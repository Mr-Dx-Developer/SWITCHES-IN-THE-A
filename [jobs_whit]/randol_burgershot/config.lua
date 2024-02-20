Config = {}

Config.NewCore = true

Config.GaragePed = "csb_burgerdrug"

Config.PedLocation = vector4(-1195.07, -903.79, 12.83, 228.09)

Config.VehicleSpawn = vector4(-1199.82, -909.19, 13.63, 33.28)

Config.Vehicle = 'stalion2'

HungerFill = { -- How much they fill your hunger
    ["burger-bleeder"] = math.random(35, 45),
    ["burger-moneyshot"] = math.random(35, 45),
    ["burger-torpedo"] = math.random(35, 45),
    ["burger-heartstopper"] = math.random(35, 45),
    ["burger-meatfree"] = math.random(20, 35),
    ["burger-fries"] = math.random(20, 35),
}

ThirstFill = { -- How much they fill your thirst.
    ["burger-softdrink"] = math.random(25, 35),
    ["burger-mshake"] = math.random(25, 35),
}

Config.Zones = {
    [1] = { coords = vector3(-1196.83, -893.44, 13.89), radius = 0.8, icon = "far fa-clipboard", event = "randol_burgershot:client:frontTray", label = "Food Tray", }, 
    [2] = { coords = vector3(-1191.13, -898.32, 13.89), radius = 0.9, icon = "fa-solid fa-beer-mug-empty", event = "randol_burgershot:client:drinkStation", label = "Make Drinks", job = "burgershot" }, 
    [3] = { coords = vector3(-1196.04, -897.96, 13.89), radius = 0.9, icon = "fa-solid fa-burger", event = "randol_burgershot:client:cookBurgers", label = "Make Burgers", job = "burgershot" }, 
    [4] = { coords = vector3(-1195.15, -899.52, 13.89), radius = 1.55, icon = "fa-solid fa-fire-burner", event = "randol_burgershot:client:makeFries", label = "Make Fries", job = "burgershot" },
    [5] = { coords = vector3(-1196.81, -901.41, 13.89), radius = 1.35, icon = "fa-solid fa-box-open", event = "randol_burgershot:client:ingredientStore", label = "Ingredients", job = "burgershot" },
    [6] = { coords = vector3(-1199.54, -903.14, 13.89), radius = 0.75, icon = "fa-solid fa-briefcase", event = "qb-bossmenu:client:OpenMenu", label = "Manage Business", job = {['burgershot'] = 4} },
    [7] = { coords = vector3(-1203.13, -896.13, 13.89), radius = 1.15, icon = "fa-solid fa-square-up-right", event = "randol_burgershot:client:jobFridge", label = "Food Storage", job = "burgershot" },
    [8] = { coords = vector3(-1195.47, -895.71, 13.89), radius = 1.0, icon = "far fa-clipboard", event = "randol_burgershot:client:passThrough", label = "Big Tray", job = "burgershot" },
    [9] = { coords = vector3(-1200.63, -901.71, 13.89), radius = 0.6, icon = "fa-solid fa-clock", event = "randol_burgershot:clientToggleDuty", label = "Clock In/Out", job = "burgershot" },
    [10] = { coords = vector3(-1197.65, -893.2, 13.89), radius = 0.8, icon = "fa-brands fa-cc-visa", event = "randol_burgershot:bill", label = "Bill Customer", job = "burgershot" },
    [11] = { coords = vector3(-1195.59, -893.88, 13.89), radius = 0.8, icon = "fa-brands fa-cc-visa", event = "randol_burgershot:bill", label = "Bill Customer", job = "burgershot" },
    [12] = { coords = vector3(-1193.72, -894.43, 13.89), radius = 0.8, icon = "fa-brands fa-cc-visa", event = "randol_burgershot:bill", label = "Bill Customer", job = "burgershot" },
    [13] = { coords = vector3(-1191.69, -894.99, 13.89), radius = 0.8, icon = "fa-brands fa-cc-visa", event = "randol_burgershot:bill", label = "Bill Customer", job = "burgershot" },
    [14] = { coords = vector3(-1194.97, -894.08, 13.89), radius = 0.8, icon = "far fa-clipboard", event = "randol_burgershot:client:frontTray2", label = "Food Tray", },
    [15] = { coords = vector3(-1192.96, -894.52, 13.89), radius = 0.8, icon = "far fa-clipboard", event = "randol_burgershot:client:frontTray3", label = "Food Tray", },
    [16] = { coords = vector3(-1191.09, -895.07, 13.89), radius = 0.8, icon = "far fa-clipboard", event = "randol_burgershot:client:frontTray4", label = "Food Tray", },  
}

Config.Items = {
label = "Shop",
    slots = 7,
    items = {
        [1] = {
            name = "burger-bun",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "burger-raw",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "burger-tomato",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "burger-lettuce",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "burger-potato",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "burger-mshakeformula",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "burger-sodasyrup",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 7,
        },
    }
}
