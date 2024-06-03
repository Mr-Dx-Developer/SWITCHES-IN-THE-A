Config = {}

Config.debug = false


--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = false,
    -- Whether or not to use the new ESX export method
    useNewESXExport = false,
    
    moneyAccount = 'bank',
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = frue,
    useNewQBExport = true, -- Make sure to uncomment the old export inside fxmanifest.lua if you're still using it

    moneyAccount = 'bank',
}


Config.sql = {
    driver = 'oxmysql', -- oxmysql or ghmattimysql or mysql
    -- If you're using an older version of oxmysql set this to false
    newOxMysql = true,
}

-- Command used to open the management menu/ui
Config.isleCommand = 'isle'

Config.shopCommand = {
    enabled = true,
    command = 'isleShop'
}


Config.purchasing = {
    -- Physical shop players can visit in game
    enabled = true,
    location = vector3(-712.62, -1298.45, 5.1),
    --
    blip = {
        enabled = true,
        sprite = 304,
        color = 28,
        scale = 1.2,
    },

    -- This will enable an admin command /setIslandOwner [player id] [island name]
    adminCommand = true,

    -- This will enable a command /transferIsland [player id]
    -- This command will enable players to transfer their island to other players
    transferCommand = {
        enabled = true,
        adminOnly = false,
    }
}

Config.prices = {
    repaint = 10000
}

Config.blips = {
    unowned = {
        enabled = true,
        sprite = 304,
        color = 16,
        scale = 0.7,
    },
    owned = {
        enabled = true,
        sprite = 304,
        color = 81,
        scale = 1.2,
    }
}

-- The best values in my opinion are between 600 and 800
-- Minimum = 300
-- Maximum = 1000
Config.renderDistance = 700.0

-- Value between 1 and 25 (faster speeds look better but are more performance intensive)
Config.renderSpeed = 15

-- sizes: 'small', 'medium', 'big', 'huge', 'giant'
-- size 'insane' can also be used. When using this make sure to test the island very well.
Config.islands = {
    {
        label = 'Isla de la Luna',
        name = 'isla_de_la_luna',
        coords = vector3(-4200.0, -1000.0, 0.0),
        coast = 'WEST COAST',
        seed = 312334,
        size = 'small',
        initialPrice = 2000000,
        description = 'Isla de la Luna is a small, private island located near the west coast of Los Santos. It is a perfect getaway for those seeking privacy and tranquility. With its stunning beaches, turquoise waters, and lush tropical vegetation, this island is a true paradise. The island\'s name comes from the full moon that shines bright over the island, creating a romantic and magical atmosphere. Don\'t miss this chance to own a piece of this enchanting place.'
    },
    {
        label = 'Isla del Encanto',
        name = 'isla_del_encanto',
        coords = vector3(-4100.0, -2200.0, 0.0),
        coast = 'WEST COAST',
        seed = 500,
        size = 'medium',
        initialPrice = 2800000,
        description = 'Isla de encanto is a medium, private island located near the west coast of Los Santos. It is a tropical paradise, with crystal clear waters and lush vegetation.<br><br>Isla de encanto is being offered for sale at a price of $2,800,000. This is a unique opportunity to own a piece of paradise, and it is sure to be a wonderful investment for those looking to escape the hustle and bustle of city life. So, if you\'re interested in owning your own private island, Isla de encanto may be the perfect opportunity for you.'
    },
    {
        label = 'Isla de la Magia',
        name = 'isla_de_la_magia',
        coords = vector3(-3200.0, -1400.0, 0.0),
        coast = 'WEST COAST',
        seed = 1000,
        size = 'big',
        initialPrice = 3700000,
        description = 'Isla de la Magia is a big, private island located near the west coast of Los Santos. It is a tropical paradise, with crystal clear waters and lush vegetation.<br><br>Isla de la Magia is being offered for sale at a price of $3,700,000. This is a unique opportunity to own a piece of paradise, and it is sure to be a wonderful investment for those looking to escape the hustle and bustle of city life. So, if you\'re interested in owning your own private island, Isla de la Magia may be the perfect opportunity for you.'
    },
    {
        label = 'Isla de la Alma',
        name = 'isla_de_la_alma',
        coords = vector3(-5500.0, -800.0, 0.0),
        coast = 'WEST COAST',
        seed = 142515,
        size = 'huge',
        initialPrice = 5600000,
        description = 'Isla de la Alma is a huge, private island located near the west coast of Los Santos. This island is a true gem with its turquoise waters, coral reefs, and abundant marine life. With its vast open spaces and secluded beaches, Isla de la Alma is a perfect escape from the hustle and bustle of city life. The island\'s name comes from the feeling of peace and calm that it instills in its visitors. With its stunning natural beauty and peaceful surroundings, Isla de la Alma is an island paradise like no other.'
    },
    {
        label = 'Isla del toro',
        name = 'isla_del_toro',
        coords = vector3(-6600.0, 1300.0, 0.0),
        coast = 'WEST COAST',
        seed = 312312,
        size = 'big',
        initialPrice = 3400000,
        description = 'Isla del toro is a big, private island located near the west coast of Los Santos. It is a tropical paradise, with crystal clear waters and lush vegetation.<br><br>Isla del toro is being offered for sale at a price of $3,400,000. This is a unique opportunity to own a piece of paradise, and it is sure to be a wonderful investment for those looking to escape the hustle and bustle of city life. So, if you\'re interested in owning your own private island, Isla del toro may be the perfect opportunity for you.'
    },
}


