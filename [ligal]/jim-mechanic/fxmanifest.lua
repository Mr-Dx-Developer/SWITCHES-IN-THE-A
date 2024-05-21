name "Jim-Mechanic"
author "Jimathy"
version "3.4.2"
description "Mechanic Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

server_script '@oxmysql/lib/MySQL.lua'

shared_scripts {
	'locales/*.lua',
	'config.lua',

    -- Required core scripts
    '@ox_lib/init.lua',
    '@ox_core/imports/client.lua',
    '@es_extended/imports.lua',
    '@qbx_core/modules/playerdata.lua',

    --Jim Bridge
    '@jim_bridge/exports.lua',
    '@jim_bridge/functions.lua',
    '@jim_bridge/wrapper.lua',
    '@jim_bridge/crafting.lua',
	'shared/*.lua',
}
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',

    'client/*.lua',
	'html/drawtext.lua',
}

server_script 'server/*.lua'

files { 'html/**', 'html/img/**', 'html/snd/**', "data/carcols_gen9.meta", "data/carmodcols_gen9.meta", 'stream/*.ytyp' }

ui_page 'html/index.html'
data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"
data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

escrow_ignore {
	'*.lua',
	'client/*.lua',
	'server/functionserver.lua', 'server/main.lua',
	'locales/*.lua',
	'html/*.lua', 'html/*.css', 'html/*.html', 'html/*.js',
	'shared/functions.lua', 'shared/recipes.lua', 'shared/locations.lua'
}

dependency 'jim_bridge'
dependency '/assetpacks'