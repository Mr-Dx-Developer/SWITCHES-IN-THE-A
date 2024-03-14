fx_version 'cerulean'
games { 'gta5' }
name "5mdevs_DesignerJobV1"
author '5M Devs - https://www.5mdevs.store/shop'
description 'Designer Job V1 by 5M Devs'
version '1.0.2'

lua54 'yes'

server_scripts {
	'@mysql-async/lib/MySQL.lua',

	--'locales/en.lua',
	'config.lua',
	'server/main.lua',
	--'server/sales.lua'
}

client_scripts {

	'locales/en.lua',
	'config.lua',
	'client/main.lua',
	--'client/sales.lua',
}

shared_script {

	'@ox_lib/init.lua'
}

data_file 'DLC_ITYP_REQUEST' 'stream/5mdevs_designercraft.ytyp'



escrow_ignore {
    'config.lua'
}


dependency '/assetpacks'