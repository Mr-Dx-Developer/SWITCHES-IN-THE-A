fx_version "cerulean"
game "gta5"

description "Vanilla Unicorn Pole Dancing"
author "DrAceMisanthrope"
version "1.1.0"

shared_script "config.lua"
server_script "src/server.lua"
client_script "src/client.lua"

lua54 "yes"

escrow_ignore {
    "config.lua"
}

dependency '/assetpacks'