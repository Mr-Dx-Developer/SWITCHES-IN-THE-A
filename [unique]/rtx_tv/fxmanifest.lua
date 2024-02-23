fx_version 'cerulean'

game 'gta5'

description 'RTX TV'

version '20.0'

server_scripts {
	--'@mysql-async/lib/MySQL.lua',  -- enable this and remove oxmysql line (line 11) if you use mysql-async (only enable this for qbcore/esx framework)
	--'@oxmysql/lib/MySQL.lua', -- enable this and remove mysql async line (line 10) if you use oxmysql (only enable this for qbcore/esx framework)
	'config.lua',
	'language/main.lua',
	'server/main.lua',
	'server/other.lua'
}

client_scripts {
	'config.lua',
	'language/main.lua',
	'client/main.lua'
}

files {
	'html/ui.html',
	'html/video.html',
	'html/styles.css',
	'html/video.css',
	'html/scripts.js',
	'html/video.js',
	'html/BebasNeueBold.ttf',
	'html/tv/index.html',
	'html/tv/style.css',
	'html/tv/img/background.png',
	'html/img/*.png',
	'html/videos/*.mp4'
}

ui_page 'html/ui.html'

exports {
	'HasVehicleTV',
}

server_exports { -- examples is in server/other.lua file at the bottom
	'StartTelevision', -- StartTelevision(tvcoords, tvtypeid, volume, routingbucket, controldisabled) (tvtypeid is from Config.TelevisionObjects)
	'PlayVideoOnTelevision',  -- PlayVideoOnTelevision(tvcoords, routingbucket, volume, url)
	'ChangeVolumeTelevision', -- ChangeVolumeTelevision(tvcoords, volume, routingbucket)
	'StopTelevision', --  StopTelevision(tvcoords, routingbucket)
}

lua54 'yes'

escrow_ignore {
  'config.lua',
  'language/main.lua',
  'server/other.lua'
}
dependency '/assetpacks'