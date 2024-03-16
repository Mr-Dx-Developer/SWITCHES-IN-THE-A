fx_version 'bodacious'

game 'gta5'

version '2.9.2'

lua54 'yes'

ui_page 'html/index.html'

shared_scripts {
	'@ox_lib/init.lua', -- If you use ox_lib in Config.MenuType
	'config/*.lua',
	'utils/*.lua',
	'client/custom/furniture/*.lua',
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'locales/*.lua',
	'client/custom/**/**.lua',
	'client/modules/*.lua',
	'client/*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'locales/*.lua',
	'server/custom/**/**.lua',
	'server/modules/*.lua',
	'server/*.lua',
}

files {
	'html/index.html',
	'html/*.css',
	'html/script.js',
	'html/img/**/**/**/**.png'
}

escrow_ignore {
	'config/*.lua',
	'locales/*.lua',
	'client/custom/**/**.lua',
	'server/custom/**/**.lua',
}

server_export {
	'hasKey',
	'CallRemoteMethod',
	'RegisterMethod'
}

exports {
	'CallRemoteMethod',
	'RegisterMethod'
}

--[[ dependencies {
	'/server:5848', -- ⚠️PLEASE READ⚠️ This requires at least server build 5848 or higher
	'k4mb1shellstarter', -- ⚠️PLEASE READ⚠️ You need https://github.com/quasar-scripts/k4mb1shellstarter
	'PolyZone',
	'meta_libs',
	'bob74_ipl',
	'lockpick',
	'skillbar',
	'progressbar'
}
 ]]

dependency '/assetpacks'