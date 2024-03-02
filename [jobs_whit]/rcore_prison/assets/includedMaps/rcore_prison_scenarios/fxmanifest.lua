--[[ FX Information ]]--
fx_version   'cerulean'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'rcore_prison_scenarios'
author       'NewEdit'
version      '1.0'
description  'Scenarios for Prison'

this_is_a_map 'yes'

dependencies { 
    '/server:4960',
    '/gameBuild:2189',
}


file "sp_manifest.ymt"
data_file "SCENARIO_POINTS_OVERRIDE_FILE" "sp_manifest.ymt"

files {
	'relationships.dat'
}
