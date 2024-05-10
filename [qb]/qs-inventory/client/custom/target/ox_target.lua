if Config.UseTarget ~= 'ox_target' then
    return
end

local ox_target = exports.ox_target

function DropTarget(dropItem, index)
    local options = {
        {
            icon = 'fa-solid fa-bag-shopping',
            label = 'Open Drop',
            distance = 2.5,
            onSelect = function()
                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'drop', index)
            end
        },
    }
    ox_target:addLocalEntity(dropItem, options)
end

CreateThread(function()
    -- Selling
    for k, v in pairs(Config.SellItems) do
        local options_selling = {
            coords = vec3(v['coords'].x, v['coords'].y, v['coords'].z),
            distance = 150.0,
            rotation = 180.0,
            debug = Config.ZoneDebug,
            options = {
                {
                    icon = 'fa-solid fa-cash-register',
                    label = 'Buyer',
                    distance = 2.5,
                    onSelect = function()
                        local PawnshopItems = {}
                        PawnshopItems.label = k
                        PawnshopItems.items = v['items']
                        PawnshopItems.slots = #v['items']
                        TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'selling', 'itemselling_' .. k, PawnshopItems)
                    end
                }
            },
        }
        ox_target:addBoxZone(options_selling)
    end

    -- Crafting
    if Config.Crafting then
        for k, v in pairs(Config.CraftingTables) do
            local options_crafting = {
                coords = vec3(v.location.x, v.location.y, v.location.z),
                distance = 2.5,
                rotation = 180.0,
                debug = Config.ZoneDebug,
                options = {
                    {
                        icon = 'fa-solid fa-hammer',
                        label = 'Crafting',
                        distance = 2.5,
                        onSelect = function()
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
                        end
                    }
                },
            }
            ox_target:addBoxZone(options_crafting)
        end
    end

    -- Vending shops
    for k, v in pairs(Config.Vendings) do
        local options_vending = {
            {
                icon = 'fa-solid fa-cash-register',
                label = 'Open Vending',
                distance = 2.5,
                onSelect = function()
                    TriggerEvent(Config.InventoryPrefix .. ':client:openVending', { category = v['Category'] })
                end
            },
        }
        ox_target:addModel(v['Model'], options_vending)
    end

    local options_vendingObjects = {
        {
            icon = 'fa-solid fa-cash-register',
            label = 'Open Vending',
            distance = 2.5,
            onSelect = function()
                TriggerEvent(Config.InventoryPrefix .. ':client:openVending', { category = v['Category'] })
            end
        },
    }
    ox_target:addModel(Config.VendingObjects, options_vendingObjects)


    -- Gargabe Code
    local options_garbage = {
        {
            icon = 'fa-solid fa-trash',
            label = 'Open Garbage',
            distance = 1.0,
            onSelect = function()
                ExecuteCommand('inventory')
            end
        },
    }
    ox_target:addModel(Config.GarbageObjects, options_garbage)
end)
