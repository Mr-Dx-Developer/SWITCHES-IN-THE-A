-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Wasabi Crutch / Wheelchair System'
author 'wasabirobby'
version '1.1.3'

files {
	'chair_data/vehicles.meta',
	'chair_data/carvariations.meta',
	'chair_data/handling.meta'
}

data_file 'DLC_ITYP_REQUEST' 'stream/crutch.ytyp'
data_file 'HANDLING_FILE'			'chair_data/handling.meta'
data_file 'VEHICLE_METADATA_FILE'	'chair_data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE'	'chair_data/carvariations.meta'

shared_scripts { '@ox_lib/init.lua', '@wasabi_bridge/import.lua', 'configuration/*.lua' }

client_scripts { 'client/*.lua' }

server_scripts { 'server/sv_customize.lua', 'server/*.lua' }

dependencies { 'ox_lib', 'wasabi_bridge' }

escrow_ignore {
  'configuration/*.lua',
  'client/client.lua',
  'server/sv_customize.lua'
}

dependency '/assetpacks'