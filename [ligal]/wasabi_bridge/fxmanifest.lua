-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'A library of functions used to ease the bridge between Wasabi Scripts'
author 'wasabirobby'
version '1.2.1'

shared_script 'config.lua'

client_scripts {
    'frameworks/**/client.lua',
    'targets/*.lua',
    'inventories/**/client.lua',
    'customize/cl_customize.lua',
    'utils/client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'frameworks/**/server.lua',
    'inventories/**/server.lua',
    'utils/server/*.lua'
}

files { 'import.lua' }

dependencies { 'oxmysql' }

escrow_ignore {
    'config.lua',
    'frameworks/**/*.lua',
    'targets/*.lua',
    'inventories/**/*.lua',
    'customize/*.lua'
}

dependency '/assetpacks'