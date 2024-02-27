fx_version 'adamant'
game 'gta5'
name "ak47_carwipe"
author "MenanAk47 (MenanAk47#3129)"
version "1.0"

client_scripts {
    'config.lua',
    'client/main.lua',

    'locales/locale.lua',
    'locales/en.lua',
}

server_scripts {
    'config.lua',
    'server/main.lua',

    'locales/locale.lua',
    'locales/en.lua',
}

escrow_ignore {
    'locales/*.lua',
    'config.lua',
}

lua54 'yes'

dependency '/assetpacks'