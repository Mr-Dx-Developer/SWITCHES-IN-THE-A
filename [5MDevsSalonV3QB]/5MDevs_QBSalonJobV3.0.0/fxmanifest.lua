fx_version 'cerulean'
games { 'gta5' }
name "5MDevs_QBSalonJobV3.0.0"
author '5M Devs - https://www.5mdevs.store/shop'
description 'Salon Job V3 QB by 5M Devs'
version '3.0.4'

lua54 'yes'

client_scripts {
	 'client/client.lua',
	 'config.lua'
}

server_scripts {   
	'server/server.lua',
	'config.lua',
	'@mysql-async/lib/MySQL.lua'	
}

data_file 'DLC_ITYP_REQUEST' 'stream/fmd_salonV3.ytyp'

shared_script '@ox_lib/init.lua'

escrow_ignore {
    'config.lua'
}

dependency '/assetpacks'