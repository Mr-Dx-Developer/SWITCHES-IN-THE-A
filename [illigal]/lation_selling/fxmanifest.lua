--- For support, scripts & more join our Discord: https://discord.gg/9EbY4nM5uu

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'iamlation'
description 'An advanced drug selling resource for FiveM'
version '1.0.12'

client_scripts {
    'bridge/client.lua',
    'client/*.lua',
}

server_scripts {
    'bridge/server.lua',
    'logging.lua',
    'server/*.lua',
}

shared_scripts {
    'config.lua',
    'strings.lua',
    '@ox_lib/init.lua'
}

escrow_ignore {
    'config.lua',
    'logging.lua',
    'strings.lua',
    'bridge/*.lua',
    'client/functions.lua',
    'server/functions.lua'
}
dependency '/assetpacks'