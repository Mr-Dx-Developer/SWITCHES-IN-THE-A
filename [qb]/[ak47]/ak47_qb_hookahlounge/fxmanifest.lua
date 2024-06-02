fx_version 'adamant'
game 'gta5'
name "ak47_hookahlounge"
author "MenanAk47 (MenanAk47#3129)"
description "Hookahlounge Job"
version "1.8.2"

ui_page('html/index.html')

files({
    'html/index.html',
    'html/*.js',
    'html/sounds/*.wav',
})

client_scripts {
    '@menuv/menuv.lua',
    'config.lua',
    'locales/locale.lua',
    'locales/en.lua',
    'client/utils.lua',
    'client/job.lua',
    'client/heater.lua',
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'locales/locale.lua',
    'locales/en.lua',
    'server/utils.lua',
    'server/job.lua',
    'server/heater.lua',
    'server/main.lua',
}

escrow_ignore {
    'locales/*.lua',
    'config*.lua',
    'server/utils.lua',
    'client/utils.lua',
    'INSTALL ME FIRST/**/*',
}

lua54 'yes'

dependencies {
    'menuv',
    'qb-core',
    'qb-management',
    '/server:5181', -- requires at least server build 5181
}

dependency '/assetpacks'