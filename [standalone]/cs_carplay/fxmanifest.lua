fx_version 'adamant'
version '1.3'
game 'gta5'
author 'CodeStudio'
description 'Code Studio Car Play'

ui_page 'ui/index.html'

server_scripts {'@oxmysql/lib/MySQL.lua', 'main/server.lua', 'config/server/*.lua'}
client_scripts {'main/client.lua', 'config/client/*.lua'}

shared_scripts {'config/config.lua', 'config/language.lua', 'main/function.lua'}

files {'ui/**'}

escrow_ignore {'config/**'}

dependencies {'oxmysql', 'xsound'}

lua54 'yes'
dependency '/assetpacks'