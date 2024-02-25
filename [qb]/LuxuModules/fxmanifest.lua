fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.2.0'
author 'Luxu.gg'
description 'LuxuModules - A library from Luxu.gg scripts'

shared_scripts { '@ox_lib/init.lua', 'config.lua', 'shared/utils.js', "init.lua" }

ui_page 'nui/index.html'

files { 'nui/index.html', 'nui/**/*', 'nui/*', 'shared/*', 'init.lua' }

client_scripts { 'client/tools.lua', 'client/cl_utils.lua', 'client/client.lua',
      'client/resource.lua', 'client/events.lua' }

server_scripts { '@mysql-async/lib/MySQL.lua', 'server/sv_utils.lua', 'server/server.lua', 'server/resource.lua', 'server/events.lua' }

escrow_ignore {
      'config.lua',
      'server/server.lua',
      'server/sv_utils.lua',
      'client/client.lua',
      'client/cl_utils.lua',
      'shared/utils.lua',
      'shared/framework.lua',
}

dependencies {
      'ox_lib',
      '/onesync',
      '/server:6464'
}

dependency '/assetpacks'