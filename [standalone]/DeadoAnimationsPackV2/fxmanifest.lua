fx_version 'adamant'

game 'gta5'
lua54 'yes'

white 'Deado Shop'
discord 'https://discord.gg/cAg8NndK'

-- Remove the following lines if you would like to use the SQL keybinds. Requires oxmysql.

--#region oxmysql

-- dependency 'oxmysql'
-- server_script "@oxmysql/lib/MySQL.lua"

--#endregion oxmysql

shared_scripts {
    'config.lua',
}

server_scripts {
    'printer.lua',
    'server/Server.lua',
    'server/Updates.lua',
    'server/frameworks/*.lua'
}

client_scripts {
    'NativeUI.lua',
    'client/AnimationList.lua',
    'client/AnimationListCustom.lua',
    'client/Emote.lua',
    'client/EmoteMenu.lua',
    'client/Keybinds.lua',
    'client/Ragdoll.lua',
    'client/Syncing.lua',
    'client/Walk.lua',
    'client/frameworks/*.lua'
}


data_file "DLC_ITYP_REQUEST" "badge1.ytyp"

data_file "DLC_ITYP_REQUEST" "copbadge.ytyp"

data_file "DLC_ITYP_REQUEST" "prideprops_ytyp"

data_file "DLC_ITYP_REQUEST" "lilflags_ytyp"

data_file 'DLC_ITYP_REQUEST' 'bzzz_foodpack'

data_file 'DLC_ITYP_REQUEST' 'natty_props_lollipops.ytyp'

data_file 'DLC_ITYP_REQUEST' 'bebekbus.ytyp'
