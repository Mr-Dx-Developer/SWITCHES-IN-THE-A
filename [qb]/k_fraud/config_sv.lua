ConfigSV = {}


ConfigSV.Webhook = ''
ConfigSV.WebhookTitle = 'K_Fraud Logs'
ConfigSV.WebhookColor = "999999"


ConfigSV.MythicNotify = true -- if false will use basic ESX alerts
ConfigSV.ForgedAlert = 'You forged a white bank check.'
ConfigSV.NotAble = 'You don\'t have the required items..'
ConfigSV.Cooldown = 'Cooldown active try again in: '

--changing any of these will require the items in the .sqls to be changed or made!
ConfigSV.LaptopItem = 'laptop'
ConfigSV.PrinterItem = 'printer'
ConfigSV.WhiteSlipItem = 'whiteslip'
ConfigSV.WhiteCheckItem = 'whitecheck'
ConfigSV.BankcardItem = 'bankcard'
ConfigSV.RemoveAndReturnPrintingItems = true -- not in qb framework yet


ConfigSV.PoliceAlertChanceMin = 1
ConfigSV.PoliceAlertChanceMax = 50 -- 1 & 50 = 1 in 50 chance, 1 & 100 = 1 in 100 chances of alerting police. 10max 0min = 1 in 10


ConfigSV.Accounts = false -- set to true if you want to use accounts i.e: Bank, Dirty ect
ConfigSV.Account = '' -- example 'bank' | account that when selling checks goes into | cash = cash | money = cash | bank = bank | black = dirty money 

