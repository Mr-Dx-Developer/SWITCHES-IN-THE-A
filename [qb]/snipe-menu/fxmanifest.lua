fx_version 'cerulean'
game 'gta5'

description 'Admin Menu Script'
version '3.4.1'
author 'Snipe'

lua54 'yes'
ui_page 'html/index.html'

shared_scripts { 
	'config/config.lua',
    'config/*.lua',
    'custom/custom_config.lua',
}

files {
	'html/**/*',
}

client_scripts{
    'utils/cl_utils.lua',
    'client/**/*.lua',
    'custom/client.lua'
} 

server_scripts{
    'utils/sv_utils.lua',
    '@oxmysql/lib/MySQL.lua',
    'server/**/*.lua',
    'custom/server.lua'
} 

escrow_ignore {
    'utils/**/*.lua',
    'config/**/*.lua',
    'client/open/*.lua',
    'server/open/*.lua',
    'custom/**/*.lua'
}

dependency '/assetpacks'