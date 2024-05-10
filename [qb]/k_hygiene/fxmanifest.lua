fx_version 'cerulean'
game 'gta5'

author 'Kypos'

discription 'Hygiene System for FiveM servers.'
version '1.0.2'


shared_scripts {
    'shared.lua',
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua',
    'client/functions.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

lua54 'yes'


exports {
    "CatchHygiene", -- exports['k_hygiene']:CatchHygiene(type, chance, check)
    "ClearHygiene", -- exports['k_hygiene']:ClearHygiene(type)
    "GetHygiene",-- exports['k_hygiene']:GetHygienes() -- returns list of Hygienes true or false and iterations Example: ( exports['k_hygiene']:GetHygienes()["Common Cold"].hasHygienes )
    "ClearAllHygiene" -- exports['k_hygiene']:ClearAllHygiene() -- Clears every sickness (could be used on player revive or something :P)
} 

escrow_ignore {
    'config.lua',
}
  
dependency '/assetpacks'