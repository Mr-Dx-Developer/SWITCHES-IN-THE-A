fx_version 'adamant'

game 'gta5'



client_script { 
    "notify.lua",
    "config.lua",
    "main/client.lua",
    'locale/*.lua',
}

server_scripts {
    "notify.lua",
    "config.lua",
    "settings.lua",
    "main/server.lua",
    'locale/*.lua',
    "@mysql-async/lib/MySQL.lua"
} 

ui_page "html/index.html"

files {
    'html/fonts/*.ttf',
    'html/fonts/*.otf',

    'html/images/*.png',
    'html/images/*.gif',
    'html/images/vehicles/*.png',
    'html/images/weapons/*.png',

    'html/index.html',

    'html/main.js',
    'html/style.css'
}

escrow_ignore {
    'notify',
    'settings',
    'config.lua',
    'main/**.lua',
    'locale/**.lua',
}

lua54 'yes'

dependency '/assetpacks'