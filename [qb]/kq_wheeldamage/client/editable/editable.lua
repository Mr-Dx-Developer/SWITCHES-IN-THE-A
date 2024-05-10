-- Wheel indexes:
-- 0 = Front left
-- 1 = Front right
-- 2 = Rear left
-- 3 = Rear right


-- Damages a specific wheel (wheels have max 1000.0 hp)
RegisterNetEvent('kq_wheeldamage:damageWheel')
AddEventHandler('kq_wheeldamage:damageWheel', function(veh, wheel, damage)
    ApplyWheelDamage(veh, wheel, damage, indexToBone[wheel])
end)

-- Removes the wheel without dropping it
RegisterNetEvent('kq_wheeldamage:removeWheel')
AddEventHandler('kq_wheeldamage:removeWheel', function(veh, wheel)
    SetVehicleWheelHealth(veh, wheel, 0.0)
    TriggerServerEvent('kq_wheeldamage:setState', NetworkGetNetworkIdFromEntity(veh), true)
    TriggerServerEvent('kq_wheeldamage:setBroken', NetworkGetNetworkIdFromEntity(veh), wheel, true)
end)


-- Fully repairs/reattaches a wheel
RegisterNetEvent('kq_wheeldamage:fixWheel')
AddEventHandler('kq_wheeldamage:fixWheel', function(veh, wheel)
    SetVehicleTyreFixed(veh, wheel)
    SetVehicleWheelHealth(veh, wheel, 1000.0)
    TriggerServerEvent('kq_wheeldamage:setBroken', NetworkGetNetworkIdFromEntity(veh), wheel, false)
end)

-- Fully repairs all wheels of a vehicle
RegisterNetEvent('kq_wheeldamage:fixCar')
AddEventHandler('kq_wheeldamage:fixCar', function(veh)
    for wheel, bone in pairs(indexToBone) do
        if wheel <= GetVehicleNumberOfWheels(veh) -1 then
            SetVehicleTyreFixed(veh, wheel)
            SetVehicleWheelHealth(veh, wheel, 1000.0)
            TriggerServerEvent('kq_wheeldamage:setBroken', NetworkGetNetworkIdFromEntity(veh), wheel, false)
        end
    end
end)


function IsBlacklisted(veh)
    if Contains(Config.blacklist.classes, GetVehicleClass(veh)) then
        return true
    end

    for k, model in pairs(Config.blacklist.models) do
        if GetEntityModel(veh) == GetHashKey(model) then
            return true
        end
    end

    return false
end
