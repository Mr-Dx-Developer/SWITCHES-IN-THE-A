fx_version 'bodacious'

game 'gta5'

shared_scripts({
    'config/config.lua',
})

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
}

ui_page './html/index.html'

files {
    './html/**',
    './html/media/**',
}

lua54 'yes'

escrow_ignore {
    'config/config.lua'
}
dependency '/assetpacks'