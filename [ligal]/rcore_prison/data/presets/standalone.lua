return {
    releasePos = vec4(1847.230469, 2587.085693, 45.672638, 269.0),
    outfitMenu = vec4(402.704010, -996.795166, -99.000252, 180.0),
    prisonYard = vec4(1717.125610, 2503.136230, 45.564896, 74.0),
    outfitCameraOffset = vector3(0.0, -8.0, 0.0),

    cameraProlog = {
        initCameraPosition = vector3(1692.123291, 2564.680176, 57.360081),
        initCameraRot = vector3(-2.981497, 0.06393559, 233.0),
        initGameplayCamRot = vec3(-10.6386, -0, 233.0),
        points = {
            {
                pos = vec3(1715.306152, 2564.119385, 55.278774),
                rot = vector3(-5.106454, 0.06342217, 197.89619445801),
                duration = 8000,
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
                pos = vector3(1754.4, 2563.8, 47),
                rot = vector3(-5.106454, 0.06342217, 29.43),
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
                pos = vector3(1763.562866, 2556.079102, 46.409992),
                rot = vector3(-2.428856, 0.05924932, 334.92651367188),
                duration = 6000,
                text = '~w~Create your prisoner ~o~account~w~ at this Warden.',
                textTimeout = 4000,
                textRenderTime = 2500,
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

            {
                pos = vector3(1764.03, 2534.94, 45.57),
                rot = vector3(-5.106454, 0.06342217, 222.11),
                duration = 8000,
                text = '~w~There you can find ~o~telephone booths~w~.',
                textTimeout = 6000,
                textRenderTime = 2000,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },
        }
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
            requiredDelivery = 1,
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


    CW = {
        {
            idx = 1,
            name = l('job_community_service_label'),
            desc = l('job_community_service_desc'),
        },
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
            coords = vec3(1707.786377, 2552.555908, 46.007427 - 1),
            type = 'dealer',
            helpers = {
                dist = Prison.Target.EyeDist
            },
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
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 1.0,
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
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 1.0,
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
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 1.0,
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
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 1.0,
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
            coords = vec3(1643.370972, 2527.793457, 45.564861 - 1.0),
            helpers = {
                heading = 52.0,
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 3.0,
                dist = 1.0,
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
            coords = vec3(1649.104614, 2529.695557, 45.564880 - 1.0),
            helpers = {
                heading = 52.0,
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 3.0,
                dist = 1.0,
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
            coords = vec3(1640.315063, 2522.548828, 45.948677 - 1.05),
            helpers = {
                heading = 52.0,
                size = vec2(0.8, 0.8),
                minZ = 1.0,
                maxZ = 2.0,
                dist = 1.0,
            },
            exercise = 'Cranks',
            type = 'gym',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = 'Prisoners Canteen',
                sprite = 214,
                scale = 0.9,
                color = 0,
            },
            helpers = {
                dist = Prison.Target.EyeDist
            },
            npc = {
                model = 's_m_m_prisguard_01',
                heading = 90.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1775.542480, 2552.090088, 45.564976),
            type = 'canteen',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = 'Prison Account',
                sprite = 280,
                scale = 1.0,
                color = 0,
            },
            npc = {
                model = 's_m_m_prisguard_01',
                heading = 180.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1767.634888, 2565.829102, 45.564949),
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
                heading = 270.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1846.737793, 2585.654785, 45.672001),
            type = 'lobby',
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
                model = 'mp_m_securoguard_01',
                heading = 225.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1752.785034, 2566.758789, 45.564972),
            type = 'jobs',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = 'Booth [1000]',
                sprite = 106,
                scale = 0.4,
                color = 0,
            },
            npc = {
                model = 'mp_m_securoguard_01',
                heading = 30.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            booth = {
                number = 1000,
            },
            coords = vec3(1765.303589, 2529.866455, 45.796360),
            type = 'booth',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = 'Booth [1001]',
                sprite = 106,
                scale = 0.4,
                color = 0,
            },
            npc = {
                model = 'mp_m_securoguard_01',
                heading = 30.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            booth = {
                number = 1001,
            },
            coords = vec3(1768.573120, 2534.181152, 45.564991),
            type = 'booth',
        }
    }
}
