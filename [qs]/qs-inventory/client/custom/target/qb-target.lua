if Config.UseTarget ~= 'qb-target' then
    return
end

function DropTarget(dropItem, index)
    exports['qb-target']:AddTargetEntity(dropItem, {
        options = {
            {
                icon = 'fa-solid fa-bag-shopping',
                label = 'Open Drop',
                action = function()
                    TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'drop', index)
                end,
            }
        },
        distance = 2.5,
    })
end

CreateThread(function()
    -- Selling
    for k, v in pairs(Config.SellItems) do
        exports['qb-target']:AddBoxZone(k, vec3(v['coords'].x, v['coords'].y, v['coords'].z), 1.5, 1.5, {
            name = k,
            heading = 90.0,
            debugPoly = Config.ZoneDebug,
            minZ = v['coords'].z - 1,
            maxZ = v['coords'].z + 1,
        }, {
            options = {
                {
                    type = 'client',
                    icon = 'fa-solid fa-cash-register',
                    label = Lang('INVENTORY_TEXT_SELLING'),
                    canInteract = function(entity, distance, data)
                        return true
                    end,
                    action = function(entity)
                        local PawnshopItems = {}
                        PawnshopItems.label = k
                        PawnshopItems.items = v['items']
                        PawnshopItems.slots = #v['items']
                        TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'selling', 'itemselling_' .. k, PawnshopItems)
                    end,
                },
            },
            distance = 2.5
        })
    end

    -- Crafting
    if Config.Crafting then
        for k, v in pairs(Config.CraftingTables) do
            exports['qb-target']:AddBoxZone(k, vec3(v.location.x, v.location.y, v.location.z), 2.5, 2.5, {
                name = k,
                heading = 90.0,
                debugPoly = Config.ZoneDebug,
                minZ = v.location.z - 1,
                maxZ = v.location.z + 1,
            }, {
                options = {
                    {
                        type = 'client',
                        icon = 'fa-solid fa-hammer',
                        label = 'Crafting',
                        canInteract = function(entity, distance, data)
                            return true
                        end,
                        action = function(entity)
                            if v.isjob then
                                if IsPlayerAuthorized(v) then
                                    CurrentCrafting = k
                                    local crafting = {
                                        label = v.name,
                                        items = GeneralInfos(k)
                                    }
                                    TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'crafting', math.random(1, 99), crafting)
                                end
                            else
                                CurrentCrafting = k
                                local crafting = {
                                    label = v.name,
                                    items = GeneralInfos(k)
                                }
                                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'crafting', math.random(1, 99), crafting)
                            end
                        end,
                    },
                },
                distance = 2.5
            })
        end
    end

    -- Vending shops
    for k, v in pairs(Config.Vendings) do
        exports['qb-target']:AddTargetModel(v['Model'], {
            options = {
                {
                    icon = 'fa-solid fa-cash-register',
                    label = 'Vending',
                    action = function()
                        TriggerEvent(Config.InventoryPrefix .. ':client:openVending', { category = v['Category'] })
                    end
                },
            },
            distance = 2.5
        })
    end

    -- Gargabe Code
    exports['qb-target']:AddTargetModel(Config.GarbageObjects, {
        options = {
            {
                icon = 'fa-solid fa-trash',
                label = 'Open Garbage',
                action = function()
                    ExecuteCommand('inventory')
                end
            },
        },
        distance = 1.0
    })
end)
