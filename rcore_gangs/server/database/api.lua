if Config.Database then
    SQL.GetGangs = function()
        return SQL.Query([[
            SELECT
                `id`,
                `identifier`,
                `tag`,
                `name`,
                `color`,
                `group`,
                `checkpoints`,
                `balance`,
                `vehicles`
            FROM gangs
        ]])
    end

    SQL.GetZones = function()
        return SQL.Query([[
            SELECT
                gang_zones.name AS name,
                gang_zones.gang_id AS gangId,
                gang_zones.loyalty AS loyalty,
                gangs.name AS gangName,
                gangs.color AS gangColor
            FROM gang_zones
            JOIN
                gangs
            ON
                gangs.id = gang_zones.gang_id
        ]])
    end

    SQL.GetGangMembers = function(gangId)
        local firstName = ''
        local lastName = ''

        if Config.Framework == 1 then
            firstName = 'firstname'
            lastName = 'lastname'
        end

        if Config.Framework == 2 then
            firstName = 'JSON_UNQUOTE(JSON_EXTRACT(charinfo, \'$.firstname\'))'
            lastName = 'JSON_UNQUOTE(JSON_EXTRACT(charinfo, \'$.lastname\'))'
        end

        local result = SQL.Query([[
            SELECT
                ]] .. Config.FrameworkSQLTables.identifier .. [[ AS identifier,
                ]] .. 'CONCAT' .. '(' .. firstName .. ', \' \', ' .. lastName .. ')' .. [[ AS name,
                JSON_EXTRACT(ganginfo, '$.rank') AS `rank`,
                JSON_EXTRACT(ganginfo, '$.group') AS `group`
            FROM ]] .. Config.FrameworkSQLTables.table .. [[
            WHERE
                JSON_EXTRACT(ganginfo, '$.id') = @gangId
        ]], {
            ['@gangId'] = gangId
        })

        for index, value in ipairs(result) do
            value.rank = string.gsub(value.rank, '"', '')

            if value.group then
                value.group = string.gsub(value.group, '"', '')
            end
        end

        return result
    end

    SQL.GetRivalries = function()
        return SQL.Query([[
            SELECT
                id AS id,
                zone AS zone,
                funds AS funds,
                attacking_gang_id AS attacker,
                defending_gang_id AS defender,
                TIME_TO_SEC(TIMEDIFF(ends_at, NOW())) AS secondsLeft
            FROM rivalries
            WHERE
                ends_at > NOW()
        ]])
    end

    SQL.GetFinishedRivalries = function()
        return SQL.Query([[
            SELECT
                id AS id,
                zone AS zone,
                funds AS funds,
                IF(defender_sold > attacker_sold, defending_gang_id, attacking_gang_id) AS gang
            FROM rivalries
            WHERE
                ends_at < NOW()
        ]])
    end

    SQL.GetProtections = function()
        return SQL.Query([[
            SELECT
                id AS id,
                shop_id AS business,
                amount AS money
            FROM protections
        ]])
    end

    SQL.InsertGang = function(playerId, color, group, tag, name, gangInfo)
        SQL.Execute([[
            INSERT INTO gangs
            (
                `identifier`, `color`, `group`, `tag`, `name`
            )
            VALUES
            (
                @playerId, @color, @group, @tag, @name
            )
        ]], {
            ['@playerId'] = playerId,
            ['@color'] = color,
            ['@group'] = group,
            ['@tag'] = tag,
            ['@name'] = name
        })

        return SQL.Execute([[
            UPDATE ]] .. Config.FrameworkSQLTables.table .. [[ SET
                ganginfo = @gangInfo
            WHERE
                ]] .. Config.FrameworkSQLTables.identifier .. [[ = @playerId
        ]], {
            ['@gangInfo'] = gangInfo,
            ['@playerId'] = playerId
        })
    end

    SQL.InsertZone = function(gangId, zoneName, loyalty)
        return SQL.Execute([[
            INSERT INTO gang_zones
            (
                gang_id, name, loyalty
            )
            VALUES
            (
                @gangId, @zoneName, @loyalty
            )
        ]], {
            ['@gangId'] = gangId,
            ['@zoneName'] = zoneName,
            ['@loyalty'] = loyalty
        })
    end

    SQL.InsertRivalry = function(rivalryZone, attacker, defender)
        return SQL.Execute([[
            INSERT INTO rivalries
            (
                zone, attacking_gang_id, defending_gang_id, funds, ends_at
            )
            VALUES
            (
                @rivalryZone, @attacker, @defender, @funds, DATE_ADD(NOW(), INTERVAL @duration HOUR)
            )
        ]], {
            ['@rivalryZone'] = rivalryZone,
            ['@attacker'] = attacker,
            ['@defender'] = defender,
            ['@funds'] = Config.ZoneOptions.rivalryCost,
            ['@duration'] = Config.ZoneOptions.rivalryDuration
        })
    end

    SQL.InsertProtection = function(protectionName, protectionMoney)
        return SQL.Execute([[
            INSERT INTO protections
            (
                shop_id, amount
            )
            VALUES
            (
                @protectionName, @protectionMoney
            )
        ]], {
            ['@protectionName'] = protectionName,
            ['@protectionMoney'] = protectionMoney
        })
    end

    SQL.DeleteGang = function(gangId)
        SQL.Execute([[
            DELETE FROM rivalries
            WHERE
                attacking_gang_id = @gangId
            OR
                defending_gang_id = @gangId
        ]], {
            ['@gangId'] = gangId
        })

        SQL.Execute([[
            DELETE FROM gang_zones
            WHERE
                gang_id = @gangId
        ]], {
            ['@gangId'] = gangId
        })

        SQL.Execute([[
            DELETE FROM gangs
            WHERE
                id = @gangId
        ]], {
            ['@gangId'] = gangId
        })

        return SQL.Execute([[
            UPDATE ]] .. Config.FrameworkSQLTables.table .. [[ SET
                ganginfo = NULL
            WHERE
                JSON_EXTRACT(ganginfo, '$.id') = @gangId
        ]], {
            ['@gangId'] = gangId
        })
    end

    SQL.DeleteZone = function(gangId, zoneName)
        return SQL.Execute([[
            DELETE FROM gang_zones
            WHERE
                gang_id = @gangId
            AND
                name = @zoneName
        ]], {
            ['@gangId'] = gangId,
            ['@zoneName'] = zoneName
        })
    end

    SQL.DeleteRivalry = function(rivalryId, rivalryZone, rivalryGang)
        return SQL.Execute([[
            DELETE FROM rivalries
            WHERE
                id = @rivalryId
            AND
                zone = @rivalryZone
            AND
                (attacking_gang_id = @rivalryGang OR defending_gang_id = @rivalryGang)
        ]], {
            ['@rivalryId'] = rivalryId,
            ['@rivalryZone'] = rivalryZone,
            ['@rivalryGang'] = rivalryGang
        })
    end

    SQL.DeleteProtection = function(protectionId)
        return SQL.Execute([[
            DELETE FROM protections
            WHERE
                id = @protectionId
        ]], {
            ['@protectionId'] = protectionId
        })
    end

    SQL.SetPlayerGang = function(playerId, gangInfo)
        return SQL.Query([[
            UPDATE ]] .. Config.FrameworkSQLTables.table .. [[ SET
                ganginfo = @gangInfo
            WHERE
                ]] .. Config.FrameworkSQLTables.identifier .. [[ = @playerId
        ]], {
            ['@playerId'] = playerId,
            ['@gangInfo'] = gangInfo
        })
    end

    SQL.SetZoneLoyalty = function(gangId, zoneName, loyalty)
        return SQL.Execute([[
            UPDATE gang_zones SET
                loyalty = @loyalty
            WHERE
                gang_id = @gangId
            AND
                name = @zoneName
        ]], {
            ['@gangId'] = gangId,
            ['@zoneName'] = zoneName,
            ['@loyalty'] = loyalty
        })
    end

    SQL.SetProtectionMoney = function(protectionId, protectionMoney)
        return SQL.Execute([[
            UPDATE protections SET
                amount = @protectionMoney
            WHERE
                id = @protectionId
        ]], {
            ['@protectionId'] = protectionId,
            ['@protectionMoney'] = protectionMoney
        })
    end

    SQL.SetGangBalance = function(gangId, balance)
        return SQL.Execute([[
            UPDATE gangs SET
                balance = @balance
            WHERE
                id = @gangId
        ]], {
            ['@balance'] = balance,
            ['@gangId'] = gangId
        })
    end

    SQL.SetGangVehicles = function(gangId, vehicles)
        return SQL.Execute([[
            UPDATE gangs SET
                vehicles = @vehicles
            WHERE
                id = @gangId
        ]], {
            ['@vehicles'] = vehicles,
            ['@gangId'] = gangId
        })
    end

    SQL.SetGangCheckpoints = function(gangId, checkpoints)
        return SQL.Execute([[
            UPDATE gangs SET
                checkpoints = @checkpoints
            WHERE
                id = @gangId
        ]], {
            ['@checkpoints'] = checkpoints,
            ['@gangId'] = gangId
        })
    end

    SQL.AddRivalrySaleAttacker = function(rivalryId, rivalryZone, rivalryGang, amount)
        return SQL.Execute([[
            UPDATE rivalries SET
                funds = funds + @amount,
                attacker_sold = attacker_sold + 1
            WHERE
                id = @rivalryId
            AND
                zone = @rivalryZone
            AND
                attacking_gang_id = @rivalryGang
        ]], {
            ['@rivalryId'] = rivalryId,
            ['@rivalryZone'] = rivalryZone,
            ['@rivalryGang'] = rivalryGang,
            ['@amount'] = amount
        })
    end

    SQL.AddRivalrySaleDefender = function(rivalryId, rivalryZone, rivalryGang, amount)
        return SQL.Execute([[
            UPDATE rivalries SET
                funds = funds + @amount,
                defender_sold = defender_sold + 1
            WHERE
                id = @rivalryId
            AND
                zone = @rivalryZone
            AND
                defending_gang_id = @rivalryGang
        ]], {
            ['@rivalryId'] = rivalryId,
            ['@rivalryZone'] = rivalryZone,
            ['@rivalryGang'] = rivalryGang,
            ['@amount'] = amount
        })
    end
