QBCORE INSTALL QUIDE

1. Download all dependencies!
    Dependencies:
    ox_lib | https://github.com/overextended/ox_lib/releases/latest
    es_extended / qb-core
    qtarget / qb-target
    ox_inventory / qb-inventory


2. Add Images to your inventory
    qb-inventory > html > images
    Paste images from folder images to qb-inventory > html > images 

3. Add Items to your inventory and jobs
    qb-core > shared.lua
    ['bakery'] = {
        label = 'Trey Bakery',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Novice',
                payment = 75
            },
            ['2'] = {
                name = 'Experienced',
                payment = 100
            },
            ['3'] = {
                name = 'Advanced',
                payment = 125
            },
            ['4'] = {
                name = 'Manager',
                payment = 150
            },
            ['5'] = {
                name = 'Boss',
                isboss = true,
                payment = 150
            },
        },
    },
    qb-core > shared.lua


["americano"] = {["name"] = "americano", ["label"] = "Americano", ["weight"] = 150, ["type"] = "item", ["image"] = "americano.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["apple_pie"] = {["name"] = "apple_pie", ["label"] = "Apple Pie", ["weight"] = 150, ["type"] = "item", ["image"] = "apple_pie.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["apple_pie_dough"] = {["name"] = "apple_pie_dough", ["label"] = "Apple Pie Dough", ["weight"] = 150, ["type"] = "item", ["image"] = "apple_pie_dough.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["apples"] = {["name"] = "apples", ["label"] = "Apples", ["weight"] = 150, ["type"] = "item", ["image"] = "apples.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["blackberry"] = {["name"] = "blackberry", ["label"] = "Blackberry", ["weight"] = 150, ["type"] = "item", ["image"] = "blackberry.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["blackberry_muffin"] = {["name"] = "blackberry_muffin", ["label"] = "Blackberry Muffin", ["weight"] = 150, ["type"] = "item", ["image"] = "blackberry_muffin.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["breadcrumbs"] = {["name"] = "breadcrumbs", ["label"] = "Breadcrumbs", ["weight"] = 150, ["type"] = "item", ["image"] = "breadcrumbs.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["butter"] = {["name"] = "butter", ["label"] = "Butter", ["weight"] = 150, ["type"] = "item", ["image"] = "butter.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["classic_donut"] = {["name"] = "classic_donut", ["label"] = "Classic Donut", ["weight"] = 150, ["type"] = "item", ["image"] = "classic_donut.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["coffee"] = {["name"] = "coffee", ["label"] = "Coffee", ["weight"] = 150, ["type"] = "item", ["image"] = "coffee.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["coffee_beans"] = {["name"] = "coffee_beans", ["label"] = "Coffee Beans", ["weight"] = 150, ["type"] = "item", ["image"] = "coffee_beans.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["coffee_crema"] = {["name"] = "coffee_crema", ["label"] = "Coffee Crema", ["weight"] = 150, ["type"] = "item", ["image"] = "coffee_crema.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["coffee_cup"] = {["name"] = "coffee_cup", ["label"] = "Coffee Cup", ["weight"] = 150, ["type"] = "item", ["image"] = "coffee_cup.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["coffee_cup_dirty"] = {["name"] = "coffee_cup_dirty", ["label"] = "Coffee Cup Dirty", ["weight"] = 150, ["type"] = "item", ["image"] = "coffee_cup_dirty.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["cookies"] = {["name"] = "cookies", ["label"] = "Cookies", ["weight"] = 150, ["type"] = "item", ["image"] = "cookies.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["cumin"] = {["name"] = "cumin", ["label"] = "Cumin", ["weight"] = 150, ["type"] = "item", ["image"] = "cumin.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["cup"] = {["name"] = "cup", ["label"] = "Cup", ["weight"] = 150, ["type"] = "item", ["image"] = "cup.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["czech_bread"] = {["name"] = "czech_bread", ["label"] = "Czechia Bread", ["weight"] = 150, ["type"] = "item", ["image"] = "czech_bread.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["dough"] = {["name"] = "dough", ["label"] = "dough", ["weight"] = 150, ["type"] = "item", ["image"] = "dough.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["eggs"] = {["name"] = "eggs", ["label"] = "eggs", ["weight"] = 150, ["type"] = "item", ["image"] = "eggs.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["espresso"] = {["name"] = "espresso", ["label"] = "espresso", ["weight"] = 150, ["type"] = "item", ["image"] = "espresso.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["flour"] = {["name"] = "flour", ["label"] = "Flour", ["weight"] = 150, ["type"] = "item", ["image"] = "flour.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["grated_chocolate"] = {["name"] = "grated_chocolate", ["label"] = "grated chocolate", ["weight"] = 150, ["type"] = "item", ["image"] = "grated_chocolate.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["grater"] = {["name"] = "grater", ["label"] = "Grater", ["weight"] = 150, ["type"] = "item", ["image"] = "grater.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["green_tea"] = {["name"] = "green_tea", ["label"] = "green tea", ["weight"] = 150, ["type"] = "item", ["image"] = "green_tea.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["green_tea_box"] = {["name"] = "green_tea_box", ["label"] = "Green Tea Box", ["weight"] = 150, ["type"] = "item", ["image"] = "green_tea_box.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["hersheys"] = {["name"] = "hersheys", ["label"] = "Hersheys", ["weight"] = 150, ["type"] = "item", ["image"] = "hersheys.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["chocolate"] = {["name"] = "chocolate", ["label"] = "chocolate", ["weight"] = 150, ["type"] = "item", ["image"] = "chocolate.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["chocolate_coffee"] = {["name"] = "chocolate_coffee", ["label"] = "chocolate coffee", ["weight"] = 150, ["type"] = "item", ["image"] = "chocolate_coffee.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["chocolate_croissant"] = {["name"] = "chocolate_croissant", ["label"] = "chocolate croissant", ["weight"] = 150, ["type"] = "item", ["image"] = "chocolate_croissant.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["chocolate_donut"] = {["name"] = "chocolate_donut", ["label"] = "chocolate donut", ["weight"] = 150, ["type"] = "item", ["image"] = "chocolate_donut.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["chocolate_muffin"] = {["name"] = "chocolate_muffin", ["label"] = "chocolate muffin", ["weight"] = 150, ["type"] = "item", ["image"] = "chocolate_muffin.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["chocolate_topping"] = {["name"] = "chocolate_topping", ["label"] = "chocolate topping", ["weight"] = 150, ["type"] = "item", ["image"] = "chocolate_topping.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["lemon"] = {["name"] = "lemon", ["label"] = "lemon", ["weight"] = 150, ["type"] = "item", ["image"] = "lemon.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["lemon_crushedice"] = {["name"] = "lemon_crushedice", ["label"] = "lemon crushedice", ["weight"] = 150, ["type"] = "item", ["image"] = "lemon_crushedice.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["liquid_dough"] = {["name"] = "liquid_dough", ["label"] = "liquid dough", ["weight"] = 150, ["type"] = "item", ["image"] = "liquid_dough.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["milk"] = {["name"] = "milk", ["label"] = "milk", ["weight"] = 150, ["type"] = "item", ["image"] = "milk.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["muffin"] = {["name"] = "muffin", ["label"] = "muffin", ["weight"] = 150, ["type"] = "item", ["image"] = "muffin.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["muffin_tin"] = {["name"] = "muffin_tin", ["label"] = "muffin tin", ["weight"] = 150, ["type"] = "item", ["image"] = "muffin_tin.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["muffin_tin_filled"] = {["name"] = "muffin_tin_filled", ["label"] = "muffin tin filled", ["weight"] = 150, ["type"] = "item", ["image"] = "muffin_tin_filled.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["multivitamin_crushedice"] = {["name"] = "multivitamin_crushedice", ["label"] = "multivitamin crushedice", ["weight"] = 150, ["type"] = "item", ["image"] = "multivitamin_crushedice.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["oil"] = {["name"] = "oil", ["label"] = "oil", ["weight"] = 150, ["type"] = "item", ["image"] = "oil.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["pink_donut"] = {["name"] = "pink_donut", ["label"] = "pink donut", ["weight"] = 150, ["type"] = "item", ["image"] = "pink_donut.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["pink_topping"] = {["name"] = "pink_topping", ["label"] = "pink topping", ["weight"] = 150, ["type"] = "item", ["image"] = "pink_topping.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["plum"] = {["name"] = "plum", ["label"] = "plum", ["weight"] = 150, ["type"] = "item", ["image"] = "plum.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["regular_muffin"] = {["name"] = "regular_muffin", ["label"] = "regular muffin", ["weight"] = 150, ["type"] = "item", ["image"] = "regular_muffin.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["shortcake"] = {["name"] = "shortcake", ["label"] = "shortcake", ["weight"] = 150, ["type"] = "item", ["image"] = "shortcake.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["shortcake_dough"] = {["name"] = "shortcake_dough", ["label"] = "shortcake dough", ["weight"] = 150, ["type"] = "item", ["image"] = "muffshortcake_doughin.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["shortcake_plum"] = {["name"] = "shortcake_plum", ["label"] = "shortcake plum", ["weight"] = 150, ["type"] = "item", ["image"] = "shortcake_plum.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["strawberry"] = {["name"] = "strawberry", ["label"] = "strawberry", ["weight"] = 150, ["type"] = "item", ["image"] = "strawberry.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["strawberry_shortcake"] = {["name"] = "strawberry_shortcake", ["label"] = "strawberry shortcake", ["weight"] = 150, ["type"] = "item", ["image"] = "strawberry_shortcake.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["sugar"] = {["name"] = "sugar", ["label"] = "sugar", ["weight"] = 150, ["type"] = "item", ["image"] = "sugar.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["unbaked_croissant_chocolate"] = {["name"] = "unbaked_croissant_chocolate", ["label"] = "unbaked croissant chocolate", ["weight"] = 150, ["type"] = "item", ["image"] = "unbaked_croissant_chocolate.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["unbaked_donut"] = {["name"] = "unbaked_donut", ["label"] = "unbaked donut", ["weight"] = 150, ["type"] = "item", ["image"] = "unbaked_donut.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["vanilla_sugar"] = {["name"] = "vanilla_sugar", ["label"] = "vanilla sugar", ["weight"] = 150, ["type"] = "item", ["image"] = "vanilla_sugar.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
["yeast_cube"] = {["name"] = "yeast_cube", ["label"] = "Yeast cube", ["weight"] = 150, ["type"] = "item", ["image"] = "yeast_cube.png", ["unique"] = false, ["useable"] = true, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},


4. add ensure drc_bakery into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new Trey Bakery JOB script from DRC SCRIPTS!