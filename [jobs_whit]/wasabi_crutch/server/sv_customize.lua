local ESX, QBCore = nil, nil

if wsb.framework == 'esx' then ESX = exports['es_extended']:getSharedObject() end
if wsb.framework == 'qb' then QBCore = exports['qb-core']:GetCoreObject() end


if wsb.framework == 'esx' then
    ESX.RegisterCommand('givecrutch', 'admin', function(xPlayer, args, showError)
        GiveCrutchTarget(args.playerId.source, args.time)
    end, false, {help = 'Give crutch', validate = true, arguments = {
        {name = 'playerId', help = 'The target', type = 'player'},
        {name = 'time', help = 'Time in minutes', type = 'number'},
    }})

    ESX.RegisterCommand('givechair', 'admin', function(xPlayer, args, showError)
        GiveWheelchairTarget(args.playerId.source, args.time)
    end, false, {help = 'Give wheelchair', validate = true, arguments = {
        {name = 'playerId', help = 'The target', type = 'player'},
        {name = 'time', help = 'Time in minutes', type = 'number'},
    }})

    ESX.RegisterCommand('resetcrutch', 'admin', function(xPlayer, args, showError)
        local identifier = wsb.getIdentifier(args.playerId.source)

        activeCrutch[identifier] = nil
        TriggerClientEvent('wasabi_crutch:breakLoop', args.playerId.source)
    end, false, {help = 'Reset crutch time', validate = true, arguments = {
        {name = 'playerId', help = 'The target', type = 'player'},
    }})

    ESX.RegisterCommand('resetchair', 'admin', function(xPlayer, args, showError)
        local identifier = wsb.getIdentifier(args.playerId.source)

        activeChair[identifier] = nil
        TriggerClientEvent('wasabi_crutch:breakLoop', args.playerId.source)
    end, false, {help = 'Reset wheelchair time', validate = true, arguments = {
        {name = 'playerId', help = 'The target', type = 'player'},
    }})
elseif wsb.framework == 'qb' then
    QBCore.Commands.Add('givecrutch', 'Give crutch', {{name = 'id', help = 'The target'}, {name = 'time', help = 'Time in minutes'}}, false, function(source, args)
        if args[1] then
            GiveCrutchTarget(args[1], args[2])
        end
    end, 'admin')

    QBCore.Commands.Add('givechair', 'Give wheelchair', {{name = 'id', help = 'The target'}, {name = 'time', help = 'Time in minutes'}}, false, function(source, args)
        if args[1] then
            GiveWheelchairTarget(args[1], args[2])
        end
    end, 'admin')

    QBCore.Commands.Add('resetrutch', 'Reset crutch time', {{name = 'id', help = 'The target'}}, false, function(source, args)
        if args[1] then
            local identifier = wsb.getIdentifier(args.playerId)

            activeCrutch[identifier] = nil
            TriggerClientEvent('wasabi_crutch:breakLoop', args.playerId)
        end
    end, 'admin')

    QBCore.Commands.Add('resetchair', 'Reset wheelchair time', {{name = 'id', help = 'The target'}}, false, function(source, args)
        if args[1] then
            local identifier = wsb.getIdentifier(args.playerId)

            activeChair[identifier] = nil
            TriggerClientEvent('wasabi_crutch:breakLoop', args.playerId)
        end
    end, 'admin')
end