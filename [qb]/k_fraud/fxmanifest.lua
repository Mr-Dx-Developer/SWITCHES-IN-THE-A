fx_version 'adamant'

game 'gta5'

description 'Kypo ESX fraudulent check system!'

version '1.0.0'
lua54 'yes'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config_sv.lua',
	'server/server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config_cl.lua',
	'client/client.lua'
}

shared_scripts{
	'config_sh.lua'
}

dependencies {
	'es_extended', --if using modifided code then delete this
}


escrow_ignore {
  'config_sv.lua',
  'config_cl.lua',
  'config_sh.lua'
}

exports {
	'useSlip',
}
dependency '/assetpacks'