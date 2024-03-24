fx_version 'bodacious'
author 'Brown Development'
description 'Wigs N Bundles (Updated)'
game 'gta5'
lua54 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/murm_decor_pack.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/starter_shells_k4mb1.ytyp'

files {
    'shared/config.lua',
    'stream/*.ytyp',
    'stream/*.ytd',
    'stream/*.ydr',
    'ui/assets/*.png',
    'ui/assets/*.mp3',
    'ui/assets/*.webp',
    'ui/*.js',
    'ui/*.css',
    'ui/*.html'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/core.lua',
    'shared/main.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

ui_page 'ui/index.html'

dependency 'ox_lib'

escrow_ignore {
    'shared/config.lua',
    'stream/frankaunttextures.ytd',
    'stream/shell_frankaunt.ydr',
    'stream/murm_dec_pack_table.ydr',
    'stream/starter_shells_k4mb1.ytyp',
    'stream/murm_decor_pack.ytyp'
}
dependency '/assetpacks'