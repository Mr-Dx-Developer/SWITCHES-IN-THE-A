fx_version 'cerulean'
game 'gta5'
author 'Buty#8291'

lua54 'yes'


client_scripts {
    'client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
}

shared_script{
    'config/config.lua',
    'config/jobs.lua',
    'config/translations.lua',
    'config/config_function.lua',
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/img/*',
    'html/background/*',
    'html/bg.png'
}

escrow_ignore {
    'config/config.lua',
    'config/jobs.lua',
    'config/translations.lua',
    'config/config_function.lua',
}
dependency '/assetpacks'
dependency '/assetpacks'