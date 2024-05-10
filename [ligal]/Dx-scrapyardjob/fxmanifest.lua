fx_version 'cerulean'
game 'gta5'


shared_scripts { 
	'config.lua'
}


client_scripts {
    'client/main.lua',
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
}


server_scripts {
    'server/main.lua',
	'@oxmysql/lib/MySQL.lua',
}

escrow_ignore {
	'client/main.lua',
	'config.lua',
	'server/main.lua',
}

lua54 'yes'
