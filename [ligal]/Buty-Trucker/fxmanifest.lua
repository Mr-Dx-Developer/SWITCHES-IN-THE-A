fx_version 'cerulean'
game 'gta5'
author 'ButyCall#8291'

lua54 'yes'

client_scripts {
    'client.lua'
}


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'configs/policealert.lua',
    'server.lua'
}

shared_scripts {
    'configs/config.lua',
    'configs/function.lua'
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/img/*'
}

escrow_ignore {
    'configs/policealert.lua',
    'configs/function.lua',
    'configs/config.lua'
}
dependency '/assetpacks'