fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Private islands by KuzQuality'
version '1.0.1'

ui_page 'html/index.html'

files {
    'html/*.html',
    'html/fonts/*.ttf',
    'html/img/*.png',
    'html/img/icons/*.png',
    'html/js/*.js',
    'html/style/*.css',

    'html/farbtastic/farbtastic.js',
    'html/farbtastic/farbtastic.css',
    'html/farbtastic/*.png',
    
    'props_icons/*.png',
    'props_icons/*.jpg',
}
--
-- Server
--

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'shared/constants.lua',
    'config.lua',
    'locale.lua',
    'server/main.lua',
    'server/customize.lua',
    'server/editable/mansion_control.lua',
    'server/editable/esx.lua',
    'server/editable/qb.lua',
    'server/editable/buying.lua',
    'server/editable/editable.lua',
    'shared/islandElements.lua',
}

--
-- Client
--

client_scripts {
    'shared/constants.lua',
    'config.lua',
    'locale.lua',
    'client/classes/island.lua',
    'client/classes/mansion.lua',
    'client/helpers/builderHelper.lua',
    'client/helpers/settings.lua',
    'client/functions.lua',
    'client/cache.lua',
    'client/main.lua',
    'client/buying.lua',
    'client/management.lua',
    'client/editable/mansion_control.lua',
    'shared/islandElements.lua',
    'client/editable/main.lua',
    'client/setup.lua',
    'client/editable/esx.lua',
    'client/editable/qb.lua',
    'client/furniture/placement.lua',
    'client/furniture/demolition.lua',
}

escrow_ignore {
    'config.lua',
    'locale.lua',
    'client/editable/*.lua',
    'client/helpers/settings.lua',
    'server/editable/*.lua',
    'shared/islandElements.lua',
}

dependencies = {
    'kq_islands_props',
}

dependency '/assetpacks'