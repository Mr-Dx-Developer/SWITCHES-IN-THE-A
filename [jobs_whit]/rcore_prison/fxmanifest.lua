--[[ FX Information ]]--
fx_version   'cerulean'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'rcore_prison'
author       'NewEdit'
version      '1.91'
description  'Standalone unique Prison system.'

shared_scripts {
	'shared/const.lua',
	'configs/config.lua',
	'shared/init.lua',
	'data/presets/*.lua',
	'configs/permissions.lua',
	'configs/outfits.lua',
	'modules/**/shared-internal.lua',
	'modules/**/init-prison.lua'
}

escrow_ignore {
	'assets/includedLibrary',
	'assets/includedMaps',
	'assets/inventoryImages',
	'modules/api/**/*.lua',
	'modules/base/server/sv_bridge.lua',
	'modules/base/client/cl-menu-api.lua',
	'modules/base/client/cl-menu.lua',
	'modules/base/client/cl-dealers.lua',
	'modules/**/database/*.lua',
	'modules/**/booth/**/*.lua',
	'modules/**/imports/*.lua',
	'modules/**/inventory/*.lua',
	'modules/**/framework/**/server.lua',
	'modules/**/framework/**/client.lua',
	'modules/**/target/**/client.lua',
	'modules/**/clothing/cl-main.lua',
	'modules/**/init-prison.lua',
	'web/build/config.js',
	'data/locales/*.lua',
	'data/presets/*.lua',
	'configs/config.lua',
	'configs/permissions.lua',
	'configs/interiors.lua',
	'configs/outfits.lua',
	'configs/webhook.lua',
}

client_scripts {
	'modules/**/framework/**/client.lua',
	'modules/**/target/**/client.lua',
	'modules/**/clothing/cl-main.lua',
	'modules/base/client/*.lua',
	'modules/api/client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'configs/webhook.lua',
	'modules/base/server/api/sv-deployer.lua',
	'modules/base/server/api/sv-init.lua',
	'modules/base/server/*.lua',
	'modules/api/server/resources/*.lua',
	'modules/**/booth/**/*.lua',
	'modules/**/booth/*.lua',
	'modules/**/imports/*.lua',
	'modules/**/database/*.lua',
	'modules/**/inventory/*.lua',
	'modules/**/framework/**/server.lua',
	'modules/api/server/*.lua',
}

ui_page 'web/build/index.html'

files {
	'zones.json',
	'web/build/index.html',
	'web/build/app.js',
	'web/build/config.js',
    'web/build/fonts/*.ttf',
    'web/build/**/*',
	'data/*.lua',
	'data/**/*.lua',
}

dependencies {
	'/server:5104',
	'/onesync',
}
dependency '/assetpacks'