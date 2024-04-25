fx_version "cerulean"
game "gta5"
lua54 "yes"

description "Comprehensive dealerships script for FiveM"
version 'v1.1.9'
author "JG Scripts"

shared_scripts {
  "config.lua",
  "locales/*.lua",
  "main.lua",
  "framework/main.lua"
}

client_scripts {
  "framework/**/cl-*.lua",
  "client/cl-main.lua",
  "client/*.lua",
  "config-cl.lua"
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
  "server/sv-webhooks.lua",
  "framework/**/sv-*.lua",
  "server/*.lua",
  "config-sv.lua"
}

ui_page "web/dist/index.html"

files {
  "web/dist/index.html",
  "web/dist/**/*"
}

escrow_ignore {
  "main.lua",
  "config.lua",
  "config-cl.lua",
  "config-sv.lua",
  "framework/**/*",
  "locales/*.lua",
  "client/cl-blips.lua",
  "server/sv-webhooks.lua",
  "client/cl-purchase.lua",
  "server/sv-purchase.lua"
}
dependency '/assetpacks'