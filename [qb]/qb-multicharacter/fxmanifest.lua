name "qb-multicharacter"
author "Mr_Dx#0879"
version "v6.0"
description "Made By Dx-Born"
fx_version "cerulean"
game "gta5"
lua54 'yes'


client_script {
    'core.lua',
    'client/main.lua',
}
server_script {
    '@oxmysql/lib/MySQL.lua',
    'core.lua',
    'server/config.lua',
    'server/functions.lua',
    'server/main.lua'
}

ui_page "nui/index.html"
files { 'nui/**/*' }

escrow_ignore {
    'core.lua',
    'server/config.lua',
    'server/functions.lua',
    'client/**',
    'nui/**',
}
dependency '/assetpacks'