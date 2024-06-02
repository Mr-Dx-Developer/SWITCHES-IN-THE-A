Config = {}

------------------------------------------------------------------------------------

Config.Mysql = "oxmysql"                                                                                                --- mysql-async, ghmattimysql, oxmysql
Config.npc = "cs_zimbor"
Config.npcanim = "CODE_HUMAN_CROSS_ROAD_WAIT"
Config.npccoord = vector3(-662.29, -933.57, 21.8292)
Config.npccoordh = 178.51
Config.controldistance = 2
Config.textdistance = 5
Config.sleepdistance = 10
Config.text = "[E] - Open Pet Shop"
Config.controlkeys = 38
Config.openmenu = "petmenu"

Config.shop = {
    cam = vector3(-661.10, -937.93, 21.8292),
    rot = vector3(-20.47, 0.0, -140.17),
    pedspawn = vector3(-660.23, -938.86, 20.8292),
    pedspawn_h = 51.27
}

Config.items = {
    [1] = {
        name = "PET CAT",
        pet_code = "a_c_cat_01",
        price = "15000",
        cattegory = "cat",
        img = "cat1.png"
    },
    [2] = {
        name = "PET DOG",
        pet_code = "a_c_chop",
        price = "10000",
        cattegory = "dog",
        img = "dog1.png"
    },
    [3] = {
        name = "PET DOG",
        pet_code = "a_c_husky",
        price = "15000",
        cattegory = "dog",
        img = "dog2.png"
    },
    [4] = {
        name = "PET DOG",
        pet_code = "a_c_poodle",
        price = "10000",
        cattegory = "dog",
        img = "dog3.png"
    },

    [5] = {
        name = "PET DOG",
        pet_code = "a_c_pug",
        price = "7000",
        cattegory = "dog",
        img = "dog4.png"
    },
    [6] = {
        name = "PET DOG",
        pet_code = "a_c_retriever",
        price = "10000",
        cattegory = "dog",
        img = "dog5.png"
    },
    [7] = {
        name = "PET DOG",
        pet_code = "a_c_rottweiler",
        price = "4000",
        cattegory = "dog",
        img = "dog2.png"
    },
    [8] = {
        name = "PET DOG",
        pet_code = "a_c_shepherd",
        price = "10000",
        cattegory = "dog",
        img = "dog7.png"
    },
    [9] = {
        name = "PET DOG",
        pet_code = "a_c_westy",
        price = "20000",
        cattegory = "dog",
        img = "dog8.png"
    }
}
