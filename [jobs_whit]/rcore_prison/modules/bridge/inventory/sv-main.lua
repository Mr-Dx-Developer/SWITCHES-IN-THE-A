Framework = GetSharedObjectSafe()

local keepItems = {}

CreateThread(function()
    for key, value in pairs(Prison.KeepItems) do
        if value then
            table.insert(keepItems, key)
        end
    end
end)

Bridge.TransferCreditToMoney = function(serverId, charid)
    if not Prison.Release.TransferCreditsFromAccount then return end

    local account = GetPrisonerAccount(charid)

    if account then
        local prisonerCredits = account.balance

        if prisonerCredits > 0 then
            cfxSetState(serverId, 'PrisonAccount', nil)
        end
    end
end

Bridge.AddItem = function(playerId, itemName, itemCount, metadata, slot)
    local Player = getPlayer(playerId)
    local hasOxInventory = HasResource(Prison.InventoryScripts.OX_INVENTORY)

    local state = shared.inventory

    if state then
        if shared.framework == 'QBCORE' and not hasOxInventory then
            itemName = itemName:lower()
        end

        dbg.debugInventory('Adding item [%s] to player [%s] with amount [%s] | USER: %s', itemName, playerId, itemCount, GetPlayerName(playerId))

        if HasResource(Prison.InventoryScripts.QB_INVENTORY) or HasResource(Prison.InventoryScripts.AJ_INVENTORY) or HasResource(Prison.InventoryScripts.LJ_INVENTORY) or HasResource(Prison.InventoryScripts.PS_INVENTORY) then
            if Player then
                if itemName == 'money' or itemName == 'cash' and not hasOxInventory then
                    return Player.Functions.AddMoney('cash', itemCount)
                end

                return Player.Functions.AddItem(itemName, itemCount, false, metadata or {}) 
            end
        elseif HasResource(Prison.InventoryScripts.OX_INVENTORY) then
            exports[Prison.InventoryScripts.OX_INVENTORY]:AddItem(playerId, itemName, itemCount, metadata, slot)
        elseif HasResource(Prison.InventoryScripts.MF_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.ESX then
            if itemName == 'money' or itemName == 'cash' then
                return Player.addMoney(tonumber(itemCount), 'prison_stashed_item')
            end    

            return exports[Prison.InventoryScripts.MF_INVENTORY]:addInventoryItem(Player.getIdentifier(), itemName, itemCount)
        elseif HasResource(Prison.InventoryScripts.QS_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.QBCORE then
            local version = GetResourceMetadata('qs-inventory', 'version', 0)

            if version and version >= '2.0.6' then
                if itemName == 'money' and not hasOxInventory then
                    return Player.Functions.AddMoney('cash', itemCount)
                end    
                
                return exports['qs-inventory']:AddItem(playerId, itemName, itemCount, nil, metadata)
            else
                if Player then
                    if itemName == 'money' or itemName == 'cash' and not hasOxInventory then
                        return Player.Functions.AddMoney('cash', itemCount)
                    end
        
                    return Player.Functions.AddItem(itemName, itemCount, false, metadata or {}) 
                end
            end
        elseif HasResource(Prison.InventoryScripts.QS_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.ESX then 
            local version = GetResourceMetadata('qs-inventory', 'version', 0)

            if version and version >= '2.0.6' then
                if itemName == 'money' and not hasOxInventory then
                    return Player.addMoney(tonumber(itemCount), 'prison_stashed_item')
                end    

                return exports['qs-inventory']:AddItem(playerId, itemName, itemCount, nil, metadata)
            else
                if Player then
                    if itemName == 'money' or itemName == 'cash' and not hasOxInventory then
                        return Player.addMoney(tonumber(itemCount), 'prison_stashed_item')
                    end    
        
                    return Player.addInventoryItem(itemName, itemCount) 
                end
            end
        elseif HasResource(Prison.InventoryScripts.ESX_INVENTORY) and not hasOxInventory then
            if itemName == 'money' or itemName == 'cash' then
                return Player.addMoney(tonumber(itemCount), 'prison_stashed_item')
            end    

            return Player.addInventoryItem(itemName, itemCount)
        end
    else
        dbg.debugInventory('Failed to find any supported inventory, not adding item [%s] to player [%s] with amount [%s] | USER: %s', itemName, playerId, itemCount, GetPlayerName(playerId))
    end
end

Bridge.ReturnPrisonerItems = function(serverId, charId, returnType)
    if not serverId then return end
    if not charId then return end

    local state = false

    -- Return items from stash if enabled.

    if Prison.Release.StashItems then
        if Prison.Release.ReturnItemsOnRelease and returnType == 'release' then
            state = Bridge.ReturnPrisonerItemsFromStash(serverId)
        elseif not Prison.Release.ReturnItemsOnRelease and returnType == 'npc' then
            state = Bridge.ReturnPrisonerItemsFromStash(serverId)
        end 
    end

    if not Prison.Release.ReturnItemsOnRelease and returnType == 'release' then
        Bridge.Notify(serverId, {
            title = l('WARDEN_TITLE'),
            description = l('PRISONER_RELEASE_ITEMS_AT_NPC'),
            position = 'top',
            subtitle = l('LOBBY_MENU_TITLE'),
            lenght = 6000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })
    end

    return state
end

Bridge.TakePrisonerItems = function(targetSID, charId)
    local inventoryState = GetInventoryState()
    local userInventory, status = gatherInventoryData(targetSID)

    if inventoryState then
        if Prison.Release.StashItems then
            if status == INVENTORY_STATUS_CODES.HAS_ITEMS then
                dbg.debugInventory('Player named %s has items in his inventory, saving to database.', GetPlayerName(targetSID))

                local state = ClearInventory(targetSID)

                if state then
                    if Prison.KeepItemState then
                        for k, v in pairs(userInventory) do
                            if Prison.KeepItems[v.name:lower()] then
                                userInventory[k] = nil
                            end
                        end
                    end

                    db.SavePrisonerItems(userInventory, charId)
                end
            else
                -- Try to clear inventory anyway, since we want to make sure that the prisoner has no items in his inventory, when any inventory found on server as fallback.

                if inventoryState then
                    ClearInventory(targetSID)
                end

                dbg.debugInventory('Player named %s has no items in his inventory, not saving anything in database.', GetPlayerName(targetSID))
            end
        else
            dbg.debugInventory('Stashing of items is disabled [configs/config.lua - Prison.Release.Stashitems = false], skipping taking of items prisoner named %s.', GetPlayerName(targetSID))

            if inventoryState then
                ClearInventory(targetSID)
            end
        end
    else
        dbg.debugInventory('Is not running any inventory, loading standalone mode, skipping taking of items prisoner named %s.', GetPlayerName(targetSID))
        
        if inventoryState then
            ClearInventory(targetSID)
        end
    end
end

Bridge.RemoveItem = function(playerId, itemName, itemCount, metadata, slot)
    local Player = getPlayer(playerId)

    local hasOxInventory = HasResource(Prison.InventoryScripts.OX_INVENTORY)
    local state = GetInventoryState()
    
    if state then
        dbg.debugInventory('Removing item [%s] from player [%s] with amount [%s] | USER: %s', itemName, playerId, itemCount, GetPlayerName(playerId))

        if HasResource(Prison.InventoryScripts.OX_INVENTORY) then
            exports[Prison.InventoryScripts.OX_INVENTORY]:RemoveItem(playerId, itemName, itemCount, metadata, slot)
        elseif HasResource(Prison.InventoryScripts.MF_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.ESX then
            if itemName == 'money' then
                return Player.removeMoney(tonumber(itemCount), 'prison_stashed_item')
            end    
            
            exports[Prison.InventoryScripts.MF_INVENTORY]:removeInventoryItem(Player.getIdentifier(), itemName, itemCount)
        elseif HasResource(Prison.InventoryScripts.CORE_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.QBCORE then
            if Player then
                local charId = Player.PlayerData.citizenid
                local inventoryPrefix = ('%s-%s'):format('content', charId)

                exports[Prison.InventoryScripts.CORE_INVENTORY]:removeItem(inventoryPrefix, itemName, tonumber(itemCount))
            end
        elseif HasResource(Prison.InventoryScripts.CORE_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.ESX then
            if Player then
                local charId = Player.getIdentifier()
                local inventoryPrefix = ('%s-%s'):format('content', charId)

                exports[Prison.InventoryScripts.CORE_INVENTORY]:removeItem(inventoryPrefix, itemName, tonumber(itemCount))
            end
        elseif HasResource(Prison.InventoryScripts.QB_INVENTORY) or HasResource(Prison.InventoryScripts.AJ_INVENTORY) or HasResource(Prison.InventoryScripts.LJ_INVENTORY) then
            if Player then
                if itemName == 'money' then
                    return Player.Functions.RemoveMoney('cash', itemCount)
                end    

                Player.Functions.RemoveItem(itemName, itemCount, false, metadata or {}) 
            end
        elseif HasResource(Prison.InventoryScripts.QS_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.QBCORE then
            local version = GetResourceMetadata('qs-inventory', 'version', 0)

            if version and version >= '2.0.6' then
                exports['qs-inventory']:RemoveItem(playerId, itemName, itemCount)
            else
                if Player then
                    Player.Functions.RemoveItem(itemName, itemCount, false, metadata or {}) 
                end
            end
        elseif HasResource(Prison.InventoryScripts.QS_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.ESX then 
            local version = GetResourceMetadata('qs-inventory', 'version', 0)

            if version and version >= '2.0.6' then
                exports['qs-inventory']:RemoveItem(playerId, itemName, itemCount)
            else
                if Player then
                    Player.removeInventoryItem(itemName, itemCount)
                end
            end
        elseif HasResource(Prison.InventoryScripts.ESX_INVENTORY) and not hasOxInventory then
            if Player then
                if itemName == 'money' then
                    Player.removeAccountMoney('bank', tonumber(itemCount))
                else
                    Player.removeInventoryItem(itemName, itemCount)
                end
            end
        end
    else
        dbg.debugInventory('Failed to find any supported inventory, not removing item [%s] from player [%s] with amount [%s] | USER: %s', itemName, playerId, itemCount, GetPlayerName(playerId))
    end
end

Bridge.GetItem = function(playerId, itemName)
    local Player = getPlayer(playerId)
    local hasOxInventory = HasResource(Prison.InventoryScripts.OX_INVENTORY)

    local state = GetInventoryState()
    local result = 0

    if state then
        if shared.framework == 'QBCORE' and not hasOxInventory then
            itemName = itemName:lower()
        end
    
        if Prison.Framework == FRAMEWORK_MAP.ESX then
            local data = Player.getInventoryItem(itemName)

            if itemName == 'money' then
                return Player.getAccount('bank').money or 0
            end

            if not data then
                return result
            end

            result = data and tonumber(data.count) or tonumber(data.amount) or 0
        elseif Prison.Framework == FRAMEWORK_MAP.QBCORE then
            if itemName == 'money' then
                local data = Player.Functions.GetMoney and Player.Functions.GetMoney('bank')

                if data and type(data) == 'number' then
                    result = data or 0
                end
            end

            if not result or result <= 0 then
                local data = Player.Functions.GetItemByName(itemName)
                result = data and tonumber(data.amount) or 0
            end
        end
    
        dbg.debugInventory('Got inventory item [%s] from player [%s] with amount [%s] | USER: %s', itemName, playerId, result, GetPlayerName(playerId) or 'N/A')
    end

    return result
end

Bridge.CreateStashAndDefineItems = function(targetSID, charId)
    local stash = db.CreateStashForPrisoner(charId)

    if stash then
        Bridge.TakePrisonerItems(targetSID, charId)
    end
end

Bridge.ReturnPrisonerItemsFromStash = function(src)
    local player = Bridge.GetPlayer(src)

    if not player then 
        return 
    end

    local stashItems = db.FetchStashItems(player.charid)

    if not stashItems then 
        return 
    end

    local decodedStashItems = stashItems and type(stashItems) == 'string' and json.decode(stashItems)
    local state = false

    if decodedStashItems and next(decodedStashItems) then
        state = true
        
        for itemName, data in pairs(decodedStashItems) do
            Bridge.AddItem(src, data.name, data.count, data.metadata or data.info or {})
        end
    end

    return state
end

function GetInventoryState()
    return shared.inventory ~= nil
end

function ClearInventory(serverId)
    if not serverId then
        return dbg.debug('ClearInventory - failed since serverId is not defined.')
    end

    local player = getPlayer(serverId)
    local clearState = false

    if Prison.Framework == FRAMEWORK_MAP.QBCORE and not HasResource(Prison.InventoryScripts.OX_INVENTORY) then
        local clearMain, clearMainErr = pcall(player.Functions.ClearInventory)

        if clearMain then
            clearState = true
        else
            local backClear, backClearErr = pcall(player.Functions.SetPlayerData, "items", {})
    
            if backClear then
                clearState = true
            end
        end
    elseif HasResource(Prison.InventoryScripts.OX_INVENTORY) then
        if Prison.KeepItemState and keepItems then
            exports.ox_inventory:ClearInventory(serverId, Prison.KeepItemState and keepItems)
        else
            exports.ox_inventory:ClearInventory(serverId)
        end

        clearState = true
    end

    if not clearState then
        if HasResource(Prison.InventoryScripts.QS_INVENTORY) then
            local success, error_message = pcall(function()
                exports['qs-inventory']:ClearInventory(serverId, {})
            end)

            if success then
                clearState = true
            else
                local version = GetResourceMetadata('qs-inventory', 'version', 0)
                local clearInventory = ('%s %s'):format('clearinv', serverId)
    
                if clearInventory and version >= '2.0.6' then
                    local commandState, commandErrMessage = pcall(function()
                        ExecuteCommand(clearInventory)
                    end)

                    if commandState then
                        clearState = true
                    end
                end
            end
        elseif HasResource('inventory') then
            local clearinventory = ('%s %s'):format('clearinventory', serverId)

            local commandState, commandErrMessage = pcall(function()
                if Prison.KeepItemState and keepItems then
                    exports.inventory:clearInventory(player, true, Prison.KeepItemState and keepItems)
                else
                    exports.inventory:clearInventory(player, true, {})
                end
            end)

            if commandState then
                clearState = true
            else
                local backClear, backClearErr = pcall(function()
                    ExecuteCommand(clearinventory)
                end)
    
                if backClear then
                    clearState = true
                end
            end
        end
    end

    dbg.debugInventory('%s inventory for user %s! | FW: %s', clearState and 'CLEARED' or 'NOT_CLEARED', GetPlayerName(serverId), shared.framework)

    return clearState
end

function GetServerInventory()
    local InventoryScripts = Prison.InventoryScripts or {}
    local DeployInventory = nil

    if not DeployInventory then
        for k, inventoryName in pairs(InventoryScripts) do
            if HasResource(inventoryName) then
                DeployInventory = inventoryName
                break
            end
        end
    end

    if DeployInventory == 'es_extended' and HasResource(InventoryScripts.QS_INVENTORY) then
        DeployInventory = InventoryScripts.QS_INVENTORY
    end

    if DeployInventory == 'es_extended' and HasResource(InventoryScripts.OX_INVENTORY) then
        DeployInventory = InventoryScripts.OX_INVENTORY
    end

    if DeployInventory == 'es_extended' and HasResource(InventoryScripts.CHEEZA_INVENTORY) then
        DeployInventory = InventoryScripts.CHEEZA_INVENTORY
    end


    return DeployInventory
end



function getPlayer(source)
    source = tonumber(source)

    if Prison.Framework == FRAMEWORK_MAP.ESX then
        return Framework.GetPlayerFromId(source)
    elseif Prison.Framework == FRAMEWORK_MAP.QBCORE then
        return Framework.Functions.GetPlayer(source)
    end
end

function gatherInventoryData(playerId)
    local inventoryData = getInventoryDataByPlayerId(playerId)
    local inventory, statusCode = {}, INVENTORY_STATUS_CODES.EMPTY_INVENTORY
    local p = promise.new()
    local iterCount = 0

    if inventoryData and next(inventoryData) and inventoryData.value and next(inventoryData.value) then
        for k, item in pairs(inventoryData.value) do
            iterCount = iterCount + 1

            if item and not inventory[k] then
                inventory[k] = {
                    name = item and item.name or 'UNK-NAME',
                    label = item and item.label or item.name or 'UNK-LABEL',
                    count = item and item.count or item.amount or 0,
                    metadata = item.metadata or item.info or {}
                }
            end

            if iterCount >= tablesize(inventoryData.value) then
                p:resolve(true)
                statusCode = INVENTORY_STATUS_CODES.HAS_ITEMS
            end
        end
    else
        p:resolve(true)
    end

    Citizen.Await(p)

    return inventory, statusCode
end

function tablesize(t)
    local c = 0
    for k, v in pairs(t) do c = c + 1 end
    return c
end

---@param serverId number -- Player serverId
---@return inventoryData --Inventory Raw data from user inventory
function getInventoryDataByPlayerId(serverId)
    local p = promise.new()
    local resolvedCount = 0

    local hasCheezaInventory = HasResource(Prison.InventoryScripts.CHEEZA_INVENTORY)
    local hasQsInventoryWithQbCore = HasResource(Prison.InventoryScripts.QS_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.QBCORE
    local hasQsInventoryWithESX = HasResource(Prison.InventoryScripts.QS_INVENTORY) and Prison.Framework == FRAMEWORK_MAP.ESX
    local hasOxInventory = HasResource(Prison.InventoryScripts.OX_INVENTORY)

    local hasMfInventory = HasResource(Prison.InventoryScripts.MF_INVENTORY)
    local hasESXInventory = HasResource(Prison.InventoryScripts.ESX_INVENTORY) and not hasOxInventory

    for resourceName, scriptName in pairs(Prison.InventoryScripts) do
        if hasQsInventoryWithESX then
            local version = GetResourceMetadata('qs-inventory', 'version', 0)
            local player = getPlayer(serverId)
            local inventory = {}

            if version >= '2.0.6' then
                inventory = exports['qs-inventory']:GetInventory(serverId)
            else
                local minimalInv = false
            
                if player then
                    inventory = player.getInventory(minimalInv) and player.getInventory(minimalInv)
                end
            end

            return p:resolve(inventory or {})
        end

        if hasESXInventory then
            local player = getPlayer(serverId)
            local inventory = player and player.inventory or {}

            return p:resolve(inventory)
        end

        if hasOxInventory then
            local inv = exports[Prison.InventoryScripts.OX_INVENTORY]:Inventory(serverId)
            local inventory, count = {}, 0

            for k, v in pairs(inv.items) do
                if v.name and v.count > 0 then
                    count += 1
                    inventory[count] = {
                        name = v.name,
                        count = v.count,
                        slot = k,
                        metadata = next(v.metadata) and v.metadata or nil
                    }
                end
            end

            return p:resolve(inventory)
        end

        if hasMfInventory then
            local xPlayer = getPlayer(serverId)

            if not xPlayer then
                return
            end

            local inventory = exports[Prison.InventoryScripts.MF_INVENTORY]:getPlayerInventory(xPlayer.getIdentifier())

            return p:resolve(inventory)
        end

        if hasCheezaInventory then
            local player = getPlayer(serverId)
            local inventory = {}
            local minimalInv = true

            if player then
                inventory = player.getInventory(minimalInv) and player.getInventory(minimalInv) or player.inventory
            end
            
            return p:resolve(inventory)
        end

        if HasResource(Prison.InventoryScripts.MF_INVENTORY) then
            local player = getPlayer(serverId)
            local inventory = {}

            if player then
                inventory = exports[Prison.InventoryScripts.MF_INVENTORY]:getPlayerInventory(player.getIdentifier())
            end

            return p:resolve(inventory)
        end

        if hasQsInventoryWithESX then
            local version = GetResourceMetadata('qs-inventory', 'version', 0)
            local player = getPlayer(serverId)
            local inventory = {}

            if version >= '2.0.6' then
                inventory = exports['qs-inventory']:GetInventory(serverId)
            else
                local minimalInv = false
            
                if player then
                    inventory = player.getInventory(minimalInv) and player.getInventory(minimalInv)
                end
            end

            return p:resolve(inventory)
        end

        if HasResource(Prison.InventoryScripts.QB_INVENTORY) or hasQsInventoryWithQbCore then
            local player = getPlayer(serverId)
            local inventory = {}

            if hasQsInventoryWithQbCore then
                local version = GetResourceMetadata('qs-inventory', 'version', 0)

                if version >= '2.0.6' then
                    inventory = exports['qs-inventory']:GetInventory(serverId)
                else
                    inventory = player and player.PlayerData.items or {}
                end
            else
                inventory = player and player.PlayerData.items or {}
            end

            return p:resolve(inventory)
        end

        if HasResource(Prison.InventoryScripts.LJ_INVENTORY) then
            local player = getPlayer(serverId)
            local inventory = player and player.PlayerData.items or {}
            return p:resolve(inventory)
        end

        if HasResource(Prison.InventoryScripts.AJ_INVENTORY) then
            local player = getPlayer(serverId)
            local inventory = player and player.PlayerData.items or {}
            return p:resolve(inventory)
        end

        if HasResource(Prison.InventoryScripts.PS_INVENTORY) then
            local player = getPlayer(serverId)
            local inventory = player and player.PlayerData.items or {}

            return p:resolve(inventory)
        end

        resolvedCount = resolvedCount + 1

        if resolvedCount >= tablesize(Prison.InventoryScripts) then
            p:resolve(true)
        end
    end
    
    return Citizen.Await(p)
end

GetMissingItems = function(myArray)
	if not myArray then
		return
	end

	local message = ""

	for itemName, state in pairs(myArray) do
        if not state then
            message = message ..  itemName .. ', '
        end
	end

	message = message:sub(1, -3)

	return message
end


InventoryTransactionValidateItems = function(playerId, items)
    local p = promise.new()
    local inventoryItems = {}

    if items and #items > 0 then
        for i = 1, #items, 1 do
            local item = items[i]
            local itemCount = Bridge.GetItem(playerId, item.itemName)

            if itemCount >= tonumber(item.count) then
                inventoryItems[item.itemName] = true
            else
                inventoryItems[item.itemName] = false
            end

            if i == #items then
                p:resolve(true)
            end
        end
    end

    Citizen.Await(p)

    local retval = GetStateFromInventoryItems(inventoryItems)

    if retval == nil then
        retval = true
    end

    return retval, inventoryItems
end

GetStateFromInventoryItems = function(inventoryItems)
    for _, state in pairs(inventoryItems) do
        if not state then
            return false
        end
    end
end

InventoryTransactionAddItems = function(playerId, items)
    local p = promise.new()

    if #items > 0 then
        for i = 1, #items, 1 do
            local item = items[i]

            Bridge.AddItem(playerId, item.itemName, item.count, item.metadata)

            if i == #items then
                p:resolve(true)
            end
        end
    end

    Citizen.Await(p)
end

InventoryTransactionRemoveItems = function(playerId, items)
    local p = promise.new()

    if #items > 0 then
        for i = 1, #items, 1 do
            local item = items[i]
            local itemCount = Bridge.GetItem(playerId, item.itemName)

            if itemCount >= tonumber(item.count) then
                Bridge.RemoveItem(playerId, item.itemName, item.count, {})
            end

            if #items == i then
                p:resolve(true)
            end
        end
    end

    Citizen.Await(p)
end

---Do a transaction in order to take or give items, or both.
---@param serverId integer The players server id.
---@param data table A table which determines what items that should be taken and given.
---@param successCb function A function which will determine what to do if the transaction is successful.
---@param failCb function A function which will determine what to do if the transaction is unsuccessful.
InventoryTransaction = function(serverId, data, successCb, failCb)
    if serverId == nil then
        return dbg.debugInventory('Failed to do transaction, serverId is nil!')
    end

    local data = data or {}

    local isGiveTransaction = data.give and next(data.give) ~= nil
    local isTakeTransaction = data.take and next(data.take) ~= nil

    local transaction = {
        playerId = serverId,
        debug = true,
        type = 'inventory',
        timeout = 500,
        id = 0,
        soloTransactionState = false,
        state = false,
        stateCode = 'UNK',
        inventory = {
            giveState = isGiveTransaction,
            takeState = isTakeTransaction,
            give = data.give or nil,
            take = data.take or nil,
        }
    }

    -- Validate transaction and return callback via state.

    CreateThread(function()
        CheckInitStatus(transaction):next(function(state)
            if not transaction.state then
                failCb(transaction.stateCode)
            elseif transaction.state then
                successCb(transaction.stateCode)
            end
        end)
    end)
end