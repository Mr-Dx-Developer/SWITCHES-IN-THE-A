ESX = nil
CachedOwners = {}

TriggerEvent(Config.ESX, function(esx) ESX = esx end)
-- Mysql functions (are just links to functions, nothing else, you can change them to yours)
--------------
-- sync / async

function MySQLSyncfetchAll(query, table, cb)
    return MySQL.Sync.fetchAll(query, table, cb)
end

function MySQLAsyncfetchAll(query, table, cb)
    return MySQL.Async.fetchAll(query, table, cb)
end

---
-- sync / async

function MySQLSyncexecute(query, table, cb)
    return MySQL.Sync.execute(query, table, cb)
end

function MySQLAsyncexecute(query, table, cb)
    return MySQL.Async.execute(query, table, cb)
end
--

function IsVehiclePlayer(source, licensePlate, cb)
    MySQLAsyncfetchAll("SELECT * FROM owned_vehicles WHERE plate = @spz", {
        ['@spz'] = licensePlate,
    }, function(result)
        if #result == 0 then
            cb(false)
        else
            cb(true)
        end
    end)
end

-- check vehicle SPZ, does it have radio ? yes -> lets open UI
-- or is vehicle stolen ? or bought -> open UI
RegisterNetEvent("lg-radiocar:openUI")
AddEventHandler("lg-radiocar:openUI", function(spz)
    local player = source
    local xPlayer = ESX.GetPlayerFromId(player)

    if Config.OnlyCarWhoHaveRadio then
        if exports.lg-radiocar:HasCarRadio(spz) then
            TriggerClientEvent("lg-radiocar:openUI", player)
        end
        return
    end
    if Config.OnlyOwnerOfTheCar then
        if not CachedOwners[spz] then
            local result = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE plate = @plate AND owner = @identifier", { ['@plate'] = spz, ['@identifier'] = xPlayer.identifier })
            if #result ~= 0 then
                TriggerClientEvent("lg-radiocar:openUI", player)
            end
            CachedOwners[spz] = result[1] or result
        else
            if CachedOwners[spz].plate == spz and CachedOwners[spz].owner == xPlayer.identifier then
                TriggerClientEvent("lg-radiocar:openUI", player)
            end
        end
		return
	end
    if Config.OnlyOwnedCars then
        if not CachedOwners[spz] then
            local result = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE plate = @plate", { ['@plate'] = spz })
            if #result ~= 0 then
                TriggerClientEvent("lg-radiocar:openUI", player)
            end
            CachedOwners[spz] = result[1] or result
        else
            if CachedOwners[spz].plate == spz then
                TriggerClientEvent("lg-radiocar:openUI", player)
            end
        end
		return
    end
	TriggerClientEvent("lg-radiocar:openUI", player)
end)