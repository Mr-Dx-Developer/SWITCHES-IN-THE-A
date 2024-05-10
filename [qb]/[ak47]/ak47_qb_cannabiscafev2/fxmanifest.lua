fx_version 'adamant'
game 'gta5'
name "ak47_qb_cannabiscafev2"
author "MenanAk47 (MenanAk47#3129)"
version "2.5.2"

ui_page('html/ui.html')

files({
    'html/**/*',
})

client_scripts {
    '@menuv/menuv.lua',
    'config.lua',
    'config-shop.lua',
    'config-farming.lua',
    'config-bong.lua',

    'client/utils.lua',
    'client/job.lua',
    'client/shop.lua',
    'client/farming.lua',
    'client/target.lua',
    'client/bong.lua',

    'locales/locale.lua',
    'locales/en.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'config-shop.lua',
    'config-farming.lua',
    'config-bong.lua',

    'server/utils.lua',
    'server/farming.lua',
    'server/shop.lua',
    'server/job.lua',
    'server/bong.lua',

    'locales/locale.lua',
    'locales/en.lua',
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