-- https://docs.fivem.net/docs/game-references/controls/
-- Use the input index for the "input" value
Config.keybinds = {
    interact = {
        label = 'E',
        input = 38,
    },
    pickup = {
        label = 'E',
        name = 'INPUT_PICKUP',
        input = 38,
        duration = 1000,
    },
    place = {
        label = 'E',
        name = 'INPUT_PICKUP',
        input = 38,
    },
    cancelPlacing = {
        label = 'Backspace',
        name = 'INPUT_CELLPHONE_CANCEL',
        input = 177,
    },
    exit = {
        label = 'Escape',
        name = 'INPUT_CELLPHONE_CANCEL',
        input = 177,
    },
    arrowUp = {
        label = 'Arrow up',
        name = 'INPUT_CELLPHONE_UP',
        input = 172,
    },
    arrowDown = {
        label = 'Arrow down',
        name = 'INPUT_CELLPHONE_DOWN',
        input = 173,
    },
    upAlternative = {
        label = 'Scroll up',
        name = 'INPUT_VEH_CINEMATIC_UP_ONLY',
        input = 96,
    },
    downAlternative = {
        label = 'Scroll down',
        name = 'INPUT_VEH_CINEMATIC_DOWN_ONLY',
        input = 97,
    },
    confirm = {
        label = 'Enter',
        name = 'INPUT_FRONTEND_ACCEPT',
        input = 201,
    },
}


--------------------------------
---------- FURNITURE  ----------
--------------------------------

-- Percentage of how much money players should get back when removing furniture from their island
Config.furnitureRemovalReimbursement = 75

-- The maximum amount of furniture/props per island
-- I do not recommend going above 200
Config.maxFurniturePerIsland = 100

