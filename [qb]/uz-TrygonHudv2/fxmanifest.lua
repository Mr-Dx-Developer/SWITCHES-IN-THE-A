fx_version "adamant"

description "UZStore"
author "Raider#0101"
version '1.0.0'
repository 'https://discord.com/invite/EkwWvFS'

game "gta5"

client_script { 
"main/client.lua",
"main/nitro_cl.lua"
}

server_script {
'@mysql-async/lib/MySQL.lua',
"main/server.lua",
"main/nitro_sv.lua"
} 

shared_script "main/shared.lua"


ui_page "index.html"

files {
    'index.html',
    'vue.js',
    'assets/**/*.*',
    'assets/font/*.otf'
}

escrow_ignore { 'main/shared.lua' }

lua54 'yes'
-- dependency '/assetpacks'