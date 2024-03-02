local QB_INVENTORY_ITEMS_DEPLOY = {
    {
        name = 'cigar',
        label = 'Cigar',
        weight = 0,
        type = 'item',
        image = 'cigar.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Cigar'
    },
    {
        name = 'sludgie',
        label = 'Sludgie',
        weight = 0,
        type = 'item',
        image = 'sludgie.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Sludgie'
    },
    {
        name = 'sprunk',
        label = 'Sprunk',
        weight = 0,
        type = 'item',
        image = 'sprunk.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Sprunk'
    },
    {
        name = 'ecola_light',
        label = 'Ecola light',
        weight = 0,
        type = 'item',
        image = 'ecola_light.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Sprunk'
    },
    {
        name = 'coffee',
        label = 'Coffee',
        weight = 0,
        type = 'item',
        image = 'coffee.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Coffee'
    },
    {
        name = 'cigs_69brand',
        label = '69 Brand',
        weight = 0,
        type = 'item',
        image = 'cigs_69brand.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Coffee'
    },
    {
        name = 'cigs_cardiaque',
        label = 'Cardiaque',
        weight = 0,
        type = 'item',
        image = 'cigs_cardiaque.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Coffee'
    },
    {
        name = 'cigs_debonaireblue',
        label = 'Debonaire Blue',
        weight = 0,
        type = 'item',
        image = 'cigs_debonaireblue.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Coffee'
    },
    {
        name = 'cigs_debonairegreen',
        label = 'Debonaire Green',
        weight = 0,
        type = 'item',
        image = 'cigs_debonairegreen.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Debonaire Green'
    },
    {
        name = 'cigs_redwood',
        label = 'Red Wood',
        weight = 0,
        type = 'item',
        image = 'cigs_redwood.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Red Wood',
    },
}

if isResourceLoaded('qb-inventory') then
    AssetDeployer:registerCopyFilesDeploy('items-images', 'qb-inventory', 'assets/inventoryImages', 'html/images',
        function(data)
            local files = {}
            
            for _, item in ipairs(data) do
                table.insert(files, item .. '.png')
            end

            return files
        end, { 'cigar', 'sludgie', 'sprunk', 'ecola_light', 'coffee', 'cigs_69brand', 'cigs_cardiaque', 'cigs_debonaireblue', 'cigs_debonairegreen', 'cigs_redwood' }
    )

    AssetDeployer:registerFileDeploy('items', 'qb-core', 'shared/items.lua',
        function(file, data)
            file = file:strtrim():gsub('}$', '')
            file = append(file, ASSET_DEPLOYER_WATERMARK_PREFIX)
            local itemTemplate = [[
['%s'] = {
['name'] = '%s',
['label'] = '%s',
['weight'] = %s,
['type'] = '%s',
['image'] = '%s.png',
['unique'] = %s,
['useable'] = %s,
['shouldClose'] = %s,
['combinable'] = nil,
},
]]
            local items = {}
            for _, item in ipairs(data) do
                local formattedItem = itemTemplate:format(
                    item.name,
                    item.name,
                    item.label,
                    item.weight,
                    item.type,
                    item.name,
                    item.unique,
                    item.useable,
                    item.shouldClose
                )
                file = append(file, '', formattedItem)
            end

            file = append(file, '', ASSET_DEPLOYER_WATERMARK_SUFFIX, '}')
            return file
        end,
        QB_INVENTORY_ITEMS_DEPLOY
    )
end
