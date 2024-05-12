fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'vames™️#1400'
description 'vms_multichars'
version '1.1.6'

shared_scripts {
    'config/config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', 
    'config/config_server.lua',
    'config/config_commands.lua',
    'server/*.lua',
}

client_scripts {
    'config/config_client.lua',
    'client/*.lua',
}

ui_page {'html/ui.html'}

files {
    'html/ui.html', 
    'html/css/main.css', 
    'html/js/app.js', 
	'config/translation.js'
}

escrow_ignore {
    'config/*.lua',
    'server/*.lua',
    'client/*.lua',
}
dependency '/assetpacks'