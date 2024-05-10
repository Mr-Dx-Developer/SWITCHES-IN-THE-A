db = {
    Queries = {
        GAME_STRUCTURE = {
            FETCH_GKSPHONE_NUMBER = "SELECT * FROM gksphone_settings WHERE phone_number = ?",
            HAS_CONTACT_IN_LIST = "SELECT * FROM rcore_prison_contacts WHERE owner = ? and name = ?",
            NEW_PRISONER = 'INSERT INTO rcore_prison (owner, data) VALUES (?, ?)',
            NEW_PRISONER_CONTACT = 'INSERT INTO rcore_prison_contacts (account_id, owner, name, targetowner) VALUES (?, ?, ?, ?)',
            NEW_PRISONER_ACCOUNT = 'INSERT INTO rcore_prison_accounts (owner, giftstate) VALUES (?, ?)',
            NEW_PRISONER_STASH = 'INSERT INTO rcore_prison_stash (owner) VALUES (?) ON DUPLICATE KEY UPDATE `stash` = "[]"',
            HAS_STASHED_ITEMS = 'SELECT stash FROM rcore_prison WHERE owner = ?',
            HAS_PRISONER_ACCOUNT = 'SELECT account_id FROM rcore_prison_accounts WHERE owner = ?',
            NEW_PRISONER_SET_DEFAULT_TIME = 'UPDATE rcore_prison SET jail_time = DATE_ADD(NOW(), INTERVAL ? SECOND) WHERE prisoner_id = ?',
            NEW_TRANSACTION = 'INSERT INTO rcore_prison_transactions (account_id, transaction_name, message) VALUES (?, ?, ?)',
            REMOVE_PRISONER_ACCOUNT_DATA = 'DELETE FROM rcore_prison_accounts WHERE owner = @owner',
            REMOVE_PRISONER_DATA = 'DELETE FROM rcore_prison WHERE owner = @owner',
            REMOVE_PRISONER_TRANSACTIONS = 'DELETE FROM rcore_prison_transactions WHERE account_id = @account_id',
            REMOVE_PRISONER_CONTACTS = 'DELETE FROM rcore_prison_contacts WHERE owner = @owner',
            REMOVE_PRISONER_STASH = 'DELETE from rcore_prison_stash WHERE owner = ?',
            UPDATE_ACCOUNT_BALANCE = 'UPDATE rcore_prison_accounts SET balance = ? WHERE owner = ?',
            UPDATE_JAIL_DATA = "UPDATE rcore_prison SET data = ? WHERE owner = ?",
            UPDATE_STASH = "UPDATE rcore_prison_stash SET stash = ? WHERE owner = ?",
            UPDATE_FRIEND_READ_MESSAGE = 'UPDATE rcore_prison_contacts SET isRead = ? WHERE owner = ?',
            FETCH_ALL_TRANSACTIONS = 'SELECT * FROM rcore_prison_transactions',
            FETCH_ALL_PRISONERS = 'SELECT prisoner_id, owner, jail_time, data FROM rcore_prison',
            FETCH_ALL_PRISONERS_ACCOUNTS = 'SELECT account_id, balance, owner, giftstate FROM rcore_prison_accounts',
            FETCH_ALL_PRISONERS_CONTACTS = 'SELECT * FROM rcore_prison_contacts',
            FETCH_PRISONER_SENTENCE_TIME_OFFLINE = 'SELECT jail_time, TIMESTAMPDIFF(SECOND, NOW(), jail_time) AS time FROM rcore_prison WHERE owner = ?',
            FETCH_PRISONER_SENTENCE_TIME_ONLINE = 'SELECT data FROM rcore_prison WHERE OWNER = ?',
            FETCH_PRISONER_TRANSACTIONS = 'SELECT rcore_prison_accounts.account_id, rcore_prison_accounts.owner, rcore_prison_transactions.message, rcore_prison_transactions.transaction_id, rcore_prison_transactions.isRead FROM rcore_prison_accounts INNER JOIN rcore_prison_transactions ON rcore_prison_accounts.account_id = rcore_prison_transactions.account_id WHERE rcore_prison_accounts.owner = ?',
            FETCH_PRISONER_STASH_ITEMS = 'SELECT stash FROM rcore_prison_stash WHERE owner = ?',
        },
        FRAMEWORK = {
            FETCH_PHONE_NUMBER = 'SELECT charinfo FROM `{skin_table}` WHERE `{identifier}` = ?',
            FETCH_PRISONER_SKIN_ILLENIUM = 'SELECT skin FROM `{skin_table}` WHERE `{identifier}` = ? AND active = ?',
            FETCH_PRISONER_SKIN = 'SELECT skin FROM `{skin_table}` WHERE `{identifier}` = ?',
            SEARCH_FRIEND = "SELECT `{search_column}` FROM `{user_table}` WHERE CONCAT(firstname, ' ', lastname) LIKE @query OR (identifier) LIKE @query",
        },

        CREATE_STRUCTURE = {
            rcore_prison = [[
                CREATE TABLE IF NOT EXISTS `rcore_prison` (
                    `prisoner_id` INT(11) NOT NULL AUTO_INCREMENT,
                    `owner` VARCHAR(255) NOT NULL COLLATE 'utf8mb3_general_ci',
                    `jail_time` DATETIME NULL DEFAULT NULL,
                    `data` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
                    `createdAt` TIMESTAMP NULL DEFAULT current_timestamp(),
                    `updatedAt` TIMESTAMP NULL DEFAULT current_timestamp(),
                    PRIMARY KEY (`prisoner_id`) USING BTREE,
                    INDEX `owner` (`owner`) USING BTREE
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            ]],
            rcore_prison_accounts = [[
                CREATE TABLE IF NOT EXISTS `rcore_prison_accounts` (
                    `account_id` int(11) NOT NULL AUTO_INCREMENT,
                    `owner` varchar(46) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                    `balance` bigint(20) DEFAULT 0,
                    `giftstate` tinyint(4) DEFAULT 0,
                    `createdAt` timestamp NULL DEFAULT current_timestamp(),
                    `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
                    PRIMARY KEY (`account_id`),
                    KEY `owner` (`owner`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            ]],
            rcore_prison_contacts = [[
                CREATE TABLE IF NOT EXISTS `rcore_prison_contacts` (
                    `account_id` int(11) DEFAULT NULL,
                    `owner` varchar(46) DEFAULT NULL,
                    `name` longtext DEFAULT NULL,
                    `targetowner` varchar(50) DEFAULT NULL,
                    KEY `FK_rcore_prison_contacts_rcore_prison_accounts` (`account_id`),
                    CONSTRAINT `FK_rcore_prison_contacts_rcore_prison_accounts` FOREIGN KEY (`account_id`) REFERENCES `rcore_prison_accounts` (`account_id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            ]],
            rcore_prison_transactions = [[
                CREATE TABLE IF NOT EXISTS `rcore_prison_transactions` (
                    `transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
                    `account_id` INT(11) NULL DEFAULT NULL,
                    `transaction_name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
                    `charid` INT(11) NULL DEFAULT NULL,
                    `isRead` TINYINT(4) NOT NULL DEFAULT '0',
                    `message` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_unicode_ci',
                    `createdAt` TIMESTAMP NULL DEFAULT current_timestamp(),
                    `updatedAt` TIMESTAMP NULL DEFAULT current_timestamp(),
                    PRIMARY KEY (`transaction_id`) USING BTREE,
                    INDEX `account_id` (`account_id`) USING BTREE
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            ]],
            rcore_prison_stash = [[
                CREATE TABLE IF NOT EXISTS `rcore_prison_stash` (
                    `owner` varchar(255) NOT NULL,
                    `stash` longtext NOT NULL,
                    PRIMARY KEY (`owner`)
                  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
            ]]
        },
    },
}

/* Functions */

db.DeletePrisonerData = function(charId, accountId)
    local query = {
        { query = db.Queries.GAME_STRUCTURE.REMOVE_PRISONER_DATA, values = { ['owner'] = charId } },
        { query = db.Queries.GAME_STRUCTURE.REMOVE_PRISONER_CONTACTS, values = { ['owner'] = charId } },
        { query = db.Queries.GAME_STRUCTURE.REMOVE_PRISONER_ACCOUNT_DATA, values = { ['owner'] = charId } }
    }

    MySQL.Sync.transaction(query, function(state)
        if state then
            dbg.debug('Remove prisoner data from database [%s] with charId [%s]', accountId, charId)
        end
    end)
end

db.RemoveStashItems = function(charId)
    return MySQL.Sync.execute(db.Queries.GAME_STRUCTURE.REMOVE_PRISONER_STASH, {charId})
end

db.FetchStashItems = function(charId)
	return MySQL.Sync.fetchScalar(db.Queries.GAME_STRUCTURE.FETCH_PRISONER_STASH_ITEMS, {charId}) or {}
end

db.FetchPrisonTransactions = function()
    return MySQL.Sync.fetchAll(db.Queries.GAME_STRUCTURE.FETCH_ALL_TRANSACTIONS) or {}
end

db.FetchFrameworkUserSkin = function(charId)
    local retval = {}
    local fetch = {}
    local p = promise.new()

    if Prison.Framework ~= nil then
        CreateThread(function()
            if IsScriptLoaded('illenium-appearance') and Prison.Framework == FRAMEWORK_MAP.QBCORE then
                fetch = MySQL.scalar.await(db.Queries.FRAMEWORK.FETCH_PRISONER_SKIN_ILLENIUM, {charId, 1})
        
                if fetch then
                    retval = json.decode(fetch) 
                    p:resolve(true)
                else
                    p:resolve(true)
                end
            else
                fetch = MySQL.scalar.await(db.Queries.FRAMEWORK.FETCH_PRISONER_SKIN, {charId})
    
                if fetch then
                    retval = json.decode(fetch)
                    p:resolve(true)
                else
                    p:resolve(true)
                end
            end
        end)
    else
        p:resolve(true)
    end

    Citizen.Await(p)

    return retval
end

db.FetchPhoneNumberByCharId = function(charId)
    local retval = {}
    local fetch = MySQL.Sync.fetchAll(db.Queries.FRAMEWORK.FETCH_PHONE_NUMBER, {charId})

    if fetch and fetch[1] then
        retval = json.decode(fetch[1].charinfo).phone
    end

    return retval
end

db.UpdateJailData = function(data, charId)
    return MySQL.Sync.execute(db.Queries.GAME_STRUCTURE.UPDATE_JAIL_DATA, {json.encode(data), charId})
end

db.SavePrisonerItems = function(invItems, charId)
    return MySQL.Sync.execute(db.Queries.GAME_STRUCTURE.UPDATE_STASH, {json.encode(invItems), charId})
end

db.UpdateReadState = function(state, charId)
    return MySQL.Sync.execute(db.Queries.GAME_STRUCTURE.UPDATE_FRIEND_READ_MESSAGE, {state, charId})
end

db.FetchPrisonerTime = function(charId, fetchType)
    local query = nil

    if fetchType == 'online' then
        query = db.Queries.GAME_STRUCTURE.FETCH_PRISONER_SENTENCE_TIME_ONLINE
    else
        query = db.Queries.GAME_STRUCTURE.FETCH_PRISONER_SENTENCE_TIME_OFFLINE
    end

    if query == nil then
        return Utils.Debug('error', 'Failed to fetch prisoner time.')
    end

    local retval = MySQL.Sync.fetchSingle(query, {charId})

    if fetchType == 'offline' and type(retval) == 'table' then
        retval = retval.time
    elseif fetchType == 'online' and type(retval) == 'table' then
        retval = json.decode(retval.data)['jail_time']
    end

    return retval
end

db.CreateStashForPrisoner = function(charId)
    return MySQL.Sync.insert(db.Queries.GAME_STRUCTURE.NEW_PRISONER_STASH, {charId})
end

db.HasStashedItems = function(owner)
    return MySQL.Sync.fetchSingle(db.Queries.GAME_STRUCTURE.HAS_STASHED_ITEMS, {owner}) or nil
end

db.FetchPrisoners = function()
    return MySQL.Sync.fetchAll(db.Queries.GAME_STRUCTURE.FETCH_ALL_PRISONERS) or {}
end

db.FetchPrisonersAccounts = function()
    return MySQL.Sync.fetchAll(db.Queries.GAME_STRUCTURE.FETCH_ALL_PRISONERS_ACCOUNTS) or {}
end

db.FetchPrisonersContacts = function()
    return MySQL.Sync.fetchAll(db.Queries.GAME_STRUCTURE.FETCH_ALL_PRISONERS_CONTACTS) or {}
end

db.HasSearchedContact = function(owner, name)
    return MySQL.Sync.fetchSingle(db.Queries.GAME_STRUCTURE.HAS_CONTACT_IN_LIST, {owner, name})
end

db.SearchContact = function(input)
    return MySQL.Sync.fetchSingle(db.Queries.FRAMEWORK.SEARCH_FRIEND, { query = string.lower('%'.. tostring(input)..'%')})
end

db.InsertNewTransaction = function(data, ...)
    return MySQL.Sync.execute(db.Queries.GAME_STRUCTURE.NEW_TRANSACTION, {data.accountId, data.transanction.name, (data.transanction.text):format(...)})
end

db.UpdatePrisonAccountBalance = function(credits, charId)
    return MySQL.Sync.execute(db.Queries.GAME_STRUCTURE.UPDATE_ACCOUNT_BALANCE, {credits, charId})
end

db.DefineNewPrisonerContact = function(accountId, charId, name, targetowner)
    return MySQL.Sync.execute(db.Queries.GAME_STRUCTURE.NEW_PRISONER_CONTACT, {accountId, charId, name, targetowner})
end

db.DefinePrisonerData = function(charId, data)
    return MySQL.Sync.insert(db.Queries.GAME_STRUCTURE.NEW_PRISONER, {charId, json.encode(data.prisonerData)})
end

db.CreatePrisonerAccount = function(charId, giftState)
    return MySQL.Sync.insert(db.Queries.GAME_STRUCTURE.NEW_PRISONER_ACCOUNT, {charId, giftState})
end

db.DefinePrisonerJailTime = function(accountId, sentenceTime)
    return MySQL.Sync.execute(db.Queries.GAME_STRUCTURE.NEW_PRISONER_SET_DEFAULT_TIME, {sentenceTime, accountId})
end

db.FetchPrisonerAccountTransactions = function(charId)
    return MySQL.Sync.fetchAll(db.Queries.GAME_STRUCTURE.FETCH_PRISONER_TRANSACTIONS, {charId})
end

db.GetPhoneForGKSPhone = function(number)
    return MySQL.Sync.fetchAll(db.Queries.GAME_STRUCTURE.FETCH_GKSPHONE_NUMBER, {number})
end

CreateThread(function()
    if Prison.MySQL == 0 then
        shared.SQL = 'oxmysql'
    elseif Prison.MySQL == 1 then
        shared.SQL = 'mysql-async'
    elseif Prison.MySQL == 2 then
        shared.SQL = 'ghmattimysql'
    end

    IsResourceLoaded(shared.SQL, function(state, func)
        if state then
            local driverVersion = GetResourceMetadata(shared.SQL, 'version', 0) or nil

            if driverVersion then
                if shared.SQL == 'mysql-async' and driverVersion ~= '3.3.2' and HasResource('mysql-async') then
                    return dbg.critical('Failed to start script -> Download latest version of mysql-async, you are using old version [%s]', driverVersion)
                end
            end

            local queries = {
                { query = db.Queries.CREATE_STRUCTURE.rcore_prison, values = {} },
                { query = db.Queries.CREATE_STRUCTURE.rcore_prison_accounts, values = {} },
                { query = db.Queries.CREATE_STRUCTURE.rcore_prison_contacts, values = {} },
                { query = db.Queries.CREATE_STRUCTURE.rcore_prison_transactions, values = {} },
                { query = db.Queries.CREATE_STRUCTURE.rcore_prison_stash, values = {} },
            } 
            
            if shared.SQL and shared.SQL == 'mysql-async' then
                local state = MySQL.Async.transaction(queries, {})
                    
                if state then
                    FetchDatabase()
                end
            else
                MySQL.transaction(queries, function(state)
                    if state then
                        FetchDatabase()
                    end
                end)
            end
        else
            dbg.critical('Failed to start script - SQL is not loaded! [%s]', shared.SQL)
        end
    end)
end)
