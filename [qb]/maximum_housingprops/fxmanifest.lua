fx_version 'cerulean'
game 'gta5'
lua54 "yes"

author 'MAXIMUM'
description 'Housing Props System'
version '1.0'

dependencies {
    'ox_lib',
    'oxmysql'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config/*.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

files {
    'html/images/*.png'
}

----------- HOUSING  ------------------------

data_file 'DLC_ITYP_REQUEST' 'stream/d_bebes.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/d_haway.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/d_muebles.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/d_otros.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/d_paredes.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/d_dnxpack.ytyp'

escrow_ignore {
    'stream/*.ytd',
    'config/*.lua',
    'client/*.lua'
}
dependency '/assetpacks'