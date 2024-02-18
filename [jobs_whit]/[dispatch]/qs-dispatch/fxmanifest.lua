fx_version "bodacious"

game "gta5"

author "quasar-store.com"

version "1.7.1"

lua54 "yes"

shared_scripts {
    "config/*.lua",
    "shared/*.lua",
    "locales/*.lua",
    "@ox_lib/init.lua"
}

ui_page "web/build/index.html"

files {
    "web/build/index.html",
    "web/build/**/*"
}

client_scripts {
    "client/lib/*.lua",
    "client/custom/framework/*.lua",
    "client/custom/billing/*.lua",
    "client/custom/exports/*.lua",
    -- main client folder
    "client/globals.lua",
    "client/utils.lua",
    "client/main.lua",
    "client/__test__.lua",
    "client/modules/*.lua",
    "client/modules/penitencial/utils/*.lua",
    "client/modules/penitencial/*.lua",
    "client/modules/penitencial/modules/*.lua",
    "client/custom/misc/*.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/utils.lua",
    "server/lib/*.lua",
    "server/exports/*.lua",
    "server/custom/framework/*.lua",
    "server/modules/webhooks.lua",
    "server/custom/events/onCallEvent.lua",
    "server/globals.lua",
    "server/main.lua",
    "server/version.lua",
    "server/modules/*.lua",
    "server/modules/penitencial/*.lua",
    "server/custom/billing/*.lua",
    "server/custom/vehicles/*.lua",
    "server/custom/inventory/*.lua"
}

exports {
    "GetPlayerInfo",
    "getSSURL",
    "SendWebhook",
    "ToggleDuty",
    "GetIsOnDuty",
    "TogleMdt"
}

escrow_ignore {
    "config/*.lua",
    "locales/*.lua",
    
    "client/custom/misc/*.lua",
    "client/custom/billing/*.lua",
    "client/custom/framework/*.lua",
    "client/custom/exports/*.lua",

    "server/custom/framework/*.lua",
    "server/custom/billing/*.lua",
    "server/custom/vehicles/*.lua",
    "server/modules/webhooks.lua",
    "server/custom/inventory/*.lua",
    "server/custom/events/onCallEvent.lua"
}

dependencies {
    "ox_lib",
    -- "screenshot-basic"
}

dependency '/assetpacks'