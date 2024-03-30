RegisterNetEvent(Config.InventoryPrefix .. ':client:OpenInventory', function(PlayerAmmo, inventory, other)
    if not inventory then return Error('Inventory is not working, clear the inventory column [sql] to continue.') end
    inventory = FormatItemsToInfo(inventory)
    ToggleHud(true)
    ToggleHotbar(false)
    SetNuiFocus(true, true)
    IdleCamera(true)
    SetPedCanPlayAmbientAnims(PlayerPedId(), false)
    SetResourceKvp('idleCam', 'off')

    if other then
        currentOtherInventory = other.name
    end

    TriggerServerCallback(Config.InventoryPrefix .. ':server:QualityDecay', function(data)
        local hungerValue = hunger
        local thirstValue = thirst
        if Config.Framework == 'qb' then
            local data = GetPlayerData()
            hungerValue = data.metadata and data.metadata.hunger
            thirstValue = data.metadata and data.metadata.thirst
        end

        local PlayerSlots = Config.InventoryWeight.slots
        if not Config.BlockedSlot then
            PlayerSlots = Config.InventoryWeight.slots - 1
        end

        inventory = data.inventory
        other = data.other

        data = GetPlayerData()
        if Config.Framework == 'esx' then
            firstName = data.firstName or ''
            lastName = data.lastName or ''
            for i = 1, #data.accounts do
                if data.accounts[i].name == 'money' then
                    money = data.accounts[i].money or 'Not found'
                elseif data.accounts[i].name == 'bank' then
                    bank = data.accounts[i].money or 'Not found'
                elseif data.accounts[i].name == 'black_money' then
                    blackmoney = data.accounts[i].money or 'Not found'
                end
            end
        elseif Config.Framework == 'qb' then
            firstName = data.charinfo.firstname or ''
            lastName = data.charinfo.lastname or ''
            money = data.money.cash or 'Not found'
            bank = data.money.bank or 'Not found'
            blackmoney = data.money.crypto or 'Not found'
        end

        SendNUIMessage({
            action = 'open',
            inventory = inventory,
            slots = PlayerSlots,
            other = other,
            maxweight = Config.InventoryWeight.weight,
            Ammo = PlayerAmmo,
            playerName = firstName .. ' ' .. lastName,
            logo = Config.Logo,
            openAnimation = Config.OpenInventoryScene,
            optionClothes = Config.InventoryOptions.clothes,
            optionConfiguration = Config.InventoryOptions.configuration,
            optionHealth = Config.InventoryOptions.health,
            optionArmor = Config.InventoryOptions.armor,
            optionHunger = Config.InventoryOptions.hunger,
            optionThirst = Config.InventoryOptions.thirst,
            optionId = Config.InventoryOptions.id,
            optionMoney = Config.InventoryOptions.money,
            optionBank = Config.InventoryOptions.bank,
            optionBlackMoney = Config.InventoryOptions.blackmoney,
            playerhp = GetEntityHealth(PlayerPedId()),
            playerarmor = GetPedArmour(PlayerPedId()),
            playerhunger = hungerValue,
            playerthirst = thirstValue,
            playerId = GetPlayerServerId(PlayerId()),
            playerMoney = money,
            playerBank = bank,
            playerBlackMoney = blackmoney,
            notStolenItems = Config.notStolenItems,
            notStoredItems = Config.notStoredItems,
            labelChanger = Config.LabelChange
        })
        inInventory = true
    end, inventory, other)

    if not Config.Handsup then return end
    checkPlayerRobbery(other)
end)
