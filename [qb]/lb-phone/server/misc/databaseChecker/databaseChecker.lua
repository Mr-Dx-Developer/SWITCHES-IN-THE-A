local shouldGenerateTables = false

if not Config.DatabaseChecker?.Enabled and not shouldGenerateTables then
	debugprint("Database checker is disabled")
	return
end

local readyPromise = promise.new()

MySQL.ready(function()
	readyPromise:resolve()
end)

Citizen.Await(readyPromise)

local database = MySQL.scalar.await("SELECT DATABASE()")

if not database then
	infoprint("error", "Database checker: Failed to get database name. The script will still work, but database changes will not apply automatically. To disable this warning, set Config.DatabaseChecker.Enabled to false")
	return
end

local defaultTables = GetDefaultDatabaseTables()
local tables = {}

local function fetchTables()
	table.wipe(tables)

	local rows = MySQL.query.await("SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, COLLATION_NAME, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE, COLUMN_DEFAULT, COLUMN_KEY FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = ? AND TABLE_NAME LIKE ?", {
		shouldGenerateTables and "vanilla" or database, "phone_%"
	})

	for i = 1, #rows do
		local row = rows[i]
		local tableName = row.TABLE_NAME
		local columnName = row.COLUMN_NAME
		local dataType = row.DATA_TYPE
		local collationName = row.COLLATION_NAME
		local characterMaximumLength = row.CHARACTER_MAXIMUM_LENGTH
		local isNullable = row.IS_NULLABLE
		local default = row.COLUMN_DEFAULT
		local isKey = #row.COLUMN_KEY > 0

		if not tables[tableName] then
			tables[tableName] = {}
		end

		tables[tableName][columnName] = {
			type = dataType:upper(),
			collation = collationName,
			allowNull = isNullable == "YES",
			default = default,
			length = characterMaximumLength,
			isKey = isKey
		}
	end

	return tables
end

fetchTables()

if shouldGenerateTables then
	local luaTable = "local defaultTables = {\n"

	for tableName, columns in pairs(tables) do
		luaTable = ("%s\t%s = {\n"):format(luaTable, tableName)

		for columnName, column in pairs(columns) do
			luaTable = luaTable .. ("\t\t{\n\t\t\tcolumn = \"%s\",\n"):format(columnName)
			luaTable = luaTable .. ("\t\t\ttype = \"%s\",\n"):format(column.type)
			luaTable = luaTable .. ("\t\t\tallowNull = %s,\n"):format(column.allowNull and "true" or "false")
			luaTable = luaTable .. ("\t\t\tisKey = %s,\n"):format(column.isKey and "true" or "false")

			if column.default then
				luaTable = luaTable .. ("\t\t\tdefault = \"%s\",\n"):format(column.default)
			end

			if column.collation then
				luaTable = luaTable .. ("\t\t\tcollation = \"%s\",\n"):format(column.collation)
			end

			if column.length and column.type ~= "LONGTEXT" and column.type ~= "TEXT" then
				luaTable = luaTable .. ("\t\t\tlength = %s,\n"):format(math.floor(column.length))
			end

			luaTable = luaTable .. "\t\t},\n"
		end

		luaTable = luaTable .. "\t},\n"
	end

	luaTable = luaTable .. "}"

	SaveResourceFile(GetCurrentResourceName(), "defaultdb.lua", luaTable, -1)

	return
end

local fixQueries = {}
local missingTables = {}
local updateChanges = false

