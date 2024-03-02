return {
    releasePos = vec4(1847.230469, 2587.085693, 45.672638, 269.0),
    outfitMenu = vec4(402.704010, -996.795166, -99.000252, 180.0),
    prisonYard = vec4(1717.125610, 2503.136230, 45.564896, 74.0),
    outfitCameraOffset = vector3(0.0, -8.0, 0.0),

    cameraProlog = {
        initCameraPosition = vector3(1748.674072, 2511.276611, 47.365631),
        initCameraRot = vector3(-2.981497, 0.06393559, 210.9220123291),
        initGameplayCamRot = vec3(-10.6386, -0, 210.9220123291),
        points = {
            {
                pos = vec3(1752.910767, 2503.992432, 45.565063),
                rot = vector3(-5.106454, 0.06342217, 210.87426757813),
                duration = 6000,
                text = '~w~Welcome to ~o~prison~w~.',
                textTimeout = 1500,
                textRenderTime = 5500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vec3(1762.252319, 2488.460938, 45.740753),
                rot = vector3(-5.106454, 0.06342217, 209.32168579102),
                duration = 5000,
                text = '~w~Propably here you can find your ~o~prison~w~ cell.',
                textTimeout = 1500,
                textRenderTime = 5500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vector3(1757.257690, 2482.726563, 46.740776),
                rot = vector3(-5.106454, 0.06342217, 117.61096191406),
                duration = 10000,
                text = '~w~You can do some ~o~jobs~w~ and ~o~reduce~w~ your jail time.',
                textTimeout = 7000,
                textRenderTime = 4500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vector3(1770.438965, 2490.531982, 46.740776),
                rot = vector3(-2.428856, 0.05924932, 308.94909667969),
                duration = 10000,
                text = '~w~Create your prisoner ~o~account~w~ at this Warden.',
                textTimeout = 7000,
                textRenderTime = 4000,
                options = {
                    fov = 90.0,
                    copyEffects = false,

                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vec3(1762.335083, 2487.831299, 45.740734),
                rot = vector3(-2.428856, 0.05924932,30.881422042847),
                duration = 8000,
                text = '~w~Lets take a look outside of ~o~prison~w~ yard.',
                textTimeout = 2500,
                textRenderTime = 5500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },
        
            {
                pos = vec3(1757.234009, 2496.407959, 45.735611),
                rot = vector3(-2.428856, 0.05924932, 30.331457138062),
                duration = 8000,
                text = '',
                textTimeout = 1500,
                textRenderTime = 5500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vec3(1752.832520, 2503.844971, 45.565018),
                rot = vector3(-2.428856, 0.05924932, 30.331457138062),
                duration = 5000,
                text = '',
                textTimeout = 1500,
                textRenderTime = 5500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vector3(1720.03, 2527.28, 47.56),
                rot = vector3(-5.106454, 0.06342217, 343.18),
                duration = 8000,
                text = '~w~There is some place to play ~o~basketball~w~',
                textTimeout = 9000 / 2,
                textRenderTime = 4500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },


            {
                pos = vector3(1643.2, 2511.05, 53.07),
                rot = vector3(-5.106454, 0.06342217, 5.35),
                duration = 10000,
                text = '~w~You can keep in form even in prison ~o~gym~w~',
                textTimeout = 6000,
                textRenderTime = 4500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    -- this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vector3(1630.04, 2548.59, 51.26),
                rot = vector3(-5.106454, 0.06342217, 232.75),
                duration = 4000,
                text = '',
                textTimeout = 4000,
                textRenderTime = 4500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vector3(1682.34, 2559.26, 45.1),
                rot = vector3(-5.106454, 0.06342217, 270.47),
                duration = 6000,
                text = '',
                textTimeout = 4000,
                textRenderTime = 4500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vector3(1747.37, 2545.54, 45.57),
                rot = vector3(-5.106454, 0.06342217, 348.46),
                duration = 7000,
                text = '',
                textTimeout = 4000,
                textRenderTime = 4500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {
                pos = vector3(1768.131958, 2552.756104, 46.770012),
                rot = vector3(-2.981497, 0.06393559, 267.0),
                duration = 7000,
                text = '~w~Are you hungry? There you can get ~o~free food~w~ package.',
                textTimeout = 2000,
                textRenderTime = 4000,
                options = {
                    fov = 90.0,
                    copyEffects = false,

                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },
        }
    },

    spawnPoints = {
        {
            heading = 32.383178710938,
            coords = vec3(1777.583008, 2483.860107, 45.741001),
        },

        {
            heading = 31.397626876831,
            coords = vec3(1774.631958, 2481.995117, 45.743000),
        },

        {
            heading = 48.096374511719,
            coords = vec3(1770.603027, 2479.503906, 45.742001),
        },

        {
            heading = 31.102121353149,
            coords = vec3(1767.026978, 2477.335938, 45.742001),
        },

        {
            heading = 30.680347442627,
            coords = vec3(1765.015991, 2476.199951, 45.742001),
        },

        {
            heading = 31.380777359009,
            coords = vec3(1761.561035, 2474.208984, 45.741001),
        },

        {
            heading = 216.71479797363,
            coords = vec3(1748.822998, 2489.238037, 45.741001),
        },

        {
            heading = 212.52207946777,
            coords = vec3(1752.645020, 2491.656982, 45.740002),
        },

        {
            heading = 209.94357299805,
            coords = vec3(1760.629028, 2496.946045, 45.720001),
        },

        {
            heading = 211.04046630859,
            coords = vec3(1764.765991, 2499.297119, 45.720001),
        },

        {
            heading = 227.72378540039,
            coords = vec3(1767.300049, 2500.971924, 45.731998),
        },

        {
            heading = 213.37281799316,
            coords = vec3(1768.444946, 2499.301025, 49.693001),
        },

        {
            heading = 210.77520751953,
            coords = vec3(1765.076050, 2497.690918, 49.693001),
        },

        {
            heading = 210.50360107422,
            coords = vec3(1758.979980, 2494.248047, 49.693001),
        },

        {
            heading = 212.09255981445,
            coords = vec3(1755.400024, 2492.278076, 49.693001),
        },

        {
            heading = 213.11320495605,
            coords = vec3(1753.602051, 2491.162109, 49.693001),
        },

        {
            heading = 28.209260940552,
            coords = vec3(1757.185059, 2473.611084, 49.707001),
        },

        {
            heading = 28.683288574219,
            coords = vec3(1760.277954, 2475.308105, 49.705002),
        },

        {
            heading = 25.495679855347,
            coords = vec3(1763.718994, 2477.172119, 49.702999),
        },

        {
            heading = 24.952131271362,
            coords = vec3(1767.329956, 2478.889893, 49.700001),
        },

        {
            heading = 28.106698989868,
            coords = vec3(1770.323975, 2480.138916, 49.706001),
        },

        {
            heading = 29.252635955811,
            coords = vec3(1773.612061, 2481.995117, 49.698002),
        },

        {
            heading = 28.820774078369,
            coords = vec3(1777.568970, 2484.204102, 49.698002),
        },
    },


    CW = {
        {
            idx = 1,
            name = l('job_community_service_label'),
            desc = l('job_community_service_desc'),
        },
    },


    Guards = {
        {
            type = 'sniper',
            recording = 'TowerGuard01',
            model = 's_m_m_security_01',
            pos = vec3(1827.69, 2474.181, 61.7202),
            heading = 0
        },

        {
            type = 'sniper',
            recording = 'TowerGuard02',
            model = 's_m_m_security_01',
            pos = vec3(1764.729, 2409.139, 61.7533),
            heading = 0
        },


        {
            type = 'sniper',
            recording = 'TowerGuard03',
            model = 's_m_m_security_01',
            pos = vec3(1658.829, 2390.888, 61.7462),
            heading = 0
        },

        {
            type = 'sniper',
            recording = 'TowerGuard04',
            model = 's_m_m_security_01',
            pos = vec3(1537.28, 2468.338, 61.7497),
            heading = 0
        },

        {
            type = 'sniper',
            recording = 'TowerGuard05',
            model = 's_m_m_security_01',
            pos = vec3(1535.098, 2581.919, 61.7312),
            heading = 0
        },

        {
            type = 'sniper',
            recording = 'TowerGuard06',
            model = 's_m_m_security_01',
            pos = vec3(1566.921, 2682.525, 61.7716),
            heading = 0
        },

        {
            type = 'sniper',
            recording = 'TowerGuard07',
            model = 's_m_m_security_01',
            pos = vec3(1648.104, 2761.528, 61.9103),
            heading = 0
        },

        {
            type = 'sniper',
            recording = 'TowerGuard08',
            model = 's_m_m_security_01',
            pos = vec3(1774.523, 2766.559, 61.9143),
            heading = 0
        },


        {
            type = 'sniper',
            recording = 'TowerGuard10',
            model = 's_m_m_security_01',
            pos = vec3(1824.288, 2625.042, 61.9749),
            heading = 0
        },

        {
            type = 'guard',
            recording = 'PatrolGuard02',
            model = 's_m_m_prisguard_01',
            pos = vec3(1768.628, 2538.97, 44.4054 + 1),
            heading = 0
        },
        {
            type = 'guard',
            recording = 'PatrolGuard03',
            model = 's_m_m_prisguard_01',
            pos = vec3(1633.613, 2498.849, 44.4054 + 1),
            heading = 0,
        },
        {
            type = 'guard',
            recording = 'PatrolGuard04',
            model = 's_m_m_prisguard_01',
            pos = vec3(1622.61, 2555.683, 44.4054 + 1),
            heading = 198.4323
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_GUARD_STAND',
            model = 's_m_y_prisoner_01',
            pos = vec3(1721.20032, 2565.21313, 44.56519),
            heading = 131.37
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_GUARD_STAND',
            model = 's_m_y_prisoner_01',
            pos = vec3(1698.739868, 2551.713135, 45.564869),
            heading = 268.2
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_GUARD_STAND',
            model = 's_m_y_prisoner_01',
            pos = vec3(1711.777954, 2566.188477, 45.564823),
            heading = 176.5
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_GUARD_STAND',
            model = 's_m_y_prismuscl_01',
            pos = vec3(1682.503784, 2476.153809, 45.825306),
            heading = 313.72
        },


        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_GUARD_STAND',
            model = 's_m_y_prismuscl_01',
            pos = vec3(1679.608154, 2530.889404, 45.564835),
            heading = 317.92
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_GUARD_STAND',
            model = 's_m_y_prismuscl_01',
            pos = vector3(1705.82, 2522.3, 45.56),
            heading = 17.67
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_AA_SMOKE',
            model = 's_m_y_prismuscl_01',
            pos = vector3(1731.69, 2508.92, 45.56),
            heading = 346.03
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_GUARD_STAND',
            model = 's_m_y_prisoner_01',
            pos = vector3(1742.329468, 2560.429932, 45.565056),
            heading = 187.84
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_JOG',
            model = 's_m_y_prismuscl_01',
            pos = vec3(1690.835083, 2499.039063, 45.564823),
            heading = 40.96
        },

        {
            type = 'inmate',
            anim = {
                animDict = '',
                animName = '',
            },
            scenario = 'WORLD_HUMAN_PUSH_UPS',
            model = 's_m_y_prismuscl_01',
            pos = vec3(1690.835083, 2499.039063, 45.564823),
            heading = 40.96
        },
    },

    jobs = {
        {
            jobId = 1,
            activeLimit = 4,
            reward = {
                {
                    type = 'reduceSentence',
                    amount = 10,
                },
                {
                    type = 'credits',
                    amount = 90,
                }
            },
            checkDist = 800,
            requiredDelivery = 5,
            text = l('JOB_CLEAN_YARD_MISSION_TEXT'),
            cooldown = 2 * 30 * 1000,
            name = l('job_cleaning_yard_label'),
            type = 'clean_yard',
            drawmarker = {
                opacity = 100,
            },
            points = {
                {
                    coords = vec(1758.165649, 2556.965088, 44.772537)
                },
                {
                    coords = vec(1754.620239, 2565.346924, 45.558464)
                },
                {
                    coords = vec3(1760.210571, 2565.096436, 45.564991)
                },
                {
                    coords = vec3(1729.313843, 2563.025146, 45.564838)
                },
                {
                    coords = vec3(1683.992310, 2506.005371, 45.558598)
                }
            }
        },
        {
            jobId = 2,
            activeLimit = 2,
            reward = {
                {
                    type = 'reduceSentence',
                    amount = 10,
                },
                {
                    type = 'credits',
                    amount = 90,
                }
            },
            checkDist = 500, -- If above awaiting 1,5 sec for cycle
            requiredDelivery = 5,
            text = l('JOB_ELECTRICIAN_MISSION_TEXT'),
            cooldown = 1 * 30 * 1000,
            name = l('job_electrician_label'),
            type = 'fix_electric',
            drawmarker = {
                opacity = 100,
            },
            points = {
                {
                    coords = vec(1629.751221, 2564.401611, 45.564861)
                },
                {
                    coords = vec(1652.276123, 2564.336182, 45.564835)
                },
                {
                    coords = vec(1737.204224, 2505.553467, 45.564957)
                },
                {
                    coords = vec(1699.859375, 2474.301270, 45.562428)
                },
                {
                    coords = vec(1623.018188, 2508.085938, 45.561508),
                }
            }
        },
    },

    Canteen = {
        {
            label = 'Sludgie',
            cost = 50,
            itemName = 'sludgie'
        },
        {
            label = 'Sprunk',
            cost = 30,
            itemName = 'sprunk'
        },
        {
            label = 'Ecola light',
            cost = 20,
            itemName = 'ecola_light'
        },
        {
            label = 'Ecola',
            cost = 10,
            itemName = 'ecola'
        },
        {
            label = 'Coffee',
            cost = 40,
            itemName = 'coffee'
        }
    },

    interaction = {
        {
            npc = {
                model = 's_m_y_prismuscl_01',
                heading = 180.0,
                anim = {
                    type = 'scenario',
                    name = 'PROP_HUMAN_SEAT_BENCH',
                    dict = nil,
                },
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            helpers = {
                dist = Prison.Target.EyeDist
            },
            coords = vec3(1707.786377, 2552.555908, 46.007427 - 1),
            type = 'dealer',
            name = 'What i can do for you?',
            trade = {
                {
                    label = 'Knife',
                    transaction = {
                        takeCount = 10,
                        takeItem = Prison.ECONOMY_ITEM,
                        giveItem = 'WEAPON_KNIFE',
                        giveCount = 1,
                    },
                },
                {
                    label = 'Taco',
                    transaction = {
                        takeCount = 3,
                        takeItem = Prison.ECONOMY_ITEM,
                        giveItem = 'taco',
                        giveCount = 1,
                    },
                }
            },
            options = {},
        },
        {
            npc = {
                model = 's_m_y_prismuscl_01',
                heading = 190.0,
                anim = {
                    type = 'scenario',
                    name = 'WORLD_HUMAN_AA_SMOKE',
                    dict = nil,
                },
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            helpers = {
                dist = Prison.Target.EyeDist
            },
            coords = vec3(1656.264038, 2547.330811, 45.564854),
            type = 'dealer',
            name = 'What i can do for you?',
            trade = {
                {
                    label = 'Knife',
                    transaction = {
                        takeCount = 10,
                        takeItem = Prison.ECONOMY_ITEM,
                        giveItem = 'WEAPON_KNIFE',
                        giveCount = 1,
                    },
                },
                {
                    label = 'Taco',
                    transaction = {
                        takeCount = 3,
                        takeItem = Prison.ECONOMY_ITEM,
                        giveItem = 'taco',
                        giveCount = 1,
                    },
                }
            },
            options = {},
        },
        {
            npc = {
                model = 's_m_y_prismuscl_01',
                heading = 100.0,
                anim = {
                    type = 'scenario',
                    name = 'PROP_HUMAN_SEAT_BENCH',
                    dict = nil,
                },
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            helpers = {
                dist = Prison.Target.EyeDist
            },
            coords = vec3(1715.009644, 2586.764404, 46.046280 - 1),
            type = 'dealer',
            name = 'What i can do for you?',
            trade = {
                {
                    label = 'Knife',
                    transaction = {
                        takeCount = 10,
                        takeItem = Prison.ECONOMY_ITEM,
                        giveItem = 'WEAPON_KNIFE',
                        giveCount = 1,
                    },
                },
                {
                    label = 'Taco',
                    transaction = {
                        takeCount = 3,
                        takeItem = Prison.ECONOMY_ITEM,
                        giveItem = 'taco',
                        giveCount = 1,
                    },
                }
            },
            options = {},
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = 'Prisoners Canteen',
                sprite = 214,
                scale = 0.6,
                color = 0,
            },
            npc = {
                model = 's_m_m_prisguard_01',
                heading = 184.25,
            },
            helpers = {
                dist = Prison.Target.EyeDist
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1779.734131, 2560.682373, 45.673138),
            type = 'canteen',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = l('PRISONER_LOBBY_LABEL'),
                sprite = 76,
                scale = 0.6,
                color = 0,
            },
            npc = {
                model = 's_m_m_prisguard_01',
                heading = 120.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1773.857056, 2492.814697, 45.740738),
            type = 'account',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = l('PRISONER_LOBBY_LABEL'),
                sprite = 280,
                scale = 1.0,
                color = 0,
            },
            npc = {
                model = 's_m_m_prisguard_01',
                heading = 360.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1840.363159, 2577.717041, 46.014305),
            type = 'lobby',
            dist = 2.0,
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = 'Prisoners Jobs',
                sprite = 402,
                scale = 0.9,
                color = 0,
            },
            npc = {
                model = 's_m_m_prisguard_01',
                heading = -60.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1752.017090, 2480.448975, 45.740738),
            type = 'jobs',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            booth = {
                number = 1000,
            },
            coords = vec3(1827.729248, 2589.635742, 48.014324),
            type = 'booth',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            booth = {
                number = 1001,
            },
            coords = vec3(1827.730103, 2587.748047, 48.014324),
            type = 'booth',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            booth = {
                number = 1002,
            },
            helpers = {
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 3.0,
                dist = 1.0,
            },
            coords = vec3(1827.680664, 2585.792969, 46.014324),
            type = 'booth',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            booth = {
                number = 1003,
            },
            helpers = {
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 3.0,
                dist = 1.0,
            },
            coords = vec3(1828.777710, 2580.209717, 46.014324),
            type = 'booth',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = l('PRISONER_CIGAR_LABEL'),
                sprite = 214,
                scale = 0.6,
                color = 0,
            },
            npc = nil,
            helpers = {
                size = vec2(1.8, 1.8),
                minZ = 1.0,
                maxZ = 3.0,
                dist = 1.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1725.2, 2497.15, 45.05),
            type = 'package_cigarette',
            production = {
                items = {
                    {
                        itemName = 'cigar',
                        count = math.random(2, 4)
                    },
                }
            }
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1742.418823, 2541.447998, 43.984791 - 1),
            helpers = {
                heading = 297.6,
            },
            exercise = 'Situps',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1744.494629, 2537.488281, 43.984791 - 1),
            helpers = {
                heading = 297.6,
            },
            exercise = 'Situps',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1751.496826, 2541.276855, 43.984791 - 1),
            helpers = {
                heading = 116.6,
            },
            exercise = 'Situps',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1749.369629, 2545.049316, 43.984791 - 1),
            helpers = {
                heading = 116.6,
            },
            exercise = 'Situps',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1635.517090, 2526.889404, 45.953522 - 1),
            helpers = {
                heading = 49.0,
            },
            exercise = 'Situps',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1638.037842, 2529.801514, 45.956512 - 1),
            helpers = {
                heading = 49.0,
            },
            exercise = 'Situps',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1640.704712, 2532.832764, 45.948532 - 1),
            helpers = {
                heading = 49.0,
            },
            exercise = 'Situps',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1642.816284, 2535.580566, 45.953316 - 1),
            helpers = {
                heading = 49.0,
            },
            exercise = 'Situps',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1643.370972, 2527.793457, 45.564861 - 1.05),
            helpers = {
                heading = 52.0,
            },
            exercise = 'Musclechin',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1649.156738, 2529.599121, 45.564857 - 1.05),
            helpers = {
                heading = 52.0,
            },
            exercise = 'Musclechin',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1645.360474, 2525.162109, 45.564861 - 1.05),
            helpers = {
                heading = 52.0,
            },
            exercise = 'Cranks',
            type = 'gym',
        },
        {
            npc = nil,
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1639.617188, 2526.394043, 45.564884 - 1.05),
            helpers = {
                heading = 141.0,
            },
            exercise = 'Cranks',
            type = 'gym',
        },
    },
}
