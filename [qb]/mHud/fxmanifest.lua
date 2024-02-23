fx_version 'adamant'
game 'gta5'
description 'mHud'
lua54 'yes'
author 'Lucid#3604'
version '2.5'
shared_scripts {
    'shared/*.lua',
}
client_scripts {
    'client/*.lua'
}
server_scripts {
	-- '@mysql-async/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'mysql-async'.:warning:
	'@oxmysql/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'oxmysql'.:warning:
    'server/*.lua',
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/app/*.js',
	'html/app/modules/*.js',	
	'html/app/utils/*.js',	
	'html/app/pages/**/*.js',
	'html/app/pages/**/*.html',	
	'html/app/pages/**/*.css',	
	'html/app/pages/**/images/*.png',	
	'html/app/pages/**/images/*.svg',	

	'html/app/pages/**/components/**/images/*.png',
	'html/app/pages/**/components/**/images/*.svg',

	'html/app/pages/**/components/**/*.js',
	'html/app/pages/**/components/**/*.html',	
	'html/app/pages/**/components/**/*.css',	


	'html/app/pages/**/components/**/components/**/*.js',
	'html/app/pages/**/components/**/components/**/*.html',	
	'html/app/pages/**/components/**/components/**/*.css',	

	'html/css/*.css',
	'html/assets/fonts/*.otf',
	'html/assets/fonts/*.ttf',
	'html/assets/fonts/*.TTF',
	


	'html/assets/fonts/*.woff',
	'html/assets/images/*.png',
	'html/assets/images/*.svg',

	'html/assets/weapons/*.png',
	'html/assets/sounds/*.ogg',



}

escrow_ignore {
	'client/cinematicmode.lua',
	'client/cruise.lua',
	'client/microphone.lua',
	'client/money.lua',
	'client/music.lua',
	'client/nitro.lua',
	'client/vehiclemodes.lua',

	'client/PlayerLoaded.lua',
	'client/seatbelt.lua',
	'client/status.lua',
	'client/stress.lua',
	'client/utility.lua',
	


	'server/botToken.lua',
	'server/music.lua',
	'server/nitro.lua',
	'server/seatbelt.lua',
	'server/stress.lua',


	'shared/config.lua',
	'shared/GetCore.lua',
	'shared/locales.lua',
	'shared/stress_config.lua',

}
dependency '/assetpacks'