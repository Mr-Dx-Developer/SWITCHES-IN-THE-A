--[[
    Hello dear developer, if you are looking at this, you will be interested to know how this
    automatic insertion system works. It's very simple, fill your furniture with the same
    syntax as the other examples, and add the `insertFurniture` function as at the end of this
    document, in this way you will add groups or single items to the Furnitures table.

    By the way, you can add a special color to make your furniture stand out!
]]

CreateThread(function()
    local Pata_valentinesday_decals = {
        {
            ['object'] = 'pata_valentine2',
            ['price'] = 50,
            ['label'] = 'Pata Valentine 02',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'pata_valentine2',  ['price'] = 50, ['label'] = 'Pata Valentine 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine3',  ['price'] = 50, ['label'] = 'Pata Valentine 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine4',  ['price'] = 50, ['label'] = 'Pata Valentine 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine6',  ['price'] = 50, ['label'] = 'Pata Valentine 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine7',  ['price'] = 50, ['label'] = 'Pata Valentine 07', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine8',  ['price'] = 50, ['label'] = 'Pata Valentine 08', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine9',  ['price'] = 50, ['label'] = 'Pata Valentine 09', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine10', ['price'] = 50, ['label'] = 'Pata Valentine 10', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine11', ['price'] = 50, ['label'] = 'Pata Valentine 11', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine12', ['price'] = 50, ['label'] = 'Pata Valentine 12', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_valentine13', ['price'] = 50, ['label'] = 'Pata Valentine 13', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local Pata_valentinesday_beds = {
        {
            ['object'] = 'pata_valentine5', ['price'] = 1600, ['label'] = 'Pata Valentine 05', ['background'] = 'rgba(162, 16, 230, 0.17)',
        }
    }

    local Pata_valentinesday_showers = {
        {
            ['object'] = 'pata_valentine', ['price'] = 1600, ['label'] = 'Pata Valentine 01', ['background'] = 'rgba(162, 16, 230, 0.17)',
        }
    }

    insertFurniture(Config.FurnitureList.decals, Pata_valentinesday_decals)
    insertFurniture(Config.FurnitureList.beds, Pata_valentinesday_beds)
    insertFurniture(Config.FurnitureList.showers, Pata_valentinesday_showers)
end)
