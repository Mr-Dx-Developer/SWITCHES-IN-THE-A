-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Wasabi ESX Multijob System'
author 'wasabirobby#5110'
version '1.3.2'

shared_scripts { '@ox_lib/init.lua', 'configuration/*.lua' }

server_scripts { '@oxmysql/lib/MySQL.lua', 'server/*.lua' }

client_scripts { 'client/*.lua' }

dependencies { 'oxmysql', 'ox_lib' }

escrow_ignore {
  'configuration/*.lua',
  'client/client.lua',
  'client/cl_customize.lua',
  'server/sv_customize.lua'
}

dependency '/assetpacks'