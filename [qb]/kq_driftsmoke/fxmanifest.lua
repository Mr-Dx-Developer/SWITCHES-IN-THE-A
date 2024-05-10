fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Drift Smoke by KuzQuality'
version '1.2.0'


--
-- Server
--

server_scripts {
    'config.lua',
    'server/server.lua',
}

--
-- Client
--

client_scripts {
    'config.lua',
    'client/client.lua',
    'client/editable.lua',
}

escrow_ignore {
    'config.lua',
    'client/editable.lua',
}

dependency '/assetpacks'