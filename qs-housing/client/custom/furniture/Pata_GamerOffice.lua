--[[
    Hello dear developer, if you are looking at this, you will be interested to know how this
    automatic insertion system works. It's very simple, fill your furniture with the same
    syntax as the other examples, and add the `insertFurniture` function as at the end of this
    document, in this way you will add groups or single items to the Furnitures table.

    By the way, you can add a special color to make your furniture stand out!
]]

CreateThread(function()
    local Pata_GamerOffice_electronics = {
        {
            ['object'] = 'pata_office1',
            ['price'] = 700,
            ['label'] = 'Pata Gamer 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'pata_office1', ['price'] = 900, ['label'] = 'Pata Gamer 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_office2', ['price'] = 900, ['label'] = 'Pata Gamer 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_office4', ['price'] = 900, ['label'] = 'Pata Gamer 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_office5', ['price'] = 900, ['label'] = 'Pata Gamer 05', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_office7', ['price'] = 900, ['label'] = 'Pata Gamer 07', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_office9', ['price'] = 900, ['label'] = 'Pata Gamer 09', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local Pata_GamerOffice_chairs = {
        {
            ['object'] = 'pata_office3',
            ['price'] = 700,
            ['label'] = 'Pata Gamer 03',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'pata_office3', ['price'] = 900, ['label'] = 'Pata Gamer 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_office6', ['price'] = 900, ['label'] = 'Pata Gamer 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local Pata_GamerOffice_lamps = {
        {
            ['object'] = 'pata_office8', ['price'] = 900, ['label'] = 'Pata Gamer 08', ['background'] = 'rgba(162, 16, 230, 0.17)',
        }
    }

    local Pata_GamerOffice_tables = {
        {
            ['object'] = 'pata_office10', ['price'] = 900, ['label'] = 'Pata Gamer 10', ['background'] = 'rgba(162, 16, 230, 0.17)',
        }
    }

    local Pata_GamerOffice_walldecoration = {
        {
            ['object'] = 'pata_office11',
            ['price'] = 700,
            ['label'] = 'Pata Gamer 11',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'pata_office11', ['price'] = 900, ['label'] = 'Pata Gamer 11', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'pata_office12', ['price'] = 900, ['label'] = 'Pata Gamer 12', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    insertFurniture(Config.FurnitureList.electronics, Pata_GamerOffice_electronics)
    insertFurniture(Config.FurnitureList.chairs, Pata_GamerOffice_chairs)
    insertFurniture(Config.FurnitureList.lamps, Pata_GamerOffice_lamps)
    insertFurniture(Config.FurnitureList.tables, Pata_GamerOffice_tables)
    insertFurniture(Config.FurnitureList.walldecoration, Pata_GamerOffice_walldecoration)
end)
