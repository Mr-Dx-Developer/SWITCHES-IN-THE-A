ELEM = {}


ELEM.grass = {
    'prop_veg_grass_02_a',
    'prop_grass_dry_02',
    'prop_veg_grass_01_d',
    'prop_veg_grass_01_c',
}
ELEM.bush = {
    'h4_prop_bush_buddleia_sml_01',
    'h4_prop_bush_ear_aa',
    'h4_prop_bush_ear_ab',
    'h4_prop_bush_wandering_aa',
    'h4_prop_palmeto_sap_ab',
    'h4_prop_palmeto_sap_ac',
    'h4_prop_tree_dracaena_sml_01',
    'h4_prop_tree_frangipani_med_01',
    'h4_prop_tree_palm_areca_sap_02',
    'h4_prop_tree_palm_areca_sap_03',
    'h4_prop_bush_olndr_white_lrg',
    'prop_plant_fern_02a',
}
ELEM.trees = {
    'h4_prop_tree_umbrella_sml_01',
    'h4_prop_tree_umbrella_med_01',
    'h4_prop_tree_blk_mgrv_med_01',
    'h4_prop_tree_blk_mgrv_med_01',
    'h4_prop_tree_banana_med_01',
    'h4_prop_tree_dracaena_lrg_01',
    'h4_prop_tree_frangipani_lrg_01',
    'h4_prop_tree_palm_thatch_01',
    
    -- The following trees do not have properly set up bounds (blame Rockstar I guess) and may pop when player looks up
    -- I still decided to keep them in as they add a lot to the foliage
    'h4_prop_tree_palm_trvlr_03',
    'h4_prop_tree_palm_fan_bea_03b',
    'h4_prop_tree_blk_mgrv_lrg_01',
    'h4_prop_tree_blk_mgrv_lrg_02',
}
ELEM.rocks = {
    'prop_rock_1_e',
    'prop_rock_2_f',
    'prop_rock_2_d',
    'prop_rock_2_g',
    'prop_rock_3_j',
    'prop_rock_3_h',
    'h4_prop_rock_scree_med_03',
    'h4_prop_rock_scree_med_02',
    'h4_prop_rock_scree_med_01',
}
ELEM.pebbles = {
    'proc_sml_stones01',
    'proc_sml_stones02',
    'proc_mntn_stone01',
    'proc_mntn_stone02',
    'proc_mntn_stone03',
    'h4_prop_rock_scree_small_01',
    'h4_prop_rock_scree_small_02',
    'h4_prop_rock_scree_small_03',
}

ELEM.boulders = {
    'h4_prop_rock_lrg_03',
    'h4_prop_rock_lrg_04',
    'h4_prop_rock_lrg_02',
    'h4_prop_rock_lrg_01',
    'h4_prop_rock_lrg_05',
    'h4_prop_rock_lrg_06',
    'h4_prop_rock_lrg_07',
    'h4_prop_rock_lrg_08',
    'h4_prop_rock_lrg_09',
    'h4_prop_rock_lrg_10',
    'h4_prop_rock_lrg_11',
    'h4_prop_rock_lrg_12',
}

ELEM.special = {
    'prop_rub_wreckage_8',
    'prop_rub_carwreck_3',
    'prop_wreckedcart',
    'prop_rub_carwreck_10',
    'prop_old_farm_01',
    'prop_oldplough1',
    'hei_prop_carrier_radar_2',
    'prop_air_watertank3',
}


OPTIONAL = {}

