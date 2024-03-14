-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(title, text, time, type)
    exports['brutal_notify']:SendAlert(title, text, time, type)
end

function PlayerDied()
    if Config.Core:upper() == 'ESX' or Config.Core:upper() == 'STANDALONE' then
        PlayerDiedHealth = 0
    elseif Config.Core:upper() == 'QBCORE' then
        PlayerDiedHealth = 150
    end

    local died = false
    if (GetEntityHealth(PlayerPedId()) <= PlayerDiedHealth) then
        died = true
    end
    return died
end

function GetPlayerNameFunction()
    return GetPlayerName(PlayerId())
end

function FinishNotify(Rank, Time)
    MidsizeBanner("~r~PLACED ON~w~ #"..Rank..".", "~b~You successfully finised the Race!\n~w~Time: ~g~"..Time.."", 2, 5, true)
end

function RankNotify(PlayerName, PlayerRank)
    RankShow("~r~".. PlayerName .." ~b~has finished the Race!", "PLACED ON #"..PlayerRank, 0.93, 0.15, 8, false)
end

function LeftGameNotify(PlayerName)
    RankShow("~r~".. PlayerName .." ~b~has left the Race!", "", 0.93, 0.15, 8, false)
end

function NewLapNotify(CurrentRounds, Rounds)
    showScaleform("LAP " .. CurrentRounds .."/"..Rounds, "", 2)
end

function ShowHelpText(x,y,z, text)
	AddTextEntry('HelpText', text)
	SetFloatingHelpTextWorldPosition(1, x,y,z)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('HelpText')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

-----------------------| UTILS TRIGGERS |-----------------------

RegisterNetEvent('brutal_vehicleshop:client:utils:CreateVehicle')
AddEventHandler('brutal_vehicleshop:client:utils:CreateVehicle', function(Vehicle)
    SetVehicleFuelLevel(Vehicle, 100.0)
    DecorSetFloat(Vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(Vehicle))
end)

RegisterNetEvent('brutal_vehicleshop:client:utils:DeleteVehicle')
AddEventHandler('brutal_vehicleshop:client:utils:DeleteVehicle', function(Vehicle)

end)