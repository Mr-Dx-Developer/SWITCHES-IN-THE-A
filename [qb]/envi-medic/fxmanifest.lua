author 'Envi-Scripts'
fx_version 'cerulean'

game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

version '1.5.0-hotfix'
 
client_scripts {
    'client/*.lua',
}
shared_scripts {
    '@envi-bridge/bridge.lua',
    'shared/*.lua',
}

server_scripts {
    'server/*.lua',
}

escrow_ignore {
    'shared/*.lua',
}

dependency '/assetpacks'

bridge 'envi-bridge'
dependency '/assetpacks'