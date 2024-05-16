fx_version "cerulean"
game "gta5"
lua54 "yes"

version "1.7.4"

shared_script {
    "config/*.lua",
    "shared/**/*.lua"
}

client_script "client/**/*.lua"

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/**/*.lua",
}

files {
    "ui/dist/**/*",
    "ui/components.js",
    "config/**/*"
}

ui_page "ui/dist/index.html"

dependencies {
    "loaf_lib",
    "oxmysql"
}

escrow_ignore {
    "config/**/*",

    "client/apps/framework/**/*.lua",
    "server/apps/framework/**/*.lua",
    "shared/*.lua",

    "client/custom/**/*.lua",
    "server/custom/**/*.lua",

    "client/misc/debug.lua",
    "server/misc/debug.lua",

    "server/misc/functions.lua",
    "server/misc/databaseChecker/*.lua",

    "server/apiKeys.lua",

    "types.lua"
}

dependency '/assetpacks'