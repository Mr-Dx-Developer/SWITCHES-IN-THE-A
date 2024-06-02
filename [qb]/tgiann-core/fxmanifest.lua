fx_version "cerulean"
game "gta5"

lua54 "yes"

ui_page "ui/index.html"

files {
	"ui/**.*",
}

escrow_ignore {
	"config.lua",
	"client/functions/progressbar.lua",
	"client/functions/skillCheck.lua",
	"client/functions/setVehicleProperties.lua",
	"client/functions/getVehicleProperties.lua",
	"client/main.lua",
	"languages/*.lua"
}

shared_scripts {
	"config.lua",
	"shared/**.lua",
}

client_scripts {
	"languages/*.lua",
	"client/**.lua",
	"coreExport.lua"
}

-- mysql
server_scripts {
	"@async/async.lua",
	"@mysql-async/lib/MySQL.lua",
	"server/**.lua",
	"coreExport.lua"
}

--[[
-- oxmysql (https://tgiann.gitbook.io/tgiann/main/convert-fxmanifest.lua-for-oxmysql)
server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"server/**.lua",
	"coreExport.lua"
}
]]

dependency '/assetpacks'