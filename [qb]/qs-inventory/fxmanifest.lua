fx_version 'cerulean'

game 'gta5'

lua54 'yes'

version '2.6.2'

data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnspistol.meta'

ui_page 'html/ui.html'

files {
    'config/*.js',
    'html/ui.html',
    'html/css/main.css',
    'html/js/*.js',
    'html/js/modules/*.js',
    'html/images/*.png',
    'html/images/*.jpg',
    'html/cloth/*.png',
    'html/*.ttf',
    'weaponsnspistol.meta'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config/*.lua',
    'locales/*.lua',
    'shared/*.lua',
}

client_script {
    'client/custom/framework/*.lua',
    'client/*.lua',
    'client/modules/*.lua',
    'client/custom/misc/*.lua',
    'client/custom/target/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/custom/framework/*.lua',
    'server/custom/webhook/*.lua',
    'server/*.lua',
    'server/modules/*.lua',
    'server/custom/misc/*.lua',
}

escrow_ignore {
    'shared/items.lua',
    'shared/weapons.lua',
    'config/*.lua',
    'locales/*.lua',
    'client/custom/framework/*.lua',
    'client/custom/misc/*.lua',
    'client/custom/target/*.lua',
    'client/modules/suggestion.lua',
    'server/custom/framework/*.lua',
    'server/custom/webhook/*.lua',
    'server/custom/misc/*.lua',
}

dependencies {
    '/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
    'ox_lib',       -- Required
}

dependency '/assetpacks'