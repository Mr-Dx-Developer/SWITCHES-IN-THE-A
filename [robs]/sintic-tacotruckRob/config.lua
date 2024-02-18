----<<<<<----  https://sintic.tebex.io// ------>>>>>--------
----<<<<<----  Taco Truck Robbery - QBCore Version ------>>>>>--------


---- If you have any problem contact(open ticket) via discord.
    ---- Discord - https://discord.gg/zKjXYuXUKP

Config = {}

Config['Rob'] = {

    ['Timenextrob'] = 9000,
    ['Policejobname'] = 'police',

    ['Startpedmodel'] = 's_m_m_highsec_02',
    ['StartLocCfg'] = vector3(406.9802, -1833.5273, 28.3502 - 0.95),
    ['StartLocHeadingCfg'] = 296.0502,

    ['TacoTruck'] = 'taco',
    ['TruckSpawnCfg'] = vector3(23.4245, -1604.7677, 28.8702),
    ['TruckSpawnHeadingCfg'] = 137.9544,

    ['GuardCfg'] = { ---- https://docs.fivem.net/docs/game-references/ped-models

        {vector = vector3(21.6090, -1598.9091, 29.2836), w = 63.3151, pedmodel = 's_m_m_highsec_02', weapon = 'WEAPON_PISTOL'},
        {vector = vector3(25.9904, -1601.2662, 29.2868), w = 59.8347, pedmodel = 's_m_m_highsec_02', weapon = 'WEAPON_PISTOL'},
        {vector = vector3(16.7171, -1613.4282, 29.2852), w = 116.2465, pedmodel = 's_m_m_highsec_02' , weapon = 'WEAPON_PISTOL'},
        {vector = vector3(20.1660, -1608.3551, 29.2824), w = 106.3519, pedmodel = 's_m_m_highsec_02' , weapon = 'WEAPON_PISTOL'},

        --- If you need more guards you can add here.

    },
    ['DeliverLocCfg'] = { 

        {vector = vector3(1171.3159, -2974.7773, 5.9019), sellprice = 300, item = 'tosti', itemamount = 10},
        {vector = vector3(1000.9796, -3209.1230, 5.9015), sellprice = 300, item = 'tosti', itemamount = 10},
        {vector = vector3(1203.4056, -3116.1777, 5.5403), sellprice = 300, item = 'tosti', itemamount = 10},
        {vector = vector3(1189.2150, -3103.9822, 5.7783), sellprice = 300, item = 'tosti', itemamount = 10},

        --- If you need more delivery locations you can add here. delivery locations are selecting ramdomly.

    },
}