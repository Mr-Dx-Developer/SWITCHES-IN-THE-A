local ESX_ITEMS_DEPLOY = {
    {
        name = 'cigar',
        label = 'Cigar',
        weight = 10,
    },
    {
        name = 'sludgie',
        label = 'Sludgie',
        weight = 50,
    },
    {
        name = 'sprunk',
        label = 'Sprunk',
        weight = 50,
    },
    {
        name = 'ecola_light',
        label = 'Ecola light',
        weight = 50,
    },
    {
        name = 'coffee',
        label = 'Coffee',
        weight = 50,
    },
    {
        name = 'cigs_69brand',
        label = '69 Brand',
        weight = 50,
    },
    {
        name = 'cigs_cardiaque',
        label = 'Cardiaque',
        weight = 50,
    },
    {
        name = 'cigs_debonaireblue',
        label = 'Debonaire Blue',
        weight = 50,
    },
    {
        name = 'cigs_debonairegreen',
        label = 'Debonaire Green',
        weight = 50,
    },
    {
        name = 'cigs_redwood',
        label = 'Red Wood',
        weight = 50,
    },
}

if isResourceLoaded(Prison.InventoryScripts.CHEEZA_INVENTORY) and not isResourceLoaded('ox_inventory') and not isResourceLoaded('qs-inventory') then
    AssetDeployer:registerDeploy('items', Prison.InventoryScripts.CHEEZA_INVENTORY, function(data)
        local items = FrameworkObject.items()

        for _, item in ipairs(data) do
            if items and not items[item.name] then
                if item.name and item.label and item.weight then
                    MySQL.Sync.execute(
                    'INSERT IGNORE INTO items (name, label, weight, rare, can_remove) VALUES (?, ?, ?, 0, 1)', {
                        item.name,
                        item.label,
                        item.weight
                    })
                end
            end
        end

        return true
    end, ESX_ITEMS_DEPLOY)
end