end

CreateThread(function()
    if Config.Database then
        if not SQL.Scalar('SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'gangs\'') or not SQL.Scalar('SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'gang_zones\'') or not SQL.Scalar('SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'rivalries\'') or not SQL.Scalar('SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'protections\'') then
            local collation = SQL.Scalar('SELECT TABLE_COLLATION FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tableName', { ['@tableName'] = Config.FrameworkSQLTables.table }) or 'utf8mb4_general_ci'

            SQL.Execute('DROP TABLE IF EXISTS `protections`')
            SQL.Execute('DROP TABLE IF EXISTS `rivalries`')
            SQL.Execute('DROP TABLE IF EXISTS `gang_zones`')
            SQL.Execute('DROP TABLE IF EXISTS `gangs`')

            SQL.Execute([[
                CREATE TABLE IF NOT EXISTS `gangs` (
                    `id`                        INT          NOT NULL AUTO_INCREMENT,
                    `identifier`                VARCHAR(255) NOT NULL,
                    `tag`                       VARCHAR(10)  NOT NULL,
                    `name`                      VARCHAR(32)  NOT NULL,
                    `color`                     VARCHAR(16)  NOT NULL,
                    `group`                     VARCHAR(24)           DEFAULT NULL,
                    `checkpoints`               TEXT                  DEFAULT NULL,
                    `balance`                   INT          NOT NULL DEFAULT 0,
                    `vehicles`                  TEXT                  DEFAULT NULL,
                    `created_at`                TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,

                    CONSTRAINT `gangs_pk_id`   PRIMARY KEY (`id`),
                    CONSTRAINT `gangs_ui_tag`  UNIQUE KEY (`tag`),
                    CONSTRAINT `gangs_ui_name` UNIQUE KEY (`name`)
                ) COLLATE ]] .. collation .. ';'
            )

            SQL.Execute([[
                CREATE TABLE IF NOT EXISTS `gang_zones` (
                    `id`      INT         NOT NULL AUTO_INCREMENT,
                    `name`    VARCHAR(16) NOT NULL,
                    `gang_id` INT         NOT NULL,
                    `loyalty` INT         NOT NULL DEFAULT 0,

                    CONSTRAINT `gang_zones_pk_id` PRIMARY KEY (`id`),
                    CONSTRAINT `gang_zones_fk_id` FOREIGN KEY (`gang_id`) REFERENCES `gangs` (`id`) ON DELETE CASCADE
                ) COLLATE ]] .. collation .. ';'
            )

            SQL.Execute([[
                CREATE TABLE IF NOT EXISTS `rivalries` (
                    `id`                INT         NOT NULL AUTO_INCREMENT,
                    `zone`              VARCHAR(32) NOT NULL,
                    `attacking_gang_id` INT         NOT NULL,
                    `defending_gang_id` INT         NOT NULL,
                    `funds`             INT         NOT NULL,
                    `attacker_sold`     INT         NOT NULL DEFAULT 0,
                    `defender_sold`     INT         NOT NULL DEFAULT 0,
                    `created_at`        TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
                    `ends_at`           DATETIME    NOT NULL,

                    CONSTRAINT `rivalries_pk_id`                PRIMARY KEY (`id`),
                    CONSTRAINT `rivalries_fk_attacking_gang_id` FOREIGN KEY (`attacking_gang_id`) REFERENCES `gangs` (`id`) ON DELETE CASCADE,
                    CONSTRAINT `rivalries_fk_defending_gang_id` FOREIGN KEY (`defending_gang_id`) REFERENCES `gangs` (`id`) ON DELETE CASCADE,

                    INDEX rivalries_i_attacking_gang_id (`attacking_gang_id`),
                    INDEX rivalries_i_defending_gang_id (`defending_gang_id`)
                ) COLLATE ]] .. collation .. ';'
            )

            SQL.Execute([[
                CREATE TABLE IF NOT EXISTS `protections` (
                    `id`      INT         NOT NULL AUTO_INCREMENT,
                    `shop_id` VARCHAR(64) NOT NULL,
                    `amount`  INT         NOT NULL,

                    CONSTRAINT `protections_pk_id` PRIMARY KEY (`id`)
                ) COLLATE ]] .. collation .. ';'
            )
        end

        if not SQL.Scalar('SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'gangs\' AND COLUMN_NAME = \'group\'') then
            SQL.Execute('ALTER TABLE `gangs` ADD COLUMN `group` VARCHAR(24) DEFAULT NULL')
        end

        if not SQL.Scalar('SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'gangs\' AND COLUMN_NAME = \'balance\'') then
            SQL.Execute('ALTER TABLE `gangs` ADD COLUMN `balance` INT NOT NULL DEFAULT 0')
        end

        if not SQL.Scalar('SELECT COLUMN_DEFAULT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'rivalries\' AND COLUMN_NAME = \'attacker_sold\'') then
            SQL.Execute('ALTER TABLE `rivalries` MODIFY COLUMN `attacker_sold` INT NOT NULL DEFAULT 0')
        end

        if not SQL.Scalar('SELECT COLUMN_DEFAULT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'rivalries\' AND COLUMN_NAME = \'defender_sold\'') then
            SQL.Execute('ALTER TABLE `rivalries` MODIFY COLUMN `defender_sold` INT NOT NULL DEFAULT 0')
        end

        if not SQL.Scalar('SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'protections\' AND COLUMN_NAME = \'id\'') then
            SQL.Execute('ALTER TABLE `protections` ADD COLUMN `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT FIRST')
        end

        for index, result in ipairs(SQL.Query('SELECT `id`, `identifier` FROM `gangs` WHERE `group` IS NULL')) do
            if not Config.RanksGroups then
                break
            end

            Wait(100)

            for name, group in pairs(Config.RanksGroups) do
                if group.default then
                    SQL.Execute('UPDATE `gangs` SET `group` = @rankGroup WHERE `id` = @gangId', { ['@rankGroup'] = group.name, ['@gangId'] = result.id })
                    break
                end
            end

            if Config.Framework == 1 or Config.Framework == 2 then
                for name, group in pairs(Config.RanksGroups) do
                    if group.default then
                        SQL.Execute('UPDATE `' .. Config.FrameworkSQLTables.table .. '` SET `ganginfo` = @gangInfo WHERE JSON_EXTRACT(ganginfo, \'$.id\') = @gangId AND `' .. Config.FrameworkSQLTables.identifier .. '` = @identifier', { ['@gangInfo'] = json.encode({ id = result.id, rank = group.ranks[#group.ranks].label, group = group.name }), ['@gangId'] = result.id, ['@identifier'] = result.identifier })
                        SQL.Execute('UPDATE `' .. Config.FrameworkSQLTables.table .. '` SET `ganginfo` = @gangInfo WHERE JSON_EXTRACT(ganginfo, \'$.id\') = @gangId AND `' .. Config.FrameworkSQLTables.identifier .. '` <> @identifier', { ['@gangInfo'] = json.encode({ id = result.id, rank = group.ranks[1].label, group = group.name }), ['@gangId'] = result.id, ['@identifier'] = result.identifier })
                        break
                    end
                end
            end
        end

        if Config.Framework == 1 or Config.Framework == 2 then
            if not SQL.Scalar('SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'' .. Config.FrameworkSQLTables.table .. '\' AND COLUMN_NAME = \'ganginfo\'') then
                SQL.Execute('ALTER TABLE `' .. Config.FrameworkSQLTables.table .. '` ADD COLUMN `ganginfo` JSON DEFAULT NULL')
            end

            if SQL.Scalar('SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = \'' .. Config.FrameworkSQLTables.table .. '\' AND COLUMN_NAME = \'gang_id\'') then
                for index, result in ipairs(SQL.Query('SELECT ' .. Config.FrameworkSQLTables.identifier .. ' AS identifier, gang_id AS gangId FROM ' .. Config.FrameworkSQLTables.table .. ' WHERE gang_id IS NOT NULL')) do
                    Wait(100)

                    if SQL.Scalar('SELECT id FROM gangs WHERE id = @gangId AND identifier = @identifier', { ['@gangId'] = result.gangId, ['@identifier'] = result.identifier }) then
                        SQL.Execute('UPDATE ' .. Config.FrameworkSQLTables.table .. ' SET ganginfo = @gangInfo WHERE ' .. Config.FrameworkSQLTables.identifier .. ' = @identifier AND gang_id = @gangId', { ['@gangInfo'] = json.encode({ id = result.gangId, group = 'GANG', rank = Config.RanksGroups['GANG'].ranks[#Config.RanksGroups['GANG'].ranks].label }), ['@identifier'] = result.identifier, ['@gangId'] = result.gangId })
                    else
                        SQL.Execute('UPDATE ' .. Config.FrameworkSQLTables.table .. ' SET ganginfo = @gangInfo WHERE ' .. Config.FrameworkSQLTables.identifier .. ' = @identifier AND gang_id = @gangId', { ['@gangInfo'] = json.encode({ id = result.gangId, group = 'GANG', rank = Config.RanksGroups['GANG'].ranks[1].label }), ['@identifier'] = result.identifier, ['@gangId'] = result.gangId })
                    end
                end

                SQL.Execute('ALTER TABLE ' .. Config.FrameworkSQLTables.table .. ' DROP COLUMN gang_id')
                
                for index, result in ipairs(SQL.Query('SELECT id, checkpoints FROM gangs')) do
                    Wait(100)

                    local checkpoints = json.decode(result.checkpoints)

                    if checkpoints then
                        if checkpoints.garageCheckpoint then
                            checkpoints.garage = { x = checkpoints.garageCheckpoint.x, y = checkpoints.garageCheckpoint.y, z = checkpoints.garageCheckpoint.z }
                        end

                        if checkpoints.storageCheckpoint then
                            checkpoints.storage = { x = checkpoints.storageCheckpoint.x, y = checkpoints.storageCheckpoint.y, z = checkpoints.storageCheckpoint.z }
                        end

                        checkpoints.garageCheckpoint = nil
                        checkpoints.storageCheckpoint = nil

                        SQL.Execute('UPDATE gangs SET checkpoints = @checkpoints WHERE id = @id', { ['@checkpoints'] = json.encode(checkpoints), ['@id'] = result.id })
                    end
                end
            end
        end

        TriggerEvent('rcore_gangs:server:database_ready')
    end
end)