-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'A library of functions used to ease the bridge between Wasabi Scripts'
author 'wasabirobby'
version '1.1.5'

shared_scripts { '@ox_lib/init.lua', 'config.lua' }
client_scripts { 'frameworks/**/client.lua', 'utils/compatibility/*.lua', 'customize/cl_customize.lua', 'utils/shared/client.lua'}
server_scripts { '@oxmysql/lib/MySQL.lua', 'frameworks/**/server.lua', 'utils/shared/server.lua' }

files { 'import.lua', 'utils/verification.lua' }

dependencies { 'ox_lib', 'oxmysql' }

escrow_ignore { 'config.lua', 'frameworks/**/*.lua', 'customize/*.lua' }

dependency '/assetpacks'