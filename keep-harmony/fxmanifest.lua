--                _
--               | |
--   _____      _| | _____  ___ _ __
--  / __\ \ /\ / / |/ / _ \/ _ \ '_ \
--  \__ \\ V  V /|   <  __/  __/ |_) |
--  |___/ \_/\_/ |_|\_\___|\___| .__/
--                             | |
--                             |_|
-- https://github.com/swkeep
fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }

name 'keep-harmony'
description 'A powerful Fivem library to enhance my development (^.^)'
version      '3.1.2'
author "swkeep"
repository 'https://swkeep.tebex.io'

shared_scripts {
    "@ox_lib/init.lua",
    -- shared config
    'config.shared.lua',
    -- links
    'lua/shared/linker.lua',
    -- test suite
    'lua/shared/testConfig.lua',
    'lua/shared/testSuite.lua',
    -- core/util
    'lua/shared/harmony.shared.core.lua',
    'lua/shared/extensions/essential/*.lua',
    'lua/shared/extensions/add-on/*.lua',
    'lua/locale/en.lua',
}

client_scripts {
    '@ox_lib/init.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
    -- accessible
    'lua/accessible/client.accessible.lua',
    -- core
    'lua/client/harmony.client.core.lua',
    'lua/client/event.lua',
    'lua/client/extensions/essential/*.lua',
    'lua/client/extensions/add-on/*.lua',
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    -- server-config
    'config.server.lua',
    -- accessible
    'lua/accessible/server.accessible.lua',
    -- core
    'lua/server/harmony.server.core.lua',
    'lua/server/event.lua',
    'lua/server/extensions/essential/*.lua',
    'lua/server/extensions/add-on/*.lua',
}

escrow_ignore {
    'lua/shared/testConfig.lua',
    -- configs
    'config.server.lua',
    'config.shared.lua',
    -- accessible
    'lua/accessible/*.lua',
    -- links
    'lua/accessible/links/**/*.lua',
    'lua/client/essential/stash.lua',
    'lua/server/add-on/stash.lua',
    'lua/locale/*.lua'
}

files {
    'lua/accessible/links/**/client.lua',
    'nui/*.*',
}

ui_page 'nui/index.html'

dependencies {
    '/server:5848',
    '/onesync',
    'oxmysql'
}

-- provide 'qb-menu'
-- provide 'qb-input'

dependency '/assetpacks'