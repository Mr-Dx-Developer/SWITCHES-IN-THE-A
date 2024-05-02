fx_version 'adamant'

game 'gta5'

description 'RTX NOTIFY'

version '1.0'

client_scripts {
	'config.lua',
	'client/main.lua'
}

files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/howler.core.js',
	'html/debounce.min.js',
	'html/BebasNeuePro-Bold.ttf',
	'html/img/*.png',
	'html/sounds/*.mp3'
}

ui_page 'html/ui.html'

exports {
	'Notify',
}

lua54 'yes'

escrow_ignore {
  'config.lua'
}
dependency '/assetpacks'