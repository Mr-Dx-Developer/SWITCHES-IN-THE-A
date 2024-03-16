--[[
    Hello dear developer, if you are looking at this, you will be interested to know how this
    automatic insertion system works. It's very simple, fill your furniture with the same
    syntax as the other examples, and add the `insertFurniture` function as at the end of this
    document, in this way you will add groups or single items to the Furnitures table.

    By the way, you can add a special color to make your furniture stand out!
]]

if not GetResourceState('KillstorexQuasar_props') == 'started' then
    return
end

CreateThread(function()
    table.insert(Config.roomsData, { id = 'killstore', name = 'Killstore' })
    Wait(500)
end)

CreateThread(function()
    local killstore_anime = {
        {
            ['object'] = 'ks_anime_shelf01',
            ['price'] = 150,
            ['label'] = 'Anime Shelf 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_anime_shelf01', ['price'] = 150, ['label'] = 'Anime Shelf 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_anime_shelf02', ['price'] = 150, ['label'] = 'Anime Shelf 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_anime_shelf03', ['price'] = 150, ['label'] = 'Anime Shelf 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_anime_shelf04', ['price'] = 150, ['label'] = 'Anime Shelf 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_anime_shelf05', ['price'] = 150, ['label'] = 'Anime Shelf 07', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_chair = {
        {
            ['object'] = 'ks_gaming_chair01',
            ['price'] = 320,
            ['label'] = 'Gaming Chair 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_gaming_chair01', ['price'] = 320, ['label'] = 'Gaming Chair 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair02', ['price'] = 320, ['label'] = 'Gaming Chair 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair03', ['price'] = 320, ['label'] = 'Gaming Chair 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair04', ['price'] = 320, ['label'] = 'Gaming Chair 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair05', ['price'] = 320, ['label'] = 'Gaming Chair 05', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair06', ['price'] = 320, ['label'] = 'Gaming Chair 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair07', ['price'] = 320, ['label'] = 'Gaming Chair 07', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair08', ['price'] = 320, ['label'] = 'Gaming Chair 08', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair09', ['price'] = 320, ['label'] = 'Gaming Chair 09', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_chair10', ['price'] = 320, ['label'] = 'Gaming Chair 10', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_deck = {
        {
            ['object'] = 'ks_gaming_desk01',
            ['price'] = 320,
            ['label'] = 'Gaming Deck 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_gaming_desk01', ['price'] = 320, ['label'] = 'Gaming Deck 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_desk02', ['price'] = 320, ['label'] = 'Gaming Deck 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_desk03', ['price'] = 320, ['label'] = 'Gaming Deck 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_desk04', ['price'] = 320, ['label'] = 'Gaming Deck 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_desk05', ['price'] = 320, ['label'] = 'Gaming Deck 05', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_desk06', ['price'] = 320, ['label'] = 'Gaming Deck 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_desk07', ['price'] = 320, ['label'] = 'Gaming Deck 07', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_desk08', ['price'] = 320, ['label'] = 'Gaming Deck 08', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_panels = {
        {
            ['object'] = 'ks_gaming_panels01',
            ['price'] = 320,
            ['label'] = 'Gaming Deck 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_gaming_panels01', ['price'] = 320, ['label'] = 'Gaming Deck 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_panels02', ['price'] = 320, ['label'] = 'Gaming Deck 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_panels03', ['price'] = 320, ['label'] = 'Gaming Deck 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_panels04', ['price'] = 320, ['label'] = 'Gaming Deck 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_panels05', ['price'] = 320, ['label'] = 'Gaming Deck 05', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_panels06', ['price'] = 320, ['label'] = 'Gaming Deck 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_panels07', ['price'] = 320, ['label'] = 'Gaming Deck 07', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_panels08', ['price'] = 320, ['label'] = 'Gaming Deck 08', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_gaming_panels09', ['price'] = 320, ['label'] = 'Gaming Deck 09', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_bar = {
        {
            ['object'] = 'ks_modern_bar01',
            ['price'] = 320,
            ['label'] = 'Modern Bar 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_modern_bar01', ['price'] = 320, ['label'] = 'Modern Bar 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_bar02', ['price'] = 320, ['label'] = 'Modern Bar 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_bar03', ['price'] = 320, ['label'] = 'Modern Bar 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_bar04', ['price'] = 320, ['label'] = 'Modern Bar 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_bar05', ['price'] = 320, ['label'] = 'Modern Bar 05', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_bar06', ['price'] = 320, ['label'] = 'Modern Bar 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_dresser = {
        {
            ['object'] = 'ks_modern_dresser01',
            ['price'] = 320,
            ['label'] = 'Modern Dresser 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_modern_dresser01', ['price'] = 320, ['label'] = 'Modern Dresser 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_dresser02', ['price'] = 320, ['label'] = 'Modern Dresser 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_dresser03', ['price'] = 320, ['label'] = 'Modern Dresser 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_dresser04', ['price'] = 320, ['label'] = 'Modern Dresser 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_dresser05', ['price'] = 320, ['label'] = 'Modern Dresser 05', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_dresser06', ['price'] = 320, ['label'] = 'Modern Dresser 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_fireplace = {
        {
            ['object'] = 'ks_modern_fireplace01',
            ['price'] = 320,
            ['label'] = 'Modern Fireplace 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_modern_fireplace01', ['price'] = 320, ['label'] = 'Modern Fireplace 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_fireplace02', ['price'] = 320, ['label'] = 'Modern Fireplace 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_fireplace03', ['price'] = 320, ['label'] = 'Modern Fireplace 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_puf = {
        {
            ['object'] = 'ks_modern_puf01',
            ['price'] = 320,
            ['label'] = 'Modern Puf 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_modern_puf01', ['price'] = 320, ['label'] = 'Modern Puf 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_puf02', ['price'] = 320, ['label'] = 'Modern Puf 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_puf03', ['price'] = 320, ['label'] = 'Modern Puf 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_puf04', ['price'] = 320, ['label'] = 'Modern Puf 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_puf05', ['price'] = 320, ['label'] = 'Modern Puf 05', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_puf06', ['price'] = 320, ['label'] = 'Modern Puf 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_wardrobe = {
        {
            ['object'] = 'ks_modern_wardrobe00',
            ['price'] = 320,
            ['label'] = 'Modern Wardrobe 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_modern_wardrobe01', ['price'] = 320, ['label'] = 'Modern Wardrobe 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_wardrobe02', ['price'] = 320, ['label'] = 'Modern Wardrobe 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_wardrobe03', ['price'] = 320, ['label'] = 'Modern Wardrobe 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_modern_wardrobe04', ['price'] = 320, ['label'] = 'Modern Wardrobe 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    local killstore_mirror = {
        {
            ['object'] = 'ks_wave_mirror01',
            ['price'] = 320,
            ['label'] = 'Modern Mirror 01',
            ['background'] = 'rgba(162, 16, 230, 0.17)',
            ['group_items'] = {
                { ['object'] = 'ks_wave_mirror01', ['price'] = 320, ['label'] = 'Modern Mirror 01', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror02', ['price'] = 320, ['label'] = 'Modern Mirror 02', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror03', ['price'] = 320, ['label'] = 'Modern Mirror 03', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror04', ['price'] = 320, ['label'] = 'Modern Mirror 04', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror05', ['price'] = 320, ['label'] = 'Modern Mirror 05', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror06', ['price'] = 320, ['label'] = 'Modern Mirror 06', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror07', ['price'] = 320, ['label'] = 'Modern Mirror 07', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror08', ['price'] = 320, ['label'] = 'Modern Mirror 08', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror09', ['price'] = 320, ['label'] = 'Modern Mirror 09', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror10', ['price'] = 320, ['label'] = 'Modern Mirror 10', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror11', ['price'] = 320, ['label'] = 'Modern Mirror 11', ['background'] = 'rgba(162, 16, 230, 0.17)' },
                { ['object'] = 'ks_wave_mirror12', ['price'] = 320, ['label'] = 'Modern Mirror 12', ['background'] = 'rgba(162, 16, 230, 0.17)' },
            }
        }
    }

    insertFurniture(Config.FurnitureList.ksgaming, killstore_anime)
    insertFurniture(Config.FurnitureList.ksgaming, killstore_chair)
    insertFurniture(Config.FurnitureList.ksgaming, killstore_deck)
    insertFurniture(Config.FurnitureList.ksgaming, killstore_panels)
    insertFurniture(Config.FurnitureList.kskitchen, killstore_bar)
    insertFurniture(Config.FurnitureList.ksroom, killstore_dresser)
    insertFurniture(Config.FurnitureList.ksroom, killstore_fireplace)
    insertFurniture(Config.FurnitureList.ksgarden, killstore_puf)
    insertFurniture(Config.FurnitureList.ksroom, killstore_wardrobe)
    insertFurniture(Config.FurnitureList.ksroom, killstore_mirror)
end)
