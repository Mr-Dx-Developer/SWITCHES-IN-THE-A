fx_version "adamant"

game "gta5"

version '3.3.0'

description 'Jc-Nails Compatibility ESX and QB'

lua54 'yes'

ui_page 'html/index.html'

-- If you use ox_lib menu uncomment this
--shared_script '@ox_lib/init.lua'

files {
	'html/css/*.css',
	'html/js/*.js',
	'html/img/*.png',
	'html/img/*.jpg',
	'html/index.html',
}

client_script {
	'config.lua',
	'client/cl_utils.lua',
	'client/main.lua',
	'customise_me.lua'
}

server_script {
--	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/sv_utils.lua',
	'server/main.lua',
	'server/version.lua'
}

escrow_ignore {
    "config.lua",
	'customise_me.lua'
}
dependency '/assetpacks'