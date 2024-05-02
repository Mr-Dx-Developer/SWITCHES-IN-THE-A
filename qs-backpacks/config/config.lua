Config = Config or {}
Locales = Locales or {}

--░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
--██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
--██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
--██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
--╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
--░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝

Config.Framework = 'qb'         -- 'esx' or 'qb'
Config.Language = 'en'           -- Set your lang in locales folder
Config.SkinScript = 'illenium-appearance'   -- 'qb-clothing', 'illenium-appearance', 'esx_skin'
Config.Menu = 'ox_lib' -- 'qb-menu', 'ox_lib', 'esx_menu_default'

-- which slots are your hot bar
Config.Hotbar = {
     1, 2, 3, 4, 5
}

Config.duration = {
     open = 1, --sec
     close = 1
}

Config.PasswordLength = {
     min = 3,
     max = 5
}

Config.Animation = {
     close = { -- Animation when close the backpack
          Dict = 'clothingshirt',
          Anim = 'try_shirt_positive_d',
          Flag = 49
     },

     open = { -- Animation when Open the backpack
          Dict = 'clothingshirt',
          Anim = 'try_shirt_positive_d',
          Flag = 49
     },

     inBackpack = {
          Dict = 'clothingshirt',
          Anim = 'try_shirt_positive_d',
     },
}
