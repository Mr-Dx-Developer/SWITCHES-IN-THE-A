fx_version 'cerulean'
games { 'gta5' }
name "5MDevs_gstationV2QB"
author '5M Devs - https://www.5mdevs.store/shop'
description 'Gas Station Food & Drinks V2 QB by 5M Devs'
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

data_file 'DLC_ITYP_REQUEST' 'stream/fmdgstationV2.ytyp'

escrow_ignore {
    'config.lua'
}


dependency '/assetpacks'