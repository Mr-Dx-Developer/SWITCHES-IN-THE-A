fx_version 'cerulean'
game 'gta5'
description 'Ak47 Qb Gunjamming'
version '1.2'

client_scripts {
	'config.lua',
	'client/utils.lua',
	'client/main.lua',

	'locales/locale.lua',
	'locales/en.lua',
}

escrow_ignore {
    'locales/*.lua',
    'config.lua',
    'client/utils.lua',
}

lua54 'yes'
dependency '/assetpacks'