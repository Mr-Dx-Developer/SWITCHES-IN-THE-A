fx_version "adamant"
game "gta5"
version '1.3.7'

author "Meeth#4289"
description "ZM EROTIC MENU"

client_scripts {
    'GetFrameworkObject.lua',
    'client/*.lua',
    'client/AnimationList.lua',
    'client/Emote.lua',
    'client/Syncing.lua'
}

server_scripts {
    "server/*.lua",
    'GetFrameworkObject.lua',
    '@mysql-async/lib/MySQL.lua',
	--'@oxmysql/lib/MySQL.lua'
}

ui_page {
    "html/index.html"
}

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/img/*.png'
}

shared_scripts {
    'config.lua',
    'locales/locale.lua'
}

escrow_ignore {
    'config.lua',
    'client/AnimationList.lua',
    'locales/locale.lua'
}

lua54 'yes'

dependency '/assetpacks'