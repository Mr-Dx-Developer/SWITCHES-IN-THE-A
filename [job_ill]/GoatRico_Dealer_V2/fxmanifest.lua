fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'GoatRico'
description 'DrugSale'
version '1.2'

shared_scripts { 
	'shared/config.lua',
	'shared/config_notifications.lua',
	'@ox_lib/init.lua'
}

client_scripts {	
	'client/client.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
	'shared/webhook.lua',
}

dependencies {
	'ox_lib',
	'ox_inventory'
}


escrow_ignore {
	'shared/config.lua',
	'shared/config_notifications.lua',
	'shared/webhook.lua',
  }
dependency '/assetpacks'