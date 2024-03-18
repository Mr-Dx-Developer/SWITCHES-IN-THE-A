Config = Config or {}

Config.ReloadTime = math.random(4000, 6000)

Config.DurabilityBlockedWeapons = {
    'weapon_stungun',
    'weapon_nightstick',
    'weapon_flashlight',
    'weapon_unarmed',
}

Config.Throwables = {
    'ball',
    'bzgas',
    'flare',
    'grenade',
    'molotov',
    'pipebomb',
    'proxmine',
    'smokegrenade',
    'snowball',
    'stickybomb',
}

Config.DurabilityMultiplier = {
    weapon_galilar          = 0.15,
    weapon_jrbak          = 0.15,
    ['weapon_neva'] 		= 0.15,
    weapon_howa_2          = 0.15,


    ['CZ Scorpion EVO'] 		= 0.15,
    weapon_glacier          = 0.15,
    
    weapon_ddm4v7 	             = 0.15,
    weapon_g2c 	                 = 0.15,
    weapon_pmr 		             = 0.15,
    weapon_g19g4 	             = 0.15,
    weapon_gs 	                 = 0.15,
    weapon_sp320 	             = 0.15,
    weapon_bp 		             = 0.15,
    weapon_tglock 	             = 0.15,
    weapon_g19x 	             = 0.15,
    weapon_awp 		             = 0.15,
    weapon_tuzi                  = 0.15,
    weapon_broom 	             = 0.15,
    weapon_tomahawk              = 0.15,
    weapon_tridagger             = 0.15,
	weapon_shammer 	             = 0.15,
	weapon_dildo 	             = 0.15,
    weapon_uk 	              	 = 0.15,
    weapon_sd                    = 0.15,
    weapon_m200            	     = 0.15,
    weapon_scar  	             = 0.15,
    weapon_552   	             = 0.15,
    weapon_l1a1 	             = 0.15,
    weapon_fal   	             = 0.15,
    weapon_mcx 	 	             = 0.20,
    weapon_p2011  	             = 0.15,
    weapon_p416 	             = 0.15,
    weapon_hipoint               = 0.15,
    weapon_de  	 	             = 0.15,
    weapon_auga1 	             = 0.15,
	weapon_p90   	             = 0.15,
	weapon_vesper 	             = 0.15,
    weapon_h12              	 = 0.15,
    weapon_g26  	             = 0.15,
    weapon_ia2 	            	 = 0.15,
	weapon_as50   	             = 0.15,


    -- Kyros Weapon Pack V4
    weapon_ddm4v7 	             = 0.15,
    weapon_glock19x 	         = 0.15,
    weapon_glock19 	             = 0.15,
    weapon_glock40 		         = 0.15,
    weapon_glock40s 	         = 0.15,
    weapon_ddm4v5 	             = 0.15,
    weapon_mpx 	                 = 0.15,
    weapon_pd509 		         = 0.15,
    weapon_aps 	                 = 0.15,
    weapon_ppk 	                 = 0.15,
    weapon_pitviper 	         = 0.15,
    weapon_barp                  = 0.15,
    weapon_rdp 	                 = 0.15,
    weapon_lok                   = 0.15,
    weapon_plr                   = 0.15,
	weapon_xds9 	             = 0.15,
	weapon_pps 	                 = 0.15,
    weapon_xdme 	   	         = 0.15,
    weapon_sp                    = 0.15,
    weapon_glock17s 	         = 0.15,
    weapon_glock18c  	         = 0.15,
    weapon_glock19s          	 = 0.15,
    weapon_arpistol 	         = 0.15,
    weapon_glock26s   	         = 0.15,
    weapon_grenades 	         = 0.20,
    weapon_m32s  	             = 0.15,
    weapon_microdraco 	         = 0.15,
    weapon_ruger57  	         = 0.15,
    weapon_mk18 	 	         = 0.15,
	weapon_680 	 	             = 0.15,
	weapon_ziptie   	         = 0.15,

    -- Kyros Weapon Pack V5
    weapon_bar15 	             = 0.15,
    weapon_axe 	                 = 0.15,
    weapon_blackarp 		     = 0.15,
    weapon_bscar 	             = 0.15,
    weapon_thompson 	         = 0.15,
    weapon_blueglocks 	         = 0.15,
    weapon_chair 		         = 0.15,
    weapon_dmk18 	             = 0.15,
    weapon_fn57 	             = 0.15,
    weapon_glock21 	             = 0.15,
    weapon_glock41               = 0.15,
    weapon_glockbeams 	         = 0.15,
    weapon_p30l                  = 0.15,
    weapon_illglock17            = 0.15,
	weapon_krissvector 	         = 0.15,
	weapon_lbtarp 	             = 0.15,
    weapon_mgglock 	   	         = 0.15,
    weapon_midasglock            = 0.15,
    weapon_m500 	             = 0.15,
    weapon_p210  	             = 0.15,
    weapon_ram7          	     = 0.15,
    weapon_redarp 	             = 0.15,
    weapon_redm4a1   	         = 0.15,
    weapon_r590 	             = 0.20,
    weapon_sr40  	             = 0.15,
    weapon_t1911 	             = 0.15,
    weapon_tarp  	             = 0.15,
    weapon_tglock19 	 	     = 0.15,
	weapon_tec9s 	 	         = 0.15,
	weapon_woarp   	             = 0.15,


    -- Melee
    -- weapon_unarmed 				 = 0.15,
    weapon_dagger                = 0.15,
    weapon_bat                   = 0.15,
    weapon_bottle                = 0.15,
    weapon_crowbar               = 0.15,
    weapon_candycane             = 0.15,
    -- weapon_flashlight 			 = 0.15,
    weapon_golfclub              = 0.15,
    weapon_hammer                = 0.15,
    weapon_hatchet               = 0.15,
    weapon_knuckle               = 0.15,
    weapon_knife                 = 0.15,
    weapon_machete               = 0.15,
    weapon_switchblade           = 0.15,
    -- weapon_nightstick 			 = 0.15,
    weapon_wrench                = 0.15,
    weapon_battleaxe             = 0.15,
    weapon_poolcue               = 0.15,
    weapon_briefcase             = 0.15,
    weapon_briefcase_02          = 0.15,
    weapon_garbagebag            = 0.15,
    weapon_handcuffs             = 0.15,
    weapon_bread                 = 0.15,
    weapon_stone_hatchet         = 0.15,

    -- Handguns
    weapon_pistol                = 0.15,
    weapon_pistol_mk2            = 0.15,
    weapon_combatpistol          = 0.15,
    weapon_appistol              = 0.15,
    -- weapon_stungun 				 = 0.15,
    -- weapon_stungun_mp 				 = 0.15,
    weapon_pistol50              = 0.15,
    weapon_snspistol             = 0.15,
    weapon_heavypistol           = 0.15,
    weapon_vintagepistol         = 0.15,
    weapon_flaregun              = 0.15,
    weapon_marksmanpistol        = 0.15,
    weapon_revolver              = 0.15,
    weapon_revolver_mk2          = 0.15,
    weapon_doubleaction          = 0.15,
    weapon_snspistol_mk2         = 0.15,
    weapon_raypistol             = 0.15,
    weapon_ceramicpistol         = 0.15,
    weapon_navyrevolver          = 0.15,
    weapon_gadgetpistol          = 0.15,
    weapon_pistolxm3             = 0.15,

    -- Submachine Guns
    weapon_microsmg              = 0.15,
    weapon_smg                   = 0.15,
    weapon_smg_mk2               = 0.15,
    weapon_assaultsmg            = 0.15,
    weapon_combatpdw             = 0.15,
    weapon_machinepistol         = 0.15,
    weapon_minismg               = 0.15,
    weapon_raycarbine            = 0.15,

    -- Shotguns
    weapon_pumpshotgun           = 0.15,
    weapon_sawnoffshotgun        = 0.15,
    weapon_assaultshotgun        = 0.15,
    weapon_bullpupshotgun        = 0.15,
    weapon_musket                = 0.15,
    weapon_heavyshotgun          = 0.15,
    weapon_dbshotgun             = 0.15,
    weapon_autoshotgun           = 0.15,
    weapon_pumpshotgun_mk2       = 0.15,
    weapon_combatshotgun         = 0.15,

    -- Assault Rifles
    weapon_assaultrifle          = 0.15,
    weapon_assaultrifle_mk2      = 0.15,
    weapon_carbinerifle          = 0.15,
    weapon_carbinerifle_mk2      = 0.15,
    weapon_advancedrifle         = 0.15,
    weapon_specialcarbine        = 0.15,
    weapon_bullpuprifle          = 0.15,
    weapon_compactrifle          = 0.15,
    weapon_specialcarbine_mk2    = 0.15,
    weapon_bullpuprifle_mk2      = 0.15,
    weapon_militaryrifle         = 0.15,
    weapon_heavyrifle            = 0.15,

    -- Light Machine Guns
    weapon_mg                    = 0.15,
    weapon_combatmg              = 0.15,
    weapon_gusenberg             = 0.15,
    weapon_combatmg_mk2          = 0.15,

    -- Sniper Rifles
    weapon_sniperrifle           = 0.15,
    weapon_heavysniper           = 0.15,
    weapon_marksmanrifle         = 0.15,
    weapon_remotesniper          = 0.15,
    weapon_heavysniper_mk2       = 0.15,
    weapon_marksmanrifle_mk2     = 0.15,

    -- Heavy Weapons
    weapon_rpg                   = 0.15,
    weapon_grenadelauncher       = 0.15,
    weapon_grenadelauncher_smoke = 0.15,
    weapon_emplauncher           = 0.15,
    weapon_minigun               = 0.15,
    weapon_firework              = 0.15,
    weapon_railgun               = 0.15,
    weapon_hominglauncher        = 0.15,
    weapon_compactlauncher       = 0.15,
    weapon_rayminigun            = 0.15,
    weapon_railgunxm3            = 0.15,

    -- Throwables
    weapon_grenade               = 0.15,
    weapon_bzgas                 = 0.15,
    weapon_molotov               = 0.15,
    weapon_stickybomb            = 0.15,
    weapon_proxmine              = 0.15,
    weapon_snowball              = 0.15,
    weapon_pipebomb              = 0.15,
    weapon_ball                  = 0.15,
    weapon_smokegrenade          = 0.15,
    weapon_flare                 = 0.15,

    -- Miscellaneous
    weapon_petrolcan             = 0.15,
    weapon_fireextinguisher      = 0.15,
    weapon_hazardcan             = 0.15,
    weapon_fertilizercan         = 0.15,
}

