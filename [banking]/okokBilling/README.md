Hi, thank you for buying my script, I'm very grateful!

If you need help contact me on discord: okok#3488
Discord server: https://discord.gg/FauTgGRUku

1. Go to your database and execute the following SQL command:

CREATE TABLE `okokBilling` (
  `id` int(50) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) NULL DEFAULT NULL,
  `society` varchar(255) NOT NULL,
  `society_name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `invoice_value` int(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notes` varchar(255) NULL DEFAULT ' ',
  `sent_date` varchar(255) NOT NULL,
  `limit_pay_date` varchar(255) NULL DEFAULT NULL,
  `fees_amount` int(50) NULL DEFAULT 0,
  `paid_date` varchar(255) NULL DEFAULT NULL
);

2. Open qb-bossmenu resource, server.lua and add the following event after the "qb-bossmenu:server:depositMoney" event (for example):

RegisterServerEvent("qb-bossmenu:server:okokBillingDeposit")
AddEventHandler("qb-bossmenu:server:okokBillingDeposit", function(job, amount)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    if not Accounts[job] then
        Accounts[job] = 0
    end

    Accounts[job] = Accounts[job] + amount

    TriggerClientEvent('qb-bossmenu:client:refreshSociety', -1, job, Accounts[job])
    SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Accounts), -1)
    TriggerEvent('qb-log:server:CreateLog', 'bossmenu', 'Deposit Money', "Successfully deposited $" .. amount .. ' (' .. job .. ')', src)
end)

3. If you use the latest qb-core version make sure to change the 'exports.oxmysql:execute' in the server side to 'exports.ghmattimysql.executeSync'!