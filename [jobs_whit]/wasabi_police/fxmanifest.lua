-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Wasabi ESX/QBCore Police Job'
author 'wasabirobby'
version '1.6.2'

shared_scripts { '@ox_lib/init.lua', '@wasabi_bridge/import.lua', 'configuration/*.lua' }

client_scripts { 'client/*.lua' }

server_scripts { '@mysql-async/lib/MySQL.lua', 'server/*.lua' }

dependencies { 'mysql-async', 'ox_lib', 'wasabi_bridge' }

provides { 'esx_policejob', 'qb-policejob' }

escrow_ignore {
  'configuration/*.lua',
  'client/client.lua',
  'client/radial.lua',
  'client/cl_customize.lua',
  'server/sv_customize.lua'
}

dependency '/assetpacks'