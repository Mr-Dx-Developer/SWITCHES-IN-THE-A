fx_version 'cerulean'
game { 'gta5' }
name "5MDevs_Pursescarry"
author '5M Devs - https://www.5mdevs.store/shop'
description 'Purse Shop Carry by 5M Devs'
version '1.0.0'

lua54 'yes'

client_scripts {
    'client/**.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/**.lua'
}

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'ox_lib'
}

dependency '/assetpacks'