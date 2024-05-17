---You can modify the /dealer sell price here
---@param price number
function GetSellPrice(source, price)
    return price
end

MySQL.ready(function()
  MySQL.query([[
    CREATE TABLE IF NOT EXISTS `lunar_drugs_weed` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `owner` varchar(60) DEFAULT NULL,
      `data` longtext DEFAULT NULL,
      PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
    ]])
end)