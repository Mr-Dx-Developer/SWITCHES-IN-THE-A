fx_version 'adamant'
game 'gta5'
author "MenanAk47"
description "Advanced Housing System"
version "6.1"

ui_page "nui/index.html"

client_scripts {
	"@ox_lib/init.lua",
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    
	"config.lua",
	"modules/**/config.lua",

	"locales/locale.lua",
	"locales/en.lua",

	"utils/client.lua",
	"modules/**/client/*.lua",
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"modules/**/config.lua",

	"locales/locale.lua",
	"locales/en.lua",

	"utils/server.lua",
	"modules/**/server/*.lua",
	"webhooks.lua",
}

files {
	"nui/**/*",
}

escrow_ignore {
	"INSTALL ME FIRST/**/*",
	"stream/**/*",
    "config.lua",
    "modules/**/config.lua",
    "modules/**/customizable.lua",
    "locales/*.lua",
    "modules/realestate/**/*",
    "modules/inventory/**/*",
    "modules/wardrobe/**/*",
    "modules/weather/**/*",
    "webhooks.lua",
    "utils/*",
}

lua54 'yes'

dependencies {
	'PolyZone',
    'qb-core',
    'qb-management',
    'ox_lib',
}
dependency '/assetpacks'