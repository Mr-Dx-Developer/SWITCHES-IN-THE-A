ESX = nil

CreateThread(function()
	local breakMe = 0
    while ESX == nil do
        Wait(100)
		breakMe = breakMe + 1
        TriggerEvent(Config.ESX, function(obj) ESX = obj end)
		if breakMe > 10 then
			break
		end
    end
end)


-- this will send information to server.
function CheckPlayerCar(vehicle)
	if ESX then
		local veh = ESX.Game.GetVehicleProperties(vehicle)
		TriggerServerEvent("lg-radiocar:openUI", veh.plate)
	else
		TriggerServerEvent("lg-radiocar:openUI", GetVehicleNumberPlateText(vehicle))
	end
end

-- if you want this script for... lets say like only vip, edit this function.
function YourSpecialPermission()
    return true
end