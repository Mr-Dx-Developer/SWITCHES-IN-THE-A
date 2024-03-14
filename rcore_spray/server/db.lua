Citizen.CreateThread(function()
    if DisableMysql then
        return
    end
    
    MySQL.Sync.execute([[
        CREATE TABLE IF NOT EXISTS `sprays` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `x` float(8,4) NOT NULL,
            `y` float(8,4) NOT NULL,
            `z` float(8,4) NOT NULL,
            `origX` float(8,4) NOT NULL,
            `origY` float(8,4) NOT NULL,
            `origZ` float(8,4) NOT NULL,
            `rx` float(8,4) NOT NULL,
            `ry` float(8,4) NOT NULL,
            `rz` float(8,4) NOT NULL,
            `scale` float(8,4) NOT NULL,
            `text` varchar(32) DEFAULT NULL,
            `image` varchar(64) DEFAULT NULL,
            `imageDict` varchar(64) DEFAULT NULL,
            `font` varchar(32) DEFAULT NULL,
            `color` varchar(32) DEFAULT NULL,
            `interior` int(3) NOT NULL,
            `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    ]])

    -- ensure identifier column
    if #MySQL.Sync.fetchAll('SHOW COLUMNS FROM `sprays` LIKE "identifier"') == 0 then
        MySQL.Sync.execute([[
            ALTER TABLE `sprays`
                ADD `identifier` varchar(64) DEFAULT NULL AFTER `id`;
        ]])
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
    end
    
    if #MySQL.Sync.fetchAll('SHOW COLUMNS FROM `sprays` LIKE "origX"') == 0 then
        MySQL.Sync.execute('DELETE FROM sprays;')
        MySQL.Sync.execute([[
            ALTER TABLE `sprays`
            ADD `origZ` float(8,4) NOT NULL AFTER `z`,
            ADD `origY` float(8,4) NOT NULL AFTER `z`,
            ADD `origX` float(8,4) NOT NULL AFTER `z`;
        ]])
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
    end
    
    if #MySQL.Sync.fetchAll('SHOW COLUMNS FROM `sprays` LIKE "imageDict"') == 0 then
        MySQL.Sync.execute([[
            ALTER TABLE `sprays`
            CHANGE `text` `text` varchar(32) DEFAULT NULL,
            CHANGE `font` `font` varchar(32) DEFAULT NULL,
            CHANGE `color` `color` varchar(32) DEFAULT NULL,
            ADD `image` varchar(64) DEFAULT NULL AFTER `text`,
            ADD `imageDict` varchar(64) DEFAULT NULL AFTER `text`;
        ]])
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
            print("^3RCORE SPRAY^0: ^1Please restart rcore_spray^0")
    end

    if Framework == FW_ESX then
        local sprayExists = MySQL.Sync.fetchScalar([[
            SELECT count(*) FROM items WHERE name='spray'
        ]])
        local sprayRemoverExists = MySQL.Sync.fetchScalar([[
            SELECT count(*) FROM items WHERE name='spray_remover'
        ]])


        if sprayExists == 0 then
            print("^3RCORE SPRAY^0: ^1Spray item added to database, please RESTART your server^0")
            print("^3RCORE SPRAY^0: ^1Spray item added to database, please RESTART your server^0")
            print("^3RCORE SPRAY^0: ^1Spray item added to database, please RESTART your server^0")

            MySQL.Sync.execute([[
                INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('spray',	'Spray',	1,	1,	1);
            ]])
        end

        if sprayRemoverExists == 0 then
            MySQL.Sync.execute([[
                INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('spray_remover',	'Spray Remover',	1,	1,	1);
            ]])
        end
    end
end)