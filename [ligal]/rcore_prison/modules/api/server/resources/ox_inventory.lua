OX_INVENTORY_ITEMS_DEPLOY = {
    {
        name = 'cigar',
        label = 'Cigar',
        weight = 10,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'sludgie',
        label = 'Sludgie',
        weight = 10,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'sprunk',
        label = 'Sprunk',
        weight = 50,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'ecola_light',
        label = 'Ecola light',
        weight = 50,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'coffee',
        label = 'Coffee',
        weight = 50,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'cigs_69brand',
        label = '69 Brand',
        weight = 50,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'cigs_cardiaque',
        label = 'Cardiaque',
        weight = 50,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'cigs_debonaireblue',
        label = 'Debonaire Blue',
        weight = 50,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'cigs_debonairegreen',
        label = 'Debonaire Green',
        weight = 50,
        stack = true,
        close = true,
        consume = 0,
    },
    {
        name = 'cigs_redwood',
        label = 'Red Wood',
        weight = 50,
        stack = true,
        close = true,
        consume = 0,
    },
}

if isResourceLoaded('ox_inventory') then
    AssetDeployer:registerCopyFilesDeploy('items-images', 'ox_inventory', 'assets/inventoryImages', 'web/images',
        function(data)
            local files = {}
            
            for _, item in ipairs(data) do
                table.insert(files, item .. '.png')
            end

            return files
        end, { 'cigar', 'sludgie', 'sprunk', 'ecola_light', 'coffee', 'cigs_69brand', 'cigs_cardiaque', 'cigs_debonaireblue', 'cigs_debonairegreen', 'cigs_redwood' }
    )

    AssetDeployer:registerFileDeploy('items', 'ox_inventory', 'data/items.lua', function(file, data)
        file = file:strtrim():gsub('}$', '')
        file = append(file, '\n', ASSET_DEPLOYER_WATERMARK_PREFIX)

        local itemTemplate = [[
['%s'] = {
    label = '%s',
    weight = %s,
    stack = %s,
    close = %s,
    consume = %s,
    server = {
        export = '%s'
    },
    %s
},
    ]]

        for _, item in ipairs(data) do
            local buttons = ''
            local formattedItem = itemTemplate:format(
                item.name,
                item.label,
                item.weight,
                item.stack,
                item.close,
                item.consume,
                item.export or nil,
                buttons
            )
            file = append(file, '', formattedItem)
        end

        file = append(file, '', ASSET_DEPLOYER_WATERMARK_SUFFIX, '}')
        return file
    end, OX_INVENTORY_ITEMS_DEPLOY)
end
