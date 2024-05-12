local QBCore = exports['qb-core']:GetCoreObject()

-- THIS COMMAND IS FOR USE ONLY THROUGH THE CONSOLE OR THROUGH THE TEBEX API
RegisterCommand("addslots", function(source, args)
    if (source == 0) then
		local formatIdentifier = Config.Identifier == 'license' and string.gsub(args[1], "license:", "") or Config.Identifier == 'steam' and string.gsub(args[1], "steam:", "")
		MySQL.Async.fetchAll('SELECT slots FROM multichars_slots WHERE identifier = ?', {formatIdentifier}, function(result)
			if result[1] then
				MySQL.update('UPDATE `multichars_slots` SET `slots` = ? WHERE `identifier` = ?', {result[1].slots + tonumber(args[2]), formatIdentifier})
			else
				MySQL.update('INSERT INTO `multichars_slots` (`identifier`, `slots`) VALUES (?, ?)', {formatIdentifier, Config.Slots + tonumber(args[2])})
			end
		end)
    end
end, false)

-- ADMIN COMMANDS

QBCore.Commands.Add('deletecharacter', Config.Translate['cmd.help_deletecharacter'], {{ 
    name = 'citizenid', help = Config.Translate['cmd.help_citizenid']
}}, true, function(source, args)
    if (args[1]) then
        QBCore.Player.ForceDeleteCharacter(args[1])
        TriggerClientEvent('vms_multichars:notification', source, (Config.Translate['cmd.success_deleted_character']):format(args[1]), 5500, 'success')
    end
end, 'admin')

QBCore.Commands.Add('setslots', Config.Translate['cmd.setslots'], {{ 
    name = 'identifier', help = Config.Translate['cmd.help_identifier'],
    name = 'slots', help = Config.Translate['cmd.help_slots']
}}, true, function(source, args)
    if (args[1] and tonumber(args[2])) then
        MySQL.Async.fetchAll('SELECT slots FROM multichars_slots WHERE identifier = ?', {args[1]}, function(result)
            if result[1] then
                MySQL.update('UPDATE `multichars_slots` SET `slots` = ? WHERE `identifier` = ?', {args[2], args[1]})
                TriggerClientEvent('vms_multichars:notification', source, (Config.Translate['slots_edited']):format(args[2], args[1]), 5500, 'success')
            else
                MySQL.update('INSERT INTO `multichars_slots` (`identifier`, `slots`) VALUES (?, ?)', {args[1], args[2]})
                TriggerClientEvent('vms_multichars:notification', source, (Config.Translate['slots_added']):format(args[2], args[1]), 5500, 'success')
            end
        end)
    end
end, 'admin')

QBCore.Commands.Add('removeslots', Config.Translate['cmd.removeslots'], {{ 
    name = 'identifier', help = Config.Translate['cmd.help_identifier'],
}}, true, function(source, args)
    if (args[1]) then
        MySQL.Async.fetchAll('SELECT slots FROM multichars_slots WHERE identifier = ?', {args[1]}, function(result)
            if result[1] then
                MySQL.update('DELETE FROM `multichars_slots` WHERE `identifier` = ?', {args[1]})
                TriggerClientEvent('vms_multichars:notification', source, (Config.Translate['slots_removed']):format(args[1]), 5500, 'success')
            end
        end)
    end
end, 'admin')

QBCore.Commands.Add('enablechar', Config.Translate['cmd.help_enablechar'], {{ 
    name = 'citizenid', help = Config.Translate['cmd.help_citizenid'],
}}, true, function(source, args)
    if (args[1]) then
        MySQL.update('UPDATE `players` SET `disabled` = 0 WHERE citizenid = ?', {args[1]}, function(result)
            if result > 0 then
                TriggerClientEvent('vms_multichars:notification', source, Config.Translate['charenabled']:format(args[1]), 5500, 'success')
            else
                TriggerClientEvent('vms_multichars:notification', source, Config.Translate['charnotfound']:format(args[1]), 5500, 'error')
            end
        end)
    end
end, 'admin')

QBCore.Commands.Add('disablechar', Config.Translate['cmd.help_disablechar'], {{ 
    name = 'citizenid', help = Config.Translate['cmd.help_citizenid'],
}}, true, function(source, args)
    if (args[1]) then
        MySQL.update('UPDATE `users` SET `disabled` = 1 WHERE identifier = ?', {args[1]}, function(result)
            if result > 0 then
                TriggerClientEvent('vms_multichars:notification', source, Config.Translate['chardisabled']:format(args[1]), 5500, 'success')
            else
                TriggerClientEvent('vms_multichars:notification', source, Config.Translate['charnotfound']:format(args[1]), 5500, 'error')
            end
        end)
    end
end, 'admin')