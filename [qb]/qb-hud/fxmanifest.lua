fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'qb-hud'
version '2.2.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_scripts {  
    'client.lua',
    'HRSGears.lua' 
}

server_script 'server.lua'

ui_page 'html/index.html'

files {
    'html/*',
    'html/index.html',
    'html/styles.css',
    'html/responsive.css',
    'stream/int3232302352.gfx',
    'html/app.js',
}
server_scripts { '@mysql-async/lib/MySQL.lua' }


data_file "SCALEFORM_DLC_FILE" "stream/int3232302352.gfx"