-- All possible furniture options
Config.furniture = {
    -- Tables
    ['apa_mp_h_tab_coffee_08'] = {
        name = 'Coffee table 1',
        model = 'apa_mp_h_tab_coffee_08',
        image = 'apa_mp_h_tab_coffee_08.jpg',
        price = 400,
    },
    ['apa_mp_h_tab_coffee_07'] = {
        name = 'Coffee table 2',
        model = 'apa_mp_h_tab_coffee_07',
        image = 'apa_mp_h_tab_coffee_07.jpg',
        price = 400,
    },
    ['ex_mp_h_tab_coffee_05'] = {
        name = 'Coffee table 3',
        model = 'ex_mp_h_tab_coffee_05',
        image = 'ex_mp_h_tab_coffee_05.jpg',
        price = 400,
    },
    ['hei_heist_tab_coffee_06'] = {
        name = 'Coffee table 4',
        model = 'hei_heist_tab_coffee_06',
        image = 'hei_heist_tab_coffee_06.jpg',
        price = 400,
    },
    ['apa_mp_h_din_table_06'] = {
        name = 'Cheap table',
        model = 'apa_mp_h_din_table_06',
        image = 'apa_mp_h_din_table_06.jpg',
        price = 300,
    },
    ['ex_mp_h_din_table_05'] = {
        name = 'Wooden table',
        model = 'ex_mp_h_din_table_05',
        image = 'ex_mp_h_din_table_05.jpg',
        price = 700,
    },
    ['ex_prop_ex_console_table_01'] = {
        name = 'Small tall table',
        model = 'ex_prop_ex_console_table_01',
        image = 'ex_prop_ex_console_table_01.jpg',
        price = 400,
    },
    ['hei_prop_yah_table_03'] = {
        name = 'Outdoor table',
        model = 'hei_prop_yah_table_03',
        image = 'hei_prop_yah_table_03.jpg',
        price = 600,
    },
    ['hei_prop_yah_table_01'] = {
        name = 'Tiny outdoor table',
        model = 'hei_prop_yah_table_01',
        image = 'hei_prop_yah_table_01.jpg',
        price = 150,
    },
    ['v_ret_fh_kitchtable'] = {
        name = 'Cooking table',
        model = 'v_ret_fh_kitchtable',
        image = 'v_ret_fh_kitchtable.jpg',
        price = 1000,
    },
    ['prop_table_02'] = {
        name = 'Round wooden table',
        model = 'prop_table_02',
        image = 'prop_table_02.jpg',
        price = 700,
    },
    ['prop_table_04'] = {
        name = 'Wooden table',
        model = 'prop_table_04',
        image = 'prop_table_04.jpg',
        price = 700,
    },
    ['prop_table_05'] = {
        name = 'Woven table',
        model = 'prop_table_05',
        image = 'prop_table_05.jpg',
        price = 600,
    },
    ['apa_mp_h_din_table_01'] = {
        name = 'Glass table',
        model = 'apa_mp_h_din_table_01',
        image = 'apa_mp_h_din_table_01.jpg',
        price = 1200,
    },
    ['apa_mp_h_tab_sidelrg_01'] = {
        name = 'Glass coffee table',
        model = 'apa_mp_h_tab_sidelrg_01',
        image = 'apa_mp_h_tab_sidelrg_01.jpg',
        price = 500,
    },
    ['hei_heist_din_table_06'] = {
        name = 'Large white dining set',
        model = 'hei_heist_din_table_06',
        image = 'hei_heist_din_table_06.jpg',
        price = 2500,
    },
    ['hei_heist_din_table_06'] = {
        name = 'Large white dining set',
        model = 'hei_heist_din_table_06',
        image = 'hei_heist_din_table_06.jpg',
        price = 2500,
    },
    ['v_corp_officedesk_5'] = {
        name = 'Office desk',
        model = 'v_corp_officedesk_5',
        image = 'v_corp_officedesk_5.jpg',
        price = 1000,
    },
    ['v_ind_dc_desk03'] = {
        name = 'Wooden desk',
        model = 'v_ind_dc_desk03',
        image = 'v_ind_dc_desk03.jpg',
        price = 750,
    },
    ['v_med_p_desk'] = {
        name = 'Wooden desk',
        model = 'v_med_p_desk',
        image = 'v_med_p_desk.jpg',
        price = 750,
    },
    ['v_res_d_smallsidetable'] = {
        name = 'Wooden side table',
        model = 'v_res_d_smallsidetable',
        image = 'v_res_d_smallsidetable.jpg',
        price = 300,
    },
    ['v_res_d_smv_res_tre_bedsidetableallsidetable'] = {
        name = 'Wooden side table',
        model = 'v_res_tre_bedsidetable',
        image = 'v_res_tre_bedsidetable.jpg',
        price = 300,
    },

    -- Chairs
    ['apa_mp_h_din_chair_04'] = {
        name = 'White chair',
        model = 'apa_mp_h_din_chair_04',
        image = 'apa_mp_h_din_chair_04.jpg',
        price = 200,
    },
    ['apa_mp_h_din_chair_12'] = {
        name = 'Wooden chair',
        model = 'apa_mp_h_din_chair_12',
        image = 'apa_mp_h_din_chair_12.jpg',
        price = 300,
    },
    ['apa_mp_h_stn_chairarm_02'] = {
        name = 'Gray Armchair',
        model = 'apa_mp_h_stn_chairarm_02',
        image = 'apa_mp_h_stn_chairarm_02.jpg',
        price = 500,
    },
    ['apa_mp_h_stn_chairarm_23'] = {
        name = 'Magenta Armchair',
        model = 'apa_mp_h_stn_chairarm_23',
        image = 'apa_mp_h_stn_chairarm_23.jpg',
        price = 500,
    },
    ['apa_mp_h_stn_chairstrip_05'] = {
        name = 'White Armchair',
        model = 'apa_mp_h_stn_chairstrip_05',
        image = 'apa_mp_h_stn_chairstrip_05.jpg',
        price = 500,
    },
    ['bkr_prop_biker_boardchair01'] = {
        name = 'Desk chair',
        model = 'bkr_prop_biker_boardchair01',
        image = 'bkr_prop_biker_boardchair01.jpg',
        price = 400,
    },
    ['hei_heist_din_chair_05'] = {
        name = 'Simple chair',
        model = 'hei_heist_din_chair_05',
        image = 'hei_heist_din_chair_05.jpg',
        price = 150,
    },
    ['p_yacht_chair_01_s'] = {
        name = 'Outdoors chair',
        model = 'p_yacht_chair_01_s',
        image = 'p_yacht_chair_01_s.jpg',
        price = 250,
    },
    ['v_res_m_l_chair1'] = {
        name = 'Vintage chair',
        model = 'v_res_m_l_chair1',
        image = 'v_res_m_l_chair1.jpg',
        price = 750,
    },
    ['v_res_tre_stool'] = {
        name = 'Stool',
        model = 'v_res_tre_stool',
        image = 'v_res_tre_stool.jpg',
        price = 150,
    },
    ['prop_off_chair_04b'] = {
        name = 'Office chair',
        model = 'prop_off_chair_04b',
        image = 'prop_off_chair_04b.jpg',
        price = 300,
    },
    ['prop_table_03_chr'] = {
        name = 'Plastic chair',
        model = 'prop_table_03_chr',
        image = 'prop_table_03_chr.jpg',
        price = 200,
    },
    ['apa_mp_h_din_stool_04'] = {
        name = 'White stool',
        model = 'apa_mp_h_din_stool_04',
        image = 'apa_mp_h_din_stool_04.jpg',
        price = 300,
    },

    -- Sofas
    ['apa_mp_h_stn_sofa2seat_02'] = {
        name = 'Small sofa',
        model = 'apa_mp_h_stn_sofa2seat_02',
        image = 'apa_mp_h_stn_sofa2seat_02.jpg',
        price = 1700,
    },
    ['apa_mp_h_stn_sofacorn_01'] = {
        name = 'Big gray sofa',
        model = 'apa_mp_h_stn_sofacorn_01',
        image = 'apa_mp_h_stn_sofacorn_01.jpg',
        price = 3000,
    },
    ['apa_mp_h_stn_sofacorn_09'] = {
        name = 'Big black sofa',
        model = 'apa_mp_h_stn_sofacorn_09',
        image = 'apa_mp_h_stn_sofacorn_09.jpg',
        price = 3000,
    },
    ['apa_mp_h_stn_sofacorn_10'] = {
        name = 'Big white sofa',
        model = 'apa_mp_h_stn_sofacorn_10',
        image = 'apa_mp_h_stn_sofacorn_10.jpg',
        price = 3000,
    },
    ['apa_mp_h_yacht_sofa_02'] = {
        name = 'Small brown sofa',
        model = 'apa_mp_h_yacht_sofa_02',
        image = 'apa_mp_h_yacht_sofa_02.jpg',
        price = 1800,
    },
    ['v_ilev_m_sofa'] = {
        name = 'White sofa',
        model = 'v_ilev_m_sofa',
        image = 'v_ilev_m_sofa.jpg',
        price = 2500,
    },
    ['v_res_tre_sofa'] = {
        name = 'Small blue sofa',
        model = 'v_res_tre_sofa',
        image = 'v_res_tre_sofa.jpg',
        price = 1500,
    },
    ['prop_couch_lg_08'] = {
        name = 'Brown sofa',
        model = 'prop_couch_lg_08',
        image = 'prop_couch_lg_08.jpg',
        price = 2500,
    },
    ['apa_mp_h_stn_sofacorn_06'] = {
        name = 'Big green sofa',
        model = 'apa_mp_h_stn_sofacorn_06',
        image = 'apa_mp_h_stn_sofacorn_06.jpg',
        price = 3000,
    },
    ['ex_mp_h_off_sofa_02'] = {
        name = 'Black sofa',
        model = 'ex_mp_h_off_sofa_02',
        image = 'ex_mp_h_off_sofa_02.jpg',
        price = 2000,
    },

    -- Rugs
    ['apa_mp_h_acc_rugwooll_03'] = {
        name = 'White rug',
        model = 'apa_mp_h_acc_rugwooll_03',
        image = 'apa_mp_h_acc_rugwooll_03.jpg',
        price = 1000,
    },
    ['apa_mp_h_acc_rugwoolm_01'] = {
        name = 'Design rug 1',
        model = 'apa_mp_h_acc_rugwoolm_01',
        image = 'apa_mp_h_acc_rugwoolm_01.jpg',
        price = 1200,
    },
    ['apa_mp_h_acc_rugwoolm_02'] = {
        name = 'Design rug 2',
        model = 'apa_mp_h_acc_rugwoolm_02',
        image = 'apa_mp_h_acc_rugwoolm_02.jpg',
        price = 1200,
    },
    ['apa_mp_h_acc_rugwools_03'] = {
        name = 'Design rug 3',
        model = 'apa_mp_h_acc_rugwools_03',
        image = 'apa_mp_h_acc_rugwools_03.jpg',
        price = 1000,
    },
    ['hei_prop_heist_drug_tub_01'] = {
        name = 'Plastic container',
        model = 'hei_prop_heist_drug_tub_01',
        image = 'hei_prop_heist_drug_tub_01.jpg',
        price = 200,
    },

    -- Outdoor furniture
    ['prop_bbq_5'] = {
        name = 'BBQ Grill',
        model = 'prop_bbq_5',
        image = 'prop_bbq_5.jpg',
        price = 700,
    },
    ['prop_ch2_wdfence_01'] = {
        name = 'Huge wooden fence',
        model = 'prop_ch2_wdfence_01',
        image = 'prop_ch2_wdfence_01.jpg',
        price = 2000,
    },
    ['prop_hottub2'] = {
        name = 'Hottub',
        model = 'prop_hottub2',
        image = 'prop_hottub2.jpg',
        price = 2000,
    },
    ['prop_fnclink_02a_sdt'] = {
        name = 'Chainlink fence',
        model = 'prop_fnclink_02a_sdt',
        image = 'prop_fnclink_02a_sdt.jpg',
        price = 1000,
    },
    ['prop_fnclink_01a'] = {
        name = 'Short chainlink fence',
        model = 'prop_fnclink_01a',
        image = 'prop_fnclink_01a.jpg',
        price = 700,
    },
    ['prop_fnclog_01b'] = {
        name = 'Huge log fence',
        model = 'prop_fnclog_01b',
        image = 'prop_fnclog_01b.jpg',
        price = 2000,
    },
    ['prop_fncres_02c'] = {
        name = 'Spiked fence',
        model = 'prop_fncres_02c',
        image = 'prop_fncres_02c.jpg',
        price = 750,
    },
    ['prop_fncres_05b'] = {
        name = 'Picket fence',
        model = 'prop_fncres_05b',
        image = 'prop_fncres_05b.jpg',
        price = 600,
    },

    -- Lights
    ['apa_mp_h_floorlamp_a'] = {
        name = 'Floor lamp 1',
        model = 'apa_mp_h_floorlamp_a',
        image = 'apa_mp_h_floorlamp_a.jpg',
        price = 800,
    },
    ['apa_mp_h_floorlamp_c'] = {
        name = 'Floor lamp 2',
        model = 'apa_mp_h_floorlamp_c',
        image = 'apa_mp_h_floorlamp_c.jpg',
        price = 800,
    },
    ['apa_mp_h_lit_floorlamp_05'] = {
        name = 'Floor lamp 3',
        model = 'apa_mp_h_lit_floorlamp_05',
        image = 'apa_mp_h_lit_floorlamp_05.jpg',
        price = 900,
    },
    ['apa_mp_h_lit_floorlamp_10'] = {
        name = 'Fancy floor lamp 1',
        model = 'apa_mp_h_lit_floorlamp_10',
        image = 'apa_mp_h_lit_floorlamp_10.jpg',
        price = 1900,
    },
    ['apa_mp_h_lit_floorlamp_13'] = {
        name = 'Fancy floor lamp 2',
        model = 'apa_mp_h_lit_floorlamp_13',
        image = 'apa_mp_h_lit_floorlamp_13.jpg',
        price = 1900,
    },
    ['apa_mp_h_lit_lamptable_04'] = {
        name = 'Table lamp 1',
        model = 'apa_mp_h_lit_lamptable_04',
        image = 'apa_mp_h_lit_lamptable_04.jpg',
        price = 250,
    },
    ['apa_mp_h_lit_lamptable_09'] = {
        name = 'Table lamp 2',
        model = 'apa_mp_h_lit_lamptable_09',
        image = 'apa_mp_h_lit_lamptable_09.jpg',
        price = 250,
    },
    ['apa_mp_h_lit_lamptablenight_24'] = {
        name = 'Table lamp 3',
        model = 'apa_mp_h_lit_lamptablenight_24',
        image = 'apa_mp_h_lit_lamptablenight_24.jpg',
        price = 250,
    },

    -- Beds
    ['apa_mp_h_bed_double_08'] = {
        name = 'Bed 1',
        model = 'apa_mp_h_bed_double_08',
        image = 'apa_mp_h_bed_double_08.jpg',
        price = 2500,
    },
    ['apa_mp_h_bed_double_09'] = {
        name = 'Bed 2',
        model = 'apa_mp_h_bed_double_09',
        image = 'apa_mp_h_bed_double_09.jpg',
        price = 2500,
    },
    ['p_mbbed_s'] = {
        name = 'Vintage bed',
        model = 'p_mbbed_s',
        image = 'p_mbbed_s.jpg',
        price = 5500,
    },
    ['gr_prop_bunker_bed_01'] = {
        name = 'Small bed',
        model = 'gr_prop_bunker_bed_01',
        image = 'gr_prop_bunker_bed_01.jpg',
        price = 1700,
    },
    ['apa_mp_h_bed_wide_05'] = {
        name = 'Red bed',
        model = 'apa_mp_h_bed_wide_05',
        image = 'apa_mp_h_bed_wide_05.jpg',
        price = 2500,
    },
    ['apa_mp_h_yacht_bed_02'] = {
        name = 'Bed 3',
        model = 'apa_mp_h_yacht_bed_02',
        image = 'apa_mp_h_yacht_bed_02.jpg',
        price = 2500,
    },
    ['v_res_msonbed_s'] = {
        name = 'Leather bed',
        model = 'v_res_msonbed_s',
        image = 'v_res_msonbed_s.jpg',
        price = 3000,
    },
    ['p_lestersbed_s'] = {
        name = 'Wooden bed',
        model = 'p_lestersbed_s',
        image = 'p_lestersbed_s.jpg',
        price = 1750,
    },

    -- Plants / foliage
    ['apa_mp_h_acc_vase_flowers_01'] = {
        name = 'Flowers 1',
        model = 'apa_mp_h_acc_vase_flowers_01',
        image = 'apa_mp_h_acc_vase_flowers_01.jpg',
        price = 100,
    },
    ['apa_mp_h_acc_vase_flowers_02'] = {
        name = 'Flowers 2',
        model = 'apa_mp_h_acc_vase_flowers_02',
        image = 'apa_mp_h_acc_vase_flowers_02.jpg',
        price = 100,
    },
    ['hei_heist_acc_flowers_01'] = {
        name = 'Flowers 3',
        model = 'hei_heist_acc_flowers_01',
        image = 'hei_heist_acc_flowers_01.jpg',
        price = 100,
    },
    ['prop_xmas_tree_int'] = {
        name = 'Christmas tree',
        model = 'prop_xmas_tree_int',
        image = 'prop_xmas_tree_int.jpg',
        price = 500,
    },
    ['prop_veg_crop_03_pump'] = {
        name = 'Pumpkin',
        model = 'prop_veg_crop_03_pump',
        image = 'prop_veg_crop_03_pump.jpg',
        price = 100,
    },
    ['prop_veg_crop_tr_01'] = {
        name = 'Small palm tree',
        model = 'prop_veg_crop_tr_01',
        image = 'prop_veg_crop_tr_01.jpg',
        price = 400,
    },
    ['prop_veg_crop_02'] = {
        name = 'Tomato plant',
        model = 'prop_veg_crop_02',
        image = 'prop_veg_crop_02.jpg',
        price = 200,
    },
    ['prop_plant_int_01b'] = {
        name = 'Plant 1',
        model = 'prop_plant_int_01b',
        image = 'prop_plant_int_01b.jpg',
        price = 500,
    },
    ['prop_plant_int_03a'] = {
        name = 'Plant 2',
        model = 'prop_plant_int_03a',
        image = 'prop_plant_int_03a.jpg',
        price = 500,
    },
    ['prop_pot_plant_01d'] = {
        name = 'Plant 3',
        model = 'prop_pot_plant_01d',
        image = 'prop_pot_plant_01d.jpg',
        price = 500,
    },
    ['prop_pot_plant_01e'] = {
        name = 'Plant 4',
        model = 'prop_pot_plant_01e',
        image = 'prop_pot_plant_01e.jpg',
        price = 500,
    },
    ['p_int_jewel_plant_01'] = {
        name = 'Plant 5',
        model = 'p_int_jewel_plant_01',
        image = 'p_int_jewel_plant_01.jpg',
        price = 500,
    },
    ['p_int_jewel_plant_02'] = {
        name = 'Plant 6',
        model = 'p_int_jewel_plant_02',
        image = 'p_int_jewel_plant_02.jpg',
        price = 500,
    },
    ['prop_fbibombplant'] = {
        name = 'Plant 7',
        model = 'prop_fbibombplant',
        image = 'prop_fbibombplant.jpg',
        price = 500,
    },
    ['prop_fbibombplant'] = {
        name = 'Plant 7',
        model = 'prop_fbibombplant',
        image = 'prop_fbibombplant.jpg',
        price = 500,
    },
    ['prop_bush_ornament_01'] = {
        name = 'Octopus topiary',
        model = 'prop_bush_ornament_01',
        image = 'prop_bush_ornament_01.jpg',
        price = 750,
    },
    ['prop_bush_ornament_02'] = {
        name = 'Seahorse topiary',
        model = 'prop_bush_ornament_02',
        image = 'prop_bush_ornament_02.jpg',
        price = 750,
    },
    ['prop_bush_ornament_03'] = {
        name = 'Anchor topiary',
        model = 'prop_bush_ornament_03',
        image = 'prop_bush_ornament_03.jpg',
        price = 750,
    },

    -- Clutter
    ['prop_amb_beer_bottle'] = {
        name = 'Beer bottle',
        model = 'prop_amb_beer_bottle',
        image = 'prop_amb_beer_bottle.jpg',
        price = 50,
    },
    ['ng_proc_sodacup_01a'] = {
        name = 'Soda cup',
        model = 'ng_proc_sodacup_01a',
        image = 'ng_proc_sodacup_01a.jpg',
        price = 50,
    },
    ['v_res_mcofcupdirt'] = {
        name = 'Coffee cup',
        model = 'v_res_mcofcupdirt',
        image = 'v_res_mcofcupdirt.jpg',
        price = 50,
    },
    ['ng_proc_pizza01a'] = {
        name = 'Pizza box',
        model = 'ng_proc_pizza01a',
        image = 'ng_proc_pizza01a.jpg',
        price = 50,
    },
    ['v_res_tt_pizzaplate'] = {
        name = 'Pizza plate',
        model = 'v_res_tt_pizzaplate',
        image = 'v_res_tt_pizzaplate.jpg',
        price = 50,
    },
    ['v_ret_fh_plate1'] = {
        name = 'Empty plate',
        model = 'v_ret_fh_plate1',
        image = 'v_ret_fh_plate1.jpg',
        price = 50,
    },
    ['v_ret_247_bread1'] = {
        name = 'Bread',
        model = 'v_ret_247_bread1',
        image = 'v_ret_247_bread1.jpg',
        price = 50,
    },
    ['v_ret_fh_fry02'] = {
        name = 'Frying pan',
        model = 'v_ret_fh_fry02',
        image = 'v_ret_fh_fry02.jpg',
        price = 100,
    },
    ['prop_cs_burger_01'] = {
        name = 'Burger',
        model = 'prop_cs_burger_01',
        image = 'prop_cs_burger_01.jpg',
        price = 50,
    },
    ['prop_drink_whisky'] = {
        name = 'Whiskey glass',
        model = 'prop_drink_whisky',
        image = 'prop_drink_whisky.jpg',
        price = 50,
    },
    ['p_whiskey_bottle_s'] = {
        name = 'Whiskey bottle',
        model = 'p_whiskey_bottle_s',
        image = 'p_whiskey_bottle_s.jpg',
        price = 150,
    },
    ['prop_knife'] = {
        name = 'Knife',
        model = 'prop_knife',
        image = 'prop_knife.jpg',
        price = 100,
    },
    ['ng_proc_paper_news_globe'] = {
        name = 'Newspaper',
        model = 'ng_proc_paper_news_globe',
        image = 'ng_proc_paper_news_globe.jpg',
        price = 50,
    },
    ['prop_champset'] = {
        name = 'Champagne set',
        model = 'prop_champset',
        image = 'prop_champset.jpg',
        price = 500,
    },
    ['hei_prop_heist_box'] = {
        name = 'Cardboard box',
        model = 'hei_prop_heist_box',
        image = 'hei_prop_heist_box.jpg',
        price = 50,
    },
    ['hei_prop_hei_bust_01'] = {
        name = 'Statue',
        model = 'hei_prop_hei_bust_01',
        image = 'hei_prop_hei_bust_01.jpg',
        price = 20000,
    },
    ['apa_mp_h_acc_fruitbowl_02'] = {
        name = 'Fruit bowl',
        model = 'apa_mp_h_acc_fruitbowl_02',
        image = 'apa_mp_h_acc_fruitbowl_02.jpg',
        price = 50,
    },
    ['apa_mp_h_acc_fruitbowl_01'] = {
        name = 'Fruit bowl',
        model = 'apa_mp_h_acc_fruitbowl_01',
        image = 'apa_mp_h_acc_fruitbowl_01.jpg',
        price = 50,
    },
    ['bkr_prop_bkr_cashpile_01'] = {
        name = 'Small pile of cash',
        model = 'bkr_prop_bkr_cashpile_01',
        image = 'bkr_prop_bkr_cashpile_01.jpg',
        price = 10000,
    },
    ['bkr_prop_bkr_cashpile_06'] = {
        name = 'Large pile of cash',
        model = 'bkr_prop_bkr_cashpile_06',
        image = 'bkr_prop_bkr_cashpile_06.jpg',
        price = 50000,
    },
    ['bkr_prop_bkr_cash_roll_01'] = {
        name = 'Rolls of cash',
        model = 'bkr_prop_bkr_cash_roll_01',
        image = 'bkr_prop_bkr_cash_roll_01.jpg',
        price = 1500,
    },
    ['ex_mp_h_acc_candles_01'] = {
        name = 'Candles',
        model = 'ex_mp_h_acc_candles_01',
        image = 'ex_mp_h_acc_candles_01.jpg',
        price = 50,
    },
    ['ex_mp_h_acc_candles_02'] = {
        name = 'Candle sticks',
        model = 'ex_mp_h_acc_candles_02',
        image = 'ex_mp_h_acc_candles_02.jpg',
        price = 50,
    },
    ['ex_prop_tv_settop_remote'] = {
        name = 'TV remote',
        model = 'ex_prop_tv_settop_remote',
        image = 'ex_prop_tv_settop_remote.jpg',
        price = 50,
    },
    ['v_res_fa_cereal01'] = {
        name = 'Cereal box',
        model = 'v_res_fa_cereal01',
        image = 'v_res_fa_cereal01.jpg',
        price = 50,
    },
    ['v_res_mp_ashtrayb'] = {
        name = 'Ash tray',
        model = 'v_res_mp_ashtrayb',
        image = 'v_res_mp_ashtrayb.jpg',
        price = 50,
    },
    ['v_res_tissues'] = {
        name = 'Tissue box',
        model = 'v_res_tissues',
        image = 'v_res_tissues.jpg',
        price = 50,
    },

    -- Appliances
    ['apa_mp_h_acc_coffeemachine_01'] = {
        name = 'Coffee machine',
        model = 'apa_mp_h_acc_coffeemachine_01',
        image = 'apa_mp_h_acc_coffeemachine_01.jpg',
        price = 150,
    },
    ['des_tvsmash_start'] = {
        name = 'Big TV',
        model = 'des_tvsmash_start',
        image = 'des_tvsmash_start.jpg',
        price = 2500,
    },
    ['prop_trev_tv_01'] = {
        name = 'Small TV',
        model = 'prop_trev_tv_01',
        image = 'prop_trev_tv_01.jpg',
        price = 1500,
    },
    ['prop_tv_03'] = {
        name = 'Small TV',
        model = 'prop_tv_03',
        image = 'prop_tv_03.jpg',
        price = 1500,
    },
    ['prop_tv_flat_03b'] = {
        name = 'Small TV',
        model = 'prop_tv_flat_03b',
        image = 'prop_tv_flat_03b.jpg',
        price = 1500,
        wallPlaceable = true,
    },
    ['vw_prop_vw_cinema_tv_01'] = {
        name = 'Huge TV',
        model = 'vw_prop_vw_cinema_tv_01',
        image = 'vw_prop_vw_cinema_tv_01.jpg',
        price = 6000,
        wallPlaceable = true,
    },
    ['v_res_fh_towerfan'] = {
        name = 'Tower fan',
        model = 'v_res_fh_towerfan',
        image = 'v_res_fh_towerfan.jpg',
        price = 100,

    },


    -- Surfaces
    ['xm_prop_x17_tv_stand_01a'] = {
        name = 'TV Stand',
        model = 'xm_prop_x17_tv_stand_01a',
        image = 'xm_prop_x17_tv_stand_01a.jpg',
        price = 3000,
    },
    ['hei_prop_hei_lflts_02'] = {
        name = 'Investment books stand',
        model = 'hei_prop_hei_lflts_02',
        image = 'hei_prop_hei_lflts_02.jpg',
        price = 10000,
    },
    ['prop_wooden_barrel'] = {
        name = 'Wooden barrel',
        model = 'prop_wooden_barrel',
        image = 'prop_wooden_barrel.jpg',
        price = 1000,
    },
    ['xm_prop_base_staff_desk_01'] = {
        name = 'Hacker desk',
        model = 'xm_prop_base_staff_desk_01',
        image = 'xm_prop_base_staff_desk_01.jpg',
        price = 9000,
    },
    ['apa_mp_h_str_shelfwallm_01'] = {
        name = 'Block shelves',
        model = 'apa_mp_h_str_shelfwallm_01',
        image = 'apa_mp_h_str_shelfwallm_01.jpg',
        price = 1000,
    },
    ['apa_mp_h_str_sideboardl_11'] = {
        name = 'Wooden sideboard',
        model = 'apa_mp_h_str_sideboardl_11',
        image = 'apa_mp_h_str_sideboardl_11.jpg',
        price = 1000,
    },
    ['apa_mp_h_str_sideboardm_03'] = {
        name = 'White sideboard',
        model = 'apa_mp_h_str_sideboardm_03',
        image = 'apa_mp_h_str_sideboardm_03.jpg',
        price = 1000,
    },

    -- Storage
    ['hei_heist_bed_chestdrawer_04'] = {
        name = 'Wooden drawers',
        model = 'hei_heist_bed_chestdrawer_04',
        image = 'hei_heist_bed_chestdrawer_04.jpg',
        price = 2250,
    },
    ['prop_cabinet_01'] = {
        name = 'Filing cabinet',
        model = 'prop_cabinet_01',
        image = 'prop_cabinet_01.jpg',
        price = 450,
    },
    ['prop_cabinet_02b'] = {
        name = 'Filing cabinet',
        model = 'prop_cabinet_02b',
        image = 'prop_cabinet_02b.jpg',
        price = 450,
    },
    ['apa_mp_h_str_shelffloorm_02'] = {
        name = 'Wooden wardrobe',
        model = 'apa_mp_h_str_shelffloorm_02',
        image = 'apa_mp_h_str_shelffloorm_02.jpg',
        price = 2500,
    },

    -- Outdoor decoration
    ['prop_rock_1_e'] = {
        name = 'Big rock',
        model = 'prop_rock_1_e',
        image = 'prop_rock_1_e.jpg',
        price = 10000,
    },
    ['prop_rock_2_f'] = {
        name = 'Big rock 2',
        model = 'prop_rock_2_f',
        image = 'prop_rock_2_f.jpg',
        price = 10000,
    },
    ['prop_mb_sandblock_01'] = {
        name = 'Sandblock',
        model = 'prop_mb_sandblock_01',
        image = 'prop_mb_sandblock_01.jpg',
        price = 5000,
    },

    -- Wall decorations
    ['hei_heist_acc_artwallm_01'] = {
        name = 'White wall art',
        model = 'hei_heist_acc_artwallm_01',
        image = 'hei_heist_acc_artwallm_01.jpg',
        price = 800,
        wallPlaceable = true,
    },
    ['apa_mp_h_acc_artwalll_01'] = {
        name = 'Large red painting',
        model = 'apa_mp_h_acc_artwalll_01',
        image = 'apa_mp_h_acc_artwalll_01.jpg',
        price = 1000,
        wallPlaceable = true,
    },
    ['apa_p_h_acc_artwallm_04'] = {
        name = 'Striped painting',
        model = 'apa_p_h_acc_artwallm_04',
        image = 'apa_p_h_acc_artwallm_04.jpg',
        price = 500,
        wallPlaceable = true,
    },
    ['apa_p_h_acc_artwalll_01'] = {
        name = 'Large blue painting',
        model = 'apa_p_h_acc_artwalll_01',
        image = 'apa_p_h_acc_artwalll_01.jpg',
        price = 1000,
        wallPlaceable = true,
    },
    ['v_med_p_wallhead'] = {
        name = 'Mask wall decoration',
        model = 'v_med_p_wallhead',
        image = 'v_med_p_wallhead.jpg',
        price = 400,
        wallPlaceable = true,
    },
    ['ch_prop_ch_wallart_06a'] = {
        name = 'Poster 1',
        model = 'ch_prop_ch_wallart_06a',
        image = 'ch_prop_ch_wallart_06a.jpg',
        price = 500,
        wallPlaceable = true,
    },
    ['ch_prop_ch_wallart_07a'] = {
        name = 'Poster 2',
        model = 'ch_prop_ch_wallart_07a',
        image = 'ch_prop_ch_wallart_07a.jpg',
        price = 500,
        wallPlaceable = true,
    },
    ['ch_prop_ch_wallart_03a'] = {
        name = 'Poster 3',
        model = 'ch_prop_ch_wallart_03a',
        image = 'ch_prop_ch_wallart_03a.jpg',
        price = 500,
        wallPlaceable = true,
    },
    ['vw_prop_vw_wallart_01a'] = {
        name = 'Eggplant painting',
        model = 'vw_prop_vw_wallart_01a',
        image = 'vw_prop_vw_wallart_01a.jpg',
        price = 500,
        wallPlaceable = true,
    },
    ['vw_prop_vw_wallart_03a'] = {
        name = 'Peach painting',
        model = 'vw_prop_vw_wallart_03a',
        image = 'vw_prop_vw_wallart_03a.jpg',
        price = 500,
        wallPlaceable = true,
    },
    ['v_ret_gc_clock'] = {
        name = 'Wall clock',
        model = 'v_ret_gc_clock',
        image = 'v_ret_gc_clock.jpg',
        price = 50,
        wallPlaceable = true,
    },
    ['prop_game_clock_01'] = {
        name = 'Wall clock',
        model = 'prop_game_clock_01',
        image = 'prop_game_clock_01.jpg',
        price = 50,
        wallPlaceable = true,
    },

    -- Miscellaneous
    ['prop_coffin_01'] = {
        name = 'Coffin',
        model = 'prop_coffin_01',
        image = 'prop_coffin_01.jpg',
        price = 4000,
    },
    ['prop_cs_bin_02'] = {
        name = 'Bin',
        model = 'prop_cs_bin_02',
        image = 'prop_cs_bin_02.jpg',
        price = 100,
    },
    ['ex_office_swag_guns04'] = {
        name = 'Gun case',
        model = 'ex_office_swag_guns04',
        image = 'ex_office_swag_guns04.jpg',
        price = 50000,
    },
    ['hei_prop_heist_gold_bar'] = {
        name = 'Gold bar',
        model = 'hei_prop_heist_gold_bar',
        image = 'hei_prop_heist_gold_bar.jpg',
        price = 5000,
    },
    ['h4_prop_h4_gold_stack_01a'] = {
        name = 'Gold bar stack',
        model = 'h4_prop_h4_gold_stack_01a',
        image = 'h4_prop_h4_gold_stack_01a.jpg',
        price = 60000,
    },
    ['v_res_fa_magtidy'] = {
        name = 'Magazine holder',
        model = 'v_res_fa_magtidy',
        image = 'v_res_fa_magtidy.jpg',
        price = 100,
    },
    ['v_serv_waste_bin1'] = {
        name = 'Bin',
        model = 'v_serv_waste_bin1',
        image = 'v_serv_waste_bin1.jpg',
        price = 100,
    },
}