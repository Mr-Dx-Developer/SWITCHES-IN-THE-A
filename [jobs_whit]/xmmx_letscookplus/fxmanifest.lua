fx_version {'cerulean'}
game {'gta5'}

lua54 {'yes'}

name '[QB/ESX] Lets Cook Plus & More'
author 'XMMX Development'
description 'Extensive Food and Items Crafting Script with Props as Items'
version '4.0'

ui_page 'html/index.html'

files {
    'html/images/*',
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/*.png',
}

shared_scripts {
    '@ox_lib/init.lua',
    'configs/*.lua',
    'shared/*.lua',
}

client_scripts { 
    'client/*.lua',
}

server_scripts { 
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

dependencies {
    'xsound',   -- https://github.com/Xogy/xsound/releases/tag/1.4.3
    'ox_lib',   -- https://github.com/overextended/ox_lib/releases/tag/v3.13.0
    'oxmysql'   -- https://github.com/overextended/oxmysql/releases/tag/v2.7.7
}

escrow_ignore { 
    'client/cl_editable.lua',
    'client/cl_editable2.lua',
    'client/cl_editable3.lua',
    'client/cl_editable4.lua',
    'server/sv_editable.lua',
    'configs/esx_meta.lua',
    'configs/qb_meta.lua',
    'configs/recipes.lua',
    'configs/config.lua', 
    'configs/shops.lua',
    'shared/locales.lua',
    'INSTALL/*',
    'html/*' 
}
dependency '/assetpacks'