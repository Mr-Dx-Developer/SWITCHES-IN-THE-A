fx_version 'cerulean'
game 'gta5'

author 'billie227 <https://store.rcore.cz/>'
description 'Gang System featuring Turf Wars, Racketeering, Rivalries, Ranks, Drugs Selling and much more!'
version '2.7.0'

lua54 'yes'

escrow_ignore {
    'config.lua',

    'locale/*.lua',

    'shared/object.lua',
    'shared/exports.lua',

    'client/framework/*.lua',
    'client/inventory/*.lua',
    'client/dispatch/*.lua',

    'client/menu/app.lua',

    'client/menu.lua',
    'client/utils.lua',

    'server/database/bridge.lua',
    'server/database/api.lua',

    'server/framework/*.lua',
    'server/inventory/*.lua',
    'server/dispatch/*.lua',
}

shared_scripts {
    '@es_extended/imports.lua',

    'config.lua',

    'locale/*.lua',

    'shared/shared.lua',
    'shared/exports.lua',
}

client_scripts {
    'client/framework/*.lua',

    'shared/object.lua',

    'client/inventory/inventory.lua',
    'client/inventory/*.lua',

    'client/dispatch/dispatch.lua',
    'client/dispatch/*.lua',

    'client/menu/app.lua',

    'client/modules/*.lua',

    'client/client.lua',

    'client/menu.lua',
    'client/utils.lua',
    'client/render.lua',
    'client/action.lua',
    'client/rivalry.lua',
    'client/protection.lua',
    'client/checkpoint.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',

    'server/database/bridge.lua',
    'server/database/api.lua',

    'server/framework/*.lua',

    'shared/object.lua',

    'server/inventory/inventory.lua',
    'server/inventory/*.lua',

    'server/dispatch/dispatch.lua',
    'server/dispatch/*.lua',

    'server/modules/*.lua',

    'server/server.lua',

    'server/gang.lua',
    'server/action.lua',
    'server/rivalry.lua',
    'server/protection.lua',
    'server/checkpoint.lua',
}

ui_page 'client/menu/html/index.html'

files {
    'client/menu/html/app.js',
    'client/menu/html/style.css',
    'client/menu/html/index.html',

    'client/menu/html/fonts/*.ttf',
    'client/menu/html/images/*.png',
}

dependencies {
    '/server:4752',
    '/onesync',
}
dependency '/assetpacks'