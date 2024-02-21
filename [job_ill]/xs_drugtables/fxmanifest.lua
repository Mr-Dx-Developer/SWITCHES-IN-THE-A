fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Advanced Drug Tables'
author 'X Studios'
version '1.0.0'

data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table_cocaine.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table_ecstasy.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table_heroine.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table_meth.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table_mushrooms.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table_weed.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table_fentanyl.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table2_cocaine.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table2_ecstasy.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table2_heroine.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table2_meth.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table2_mushrooms.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table2_weed.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/plastic_table2_fentanyl.ytyp'

shared_scripts { '@ox_lib/init.lua', 'configuration/*.lua' }
client_scripts { 'bridge/**/client.lua', 'client/*.lua' }
server_scripts { 'bridge/**/server.lua', 'server/*.lua' }

dependencies { 'ox_lib' }

escrow_ignore {
    'configuration/*.lua',
    'client/cl_customize.lua',
    'target/client.lua',
    'bridge/esx/*.lua',
    'bridge/qb/*.lua',
    'bridge/target/*.lua',
}

dependency '/assetpacks'