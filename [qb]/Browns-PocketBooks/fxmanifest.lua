fx_version 'bodacious'
author 'Brown Development'
description 'Pocket Book Script'
game 'gta5'
lua54 'yes'

client_scripts {
    'code/client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'code/server/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'configurable/config.lua',
    'code/shared/global.lua'
}

files {
    'stream/*.ytyp',
    'stream/*.ydr',
    'stream/*.ytd',
}

escrow_ignore {
    'stream/*.ytyp',
    'stream/*.ydr',
    'stream/*.ytd',
    'configurable/config.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/gucci_gcpurse.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/shearlingshopperbag.ytyp'

dependency '/assetpacks'