OPTIONAL = {
    mansion_roofing = {
        enabled = true,
        camera = {
            offset = vector3(24.0, -22.0, 22.0),
            rotation = vector3(-42.0 , 0.0, 0.0),
            fov = 90.0,
        },
        objects = {
            ['empty'] = {
                label = 'EMPTY',
                description = '',
                price = 3000,
            },
            ['roofing'] = {
                label = 'Roofing',
                description = 'Roof expansion for the mansion',
                price = 50000,
        
                model = 'kq_island_mansion_roofing',
                offset = vector3(14.5, 7.2, 10.92),
                heading = 110.0,
                clearSpace = false,
                clearRadius = 0.0,
            },
        },
    },
    mansion_front = {
        enabled = true,
        camera = {
            offset = vector3(24.0, -22.0, 22.0),
            rotation = vector3(-42.0 , 0.0, 0.0),
            fov = 90.0,
        },
        objects = {
            ['empty'] = {
                label = 'EMPTY',
                description = '',
                price = 1000,
            },
            ['dining_set'] = {
                label = 'Dining set',
                description = 'Table with a couple of chairs',
                price = 8000,
        
                model = 'apa_mp_h_din_table_04',
                offset = vector3(24.6, -9.3, 10.86),
                heading = 110.0,
                clearSpace = false,
                clearRadius = 0.0,

                children = {
                    {
                        model = 'hei_heist_acc_flowers_01',
                        offset = vector3(0.0, 0.0, 0.8),
                        heading = 90.0,
                    },
                    {
                        model = 'prop_cs_whiskey_bottle',
                        offset = vector3(0.7, 0.2, 0.93),
                        heading = 47.0,
                    },
                    {
                        model = 'prop_drink_whisky',
                        offset = vector3(0.7, 0.5, 0.8),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_drink_whisky',
                        offset = vector3(-0.7, 0.46, 0.8),
                        heading = 11.0,
                    },
                    {
                        model = 'prop_drink_whisky',
                        offset = vector3(1.0, -0.21, 0.8),
                        heading = 77.0,
                    },
                    {
                        model = 'apa_mp_h_stn_chairarm_02',
                        offset = vector3(0.9, 2.3, 0.0),
                        heading = -5.0,
                    },
                    {
                        model = 'apa_mp_h_stn_chairarm_02',
                        offset = vector3(-0.9, 2.2, 0.0),
                        heading = 15.0,
                    },
                    {
                        model = 'apa_mp_h_stn_chairarm_02',
                        offset = vector3(0.9, -2.2, 0.0),
                        heading = 180.0,
                    },
                    {
                        model = 'apa_mp_h_stn_chairarm_02',
                        offset = vector3(-0.9, -2.2, 0.0),
                        heading = 177.0,
                    },
                },
            },
            ['table_tennis'] = {
                label = 'Table tennis set',
                description = 'Table tennis table',
                price = 2000,
        
                model = 'prop_table_tennis',
                offset = vector3(24.6, -9.3, 10.85),
                heading = 110.0,
                clearSpace = false,
                clearRadius = 0.0,

                children = {
                    {
                        model = 'prop_ping_pong',
                        offset = vector3(0.4, 0.3, 0.8),
                        heading = 90.0,
                    },
                },
            },
            ['lounge_set'] = {
                label = 'Lounge set',
                description = 'Table tennis table',
                price = 2000,
        
                model = 'prop_patio_lounger1',
                offset = vector3(25.0, -7.5, 10.85),
                heading = 20.0,
                clearSpace = false,
                clearRadius = 0.0,

                children = {
                    {
                        model = 'prop_patio_lounger1',
                        offset = vector3(1.5, 0.0, 0.0),
                        heading = -1.0,
                    },
                    {
                        model = 'prop_patio_lounger1_table',
                        offset = vector3(0.75, -0.15, 0.1),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_patio_lounger1',
                        offset = vector3(-1.5, 0.05, 0.0),
                        heading = 2.0,
                    },
                    {
                        model = 'prop_patio_lounger1_table',
                        offset = vector3(-0.75, -0.22, 0.1),
                        heading = -3.0,
                    },
                    {
                        model = 'prop_cocktail',
                        offset = vector3(-0.75, -0.22, 0.26),
                        heading = 99.0,
                    },
                },
            },
        },
    },
    flag = {
        enabled = true,
        camera = {
            offset = vector3(58.0, -14.0, 18.0),
            rotation = vector3(-20.0 , 0.0, 90.0),
            fov = 90.0,
        },
        objects = {
            ['empty'] = {
                label = 'EMPTY',
                description = '',
                price = 1000,
            },
            ['flag_usa'] = {
                label = 'USA',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_us',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_canada'] = {
                label = 'Canada',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_canada',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_eu'] = {
                label = 'European Union',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_eu',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_germany'] = {
                label = 'Germany',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_german',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_japan'] = {
                label = 'Japan',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_japan',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_los_santos'] = {
                label = 'Los Santos',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_ls',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_mexico'] = {
                label = 'Mexico',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_mexico',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_sa'] = {
                label = 'San Andreas',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_sa',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_scotland'] = {
                label = 'Scotland',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_scotland',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_uk'] = {
                label = 'United Kingdom',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_uk',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_france'] = {
                label = 'France',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_france',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
            ['flag_ireland'] = {
                label = 'Ireland',
                description = '',
                price = 5000,
        
                model = 'prop_flagpole_2a',
                offset = vector3(47.5, -14.0, 9.7),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_flag_ireland',
                        offset = vector3(0.0, 0.0, 9.5),
                        heading = 0.0,
                    },
                },
            },
        },
    },
    land_slot_a = {
        enabled = true,
        camera = {
            offset = vector3(20.0, -18.0, 24.0),
            rotation = vector3(-42.0 , 0.0, 215.0),
            fov = 90.0,
        },
        objects = {
            ['empty'] = {
                label = 'EMPTY',
                description = '',
                price = 3000,
            },
            ['helipad_1'] = {
                label = 'Helipad type A',
                description = 'A simple octagonal helipad',
                price = 120000,

                model = 'prop_helipad_01',
                offset = vector3(31.0, -29.0, 10.5),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 11.5,
            },
            ['helipad_2'] = {
                label = 'Helipad type B',
                description = 'A simple square helipad',
                price = 110000,

                model = 'prop_helipad_02',
                offset = vector3(31.0, -29.0, 10.5),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 12.0,
            },
            ['gazebo'] = {
                label = 'Garden set',
                description = 'Gazebo, hot tub, bbq grill and a table',
                price = 9000,
    
                model = 'prop_gazebo_03',
                offset = vector3(31.0, -30.5, 10.88),
                heading = 270.0,
                clearSpace = true,
                clearRadius = 8.0,
    
                children = {
                    {
                        model = 'prop_hottub2',
                        offset = vector3(1.0, 5.0, 0.0),
                        heading = 50.0,
                    },
                    {
                        model = 'prop_bbq_5',
                        offset = vector3(4.0, -4.0, 0.0),
                        heading = 190.0,
                    },
                    {
                        model = 'hei_heist_din_table_07',
                        offset = vector3(0.0, 0.0, 0.02),
                        heading = 3.0,
                    },
                    {
                        model = 'prop_wine_white',
                        offset = vector3(0.0, 0.0, 0.83),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_pizza_box_03',
                        offset = vector3(1.3, 0.3, 0.85),
                        heading = 30.0,
                    },
                    {
                        model = 'prop_patio_lounger1',
                        offset = vector3(-2.0, -6.0, 0.26),
                        heading = 330.0,
                    },
                    {
                        model = 'prop_patio_lounger1',
                        offset = vector3(0.0, -6.5, 0.25),
                        heading = 330.0,
                    },
                },
            },
            ['garage'] = {
                label = 'Manchez + Verus garage',
                description = 'Simple garage. Resupplied with 2 Manchez bikes and 2 Verus quad bikes',
                price = 170000,

                model = 'kq_island_garage',
                offset = vector3(22.0, -27.0, 12.9),
                heading = 200.0,
                clearSpace = true,
                clearRadius = 7.5,
                spawners = {
                    {
                        offset = vector3(-3.5, 1.5, -1.0),
                        heading = 220.0,
                        model = 'manchez2',
                    },
                    {
                        offset = vector3(-1.75, 0.5, -1.0),
                        heading = 220.0,
                        model = 'manchez2',
                    },
                    {
                        offset = vector3(1.4, -0.5, -1.0),
                        heading = 220.0,
                        model = 'verus',
                    },
                    {
                        offset = vector3(3.6, -1.5, -1.0),
                        heading = 220.0,
                        model = 'verus',
                    },
                },
            },
            ['garage_2'] = {
                label = 'Outlaw garage',
                description = 'Simple garage. Resupplied with 2 Outlaws',
                price = 190000,

                model = 'kq_island_garage',
                offset = vector3(22.0, -27.0, 12.9),
                heading = 200.0,
                clearSpace = true,
                clearRadius = 7.5,
                spawners = {
                    {
                        offset = vector3(-2.0, 1.0, -1.0),
                        heading = 220.0,
                        model = 'outlaw',
                    },
                    {
                        offset = vector3(2.0, -1.5, -1.0),
                        heading = 220.0,
                        model = 'outlaw',
                    },
                },
            },
        }
    },
    land_slot_b = {
        enabled = true,
        camera = {
            offset = vector3(-15.0, 7.0, 19.85),
            rotation = vector3(-42.0 , 0.0, 20.0),
            fov = 90.0,
        },
        objects = {
            ['empty'] = {
                label = 'EMPTY',
                description = '',
                price = 3000,
            },
            ['helipad_a'] = {
                label = 'Helipad type A',
                description = 'A simple octagonal helipad',
                price = 120000,
                
                model = 'prop_helipad_01',
                offset = vector3(-20.0, 17.0, 10.85),
                heading = 20.0,
                clearSpace = true,
                clearRadius = 11.5,
            },
            ['helipad_b'] = {
                label = 'Helipad type B',
                description = 'A simple square helipad',
                price = 110000,
                
                model = 'prop_helipad_02',
                offset = vector3(-20.0, 17.0, 10.85),
                heading = 20.0,
                clearSpace = true,
                clearRadius = 12.0,
            },
            ['gazebo'] = {
                label = 'Garden set',
                description = 'Gazebo, hot tub, bbq grill and a table',
                price = 9000,
    
                model = 'prop_gazebo_03',
                offset = vector3(-18.0, 17.0, 10.86),
                heading = 0.0,
                clearSpace = true,
                clearRadius = 8.0,
    
                children = {
                    {
                        model = 'prop_hottub2',
                        offset = vector3(-1.0, 5.0, 0.0),
                        heading = 20.0,
                    },
                    {
                        model = 'prop_bbq_5',
                        offset = vector3(-3.0, -4.0, 0.0),
                        heading = 90.0,
                    },
                    {
                        model = 'hei_heist_din_table_07',
                        offset = vector3(0.0, 0.0, 0.02),
                        heading = 3.0,
                    },
                    {
                        model = 'prop_wine_rose',
                        offset = vector3(0.0, 0.0, 0.83),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_pizza_box_03',
                        offset = vector3(1.3, 0.3, 0.85),
                        heading = 30.0,
                    },
                    {
                        model = 'prop_patio_lounger1',
                        offset = vector3(5.5, 3.5, 0.0),
                        heading = 110.0,
                    },
                    {
                        model = 'prop_patio_lounger1',
                        offset = vector3(5.0, 5.0, 0.0),
                        heading = 110.0,
                    },
                },
            },
            ['garage'] = {
                label = 'Manchez + Verus garage',
                description = 'Simple garage. Resupplied with 2 Manchez bikes and 2 Verus quad bikes',
                price = 170000,
                
                model = 'kq_island_garage',
                offset = vector3(-19.6, 15.5, 12.8),
                heading = 240.0,
                clearSpace = true,
                clearRadius = 7.5,
                spawners = {
                    {
                        offset = vector3(-3.65, 1.5, -1.0),
                        heading = 220.0,
                        model = 'manchez2',
                    },
                    {
                        offset = vector3(-1.4, 0.5, -1.0),
                        heading = 220.0,
                        model = 'manchez2',
                    },
                    {
                        offset = vector3(1.4, -0.3, -1.0),
                        heading = 220.0,
                        model = 'verus',
                    },
                    {
                        offset = vector3(3.6, -1.5, -1.0),
                        heading = 220.0,
                        model = 'verus',
                    },
                },
            },
            ['garage_2'] = {
                label = 'Outlaw garage',
                description = 'Simple garage. Resupplied with 2 Outlaws',
                price = 190000,
                
                model = 'kq_island_garage',
                offset = vector3(-19.6, 15.5, 12.8),
                heading = 240.0,
                clearSpace = true,
                clearRadius = 7.5,
                spawners = {
                    {
                        offset = vector3(-2.0, 1.0, -1.0),
                        heading = 220.0,
                        model = 'outlaw',
                    },
                    {
                        offset = vector3(2.0, -1.5, -1.0),
                        heading = 220.0,
                        model = 'outlaw',
                    },
                },
            },
        }
    },
    water_slot_a = {
        enabled = true,
        camera = {
            offset = vector3(71.0, -36.0, 18.0),
            rotation = vector3(-20.0 , 0.0, 90.0),
            fov = 90.0,
        },
        objects = {
            ['empty'] = {
                label = 'EMPTY',
                description = '',
                price = 1000,
            },
            ['seasharks'] = {
                label = 'Seasharks',
                description = 'Floating dock resupplied with 4 seasharks',
                price = 100000,
            
                model = 'prop_byard_float_02',
                offset = vector3(50.0, -35.0, 6.0),
                heading = 30.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(4.7, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(9.4, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(14.1, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(8.3, -3.4, 0.0),
                        heading = 90.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(8.3, -8.1, 0.0),
                        heading = 90.0,
                    },
                },
                spawners = {
                    {
                        offset = vector3(11.8, -8.8, 0.0),
                        heading = 90.0,
                        model = 'seashark',
                    },
                    {
                        offset = vector3(11.8, -6.3, 0.0),
                        heading = 90.0,
                        model = 'seashark',
                    },
                    {
                        offset = vector3(11.8, -4.2, 0.0),
                        heading = 90.0,
                        model = 'seashark',
                    },
                    {
                        offset = vector3(11.8, -2.0, 0.0),
                        heading = 90.0,
                        model = 'seashark',
                    },
                },
            },
            ['dinghys'] = {
                label = 'Dinghys',
                description = 'Floating dock resupplied with 2 dinghys',
                price = 110000,
            
                model = 'prop_byard_float_02',
                offset = vector3(50.0, -35.0, 6.0),
                heading = 30.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(4.7, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(9.4, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(14.1, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(8.3, -3.4, 0.0),
                        heading = 90.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(8.3, -8.1, 0.0),
                        heading = 90.0,
                    },
                },
                spawners = {
                    {
                        offset = vector3(5.5, -5.0, 0.0),
                        heading = 180.0,
                        model = 'dinghy2',
                    },
                    {
                        offset = vector3(13.8, -3.3, 0.0),
                        heading = 90.0,
                        model = 'dinghy',
                    },
                },
            },
            ['dock'] = {
                label = 'Floating dock (empty)',
                description = 'Floating dock',
                price = 20000,
            
                model = 'prop_byard_float_02',
                offset = vector3(50.0, -35.0, 6.0),
                heading = 30.0,
                clearSpace = true,
                clearRadius = 2.0,
                children = {
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(4.7, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(9.4, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(14.1, 0.0, 0.0),
                        heading = 0.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(8.3, -3.4, 0.0),
                        heading = 90.0,
                    },
                    {
                        model = 'prop_byard_float_02',
                        offset = vector3(8.3, -8.1, 0.0),
                        heading = 90.0,
                    },
                },
            },
        },
    },
    water_slot_b = {
        enabled = true,
        camera = {
            offset = vector3(84.0, -20.0, 17.0),
            rotation = vector3(-20.0 , 0.0, 90.0),
            fov = 90.0,
        },
        objects = {
            ['empty'] = {
                label = 'EMPTY',
                description = '',
                price = 1000,
            },
            ['longfin'] = {
                label = 'Longfin',
                description = 'Automatically restocked and serviced Longfin',
                price = 200000,
            
                model = 'prop_dock_ropetyre1',
                offset = vector3(67.0, -25.55, 9.35),
                heading = 206.0,
                spawners = {
                    {
                        offset = vector3(6.0, -3.5, -3.0),
                        heading = 270.0,
                        model = 'longfin',
                    },
                },
            },
            ['speeder'] = {
                label = 'Speeder',
                description = 'Automatically restocked and serviced Speeder',
                price = 130000,
            
                model = 'prop_dock_ropetyre1',
                offset = vector3(67.0, -25.55, 9.35),
                heading = 206.0,
                spawners = {
                    {
                        offset = vector3(4.0, -3.5, -3.0),
                        heading = 270.0,
                        model = 'speeder',
                    },
                },
            },
            ['marquis'] = {
                label = 'Marquis',
                description = 'Automatically restocked and serviced Marquis',
                price = 240000,
            
                model = 'prop_dock_ropetyre1',
                offset = vector3(67.0, -25.55, 9.35),
                heading = 206.0,
                spawners = {
                    {
                        offset = vector3(1.0, -4.0, -3.0),
                        heading = 270.0,
                        model = 'marquis',
                    },
                },
            },
            ['jetmax'] = {
                label = 'Jetmax',
                description = 'Automatically restocked and serviced Jetmax',
                price = 110000,
            
                model = 'prop_dock_ropetyre1',
                offset = vector3(67.0, -25.55, 9.35),
                heading = 206.0,
                spawners = {
                    {
                        offset = vector3(2.0, -3.0, -3.0),
                        heading = 270.0,
                        model = 'jetmax',
                    },
                },
            },
            ['toro'] = {
                label = 'Toro',
                description = 'Automatically restocked and serviced Toro',
                price = 180000,
            
                model = 'prop_dock_ropetyre1',
                offset = vector3(67.0, -25.55, 9.35),
                heading = 206.0,
                spawners = {
                    {
                        offset = vector3(2.0, -3.0, -3.0),
                        heading = 270.0,
                        model = 'toro',
                    },
                },
            },
            ['tropic_suntrap'] = {
                label = 'Tropic & Suntrap',
                description = 'Automatically restocked and serviced Tropic & Suntrap boats',
                price = 95000,
            
                model = 'prop_dock_ropetyre1',
                offset = vector3(67.0, -25.55, 9.35),
                heading = 206.0,
                spawners = {
                    {
                        offset = vector3(10.0, -3.0, -3.0),
                        heading = 270.0,
                        model = 'suntrap',
                    },
                    {
                        offset = vector3(-2.0, -3.0, -3.0),
                        heading = 270.0,
                        model = 'tropic',
                    },
                },
            },
        },
    },
}
