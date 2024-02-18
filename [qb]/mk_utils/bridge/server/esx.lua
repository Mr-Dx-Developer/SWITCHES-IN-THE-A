if GetResourceState('es_extended') == 'missing' then return end 

ESX = exports.es_extended:getSharedObject()

-- Framework label used by all scripts
framework.name = 'ESX'

--Show server console prints from mk scripts. Disable will only show version update available print
framework.consoleLogging = true

-- Default garage used by [mk_usedvehicles] and [mk_garage] to store a vehicle if one wasn't found
framework.defaultGarage = GetResourceState('mk_garage') ~= 'missing' and 'legion' or 'SanAndreasAvenue'

-- Used by [mk_vehiclekeys]
-- Triggered by [mk_utils] to get ESX players with the job 'police' to send dispatch notifications for base framework
---@param data { message: string, coords: vector3, vehicle: number, plate: string, vehicleName: string, modelHash: number, modelString: string, blipText: string } Dispatch notify data
RegisterNetEvent('mk_utils:server:esxDispatchNotify', function(data)
    local xPlayers = ESX.GetExtendedPlayers('job', 'police')
    for i=1, #(xPlayers) do 
        local xPlayer = xPlayers[i]
        TriggerClientEvent('mk_utils:client:esxDispatchNotify', xPlayer.source, data)
    end
end)

-- Used by [mk_utils] to get ESX framework jobs to use client side with [mk_garage]
lib.callback.register('mk_utils:server:getEsxJobs', function(source)
    return ESX.Jobs
end)

-- Used by [mk_utils] to get ESX framework gangs (if any) to use client side with [mk_garage]
lib.callback.register('mk_utils:server:getEsxGangs', function(source)
    return ESX.Gangs
end)

-- Used by [mk_utils] to get ESX framework vehicle price to use with [mk_usedvehicles]
lib.callback.register('mk_utils:server:getEsxVehiclePrice', function(source, modelNumber, modelString)
    local result = MySQL.query.await('SELECT price FROM vehicles WHERE model = ? OR model = ?', {modelNumber, modelString})
    if result and result[1] then 
        return tonumber(result[1].price)
    else
        return 0
    end
end)

-- Used by [mk_garage] [mk_vehiclekeys] [mk_plates] [mk_usedvehicles]
-- Framework database structure
database = {
    ownedVehicles = {
        tableName = 'owned_vehicles',
        plateColumn = 'plate',
        fakePlateColumn = 'fakeplate',
        identifierColumn = 'owner',
        modsColumn = 'vehicle',
        garageColumn = 'parking',
        vehicleStoredColumn = 'stored',
        vinColumn = false,
    },
    players = {
        tableName = 'users',
        identifierColumn = 'identifier'
    },
    glovebox = false,
    trunk = false
}

-- Used by [mk_plates] [mk_vehiclekeys] [mk_usedvehicles]
---@param itemName string Name of item to make useable
---@param triggerEvent string Event name to trigger when item is used
---@param args table|nil Event args to pass to the triggered event when item is used
inventory.createUseableItem = function(self, itemName, triggerEvent, args)
    ESX.RegisterUsableItem(itemName, function(source)
        local src = source 
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then 
            local item = xPlayer.getInventoryItem(itemName)
            if item then 
                TriggerClientEvent(triggerEvent, src, item, args)
            end
        end
    end)
end

