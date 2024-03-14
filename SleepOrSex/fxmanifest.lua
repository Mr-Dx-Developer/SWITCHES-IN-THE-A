fx_version 'cerulean'

game 'gta5'

description 'SleepOrSex by luthanirgi#4471'

version '3.6.0'

lua54 'yes'

shared_scripts { 
  '@ox_lib/init.lua',
  'config.lua',
  --'@es_extended/imports.lua', -- if using esx legacy dont hash this
}

client_scripts {
  'client/client.lua',
  'client/shower.lua',
  'client/disease.lua',
}

server_scripts {
  --'@mysql-async/lib/MySQL.lua',
  '@oxmysql/lib/MySQL.lua',
  'server/server.lua',
  'server/disease.lua',
}

escrow_ignore {
  'image/*.png',
  'sql/*.sql',
  'sql/*.lua',
  'config-esx.lua',
  'config-qbcore.lua',
  'client/shower-esx.lua',
  'client/shower-qbcore.lua',
  'client/disease.lua',
  'server/disease-esx.lua',
  'server/disease-qbcore.lua',
}

dependencies {
	'/server:6116',
  'oxmysql',
  --'mysql-async',
	'ox_lib',
}
dependency '/assetpacks'