return {
    releasePos = vec4(1847.230469, 2587.085693, 45.672638, 269.0),
    outfitMenu = vec4(402.704010, -996.795166, -99.000252, 180.0),
    outfitCameraOffset = vector3(0.0, -8.0, 0.0),
    prisonYard = vec4(1774.836914, 2552.014404, 45.564976, 74.0),

    cameraProlog = {
        initCameraPosition = vector3(1708.94, 2587.74, 48.59),
        initCameraRot = vector3(-2.981497, 0.06393559, 179.99),
        initGameplayCamRot = vec3(-10.6386, -0, 298.78),
        points = {
            {
                pos = vector3(1709.73, 2576.16, 45.59),
                rot = vector3(-2.981497, 0.06393559, 232.39),
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
                pos = vector3(1708.11, 2573.41, 45.59),
                rot = vector3(-2.428856, 0.05924932, 99.11),
                duration = 6000,
                text = '~w~Create your prisoner ~o~account~w~ at this Warden.',
                textTimeout = 2000,
                textRenderTime = 2500,
                options = {
                    fov = 90.0,
                    copyEffects = false,

                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },
            {
                pos = vector3(1707.23, 2568.85, 45.59),
                rot = vector3(-2.428856, 0.05924932, 79.77),
                duration = 4000,
                textRenderTime = 4500,
                text = '',
                textTimeout = 9000 / 2,
                options = {
                    fov = 90.0,
                    copyEffects = false,

                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },
            {

                pos = vector3(1691.71, 2569.54, 46.5),
                rot = vector3(-5.106454, 0.06342217, 190.82),
                duration = 8000,
                text = 'Lets take a look outside.',
                textTimeout = 6000 / 2,
                textRenderTime = 4500,
                options = {
                    fov = 90.0,
                    copyEffects = false,
                    --this will cause the movement of the camera to feel more smooth becuase it wont wait till will be on the defined destination
                    offsetDuration = 1500,
                }
            },

            {

                pos = vector3(1691.91, 2561.21, 45.56),
                rot = vector3(-5.106454, 0.06342217, 245.28),
                duration = 5000,
                text = '',
                textTimeout = 6000 / 2,
                textRenderTime = 4500,
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
                text = 'You can do some ~o~jobs~w~ and ~o~reduce~w~ your jail time.',
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

                pos = vector3(1764.03, 2534.94, 45.57),
                rot = vector3(-5.106454, 0.06342217, 222.11),
                duration = 8000,
                text = 'There you can find ~o~telephone booths~w~.',
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

    spawnPoints = {
        {
            heading = 267.48275756836,
            coords = vec3(1666.126953, 2571.655029, 50.189999),
        },


        {
            heading = 272.62530517578,
            coords = vec3(1666.463013, 2575.881104, 50.189999),
        },


        {
            heading = 270.10980224609,
            coords = vec3(1666.473022, 2578.914062, 50.189999),
        },

        {
            heading = 303.92572021484,
            coords = vec3(1667.630981, 2583.321045, 50.188999),
        },


        {
            heading = 269.0207824707,
            coords = vec3(1667.671997, 2586.471924, 50.188999),
        },


        {
            heading = 268.28881835938,
            coords = vec3(1666.519043, 2591.045898, 50.188999),
        },


        {
            heading = 268.18087768555,
            coords = vec3(1666.761963, 2594.232910, 50.188999),
        },


        {
            heading = 273.2209777832,
            coords = vec3(1666.344971, 2598.187988, 50.188999),
        },


        {
            heading = 269.62091064453,
            coords = vec3(1666.370972, 2600.927979, 50.188999),
        },


        {
            heading = 268.86920166016,
            coords = vec3(1666.697021, 2604.946045, 50.188999),
        },


        {
            heading = 269.59603881836,
            coords = vec3(1666.769043, 2608.022949, 50.189999),
        },


        {
            heading = 268.28225708008,
            coords = vec3(1666.838013, 2611.449951, 50.189999),
        },


        {
            heading = 178.13140869141,
            coords = vec3(1671.171997, 2617.600098, 50.189999),
        },


        {
            heading = 177.93962097168,
            coords = vec3(1675.230957, 2617.470947, 50.188999),
        },


        {
            heading = 178.57305908203,
            coords = vec3(1677.576050, 2617.412109, 50.188999),
        },


        {
            heading = 180.60917663574,
            coords = vec3(1682.157959, 2618.270996, 50.188999),
        },


        {
            heading = 179.70742797852,
            coords = vec3(1685.359985, 2618.416992, 50.188999),
        },


        {
            heading = 154.97035217285,
            coords = vec3(1689.327026, 2618.412109, 50.188999),
        },


        {
            heading = 190.24348449707,
            coords = vec3(1691.995972, 2618.476074, 50.182999),
        },


        {
            heading = 180.1695098877,
            coords = vec3(1697.010010, 2618.540039, 50.183998),
        },


        {
            heading = 179.06416320801,
            coords = vec3(1700.829956, 2618.491943, 50.185001),
        },


        {
            heading = 179.0852355957,
            coords = vec3(1700.519043, 2617.553955, 50.188999),
        },


        {
            heading = 181.87580871582,
            coords = vec3(1704.063965, 2617.616943, 50.188999),
        },


        {
            heading = 179.63694763184,
            coords = vec3(1706.973022, 2617.601074, 50.188999),
        },


        {
            heading = 177.48756408691,
            coords = vec3(1711.260010, 2618.547119, 50.198002),
        },


        {
            heading = 87.581260681152,
            coords = vec3(1715.915039, 2608.281982, 50.195999),
        },


        {
            heading = 87.344856262207,
            coords = vec3(1715.774048, 2604.875000, 50.195000),
        },


        {
            heading = 87.595947265625,
            coords = vec3(1716.713013, 2601.001953, 50.208000),
        },


        {
            heading = 121.08084869385,
            coords = vec3(1713.436035, 2597.559082, 50.188999),
        },


        {
            heading = 88.970039367676,
            coords = vec3(1713.397949, 2594.074951, 50.188000),
        },


        {
            heading = 88.349220275879,
            coords = vec3(1713.336060, 2590.339111, 50.188999),
        },


        {
            heading = 62.673355102539,
            coords = vec3(1714.427002, 2586.197021, 50.189999),
        },


        {
            heading = 97.937469482422,
            coords = vec3(1714.494995, 2583.318115, 50.189999),
        },


        {
            heading = 88.418823242188,
            coords = vec3(1714.438965, 2579.937988, 50.189999),
        },


        {
            heading = 87.435585021973,
            coords = vec3(1714.136963, 2575.108887, 50.189999),
        },


        {
            heading = 86.160972595215,
            coords = vec3(1714.170044, 2572.239990, 50.189999),
        },


        {
            heading = 88.91739654541,
            coords = vec3(1713.928955, 2572.512939, 53.189999),
        },


        {
            heading = 87.191314697266,
            coords = vec3(1713.260010, 2575.002930, 53.189999),
        },


        {
            heading = 86.976287841797,
            coords = vec3(1714.660034, 2579.617920, 53.094002),
        },


        {
            heading = 85.250358581543,
            coords = vec3(1714.797974, 2582.235107, 53.181000),
        },


        {
            heading = 82.032737731934,
            coords = vec3(1715.060059, 2586.358887, 53.182999),
        },


        {
            heading = 88.129508972168,
            coords = vec3(1714.719971, 2589.934082, 53.178001),
        },


        {
            heading = 92.238571166992,
            coords = vec3(1715.973022, 2593.705078, 53.188999),
        },


        {
            heading = 98.880996704102,
            coords = vec3(1714.938965, 2597.798096, 53.189999),
        },


        {
            heading = 83.940788269043,
            coords = vec3(1714.875977, 2601.513916, 53.189999),
        },


        {
            heading = 95.770286560059,
            coords = vec3(1715.842041, 2605.381104, 53.189999),
        },


        {
            heading = 88.132049560547,
            coords = vec3(1716.031006, 2611.831055, 53.189999),
        },


        {
            heading = 181.0672454834,
            coords = vec3(1710.916992, 2618.063965, 53.168999),
        },


        {
            heading = 215.91207885742,
            coords = vec3(1706.801025, 2617.847900, 53.189999),
        },


        {
            heading = 174.78657531738,
            coords = vec3(1703.170044, 2617.935059, 53.189999),
        },


        {
            heading = 162.45913696289,
            coords = vec3(1699.421021, 2617.823975, 53.192001),
        },


        {
            heading = 181.49432373047,
            coords = vec3(1695.762939, 2617.666992, 53.188999),
        },


        {
            heading = 162.57824707031,
            coords = vec3(1692.302002, 2618.010010, 53.189999),
        },


        {
            heading = 181.87705993652,
            coords = vec3(1689.704956, 2618.084961, 53.189999),
        },


        {
            heading = 179.34056091309,
            coords = vec3(1685.077026, 2618.277100, 53.189999),
        },


        {
            heading = 178.32022094727,
            coords = vec3(1681.526001, 2618.316895, 53.189999),
        },


        {
            heading = 174.16839599609,
            coords = vec3(1677.177002, 2619.322021, 53.189999),
        },


        {
            heading = 180.59870910645,
            coords = vec3(1673.868042, 2619.341064, 53.189999),
        },


        {
            heading = 179.25245666504,
            coords = vec3(1669.989014, 2619.437988, 53.189999),
        },


        {
            heading = 251.16705322266,
            coords = vec3(1666.359985, 2613.001953, 53.191002),
        },


        {
            heading = 259.03283691406,
            coords = vec3(1666.505981, 2608.129883, 53.189999),
        },


        {
            heading = 269.2649230957,
            coords = vec3(1666.298950, 2604.641113, 53.189999),
        },


        {
            heading = 269.68515014648,
            coords = vec3(1666.250977, 2600.327881, 53.189999),
        },


        {
            heading = 269.68515014648,
            coords = vec3(1666.229004, 2597.366943, 53.189999),
        },


        {
            heading = 269.92242431641,
            coords = vec3(1665.943970, 2590.469971, 53.189999),
        },


        {
            heading = 271.62829589844,
            coords = vec3(1665.937988, 2585.842041, 53.189999),
        },


        {
            heading = 270.05059814453,
            coords = vec3(1666.041992, 2582.877930, 53.168999),
        },


        {
            heading = 284.53225708008,
            coords = vec3(1666.125977, 2578.987061, 53.189999),
        },


        {
            heading = 268.40087890625,
            coords = vec3(1666.194946, 2575.925049, 53.099998),
        },


        {
            heading = 264.2692565918,
            coords = vec3(1666.152954, 2572.934082, 53.178001),
        },


        {
            heading = 257.7561340332,
            coords = vec3(1666.796997, 2572.353027, 56.096001),
        },


        {
            heading = 266.96762084961,
            coords = vec3(1667.272949, 2576.459961, 56.095001),
        },


        {
            heading = 267.53091430664,
            coords = vec3(1667.359009, 2578.481934, 56.095001),
        },


        {
            heading = 266.11492919922,
            coords = vec3(1667.105957, 2583.101074, 56.095001),
        },


        {
            heading = 267.89498901367,
            coords = vec3(1668.098022, 2587.356934, 56.095001),
        },


        {
            heading = 273.43954467773,
            coords = vec3(1667.509033, 2590.445068, 56.116001),
        },


        {
            heading = 269.01696777344,
            coords = vec3(1667.587036, 2594.097900, 56.094002),
        },


        {
            heading = 268.77276611328,
            coords = vec3(1667.692017, 2598.018066, 56.094002),
        },


        {
            heading = 268.4128112793,
            coords = vec3(1667.810059, 2602.094971, 56.094002),
        },


        {
            heading = 268.54144287109,
            coords = vec3(1667.873047, 2604.687012, 56.095001),
        },


        {
            heading = 306.17666625977,
            coords = vec3(1667.285034, 2608.225098, 56.096001),
        },


        {
            heading = 346.51095581055,
            coords = vec3(1667.404053, 2611.787109, 56.096001),
        },


        {
            heading = 178.22773742676,
            coords = vec3(1670.074951, 2618.541992, 56.089001),
        },


        {
            heading = 178.10774230957,
            coords = vec3(1674.250977, 2618.363037, 56.090000),
        },


        {
            heading = 178.95268249512,
            coords = vec3(1677.131958, 2618.366943, 56.091999),
        },


        {
            heading = 178.81669616699,
            coords = vec3(1682.348999, 2618.103027, 56.095001),
        },


        {
            heading = 171.78863525391,
            coords = vec3(1686.222046, 2617.952881, 56.095001),
        },


        {
            heading = 160.54080200195,
            coords = vec3(1689.879028, 2617.773926, 56.095001),
        },


        {
            heading = 182.64663696289,
            coords = vec3(1696.855957, 2616.996094, 56.094002),
        },


        {
            heading = 177.55389404297,
            coords = vec3(1699.840942, 2616.887939, 56.092999),
        },


        {
            heading = 178.8537902832,
            coords = vec3(1703.790039, 2616.816895, 56.094002),
        },


        {
            heading = 184.33111572266,
            coords = vec3(1700.713989, 2618.315918, 56.094002),
        },


        {
            heading = 180.01483154297,
            coords = vec3(1704.071045, 2618.311035, 56.094002),
        },


        {
            heading = 179.88508605957,
            coords = vec3(1707.571045, 2618.305908, 56.094002),
        },


        {
            heading = 179.46229553223,
            coords = vec3(1710.444946, 2618.281982, 56.095001),
        },


        {
            heading = 106.01525115967,
            coords = vec3(1714.724976, 2611.708008, 56.084000),
        },


        {
            heading = 91.224342346191,
            coords = vec3(1714.670044, 2608.892090, 56.090000),
        },


        {
            heading = 86.089920043945,
            coords = vec3(1714.130005, 2604.459961, 56.096001),
        },


        {
            heading = 88.187812805176,
            coords = vec3(1713.920044, 2600.059082, 56.096001),
        },


        {
            heading = 89.518287658691,
            coords = vec3(1713.840942, 2596.372070, 56.095001),
        },


        {
            heading = 89.518287658691,
            coords = vec3(1713.840942, 2596.372070, 56.095001),
        },


        {
            heading = 92.751335144043,
            coords = vec3(1713.979004, 2593.580078, 56.095001),
        },


        {
            heading = 89.697982788086,
            coords = vec3(1713.985962, 2590.166992, 56.095001),
        },


        {
            heading = 87.846435546875,
            coords = vec3(1713.887939, 2587.122070, 56.096001),
        },


        {
            heading = 88.451377868652,
            coords = vec3(1713.561035, 2582.625000, 56.096001),
        },


        {
            heading = 92.249412536621,
            coords = vec3(1713.468018, 2578.836914, 56.096001),
        },


        {
            heading = 89.203224182129,
            coords = vec3(1713.446045, 2576.177002, 56.096001),
        },


        {
            heading = 111.17824554443,
            coords = vec3(1713.156006, 2572.377930, 56.096001),
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
            checkDist = 800, -- If above awaiting 1,5 sec for cycle
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

    CW = {
        {
            idx = 1,
            name = l('job_community_service_label'),
            desc = l('job_community_service_desc'),
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
            coords = vec3(1707.786377, 2552.555908, 46.007427 - 1),
            type = 'dealer',
            name = 'What i can do for you?',
            helpers = {
                dist = Prison.Target.EyeDist
            },

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
            coords = vec3(1656.264038, 2547.330811, 45.564854),
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
            coords = vec3(1715.009644, 2586.764404, 46.046280 - 1),
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
            blip = {
                state = Prison.RenderNPCBlips,
                name = 'Prisoners Canteen',
                sprite = 214,
                scale = 0.6,
                color = 0,
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
            helpers = {
                heading = 49.0,
                size = vec2(1.2, 1.2),
                minZ = 1.0,
                maxZ = 1.0,
                dist = Prison.Target.EyeDist
            },

            coords = vec3(1712.886108, 2573.232422, 45.555862),
            type = 'canteen',
            name = l('CANTEEN_LABEL_INTERACT'),
        },
        {

            blip = {
                state = Prison.RenderNPCBlips,
                name = l('PRISONER_ACCOUNT_LABEL'),
                sprite = 76,
                scale = 0.6,
                color = 0,
            },
            npc = {
                model = 's_m_m_prisguard_01',
                heading = -90.0,
            },
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            coords = vec3(1704.946411, 2572.577637, 45.585835),
            type = 'account',
            name = l('PRISONER_MY_ACCOUNT_LABEL'),
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
            coords = vec3(1845.662476, 2585.930908, 45.672016),
            type = 'lobby',
            name = 'Lobby',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = l('PRISONER_LOBBY_LABEL'),
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
            name = 'Prison Jobs',
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
                name = 'Booth [1000]',
                sprite = 106,
                scale = 0.6,
                color = 0,
            },
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
            helpers = {
                heading = 100.0,
                size = vec2(0.8, 0.8),
                minZ = 1.0,
                maxZ = 3.0,
                dist = 1.0,
            },
            coords = vec3(1768.42, 2530.699, 44.44053),
            type = 'booth',
        },
        {
            blip = {
                state = Prison.RenderNPCBlips,
                name = 'Booth [1001]',
                sprite = 106,
                scale = 0.6,
                color = 0,
            },
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
            helpers = {
                heading = 100.0,
                size = vec2(0.8, 0.8),
                minZ = 1.0,
                maxZ = 3.0,
                dist = 1.0,
            },
            coords = vec3(1766.838, 2529.723, 44.44053),
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
            marker = {
                renderState = false,
                rgba = vec4(255, 255, 255, 255),
                size = vec3(0.5, 0.5, 0.5),
                type = 0
            },
            name = 'Cigar production',
            coords = vector3(1667.75, 2590.0, 44.50),
            type = 'package_cigarette',
            production = {
                items = {
                    {
                        itemName = 'cigar',
                        count = math.random(2, 4)
                    },
                }
            }
        }
    }
}