-- Photo albums update
local function validatePhotoAlbums()
	if not tables.phone_photo_albums then
		MySQL.rawExecute.await([[
			CREATE TABLE IF NOT EXISTS `phone_photo_albums` (
				`id` INT NOT NULL AUTO_INCREMENT,
				`phone_number` VARCHAR(15) NOT NULL,

				`title` VARCHAR(100) NOT NULL,

				PRIMARY KEY (`id`),
				FOREIGN KEY (`phone_number`) REFERENCES `phone_phones`(`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
			) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
		]])

		updateChanges = true
	end

	local photos = tables.phone_photos

	if not photos then
		missingTables[#missingTables+1] = "phone_photos"
		return
	end

	if not photos.id then
		MySQL.rawExecute.await([[
			ALTER TABLE `phone_photos`
			DROP PRIMARY KEY,
			DROP FOREIGN KEY `phone_photos_ibfk_1`
		]])

		MySQL.rawExecute.await([[
			ALTER TABLE `phone_photos`
			ADD COLUMN `id` INT NOT NULL AUTO_INCREMENT FIRST,
			ADD PRIMARY KEY (`id`),
			ADD FOREIGN KEY (`phone_number`) REFERENCES `phone_phones`(`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
		]])

		updateChanges = true
	end

	if not tables.phone_photo_album_photos then
		MySQL.rawExecute.await([[
			CREATE TABLE IF NOT EXISTS `phone_photo_album_photos` (
				`album_id` INT NOT NULL,
				`photo_id` INT NOT NULL,

				PRIMARY KEY (`album_id`, `photo_id`),
				FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
				FOREIGN KEY (`photo_id`) REFERENCES `phone_photos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
			) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
		]])

		updateChanges = true
	end
end

validatePhotoAlbums()

if updateChanges then
	fetchTables()
end

local function getLastArg(column)
	local lastArg = column.type

	if column.length and column.type ~= "LONGTEXT" and column.type ~= "TEXT" then
		lastArg = lastArg .. ("(%s)"):format(column.length)
	end

	if not column.allowNull then
		lastArg = lastArg .. " NOT NULL"
	end

	if column.default then
		lastArg = lastArg .. (" DEFAULT %s"):format(column.default)
	end

	return lastArg
end

for tableName, columns in pairs(defaultTables) do
	local checkTable = tables[tableName]

	if not checkTable then
		infoprint("error", ("Missing table ^5%s^7 in the database. Please re-run the phone.sql file."):format(tableName))

		missingTables[#missingTables+1] = tableName

		goto continue
	end

	for i = 1, #columns do
		local defaultColumn = columns[i]
		local column = checkTable[defaultColumn.column]

		if not checkTable[defaultColumn.column] then
			infoprint("error", ("Missing column ^5%s^7 in the table ^5%s^7."):format(defaultColumn.column, tableName))

			if not defaultColumn.isKey then
				fixQueries[#fixQueries+1] = ("ALTER TABLE `%s` ADD COLUMN `%s` %s"):format(tableName, defaultColumn.column, getLastArg(defaultColumn))
			else
				infoprint("warning", ("Column ^5%s^7 in the table ^5%s^7 is a key and cannot be added automatically. Check the #updates channel for a query to run, or ask in #customer-support"):format(defaultColumn.column, tableName))
			end

			goto continueColumns
		end

		if defaultColumn.type ~= column.type then
			infoprint("warning", ("Column ^5%s^7 in the table ^5%s^7 has the wrong data type."):format(defaultColumn.column, tableName))

			if not defaultColumn.isKey and not column.isKey then
				fixQueries[#fixQueries+1] = ("ALTER TABLE `%s` MODIFY COLUMN `%s` %s"):format(tableName, defaultColumn.column, getLastArg(defaultColumn))
			else
				infoprint("warning", ("Column ^5%s^7 in the table ^5%s^7 is a key and cannot be modified automatically. Check the #updates channel for a query to run, or ask in #customer-support"):format(defaultColumn.column, tableName))
			end

			goto continueColumns
		end

		if defaultColumn.length and defaultColumn.length > column.length then
			infoprint("warning", ("Column ^5%s^7 in the table ^5%s^7 has the wrong length."):format(defaultColumn.column, tableName))

			if not defaultColumn.isKey and not column.isKey then
				fixQueries[#fixQueries+1] = ("ALTER TABLE `%s` MODIFY COLUMN `%s` %s"):format(tableName, defaultColumn.column, getLastArg(defaultColumn))
			else
				infoprint("warning", ("Column ^5%s^7 in the table ^5%s^7 is a key and cannot be modified automatically. Check the #updates channel for a query to run, or ask in #customer-support"):format(defaultColumn.column, tableName))
			end

			goto continueColumns
		end

		if defaultColumn.collation and defaultColumn.collation ~= column.collation then
			infoprint("warning", ("Column ^5%s^7 in the table ^5%s^7 has the wrong collation."):format(defaultColumn.column, tableName))
		end

		::continueColumns::
	end

    ::continue::
end

local changes = #fixQueries
local missingAnyTables = #missingTables > 0

if changes > 0 then
	if Config.DatabaseChecker.AutoFix then
		infoprint("info", ("Fixing database, applying %i changes..."):format(changes))

		local success = MySQL.transaction.await(fixQueries)

		if success then
			infoprint("success", "Database has been fixed.")
		else
			infoprint("error", "Failed to fix the database.")
		end
	else
		local fixQuery = ""

		for i = 1, #fixQueries do
			fixQuery = fixQuery .. fixQueries[i] .. ";\n"
		end

		SaveResourceFile(GetCurrentResourceName(), "fix.sql", fixQuery, -1)
		infoprint("warning", ("Database has %i changes that need to be fixed. Try running lb-phone/fix.sql"):format(changes))
	end
end

local function notifyChanges()
	if changes > 0 and not Config.DatabaseChecker.AutoFix then
		infoprint("warning", ("Database has %i changes that need to be fixed. Try running lb-phone/fix.sql"):format(changes))
	end

	if missingAnyTables then
		infoprint("error", "The database is missing the table" .. (missingAnyTables == 1 and "s^5 " or "^5 ") ..  table.concat(missingTables, "^7,^5 ") .. "^7. Please re-run the phone.sql file.")
	end
end

while changes > 0 or missingAnyTables do
	notifyChanges()
	Wait(5000)
end
