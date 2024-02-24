
--[[
    All the roles here can access the admin menu
    Only the GOD can set the panels for the other roles
    There are 3 options
    1. God -> can access all the commands
    
    IMPORTANT: DO NOT REMOVE GOD ROLE, IF YOU DO SO, YOU WILL NOT BE ABLE TO ACCESS THE ADMIN MENU AT ALL

    If you have a new role, you can add it here and select to give either God, Admin or Moderator or any of the custom perms you want

    eg. ["new_role"] = "God",
    eg. ["dev"] = "Admin",
]]--
Config.GodRoles = {
    ["god"] = "God", -- This is the biggest role (DO NOT REMOVE THIS ROLE)
    ["admin"] = "Admin", -- This is just a custom role
    ["mod"] = "Moderator", -- This is just a custom role
    -- ["new_role1"] = "Test", -- if you want to add more roles just add them here
    -- ["new_role2"] = "Test", -- if you want to add more roles just add them here
    -- ["new_role3"] = "Test",
    -- if you want to add more roles just add them here
    -- ["NEW_ROLE_HERE"] = "God",
    -- ["NEW_ROLE_HERE"] = "Admin",
    -- ["NEW_ROLE_HERE"] = "Moderator",
}

Config.Permissions = {
    ["license:8601d9b7e1fab1f7008d9ca44176ceddd04353bc"] = "god", -- rico
    ["license:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5"] = "god", -- dx

   



    ["discord:1144911208303034440"] = "god",  -- Vroy
    ["discord:981738978015313930"] = "god", -- Dex
    ["discord:1164653509443059732"] = "god", -- Ishh
    ["discord:662207311665954826"] = "god",  -- Ace
    ["discord:1012094569321615401"] = "god", -- Jack
    ["discord:1051260760992522320"] = "god", -- Shawnii
    ["discord:1110069724143951923"] = "god", -- Stormii

  -- ["fivem:1234"] = "god",
  --  ["steam:1234"] = "god",
  --  ["124584938326312"] = "god", -- discord roles (copy the role id and paste it here) (If you want to use the discord roles, you need to add the bot token and server id in sv_customise.lua at the top)
  --  ["XY123456"] = "god", -- citizenid for qbcore
  --  ["char1:12334"] = "god", -- charid for ESX

    -- ["license:6d3b6254a50416697dcaa91878e2eb03d9112302"] = {"mod", "admin"}, -- the role god, admin or mod should be the key from Config.GodRoles which means the values that are added in square brackets.
    -- ["license:1234"] = "admin",
    -- ["license:1234"] = "mod",
    -- ["license:1234"] = "new_role1",
    -- ["license:1234"] = "new_role2",
    -- ["license:1234"] = "new_role3",
}

