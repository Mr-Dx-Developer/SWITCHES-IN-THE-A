MANSION = {
    model = 'kq_island_mansion_shell',
    offset = vector3(14.5, 7.2, 10.88),
    heading = 110.0,
    clearSpace = true,
    clearRadius = 25.0,
    children = {
        {
            model = 'kq_island_mansion_sidewalk',
            offset = vector3(0.024, 0.043, 0.0003),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_interior',
            offset = vector3(-3.01, -0.01, 2.4165),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_windows',
            offset = vector3(0.0, 0.0, 0.0),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_doors',
            offset = vector3(0.0, 0.0, 0.05),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_living_1',
            offset = vector3(-3.727, -11.516, 2.0055),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_living_2',
            offset = vector3(-3.698, -11.446, 1.9851),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_dining_1',
            offset = vector3(-0.602, 0.003, 2.0),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_dining_2',
            offset = vector3(-0.48, 0.003, 2.01),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_dining_col',
            offset = vector3(-0.48, 0.003, 2.01),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_cor_1',
            offset = vector3(-2.092, 11.467, 1.4923),
            heading = 0.0,
        },
        {
            model = 'kq_island_mansion_cor_2',
            offset = vector3(-2.085, 11.44, 1.8327),
            heading = 0.0,
        },
    },
    doors = {
        -- living room doors
        {
            model = 'v_ilev_ra_door1_l',
            offset = vector3(-10.0, -16.206, 1.1472),
            heading = 210.0,
            closed = {
                offset = vector3(-9.9, -16.235, 1.1472),
                heading = 90.0,
            },
        },
        {
            model = 'v_ilev_ra_door1_r',
            offset = vector3(-10.0, -14.106, 1.1472),
            heading = -15.0,
            closed = {
                offset = vector3(-9.9, -14.04, 1.1472),
                heading = 90.0,
            },
        },
        
        {
            model = 'v_ilev_ra_door1_l',
            offset = vector3(2.139, -19.059, 1.15),
            heading = 180.0,
        },
        {
            model = 'v_ilev_ra_door1_r',
            offset = vector3(-0.061, -19.059, 1.15),
            heading = 180.0,
        },
        {
            model = 'v_ilev_ra_door1_l',
            offset = vector3(-0.06, -19.059, 1.15),
            heading = 180.0,
        },
        {
            model = 'v_ilev_ra_door1_r',
            offset = vector3(-2.26, -19.059, 1.15),
            heading = 180.0,
        },
        
        -- main doors
        {
            model = 'v_ilev_ra_door1_l',
            offset = vector3(-4.7, -6.67, 1.4472),
            heading = 167.0,
            closed = {
                offset = vector3(-4.7, -6.67, 1.4472),
                heading = 90.0,
            },
        },
        {
            model = 'v_ilev_ra_door1_r',
            offset = vector3(-4.7, -4.47, 1.4472),
            heading = 13.0,
            closed = {
                offset = vector3(-4.7, -4.47, 1.4472),
                heading = 90.0,
            },
        },
        
        -- secondary doors
        {
            model = 'v_ilev_ra_door1_l',
            offset = vector3(-4.7, 4.28, 1.1472),
            heading = 171.0,
            closed = {
                offset = vector3(-4.7, 4.28, 1.1472),
                heading = 90.0,
            },
        },
        {
            model = 'v_ilev_ra_door1_r',
            offset = vector3(-4.7, 6.48, 1.1472),
            heading = 8.0,
            closed = {
                offset = vector3(-4.7, 6.48, 1.1472),
                heading = 90.0,
            },
        },
        
        -- Dining room doors
        {
            model = 'v_ilev_ra_door1_r',
            offset = vector3(8.743, 3.281, 1.1533),
            heading = 90.0,
        },
        {
            model = 'v_ilev_ra_door1_l',
            offset = vector3(8.743, 1.081, 1.1533),
            heading = 90.0,
        },
        
        {
            model = 'v_ilev_ra_door1_r',
            offset = vector3(8.743, 1.081, 1.1533),
            heading = 230.0,
            closed = {
                offset = vector3(8.743, 1.081, 1.1533),
                heading = 90.0,
            },
        },
        {
            model = 'v_ilev_ra_door1_l',
            offset = vector3(8.743, -1.119, 1.1533),
            heading = -30.0,
            closed = {
                offset = vector3(8.743, -1.119, 1.1533),
                heading = 90.0,
            },
        },
        
        {
            model = 'v_ilev_ra_door1_r',
            offset = vector3(8.743, -1.119, 1.1533),
            heading = 90.0,
        },
        {
            model = 'v_ilev_ra_door1_l',
            offset = vector3(8.743, -3.319, 1.1533),
            heading = 90.0,
        },
    },
}
