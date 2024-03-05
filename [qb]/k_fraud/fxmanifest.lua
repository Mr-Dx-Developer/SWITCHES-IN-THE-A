fx_version 'adamant'

game 'gta5'

description 'Kypo QB fraudulent check system!'

version '1.0.0'
lua54 'yes'

server_scripts {
	'config_sv.lua',
	'server/server.lua'
}

client_scripts {
	'config_cl.lua',
	'client/client.lua'
}

shared_scripts{
	'config_sh.lua'
}



escrow_ignore {
  'config_sv.lua',
  'config_cl.lua',
  'config_sh.lua'
}
dependency '/assetpacks'