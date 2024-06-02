fx_version 'cerulean'
game 'gta5'

lua54 'yes'

dependencies {
	'tgiann-core',
	'tgiann-naked-assets',
}

escrow_ignore {
	'config.lua',
	'client/editable.lua',
	'server/commands.lua',
	'server/editable.lua',
}

shared_scripts  {
	"escrowConfig.lua",
	"config.lua",
	"shared/nakedData.lua",
}

client_scripts {
	'client/*.lua'
}

-- mysql
server_scripts {
	'@async/async.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/editable.lua',
	'server/server.lua',
	'server/commands.lua',
	'server/mysql.lua'
}

--[[   
-- oxmysql
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/editable.lua',
	'server/server.lua',
	'server/commands.lua',
	'server/mysql.lua'
} 
]]

file('nakedData.json')
dependency '/assetpacks'