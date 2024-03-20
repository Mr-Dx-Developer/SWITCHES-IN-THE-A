Coords = {}


--[[

    !! Important Note

    Do not place your character inside an interior,
    i.e. an apartment or a garage or a house, as interiors are not supported in um-multicharacter
    and the environment may not load

    Your character is spawn in a different world (bucket),
    but it would be better to put your character in a quiet and scenic place where cars don't pass by,
    so don't put your character in the middle of the road,
    I could delete or block cars this with a loop but I thought it was unnecessary

--]]

Coords.List = {
    --[[

        if camCoords is not specified, the camera and ped will try to be set to the same coordinates,
        but if this is not what you want, set it manually by specifying camCoords
        like the 3rd coordinate

    --]]

   [1] = { pedCoords = vector4(2934.43, 5325.41, 100.62, 128.05) },
   [2] = { pedCoords = vector4(3321.66, 5171.31, 18.42, 98.12) },
   [3] = { pedCoords = vector4(2528.89, 4208.06, 40.03, 323.25), camCoords = vector4(2529.9, 4210.20, 40.04, 143.39) },
   [4] = { pedCoords = vector4(1965.92, 4636.62, 40.82, 36.75) },
   [5] = { pedCoords = vector4(-1588.18, -1126.39, 2.57, 268.58), camCoords = vector4(-1586.52, -1125.79, 2.58, 95.23) },
   [6] = { pedCoords = vector4(-1683.34, -1129.57, 13.13, 102.49) },
   [7] = { pedCoords = vector4(-1631.62, 194.38, 60.63, 111.56) },
   [8] = { pedCoords = vector4(-1739.52, -1114.48, 13.07, 91.75) },
   [9] = { pedCoords = vector4(-1387.03, 6741.98, 11.98, 67.8) },
   [10] = { pedCoords = vector4(-830.52, -102.67, 28.19, 297.36), camCoords = vector4(-828.80, -101.17, 28.17, 297.36) },
   [11] = { pedCoords = vector4(26.96, 200.78, 105.97, 334.61), camCoords = vector4(27.60, 202.78, 105.97, 334.61) },
   [12] = { pedCoords = vector4(657.27, -1497.52, 10.68, 191.41), camCoords = vector4(657.99, -1499.80, 10.68, 193.48) },
   [13] = { pedCoords = vector4(-74.14, -1455.51, 32.16, 115.75)},

    --- Scenario List
    -- [this only works for single coordinates, if your coordinate state is random this list will not work]

    [14] = {
        pedCoords = vector4(-1606.93, 5261.81, 2.01, 204.77),
        camCoords = vector4(-1604.93, 5258.81, 2.01, 204.77),
        scenario = 'PROP_HUMAN_SEAT_CHAIR_DRINK_BEER'
    },
    [15] = {
        pedCoords = vector4(1978.67, 3830.5, 32.52, 227.04),
        camCoords = vector4(1982.31, 3828.33, 32.43, 43.08),
        scenario = 'PROP_HUMAN_SEAT_CHAIR_FOOD'
    },
    [16] = {
        pedCoords = vector4(-30.43, -1978.88, 4.90, 339.19),
        camCoords = vector4(-29.7, -1976.13, 4.90, 169.52),
        scenario = 'WORLD_HUMAN_SMOKING_POT'
    },
    [17] = {
        pedCoords = vector4(-519.76, 4420.22, 81.41, 271.8),
        camCoords = vector4(-516.76, 4420.92, 81.41, 271.8),
        scenario = 'PROP_HUMAN_SEAT_CHAIR_DRINK'
    }
}