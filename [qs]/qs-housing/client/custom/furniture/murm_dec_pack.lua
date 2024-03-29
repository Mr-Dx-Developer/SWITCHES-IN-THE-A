--[[
    Hello dear developer, if you are looking at this, you will be interested to know how this
    automatic insertion system works. It's very simple, fill your furniture with the same
    syntax as the other examples, and add the `insertFurniture` function as at the end of this
    document, in this way you will add groups or single items to the Furnitures table.

    By the way, you can add a special color to make your furniture stand out!
]]

CreateThread(function()
    local murm_dec_pack_sideboards = {
        {
            ['object'] = 'gcom_dec_pack_bathcab', ['price'] = 500, ['label'] = 'GCOM Bathcab', ['background'] = 'rgba(199, 32, 55, 0.17)'
        },
        {
            ['object'] = 'gcom_dec_pack_cabinet', ['price'] = 50, ['label'] = 'GCOM Cabinet 01', ['background'] = 'rgba(199, 32, 55, 0.17)'
        },
        {
            ['object'] = 'gcom_dec_pack_cabinet_2', ['price'] = 50, ['label'] = 'GCOM Cabinet 02', ['background'] = 'rgba(199, 32, 55, 0.17)'
        },
        {
            ['object'] = 'gcom_dec_pack_table_1', ['price'] = 50, ['label'] = 'GCOM Table 01', ['background'] = 'rgba(199, 32, 55, 0.17)'
        },
        {
            ['object'] = 'murm_dec_pack_dresser', ['price'] = 50, ['label'] = 'GCOM Dresser', ['background'] = 'rgba(199, 32, 55, 0.17)'
        }
    }

    local murm_dec_pack_tables = {
        {
            ['object'] = 'gcom_dec_pack_table_2', ['price'] = 50, ['label'] = 'GCOM Table 02', ['background'] = 'rgba(199, 32, 55, 0.17)'
        },
        {
            ['object'] = 'murm_dec_pack_table', ['price'] = 50, ['label'] = 'GCOM Table 01', ['background'] = 'rgba(199, 32, 55, 0.17)'
        }
    }

    local murm_dec_pack_wardrobes = {
        {
            ['object'] = 'gcom_dec_pack_wardrobe_1',
            ['price'] = 50,
            ['label'] = 'GCOM Wardrobe 01',
            ['background'] = 'rgba(199, 32, 55, 0.17)',
            ['group_items'] = {
                { ['object'] = 'gcom_dec_pack_wardrobe_1', ['price'] = 50, ['label'] = 'GCOM Wardrobe 01', ['background'] = 'rgba(199, 32, 55, 0.17)' },
                { ['object'] = 'gcom_dec_pack_wardrobe_1', ['price'] = 50, ['label'] = 'GCOM Wardrobe 02', ['background'] = 'rgba(199, 32, 55, 0.17)' },
                { ['object'] = 'gcom_dec_pack_wardrobe_2', ['price'] = 50, ['label'] = 'GCOM Wardrobe 03', ['background'] = 'rgba(199, 32, 55, 0.17)' },
                { ['object'] = 'murm_dec_pack_cabinet',    ['price'] = 50, ['label'] = 'GCOM Cabinet',     ['background'] = 'rgba(199, 32, 55, 0.17)' },
            },
        },
        {
            ['object'] = 'gcom_dec_pack_wall', ['price'] = 50, ['label'] = 'GCOM Wall', ['background'] = 'rgba(199, 32, 55, 0.17)'
        }
    }

    local murm_dec_pack_chairs = {
        {
            ['object'] = 'murm_dec_pack_chair_1', ['price'] = 50, ['label'] = 'GCOM Chair 01', ['background'] = 'rgba(199, 32, 55, 0.17)'
        },
        {
            ['object'] = 'murm_dec_pack_chair_2', ['price'] = 50, ['label'] = 'GCOM Chair 02', ['background'] = 'rgba(199, 32, 55, 0.17)'
        }
    }

    local murm_dec_pack_sofas = {
        {
            ['object'] = 'murm_dec_pack_sofa', ['price'] = 50, ['label'] = 'GCOM Sofa', ['background'] = 'rgba(199, 32, 55, 0.17)'
        }
    }

    insertFurniture(Config.FurnitureList.tables, murm_dec_pack_tables)
    insertFurniture(Config.FurnitureList.sideboards, murm_dec_pack_sideboards)
    insertFurniture(Config.FurnitureList.wardrobes, murm_dec_pack_wardrobes)
    insertFurniture(Config.FurnitureList.chairs, murm_dec_pack_chairs)
    insertFurniture(Config.FurnitureList.sofas, murm_dec_pack_sofas)
end)
