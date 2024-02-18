
fx_version 'adamant'

game 'gta5'

ui_page 'html/index.html'


files {
	'html/index.html',
	'html/index.css',
	'html/index.js',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
    'html/img/cars/*.png',
    'html/img/boats/*.png',
    'html/img/choppers/*.png',
    'html/img/bikes/*.png',
    'html/img/cargoclothes/*.png',
}

client_scripts{
    'config.lua',
    'client/main.lua',
    'client/thunter.lua',
    'client/fisher.lua',
    'client/scrap.lua',
    'client/cargo.lua',
}

server_scripts{
    'config.lua',
    'server/main.lua',  
}

shared_scripts {
    'config.lua',
}

lua54 'yes'


escrow_ignore {
   'client/*.lua',
  'server/main.lua',
  'config.lua',
  'stream/*.ytd'
}


dependency '/assetpacks'