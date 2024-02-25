Config = {}

--[[ Framework ]]
Config.Framework = "auto"                               -- "auto" | "esx" | "qbcore"
Config.ESX_Version = "auto"                             -- "auto" | "legacy" | "old"
Config.ESX_GetSharedObjectEvent = 'esx:getSharedObject' -- Event name of ESX GetSharedObject

Config.OnesyncInfinityChecker = true                    -- Check if Onesync Infinity is enabled, if not, stop the script.

Config.ShowPlayerIPinStats = false                      -- Show Player IP in Stats /playerinfo id

--[[ All the money accounts in your server || MYSQL: QB: players/money | ESX: users/accounts ]]
Config.Accounts = { 'bank', 'crypto', 'cash', 'black_money' }
Config.BlackMoney = 'black_money'

--[[ Ace Groups ]]
Config.Permissions = { 'group.user', 'group.admin', 'group.god', 'qbcore.admin', 'qbcore.god' }

Config.ItemsImages = "auto" -- Your inventory item images location | "auto" "nui://ox_inventory/web/images/"

Config.DefaultParkingGarage = {
      qb = "pillboxgarage",
      esx = "SanAndreasAvenue"
}

--✅ Change to true if you have the follwing scripts 👇

--[[ Luxu.gg ]]
Config.LuxuAdmin = true
Config.LuxuCEX = false
Config.LuxuCM = false
Config.LuxuDiscordBot = false


--[[ ⚠️ Set to false those you don't have ]]

--[[ Notify ]]
Config.Notify = {
      ['ox'] = true,
      ['okok'] = false,
      ['default'] = true -- Default Framework Notify
}