-- Used by [mk_mining] [mk_plates] [mk_usedvehicles] [mk_vehiclekeys]
---@param playerSource number Player server id
---@param itemName string Item name to be removed
---@param amount number Amount to be removed
---@param metadata table|nil Metadata item should have to be removed
---@param slot number|nil Slot number to check for specific item to remove
---@param cb function Callback true if item was removed. false if not
inventory.removeItem = function(self, playerSource, itemName, amount, metadata, slot, cb)
    local src = playerSource
    local next = next

    if GetResourceState('ox_inventory') == 'started' then 
        if slot then 
            local item = exports['ox_inventory']:GetSlot(src, slot)
            if item then 
                if item.name == itemName then
                    local success, response = exports['ox_inventory']:RemoveItem(src, itemName, amount, false, slot)
                    if success then
                        cb(true)
                    else
                        cb(false)
                    end
                else
                    cb(false)
                end
            else
                cb(false)
            end
        else
            local itemAmount = exports['ox_inventory']:Search(src, 'count', itemName, metadata)
            if itemAmount >= amount then 
                local success, response = exports['ox_inventory']:RemoveItem(src, itemName, amount, metadata, false)
                if success then 
                    cb(true)
                else
                    --debug response
                    cb(false)
                end
            else
                cb(false)
            end
        end
    else
        if metadata and next(metadata) ~= nil then 
            utils.logger:error(GetInvokingResource(), '^1Inventory resource does not support item metadata. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
        else
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer then 
                if slot then 
                    utils.logger:error(GetInvokingResource(), '^1Inventory resource does not support item removing items by slot. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
                else
                    local itemInfo = xPlayer.getInventoryItem(itemName)
                    if itemInfo then 
                        if itemInfo.count >= amount then 
                            xPlayer.removeInventoryItem(itemName, amount)
                            cb(true)
                        else
                            cb(false)
                        end
                    else
                        cb(false)
                    end
                end
            else
                cb(false)
            end
        end
    end
end

-- Used by [mk_garbage] [mk_mining] [mk_plates] [mk_vehiclekeys]
---@param playerSource number Player server id
---@param itemName string Item name to be added
---@param amount number Amount to be added
---@param metadata table|nil Metadata to add onto the item
---@param cb function Callback true if item was added. false if not
inventory.addItem = function(self, playerSource, itemName, amount, metadata, cb)
    local src = playerSource

    if GetResourceState('ox_inventory') == 'started' then 
        local carryAmount = exports['ox_inventory']:CanCarryAmount(src, itemName)
        if carryAmount then 
            if carryAmount >= amount then 
                local success, response = exports['ox_inventory']:AddItem(src, itemName, amount, metadata, false)
                if success then 
                    cb(true)
                else
                    --debug response
                    cb(false)
                end
            else
                utils:notify(src, locale('cant_carry'), 'error', 5000)
                cb(false)
            end
        else
            cb(false)
        end
    elseif GetResourceState('qs-inventory') == 'started' then 
        if exports['qs-inventory']:CanCarryItem(src, itemName, amount) then
            exports['qs-inventory']:AddItem(src, itemName, amount, nil, metadata)
            cb(true)
        else
            cb(false)
        end
    else
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then 
            if xPlayer.canCarryItem(itemName, amount) then 
                xPlayer.addInventoryItem(itemName, amount)
                cb(true)
            else
                utils:notify(src, locale('cant_carry'), 'error', 5000)
                cb(false)
            end
        else
            cb(false)
        end
    end
end

-- Used by [mk_vehiclekeys]
---@param playerSource number Player server id
---@param itemName string Name of item to check
---@param metadata table|nil Metadata item should have when checking if the player has it
---@return boolean true if player has item. false if not
inventory.hasItem = function(self, playerSource, itemName, metadata)
    local src = playerSource
    local hasItem = false 
    local next = next

    if GetResourceState('ox_inventory') == 'started' then 
        local item = exports['ox_inventory']:Search(src, 'count', itemName, metadata)
        if item > 0 then 
            hasItem = true
        end
    elseif GetResourceState('qs-inventory') == 'started' then 
        local items = exports['qs-inventory']:GetInventory(src)
        
        if items and next(items) ~= nil then 
            for key, value in pairs(items) do 
                if value.name == itemName then 
                    if metadata and next(metadata) ~= nil then 
                        for index, val in pairs(metadata) do 
                            if value.info?[index] then 
                                if value.info?[index] == val then 
                                    hasItem = true 
                                    break
                                end
                            end
                        end
                    else
                        hasItem = true 
                    end
                end
            end
        end
    else
        if metadata and next(metadata) ~= nil then 
            utils.logger:error(GetInvokingResource(), '^1Inventory resource does not support item metadata. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
        else
            local xPlayer = ESX.GetPlayerFromId(src)
            if xPlayer then 
                if xPlayer.hasItem(itemName) then
                    hasItem = true
                end
            end
        end
    end

    return hasItem
end

-- Used by [mk_mining]
---@param playerSource number Player server id
---@param itemName string Name of item to check
---@return table List of each slot a specific item is in the inventory
inventory.getItemSlots = function(self, playerSource, itemName)
    local src = playerSource
    local slots = {}

    if GetResourceState('ox_inventory') == 'started' then 
        local inv = exports['ox_inventory']:Search(src, 'slots', itemName)
        if inv then 
            slots = inv
        end
    else
        utils.logger:error(GetInvokingResource(), '^1Inventory resource not compatible. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
    end

    return slots
end

-- Used by [mk_vehiclekeys]
---@param playerSource number Player server id
---@param slot number Inventory slot to get item data
---@return table|boolean Item data if exists or false
inventory.getItemBySlot = function(self, playerSource, slot)
    local src = playerSource 

    if GetResourceState('ox_inventory') == 'started' then 
        local item = exports['ox_inventory']:GetSlot(src, slot)
        if item then
            return item 
        else
            return false
        end
    else
        utils.logger:error(GetInvokingResource(), '^1Inventory resource not compatible. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
    end
end

-- Used by [mk_vehiclekeys]
---@param item table Item to locate metadata from
---@return table|boolean Item metadata or false
inventory.getMetadata = function(self, item)
    if item then 
        if GetResourceState('ox_inventory') == 'started' then 
            return item.metadata 
        else
            utils.logger:error(GetInvokingResource(), '^1Inventory resource not compatible. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
            return false
        end
    else
        return false 
    end
end

-- Used by [mk_vehiclekeys]
---@param item table Item to check its metadata
---@param metadataKey string Table key of item metadata to check
---@param metadataValue string Table value of item metadata to check
---@return boolean true if metadata value exists. false if not
inventory.compareMetadata = function(self, item, metadataKey, metadataValue)
    if GetResourceState('ox_inventory') == 'started' then 
        if item.metadata?[metadataKey] == metadataValue then 
            return true 
        else
            return false 
        end
    else
        utils.logger:error(GetInvokingResource(), '^1Inventory resource not compatible. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
        return false
    end
end

-- Used by [mk_vehiclekeys]
---@param playerSource number Player server id
---@param item table Item to set new metadata on
---@param slot number Inventory slot where item is located
---@param metadataKey string Metadata table key
---@param metadataValue string New metadata value for the provided metadata key
inventory.setNewMetadata = function(self, playerSource, item, slot, metadataKey, metadataValue)
    local src = playerSource

    if GetResourceState('ox_inventory') == 'started' then
        item.metadata[metadataKey] = metadataValue
        exports['ox_inventory']:SetMetadata(src, slot, item.metadata)
    else
        utils.logger:error(GetInvokingResource(), '^1Inventory resource not compatible. Install dependency or setup custom inventory in ^7[^5mk_utils^7]', {console = true})
    end
end

-- Used by [mk_garage] [mk_usedvehicles]
---@param data { shared: true|nil (true if a shared vehicle), userData: table|nil (owners row from the players database or nil if shared vehicle), modelString: string (vehicle model name), 
---@param data      modelHash: number (vehicle model number), mods: table (vehicle mods), plate: string (vehicle plate), vin: string|nil (vehicle vin number), garage: string (garage name),
---@param data      state: number (0 - out 1 - garaged 2 - impounded), fuelLevel: number (vehicle fuel amount), engineHealth: number (vehicle engine health), bodyHealth: number (vehicle body health),
---@param data      vehicleData: table|nil (data set by mk_garage) } 
---@param cb function Callsback upson SQL query finish
database.addPlayerVehicle = function(self, data, cb)
    local insertQuery, insertData 

    if database.ownedVehicles.vinColumn and data.vin then 
        if data.vehicleData then 
            InsertQuery = 'INSERT INTO owned_vehicles (owner, vehicle, plate, '..database.ownedVehicles.vinColumn..', parking, stored, vehicleData) VALUES (?, ?, ?, ?, ?, ?, ?)'
            insertData = {
                data.shared and data.shared or data.userData?.identifier,
                json.encode(data.mods),
                data.plate,
                data.vin,
                data.garage and data.garage or framework.defaultGarage,
                data.state,
                data.vehicleData
            }
        else
            InsertQuery = 'INSERT INTO owned_vehicles (owner, vehicle, plate, '..database.ownedVehicles.vinColumn..', parking, stored) VALUES (?, ?, ?, ?, ?, ?)'
            insertData = {
                data.shared and data.shared or data.userData?.identifier,
                json.encode(data.mods),
                data.plate,
                data.vin,
                data.garage and data.garage or framework.defaultGarage,
                data.state
            }
        end
    else
        if data.vehicleData then 
            insertQuery = 'INSERT INTO owned_vehicles (owner, vehicle, plate, parking, stored, vehicleData) VALUES (?, ?, ?, ?, ?, ?)'
            insertData = {
                data.shared and data.shared or data.userData?.identifier,
                json.encode(data.mods),
                data.plate,
                data.garage and data.garage or framework.defaultGarage,
                data.state,
                data.vehicleData
            }
        else
            insertQuery = 'INSERT INTO owned_vehicles (owner, vehicle, plate, parking, stored) VALUES (?, ?, ?, ?, ?)'
            insertData = {
                data.shared and data.shared or data.userData?.identifier,
                json.encode(data.mods),
                data.plate,
                data.garage and data.garage or framework.defaultGarage,
                data.state
            }
        end
    end

    MySQL.insert(insertQuery, insertData, cb)
end

-- Used by [mk_usedvehicles]
---@param data { identifier: string (player identifier), plate: string (vehicle plate) }
---@param cb function Callback upson SQL query finish
database.removePlayerVehicle = function(self, data, cb)
    MySQL.query('DELETE FROM owned_vehicles WHERE owner = :id AND '..(database.ownedVehicles.fakePlateColumn and '(plate = :plate OR '..database.ownedVehicles.fakePlateColumn..' = :plate)' or 'plate = :plate'), {id = data.identifier, plate = data.plate}, cb)
end

-- Used by [mk_usedvehicles]
---@param data { userData: table (owners row from the players database), plate: string (vehicle plate) }
---@param cb function Callback upson SQL query finish
database.updateVehicleOwner = function(self, data, cb)
    MySQL.update('UPDATE owned_vehicles SET owner = ? WHERE plate = ?', {data.userData.identifier, data.plate}, cb)
end

-- Used by [mk_garage]
---@param data { garageName: string (garage name), vehicleState: number (1 - stored), fuelLevel: number (vehicle fuel), engineHealth: number (vehicle engine health), bodyHealth: number (vehicle body health), mods: table (vehicle mods), plate: string (vehicle plate) }
---@param cb function Callback upson SQL query finish
database.storeVehicle = function(self, data, cb)
    MySQL.update('UPDATE owned_vehicles SET parking = ?, stored = ?, vehicle = ? WHERE plate = ?', {
        data.garageName,
        data.vehicleState,
        data.mods,
        data.plate
    }, cb)
end

-- Used by [mk_garage]
---@param data { garageName: string (garage name), vehicleState: number (2 - impounded), fuelLevel: number (vehicle fuel), engineHealth: number (vehicle engine health), bodyHealth: number (vehicle body health), mods: table (vehicle mods), impoundData: table (data set by mk_garage) plate: string (vehicle plate) }
---@param cb function Callback upson SQL query finish
database.impoundVehicle = function(self, data, cb)
    MySQL.update('UPDATE owned_vehicles SET parking = ?, stored = ?, vehicle = ?, impound = ? WHERE plate = ?', {
        data.garageName,
        data.vehicleState,
        data.mods,
        data.impoundData,
        data.plate
    }, cb)
end

-- Used by [mk_garage]
---@param playerSource number Player server id
---@param playerIdentifier string Player identifier
---@return string|boolean player firstname, player lastname or false, false
framework.getPlayerName = function(self, playerSource, playerIdentifier)
    local ident

    if playerIdentifier then --get another player name
        ident = playerIdentifier
    else --get own name
        local src = playerSource 
        ident = Player(src).state.mk_identifier
    end

    local res = MySQL.query.await('SELECT firstname, lastname FROM users WHERE identifier = ?', {ident})
    if res and res[1] then 
        return res[1].firstname, res[1].lastname 
    else
        return false, false
    end
end

-- Used by [mk_garage] [mk_plates]
---@param playerSource number Player server id
---@return string|boolean player job name, player job grade or false, false
framework.getJob = function(self, playerSource)
    local src = playerSource
    local player = ESX.GetPlayerFromId(src)
    return player?.job?.name, player?.job?.grade
end

--- Used by [mk_garbage] [mk_plates] [mk_usedvehicles]
---@param playerIdentifier string Player identifier
---@return number Player server id
framework.getPlayerSourceByIdentifier = function(self, playerIdentifier)
    local player = ESX.GetPlayerFromIdentifier(playerIdentifier)
    return tonumber(player?.source) or false
end

-- Used by [mk_garage] [mk_mining] [mk_usedvehicles] [mk_garbage] [mk_vehiclekeys]
---@param playerSource number Player server id
---@param moneyType string 'cash'|'bank' Account to check
---@return number Account balance or 0
framework.checkMoney = function(self, playerSource, moneyType)
    local src = playerSource
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then 
        if moneyType == 'cash' then 
            return tonumber(xPlayer.getAccount('money').money)
        elseif moneyType == 'bank' then 
            return tonumber(xPlayer.getAccount('bank').money)
        end
    else 
        return 0
    end
end

-- Used by [mk_garage] [mk_mining] [mk_usedvehicles] [mk_garbage] [mk_vehiclekeys]
---@param playerSource number Player server id
---@param moneyType string 'cash'|'bank' Account to remove money from
---@param amount number Amount to remove
---@return boolean true if money was removed. false if not
framework.removeMoney = function(self, playerSource, moneyType, amount)
    local src = playerSource
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then 
        if moneyType == 'cash' then 
            xPlayer.removeAccountMoney('money', amount)
            return true
        elseif moneyType == 'bank' then 
            xPlayer.removeAccountMoney('bank', amount)
            return true
        end
    else 
        return false
    end
end

-- Used by [mk_garbage] [mk_mining] [mk_usedvehicles]
---@param playerSource number Player server id
---@param moneyType string 'cash'|'bank' Account to add money to
---@param amount number Amount to add
---@return boolean true if money was added. false if not
framework.addMoney = function(self, playerSource, moneyType, amount)
    local src = playerSource
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then 
        if moneyType == 'cash' then 
            xPlayer.addAccountMoney('money', amount)
            return true
        elseif moneyType == 'bank' then 
            xPlayer.addAccountMoney('bank', amount)
            return true
        end
    else
        return false
    end
end

-- Used by [mk_usedvehicles]
---@param identifier string Player identifier
---@param moneyType string 'cash'|'bank' Account to add money to
---@param amount number Amount to add
---@return boolean true if money was added. false if not
framework.addMoneyToOfflinePlayer = function(self, identifier, moneyType, amount)
    local result = MySQL.query.await("SELECT * FROM users WHERE identifier = ?", {identifier})
    if result and result[1] then 
        if moneyType == 'cash' then moneyType = 'money' end
        local money = json.decode(result[1].accounts)
        if money[moneyType] then 
            money[moneyType] = math.ceil(money[moneyType] + amount)
            local updateResult = MySQL.update.await("UPDATE users SET accounts = ? WHERE identifier = ?", {json.encode(money), result[1].identifier})
            if updateResult then return true else return false end
        else
            return false 
        end
    else
        return false
    end
end

-- Used by [mk_garage]
---@param societyType string 'job'|'gang' Job or gang society
---@param societyName string Job or gang name
---@return number|boolean Account balance or false
society.getBalance = function(self, societyType, societyName)
    local result = MySQL.query.await('SELECT money FROM addon_account_data WHERE account_name = ?', {
        'society_'..societyName
    })

    if result and result[1] then 
        if result[1].money then
            return tonumber(result[1].money)
        else
            return false
        end
    else
        return false
    end
end

-- Used by [mk_garage]
---@param deposit boolean true if depositing money. false if withdrawing
---@param societyType string 'job'|'gang' Job or gang society
---@param societyName string Job or gang name
---@param amount number Amount to add or remove from society account
---@return number|boolean New balance amount or false
society.updateBalance = function(self, deposit, societyType, societyName, amount)
    local currentBalance, newBalance = self:getBalance(societyType, societyName), 0
    if not currentBalance then return false end 

    amount = tonumber(amount)

    if deposit then 
        newBalance = math.ceil(currentBalance + amount)
        if newBalance <= currentBalance then return false end 
    else
        newBalance = math.ceil(currentBalance - amount)
        if newBalance >= currentBalance then return false end
        if newBalance < 0 then return false end
    end

    local result = MySQL.query.await('UPDATE addon_account_data SET money = ? WHERE account_name = ?', {
        newBalance,
        'society_'..societyName
    })

    if result then 
        return newBalance
    else
        return false 
    end
end