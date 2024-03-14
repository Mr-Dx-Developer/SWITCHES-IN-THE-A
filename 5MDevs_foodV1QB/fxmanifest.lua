fx_version 'cerulean'
games { 'gta5' }
name "5MDevs_foodV1QB"
author '5M Devs - https://www.5mdevs.store/shop'
description 'Food V1 Usable QB by 5M Devs'
version '1.1.0'

lua54 'yes'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/client.lua',
    'client/animations.lua',
    'client/AnimationList2.lua'
}

files {
    'files/events.meta',
    'files/popgroups.ymt',
    'files/relationships.dat'
}

server_scripts {
    'config.lua',
    'server.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/fmdfoodV1.ytyp'

escrow_ignore {
    'config.lua'
}

dependency '/assetpacks'