Config.WeaponRepairPoints = {
    { coords = vector3(964.02, -1267.41, 34.97), IsRepairing = false, RepairingData = {} }
}

Config.WeaponRepairCosts = {
    pistol = 1000,
    smg = 3000,
    mg = 4000,
    rifle = 5000,
    sniper = 7000,
    shotgun = 6000
}

WeaponAttachments = {
    
    clip_attachment = {
        weapon_glacier = `w_ar_glacier_mag2`,
        weapon_howa_2 = `w_ar_howa_2_mag2`,
        weapon_jrbak = `w_ar_jrbak_mag2`,
        weapon_galilar = `w_ar_galilar_mag2`,

        WEAPON_SCEVO = `w_ar_cz_sc_evo_mag2`,
        weapon_pistol = `COMPONENT_PISTOL_CLIP_02`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CLIP_02`,
        weapon_combatpistol = `COMPONENT_COMBATPISTOL_CLIP_02`,
        weapon_appistol = `COMPONENT_APPISTOL_CLIP_02`,
        weapon_pistol50 = `COMPONENT_PISTOL50_CLIP_02`,
        weapon_snspistol = `COMPONENT_SNSPISTOL_CLIP_02`,
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CLIP_02`,
        weapon_heavypistol = `COMPONENT_HEAVYPISTOL_CLIP_02`,
        weapon_vintagepistol = `COMPONENT_VINTAGEPISTOL_CLIP_02`,
        weapon_ceramicpistol = `COMPONENT_CERAMICPISTOL_CLIP_02`,
        weapon_microsmg = `COMPONENT_MICROSMG_CLIP_02`,
        weapon_smg = `COMPONENT_SMG_CLIP_02`,
        weapon_assaultsmg = `COMPONENT_ASSAULTSMG_CLIP_02`,
        weapon_minismg = `COMPONENT_MINISMG_CLIP_02`,
        weapon_smg_mk2 = `COMPONENT_SMG_MK2_CLIP_02`,
        weapon_machinepistol = `COMPONENT_MACHINEPISTOL_CLIP_02`,
        weapon_combatpdw = `COMPONENT_COMBATPDW_CLIP_02`,
        weapon_assaultshotgun = `COMPONENT_ASSAULTSHOTGUN_CLIP_02`,
        weapon_heavyshotgun = `COMPONENT_HEAVYSHOTGUN_CLIP_02`,
        weapon_assaultrifle = `COMPONENT_ASSAULTRIFLE_CLIP_02`,
        weapon_carbinerifle = `COMPONENT_CARBINERIFLE_CLIP_02`,
        weapon_advancedrifle = `COMPONENT_ADVANCEDRIFLE_CLIP_02`,
        weapon_specialcarbine = `COMPONENT_SPECIALCARBINE_CLIP_02`,
        weapon_bullpuprifle = `COMPONENT_BULLPUPRIFLE_CLIP_02`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_02`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CLIP_02`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_02`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CLIP_02`,
        weapon_compactrifle = `COMPONENT_COMPACTRIFLE_CLIP_02`,
        weapon_militaryrifle = `COMPONENT_MILITARYRIFLE_CLIP_02`,
        weapon_heavyrifle = `COMPONENT_HEAVYRIFLE_CLIP_02`,
        weapon_mg = `COMPONENT_MG_CLIP_02`,
        weapon_combatmg = `COMPONENT_COMBATMG_CLIP_02`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CLIP_02`,
        weapon_gusenberg = `COMPONENT_GUSENBERG_CLIP_02`,
        weapon_marksmanrifle = `COMPONENT_MARKSMANRIFLE_CLIP_02`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_02`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CLIP_02`,
        weapon_ddm4v7 = `COMPONENT_DDM4V7_CLIP_02`, -- v3
		weapon_g2c = `COMPONENT_G2C_CLIP_02`, -- v3
        weapon_tglock = `COMPONENT_TGLOCK_CLIP_02`, -- v3
        weapon_tuzi = `COMPONENT_TUZI_CLIP_02`, -- v3
        weapon_scar = `COMPONENT_SCARV3_CLIP_02`, -- v3
        weapon_auga1 = `COMPONENT_AUGA1_CLIP_02`, -- v3
        weapon_glock19 = `COMPONENT_GLOCK19_CLIP_02`, -- v4
        weapon_glock40 = `COMPONENT_GLOCK40_CLIP_02`, -- v4
        weapon_glock19x = `COMPONENT_GLOCK19X_CLIP_02`, -- v4
        weapon_glock40s = `COMPONENT_GLOCK40S_CLIP_02`, -- v4
        weapon_aps = `COMPONENT_APS_CLIP_02`, -- v4
        weapon_barp = `COMPONENT_BARP_CLIP_02`, -- v4
        weapon_plr = `COMPONENT_PLR_CLIP_02`, -- v4
        weapon_xds9 = `COMPONENT_XDS9_CLIP_02`, -- v4
        weapon_glock17s = `COMPONENT_GLOCK17_CLIP_02`, -- v4
        weapon_glock18c = `COMPONENT_GLOCK18C_CLIP_02`, -- v4
        weapon_arpistol = `COMPONENT_ARPISTOL_BOXMAG`, -- v4
        weapon_ziptie = `COMPONENT_ZIPTIE_BOXMAG`, -- v4
        weapon_bscar = `COMPONENT_BSCAR_CLIP_02`, -- v5
        weapon_thompson = `COMPONENT_THOMPSON_CLIP_02`, -- v5
        weapon_blueglocks = `COMPONENT_BLUEGLOCKS_CLIP_02`, -- v5
        weapon_glock41 = `COMPONENT_GLOCK41_CLIP_02`, -- v5
        weapon_glockbeams = `COMPONENT_GLOCKBEAMS_CLIP_02`, -- v5
        weapon_illglock17 = `COMPONENT_ILLGLOCK17_CLIP_02`, -- v5
        weapon_lbtarp = `COMPONENT_LBTANARP_CLIP_02`, -- v5
        weapon_mgglock = `COMPONENT_MGGLOCK_CLIP_02`, -- v5
        weapon_midasglock = `COMPONENT_MIDASGLOCK_CLIP_02`, -- v5
        weapon_ram7 = `COMPONENT_RAM7_CLIP_02`, -- v5
        weapon_redarp = `COMPONENT_REDARP_CLIP_02`, -- v5
        weapon_redm4a1 = `COMPONENT_REDM4A1_CLIP_02`, -- v5
        weapon_tarp = `COMPONENT_TANARP_CLIP_02`, -- v5
        weapon_tglock = `COMPONENT_TGLOCK19_CLIP_02`, -- v5
        weapon_tec9s = `COMPONENT_TEC9S_CLIP_02`, -- v5
        weapon_woarp = `COMPONENT_WOARP_CLIP_02`, -- v5
    },
    drum_attachment = {
        weapon_smg = `COMPONENT_SMG_CLIP_03`,
        weapon_machinepistol = `COMPONENT_MACHINEPISTOL_CLIP_03`,
        weapon_combatpdw = `COMPONENT_COMBATPDW_CLIP_03`,
        weapon_heavyshotgun = `COMPONENT_HEAVYSHOTGUN_CLIP_03`,
        weapon_assaultrifle = `COMPONENT_ASSAULTRIFLE_CLIP_03`,
        weapon_carbinerifle = `COMPONENT_CARBINERIFLE_CLIP_03`,
        weapon_specialcarbine = `COMPONENT_SPECIALCARBINE_CLIP_03`,
        weapon_compactrifle = `COMPONENT_COMPACTRIFLE_CLIP_03`,
        weapon_tarp = `COMPONENT_TANARP_CLIP_03`, -- v5
        weapon_lbtarp = `COMPONENT_LBTANARP_CLIP_03`, -- v5
        weapon_woarp = `COMPONENT_WOARP_CLIP_03`, -- v5
        weapon_redarp = `COMPONENT_REDARP_CLIP_03`, -- v5
    },
    flashlight_attachment = {
        weapon_pistol = `COMPONENT_AT_PI_FLSH`,
        weapon_pistol_mk2 = `COMPONENT_AT_PI_FLSH_02`,
        weapon_combatpistol = `COMPONENT_AT_PI_FLSH`,
        weapon_appistol = `COMPONENT_AT_PI_FLSH`,
        weapon_pistol50 = `COMPONENT_AT_PI_FLSH`,
        weapon_heavypistol = `COMPONENT_AT_PI_FLSH`,
        weapon_snspistol_mk2 = `COMPONENT_AT_PI_FLSH_03`,
        weapon_revolver_mk2 = `COMPONENT_AT_PI_FLSH`,
        weapon_microsmg = `COMPONENT_AT_PI_FLSH`,
        weapon_smg = `COMPONENT_AT_AR_FLSH`,
        weapon_assaultsmg = `COMPONENT_AT_AR_FLSH`,
        weapon_smg_mk2 = `COMPONENT_AT_AR_FLSH`,
        weapon_combatpdw = `COMPONENT_AT_AR_FLSH`,
        weapon_pumpshotgun = `COMPONENT_AT_AR_FLSH`,
        weapon_assaultshotgun = `COMPONENT_AT_AR_FLSH`,
        weapon_bullpupshotgun = `COMPONENT_AT_AR_FLSH`,
        weapon_pumpshotgun_mk2 = `COMPONENT_AT_AR_FLSH`,
        weapon_heavyshotgun = `COMPONENT_AT_AR_FLSH`,
        weapon_combatshotgun = `COMPONENT_AT_AR_FLSH`,
        weapon_assaultrifle = `COMPONENT_AT_AR_FLSH`,
        weapon_carbinerifle = `COMPONENT_AT_AR_FLSH`,
        weapon_advancedrifle = `COMPONENT_AT_AR_FLSH`,
        weapon_specialcarbine = `COMPONENT_AT_AR_FLSH`,
        weapon_bullpuprifle = `COMPONENT_AT_AR_FLSH`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_AR_FLSH`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_AR_FLSH`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_AR_FLSH`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_AR_FLSH`,
        weapon_militaryrifle = `COMPONENT_AT_AR_FLSH`,
        weapon_heavyrifle = `COMPONENT_AT_AR_FLSH`,
        weapon_marksmanrifle = `COMPONENT_AT_AR_FLSH`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_AR_FLSH`,
        weapon_grenadelauncher = `COMPONENT_AT_AR_FLSH`,
        weapon_ddm4v7 = `COMPONENT_AT_PI_G2C_FLSH`, -- v3
        weapon_pmr = `COMPONENT_AT_PI_PMR_FLSH`, -- v3
        weapon_g19x = `COMPONENT_AT_PI_G19X_FLSH`, -- v3
        weapon_g26 = `COMPONENT_AT_PI_G26_FLSH`, -- v3
        weapon_barp = `COMPONENT_AT_AR_BARPFLSH`, -- v4
        weapon_ruger57 = `COMPONENT_AT_PI_RUGER57FLSH`, -- v4
        weapon_bar15 = `COMPONENT_AT_AR_BAR15_FLSH`, -- v5
        weapon_dmk18 = `COMPONENT_AT_AR_DMK18_FLSH`, -- v5
        weapon_glockbeams = `COMPONENT_AT_PI_GLOCKBEAMS_FLSH`, -- v5
    },
    suppressor_attachment = {
        weapon_glacier = `w_at_ar_glacier_supp`,
        weapon_howa_2 = `w_at_ar_howa_2_supp`,
        weapon_jrbak = `w_at_ar_jrbak_supp`,
        weapon_galilar = `w_at_ar_galilar_supp`,


        WEAPON_SCEVO = `w_at_cz_sc_evo_supp`,
        weapon_pistol = `COMPONENT_AT_PI_SUPP_02`,
        weapon_pistol_mk2 = `COMPONENT_AT_PI_SUPP_02`,
        weapon_combatpistol = `COMPONENT_AT_PI_SUPP`,
        weapon_appistol = `COMPONENT_AT_PI_SUPP`,
        weapon_pistol50 = `COMPONENT_AT_AR_SUPP_02`,
        weapon_heavypistol = `COMPONENT_AT_PI_SUPP`,
        weapon_snspistol_mk2 = `COMPONENT_AT_PI_SUPP_02`,
        weapon_vintagepistol = `COMPONENT_AT_PI_SUPP`,
        weapon_ceramicpistol = `COMPONENT_CERAMICPISTOL_SUPP`,
        weapon_microsmg = `COMPONENT_AT_AR_SUPP_02`,
        weapon_smg = `COMPONENT_AT_PI_SUPP`,
        weapon_assaultsmg = `COMPONENT_AT_AR_SUPP_02`,
        weapon_smg_mk2 = `COMPONENT_AT_PI_SUPP`,
        weapon_machinepistol = `COMPONENT_AT_PI_SUPP`,
        weapon_pumpshotgun = `COMPONENT_AT_SR_SUPP`,
        weapon_assaultshotgun = `COMPONENT_AT_AR_SUPP`,
        weapon_bullpupshotgun = `COMPONENT_AT_AR_SUPP_02`,
        weapon_pumpshotgun_mk2 = `COMPONENT_AT_SR_SUPP_03`,
        weapon_heavyshotgun = `COMPONENT_AT_AR_SUPP_02`,
        weapon_combatshotgun = `COMPONENT_AT_AR_SUPP`,
        weapon_assaultrifle = `COMPONENT_AT_AR_SUPP_02`,
        weapon_carbinerifle = `COMPONENT_AT_AR_SUPP`,
        weapon_advancedrifle = `COMPONENT_AT_AR_SUPP`,
        weapon_specialcarbine = `COMPONENT_AT_AR_SUPP_02`,
        weapon_bullpuprifle = `COMPONENT_AT_AR_SUPP`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_AR_SUPP`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_AR_SUPP_02`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_AR_SUPP_02`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_AR_SUPP`,
        weapon_militaryrifle = `COMPONENT_AT_AR_SUPP`,
        weapon_heavyrifle = `COMPONENT_AT_AR_SUPP`,
        weapon_sniperrifle = `COMPONENT_AT_AR_SUPP_02`,
        weapon_marksmanrifle = `COMPONENT_AT_AR_SUPP`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_AR_SUPP`,
        weapon_heavysniper_mk2 = `COMPONENT_AT_SR_SUPP_03`,
        weapon_p416 = `COMPONENT_AT_AR_P416_SUPP`, -- v3
        weapon_p90 = `COMPONENT_AT_SR_P90_SUPP`, -- v3
        weapon_ziptie = `COMPONENT_AT_AR_ZIPTIE_SUPP`, -- v4
        weapon_dmk18 = `COMPONENT_AT_AR_DMK18_SUPP`, -- v5
        weapon_redm4a1 = `COMPONENT_AT_AR_REDM4A1_SUPP`, -- v5
    },
    smallscope_attachment = {
        WEAPON_SCEVO  = `w_at_cz_sc_evo_scope_small`,
        weapon_pistol_mk2 = `COMPONENT_AT_PI_RAIL`,
        weapon_snspistol_mk2 = `COMPONENT_AT_PI_RAIL_02`,
        weapon_microsmg = `COMPONENT_AT_SCOPE_MACRO`,
        weapon_smg = `COMPONENT_AT_SCOPE_MACRO_02`,
        weapon_assaultsmg = `COMPONENT_AT_SCOPE_MACRO`,
        weapon_combatpdw = `COMPONENT_AT_SCOPE_SMALL`,
        weapon_assaultrifle = `COMPONENT_AT_SCOPE_MACRO`,
        weapon_bullpuprifle = `COMPONENT_AT_SCOPE_SMALL`,
        weapon_militaryrifle = `COMPONENT_AT_SCOPE_SMALL`,
        weapon_mg = `COMPONENT_AT_SCOPE_SMALL_02`,
        weapon_revolver_mk2 = `COMPONENT_AT_SCOPE_MACRO_MK2`,
        weapon_smg_mk2 = `COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2`,
        weapon_pumpshotgun_mk2 = `COMPONENT_AT_SCOPE_MACRO_MK2`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_SCOPE_MACRO_02_MK2`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_SCOPE_MACRO_MK2`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_SCOPE_MACRO_MK2`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_SCOPE_MACRO_MK2`,
        weapon_advancedrifle = `COMPONENT_AT_SCOPE_SMALL`,
        weapon_grenadelauncher = `COMPONENT_AT_SCOPE_SMALL`,
    },
    medscope_attachment = {
        weapon_glacier = `w_at_ar_glacier_scope`,
        weapon_howa_2 = `w_at_ar_howa_2_scope`,
        weapon_jrbak = `w_at_ar_jrbak_scope`,
        weapon_galilar = `w_at_ar_galilar_scope`,

        weapon_smg_mk2 = `COMPONENT_AT_SCOPE_SMALL_SMG_MK2`,
        weapon_pumpshotgun_mk2 = `COMPONENT_AT_SCOPE_SMALL_MK2`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_SCOPE_SMALL_MK2`,
        weapon_combatmg_mk2 = `COMPONENT_AT_SCOPE_SMALL_MK2`,
        weapon_carbinerifle = `COMPONENT_AT_SCOPE_MEDIUM`,
        weapon_specialcarbine = `COMPONENT_AT_SCOPE_MEDIUM`,
        weapon_combatmg = `COMPONENT_AT_SCOPE_MEDIUM`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_SCOPE_MEDIUM_MK2`,
        weapon_arpistol = `COMPONENT_AT_ARPISTOLSCOPE_MEDIUM`, -- v4
        weapon_bar15 = `COMPONENT_AT_BAR15_SCOPE_MEDIUM`, -- v5
        weapon_dmk18 = `COMPONENT_AT_DMK18_SCOPE_MEDIUM`, -- v5
    },
    largescope_attachment = {
        weapon_sniperrifle = `COMPONENT_AT_SCOPE_LARGE`,
        weapon_marksmanrifle = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM`,
        weapon_heavysniper_mk2 = `COMPONENT_AT_SCOPE_LARGE_MK2`,
        weapon_awp = `COMPONENT_AT_AWP_SCOPE_LARGE`, -- v3
        weapon_m200 = `COMPONENT_AT_M200_SCOPE_LARGE`, -- v3
        weapon_as50 = `COMPONENT_AT_AS50_SCOPE_LARGE`, -- v3
    },
    holoscope_attachment = {
        weapon_heavyrevolver_mk2 = `COMPONENT_AT_SIGHTS`,
        weapon_smg_mk2 = `COMPONENT_AT_SIGHTS`,
        weapon_pumpshotgun_mk2 = `COMPONENT_AT_SIGHTS`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_SIGHTS`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_SIGHTS`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_SIGHTS`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_SIGHTS`,
        weapon_combatmg_mk2 = `COMPONENT_AT_SIGHTS`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_SIGHTS`,
    },
    advscope_attachment = {
        weapon_sniperrifle = `COMPONENT_AT_SCOPE_MAX`,
        weapon_heavysniper = `COMPONENT_AT_SCOPE_MAX`,
        weapon_heavysniper_mk2 = `COMPONENT_AT_SCOPE_MAX`,
    },
    nvscope_attachment = {
        weapon_heavysniper_mk2 = `COMPONENT_AT_SCOPE_NV`,
    },
    thermalscope_attachment = {
        weapon_heavysniper_mk2 = `COMPONENT_AT_SCOPE_THERMAL`,
    },
    flat_muzzle_brake = {
        weapon_smg_mk2 = `COMPONENT_AT_MUZZLE_01`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_MUZZLE_01`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_MUZZLE_01`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_MUZZLE_01`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_MUZZLE_01`,
        weapon_combatmg_mk2 = `COMPONENT_AT_MUZZLE_01`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_MUZZLE_01`,
    },
    tactical_muzzle_brake = {
        weapon_smg_mk2 = `COMPONENT_AT_MUZZLE_02`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_MUZZLE_02`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_MUZZLE_02`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_MUZZLE_02`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_MUZZLE_02`,
        weapon_combatmg_mk2 = `COMPONENT_AT_MUZZLE_02`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_MUZZLE_02`,
    },
    fat_end_muzzle_brake = {
        weapon_smg_mk2 = `COMPONENT_AT_MUZZLE_03`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_MUZZLE_03`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_MUZZLE_03`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_MUZZLE_03`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_MUZZLE_03`,
        weapon_combatmg_mk2 = `COMPONENT_AT_MUZZLE_03`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_MUZZLE_03`,
    },
    precision_muzzle_brake = {
        weapon_smg_mk2 = `COMPONENT_AT_MUZZLE_04`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_MUZZLE_04`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_MUZZLE_04`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_MUZZLE_04`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_MUZZLE_04`,
        weapon_combatmg_mk2 = `COMPONENT_AT_MUZZLE_04`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_MUZZLE_04`,
    },
    heavy_duty_muzzle_brake = {
        weapon_smg_mk2 = `COMPONENT_AT_MUZZLE_05`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_MUZZLE_05`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_MUZZLE_05`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_MUZZLE_05`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_MUZZLE_05`,
        weapon_combatmg_mk2 = `COMPONENT_AT_MUZZLE_05`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_MUZZLE_05`,
    },
    slanted_muzzle_brake = {
        weapon_smg_mk2 = `COMPONENT_AT_MUZZLE_06`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_MUZZLE_06`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_MUZZLE_06`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_MUZZLE_06`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_MUZZLE_06`,
        weapon_combatmg_mk2 = `COMPONENT_AT_MUZZLE_06`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_MUZZLE_06`,
    },
    split_end_muzzle_brake = {
        weapon_smg_mk2 = `COMPONENT_AT_MUZZLE_07`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_MUZZLE_07`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_MUZZLE_07`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_MUZZLE_07`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_MUZZLE_07`,
        weapon_combatmg_mk2 = `COMPONENT_AT_MUZZLE_07`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_MUZZLE_07`,
    },
    squared_muzzle_brake = {
        weapon_pumpshotgun_mk2 = `COMPONENT_AT_MUZZLE_08`,
        weapon_heavysniper_mk2 = `COMPONENT_AT_MUZZLE_08`
    },
    bellend_muzzle_brake = {
        weapon_heavysniper_mk2 = `COMPONENT_AT_MUZZLE_09`
    },
    barrel_attachment = {
        weapon_smg_mk2 = `COMPONENT_AT_SB_BARREL_02`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_BP_BARREL_02`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_SC_BARREL_02`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_AR_BARREL_02`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_CR_BARREL_02`,
        weapon_combatmg_mk2 = `COMPONENT_AT_MG_BARREL_02`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_MRFL_BARREL_02`,
        weapon_heavysniper_mk2 = `COMPONENT_AT_SR_BARREL_02`,
    },
    grip_attachment = {
        weapon_glacier = `w_at_ar_glacier_grip`,
        weapon_howa_2 = `w_at_ar_howa_2_grip`,
        weapon_jrbak = `w_at_ar_jrbak_grip`,
        weapon_galilar = `w_at_ar_galilar_grip`,

        WEAPON_SCEVO = `w_at_cz_sc_evo_afgrip`,
        weapon_combatpdw = `COMPONENT_AT_AR_AFGRIP`,
        weapon_assaultshotgun = `COMPONENT_AT_AR_AFGRIP`,
        weapon_bullpupshotgun = `COMPONENT_AT_AR_AFGRIP`,
        weapon_heavyshotgun = `COMPONENT_AT_AR_AFGRIP`,
        weapon_assaultrifle = `COMPONENT_AT_AR_AFGRIP`,
        weapon_carbinerifle = `COMPONENT_AT_AR_AFGRIP`,
        weapon_advancedrifle = `COMPONENT_AT_AR_AFGRIP`,
        weapon_specialcarbine = `COMPONENT_AT_AR_AFGRIP`,
        weapon_bullpuprifle = `COMPONENT_AT_AR_AFGRIP`,
        weapon_bullpuprifle_mk2 = `COMPONENT_AT_AR_AFGRIP_02`,
        weapon_specialcarbine_mk2 = `COMPONENT_AT_AR_AFGRIP_02`,
        weapon_assaultrifle_mk2 = `COMPONENT_AT_AR_AFGRIP_02`,
        weapon_carbinerifle_mk2 = `COMPONENT_AT_AR_AFGRIP_02`,
        weapon_heavyrifle = `COMPONENT_AT_AR_AFGRIP`,
        weapon_combatmg = `COMPONENT_AT_AR_AFGRIP`,
        weapon_combatmg_mk2 = `COMPONENT_AT_AR_AFGRIP_02`,
        weapon_marksmanrifle = `COMPONENT_AT_AR_AFGRIP`,
        weapon_marksmanrifle_mk2 = `COMPONENT_AT_AR_AFGRIP_02`,
        weapon_grenadelauncher = `COMPONENT_AT_AR_AFGRIP`,
        weapon_lok = `COMPONENT_AT_AR_LOKAFGRIP`, -- v4
        weapon_plr = `COMPONENT_AT_AR_PLRAFGRIP`, -- v4
        weapon_bar15 = `COMPONENT_AT_AR_BAR15_AFGRIP`, -- v5
        weapon_dmk18 = `COMPONENT_AT_AR_DMK18_AFGRIP`, -- v5
    },
    comp_attachment = {
        weapon_pistol_mk2 = `COMPONENT_AT_PI_COMP`,
        weapon_snspistol_mk2 = `COMPONENT_AT_PI_COMP_02`,
        weapon_revolver_mk2 = `COMPONENT_AT_PI_COMP_03`,
    },
    luxuryfinish_attachment = {
        weapon_pistol = `COMPONENT_PISTOL_VARMOD_LUXE`,
        weapon_combatpistol = `COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER`,
        weapon_appistol = `COMPONENT_APPISTOL_VARMOD_LUXE`,
        weapon_pistol50 = `COMPONENT_PISTOL50_VARMOD_LUXE`,
        weapon_revolver = `COMPONENT_REVOLVER_VARMOD_GOON`,
        weapon_snspistol = `COMPONENT_SNSPISTOL_VARMOD_LOWRIDER`,
        weapon_heavypistol = `COMPONENT_HEAVYPISTOL_VARMOD_LUXE`,
        weapon_smg = `COMPONENT_SMG_VARMOD_LUXE`,
        weapon_assaultsmg = `COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER`,
        weapon_microsmg = `COMPONENT_MICROSMG_VARMOD_LUXE`,
        weapon_pumpshotgun = `COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER`,
        weapon_sawnoffshotgun = `COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE`,
        weapon_assaultrifle = `COMPONENT_ASSAULTRIFLE_VARMOD_LUXE`,
        weapon_carbinerifle = `COMPONENT_CARBINERIFLE_VARMOD_LUXE`,
        weapon_advancedrifle = `COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE`,
        weapon_specialcarbine = `COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER`,
        weapon_bullpuprifle = `COMPONENT_BULLPUPRIFLE_VARMOD_LOW`,
        weapon_heavyrifle = `COMPONENT_BULLPUPRIFLE_VARMOD_LOW`,
        weapon_mg = `COMPONENT_MG_VARMOD_LOWRIDER`,
        weapon_combatmg = `COMPONENT_COMBATMG_VARMOD_LOWRIDER`,
        weapon_sniperrifle = `COMPONENT_SNIPERRIFLE_VARMOD_LUXE`,
        weapon_marksmanrifle = `COMPONENT_MARKSMANRIFLE_VARMOD_LUXE`,
    },
    digicamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO`,
    },
    brushcamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_02`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_02`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_02`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_02`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_02`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_02`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_02`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_02`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_02`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_02`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_02`,
    },
    woodcamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_03`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_03`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_03`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_03`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_03`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_03`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_03`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_03`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_03`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_03`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_03`,
    },
    skullcamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_04`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_04`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_04`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_04`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_04`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_04`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_04`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_04`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_04`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_04`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_04`,
    },
    sessantacamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_05`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_05`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_05`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_05`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_05`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_05`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_05`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_05`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_05`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_05`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_05`,
    },
    perseuscamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_06`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_06`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_06`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_06`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_06`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_06`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_06`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_06`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_06`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_06`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_06`,
    },
    leopardcamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_07`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_07`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_07`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_07`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_07`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_07`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_07`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_07`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_07`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_07`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_07`,
    },
    zebracamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_08`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_08`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_08`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_08`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_08`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_08`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_08`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_08`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_08`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_08`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_08`,
    },
    geocamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_09`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_09`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_09`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_09`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_09`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_09`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_09`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_09`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_09`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_09`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_09`,
    },
    boomcamo_attachment = {
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_10`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_10`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_10`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_10`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_10`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_10`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_10`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_10`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_10`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_10`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_10`,
    },
    patriotcamo_attachment = {
        weapon_heavyrifle_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_IND_01`,
        weapon_snspistol_mk2 = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01`,
        weapon_pistol_mk2 = `COMPONENT_PISTOL_MK2_CAMO_IND_01`,
        weapon_smg_mk2 = `COMPONENT_REVOLVER_MK2_CAMO_IND_01`,
        weapon_pumpshotgun_mk2 = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01`,
        weapon_bullpuprifle_mk2 = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01`,
        weapon_specialcarbine_mk2 = `COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01`,
        weapon_assaultrifle_mk2 = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01`,
        weapon_carbinerifle_mk2 = `COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01`,
        weapon_combatmg_mk2 = `COMPONENT_COMBATMG_MK2_CAMO_IND_01`,
        weapon_marksmanrifle_mk2 = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01`,
        weapon_heavysniper_mk2 = `COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01`,
    },
    at_clip_drum_pistol = {
        weapon_glock19 = `COMPONENT_GLOCK19_CLIP_03`, -- v4
        weapon_glock40 = `COMPONENT_GLOCK40_CLIP_03`, -- v4
        weapon_glock19x = `COMPONENT_GLOCK19X_CLIP_03`, -- v4
        weapon_glock40s = `COMPONENT_GLOCK40S_CLIP_03`, -- v4
        weapon_illglock17 = `COMPONENT_ILLGLOCK17_CLIP_03`, -- v5
        weapon_blueglocks = `COMPONENT_BLUEGLOCKS_CLIP_03`, -- v5
        weapon_glockbeams = `COMPONENT_GLOCKBEAMS_CLIP_03`, -- v5
        weapon_mgglock = `COMPONENT_MGGLOCK_CLIP_03`, -- v5
        weapon_tglock19 = `COMPONENT_TGLOCK19_CLIP_03`, -- v5
        weapon_midasglock = `COMPONENT_MIDASGLOCK_CLIP_03`, -- v5

    },
    at_clip_100_pistol = { 
        weapon_glock40 = `COMPONENT_GLOCK40_CLIP_04`, -- v4
        weapon_glock19x = `COMPONENT_GLOCK19X_CLIP_04`, -- v4
        weapon_glock40s = `COMPONENT_GLOCK40S_CLIP_04`, -- v4
        weapon_illglock17 = `COMPONENT_ILLGLOCK17_CLIP_05`, -- v5
        weapon_blueglocks = `COMPONENT_BLUEGLOCKS_CLIP_04`, -- v5
        weapon_glockbeams = `COMPONENT_GLOCKBEAMS_CLIP_04`, -- v5
        weapon_mgglock = `COMPONENT_MGGLOCK_CLIP_04`, -- v5
        weapon_tglock19 = `COMPONENT_TGLOCK19_CLIP_04`, -- v5
        weapon_midasglock = `COMPONENT_MIDASGLOCK_CLIP_04`, -- v5   
    },
    at_clip_clear = { 
        weapon_tarp = `COMPONENT_TANARP_CLIP_04`, -- v5
        weapon_lbtarp = `COMPONENT_LBTANARP_CLIP_04`, -- v5
        weapon_woarp = `COMPONENT_WOARP_CLIP_04`, -- v5
        weapon_illglock17 = `COMPONENT_ILLGLOCK17_CLIP_04`, -- v5
        weapon_blueglocks = `COMPONENT_BLUEGLOCKS_CLIP_05`, -- v5
        weapon_glockbeams = `COMPONENT_GLOCKBEAMS_CLIP_05`, -- v5
        weapon_mgglock = `COMPONENT_MGGLOCK_CLIP_05`, -- v5
        weapon_tglock19 = `COMPONENT_TGLOCK19_CLIP_05`, -- v5
        weapon_midasglock = `COMPONENT_MIDASGLOCK_CLIP_05`, -- v5
        weapon_redarp = `COMPONENT_REDARP_CLIP_04`, -- v5
    },
}

local function getConfigWeaponAttachments()
    return WeaponAttachments
end

exports('getConfigWeaponAttachments', getConfigWeaponAttachments)
