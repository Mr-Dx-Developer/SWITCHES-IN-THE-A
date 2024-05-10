Config = Config or {}

-- Clarification if you are going to create more backpacks you have to add the information in these parts:

-- qs-inventory/config/metadata.js
-- Save information
--[[
     } else if (itemData.name == "YOUR_BACKPACK_NAME") {
     $(".item-info-title").html("<p>" + label + "</p>");
     $(".item-info-description").html(
         "<p><strong>ID: </strong><span>" +
         itemData.info.ID +
         "</span></p><p><strong>Weight: </strong><span>" +
         itemData.info.weight +
         "</span></p><p><strong>Slots: </strong><span>" +
         itemData.info.slots +
         "</span></p>"
     );
]]

-- qs-inventory/server/custom/GiveItemToPlayer.lua
-- For giveitem admin
--[[
     elseif itemData["name"] == "YOUR_BACKPACK_NAME" then
          info.ID = 'backpack_'..math.random(111111,999999)
          info.weight = 10000
          info.slots = 10
]]

-- (IMPORTANT INTEGRATION WITH qs-advancedshops or qs-shops)
-- If you want to add the backpack to a qs-shop, you must add an ID to the item. this is the example :
--[[
     qs-shops/config/config.lua or qs-advancedshops/config/shops.lua

     [1] = {
          name = "backpack",
          label = 'Backpack',
          price = 250,
          amount = 100,
          info = {}, -- If you put here info = {}, it will automatically take the weight of your configuration
          type = "item",
          slot = 1,
     },
     [2] = {
          name = "my_custom_backpack",
          label = 'UwU Backpack',
          price = 250,
          amount = 100,
          info = { ID = 'ID_'..math.random(111111,999999), weight = 10000 , slots = 10}, -- If you put this information, it will take the information you put in it
          type = "item",
          slot = 2,
     },
]]

-- (important) do not use both prop and cloth at same time just one.
Config.Items = {
     ['backpack'] = {      --- Item name
          slots = 20,      -- Change in `qs-inventory/server/custom/GiveItemToPlayer.lua`
          weight = 1200000, -- Change in `qs-inventory/server/custom/GiveItemToPlayer.lua`
          locked = false,  -- If you want to have a password change false to true
          prop = {
               model = 'vw_prop_vw_backpack_01a',
               animation = {
                    dict = 'amb@world_human_hiker_standing@female@base',
                    anim = 'base',
                    bone = 'Back',  -- LeftHand | RightHand
                    attaching_position = {
                         x = -0.20, -- Up - Down
                         y = -0.10, -- Forward Backward
                         z = 0.0,   -- Left - Right
                         x_rotation = 10.0,
                         y_rotation = 90.0,
                         z_rotation = 175.0,
                    }
               },
          },
     },
     ['backpack2'] = {
          slots = 20,      -- Change in `qs-inventory/server/custom/GiveItemToPlayer.lua`
          weight = 1200000, -- Change in `qs-inventory/server/custom/GiveItemToPlayer.lua`
          cloth = {
               male = {
                    ['bag'] = { item = 45, texture = 0 }
               },
               female = {
                    ['bag'] = { item = 45, texture = 0 }
               }
          }
     },
     ['briefcase'] = {
          slots = 3,
          weight = 5000,
          locked = true, -- If you want to have a password change false to true
          prop = {
               model = 'prop_ld_suitcase_01',
               animation = {
                    dict = 'missheistdocksprep1hold_cellphone',
                    anim = 'static',
                    bone = 'RightHand',
                    attaching_position = {
                         x = 0.10,
                         y = 0.0,
                         z = 0.0,
                         x_rotation = 0.0,
                         y_rotation = 280.0,
                         z_rotation = 53.0,
                    }
               },
          },
     },
     ['paramedicbag'] = {
          slots = 10,     -- Change in `qs-inventory/server/custom/GiveItemToPlayer.lua`
          weight = 10000, -- Change in `qs-inventory/server/custom/GiveItemToPlayer.lua`
          prop = {
               model = 'xm_prop_smug_crate_s_medical',
               animation = {
                    dict = 'missheistdocksprep1hold_cellphone',
                    anim = 'static',
                    bone = 'RightHand',
                    attaching_position = {
                         x = 0.29,
                         y = -0.05,
                         z = 0.0,
                         x_rotation = -25.0,
                         y_rotation = 280.0,
                         z_rotation = 75.0,
                    }
               },
          }
     },
}

Config.Bones = {
     bones = {
          ['RightHand'] = {
               bone = 57005,
               current_active_porp = nil,
               slot = -1,
          },
          ['Back'] = {
               bone = 24818,
               current_active_porp = nil,
               slot = -1,
          },
          ['LeftHand'] = {
               bone = 18905,
               current_active_porp = nil,
               slot = -1,
          },
     }
}
