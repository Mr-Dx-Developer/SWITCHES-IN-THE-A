fx_version 'cerulean'
game 'gta5'

description 'QB-Pawnshop'
version '1.0.0'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'config.lua',
	'locales/en.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/main.lua'
}

lua54 'yes'

escrow_ignore {
    'config.lua'

}
dependency '/assetpacks'