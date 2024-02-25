fx_version 'bodacious'
game 'gta5'
lua54 'yes'

client_scripts { 
    "@PolyZone/client.lua",
	"@PolyZone/BoxZone.lua",
	"@PolyZone/EntityZone.lua",
	"@PolyZone/CircleZone.lua",
	"@PolyZone/ComboZone.lua",
	'functions.lua',
    'config.lua',
    'client.lua'
}

escrow_ignore {
    'config.lua'
}

dependency "PolyZone"
dependency '/assetpacks'