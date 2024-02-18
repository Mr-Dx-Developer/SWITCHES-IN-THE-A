local FrameworkObject 
Citizen.CreateThread(function()
  FrameworkObject = Config.GetFrameWork()
end)
RegisterServerEvent('codem-market-server-checkmoney')
 AddEventHandler('codem-market-server-checkmoney', function(targetSrc)
    local src = targetSrc and targetSrc or source
    if Config.Framework == "esx" then
      local xPlayer = FrameworkObject.GetPlayerFromId(src)
      local money = xPlayer.getMoney()
      local bankmoney = xPlayer.getAccount('bank').money
      TriggerClientEvent('codem-market-client-checkmoney',src , money,bankmoney, xPlayer.getName())
    elseif Config.Framework == "newqb" or Config.Framework == "oldqb"  then
     
      local Player = FrameworkObject.Functions.GetPlayer(src)
      local money = Player.Functions.GetMoney("cash")
      local bankmoney = Player.Functions.GetMoney("bank")
      TriggerClientEvent('codem-market-client-checkmoney',src , money,bankmoney, GetPlayerName(src))
    end
 end)


 RegisterServerEvent('codem-market-server-addItem')
 AddEventHandler('codem-market-server-addItem', function(item,amount,price,bank)
    local src = source
    if Config.Framework == "esx" then
      local xPlayer = FrameworkObject.GetPlayerFromId(src)
      local money = xPlayer.getMoney()
      local banks = xPlayer.getAccount('bank').money
      local total = amount * price
      if total >  0 then 
        if bank then
            if banks >= total then 
              xPlayer.addInventoryItem(item, amount)
              xPlayer.removeAccountMoney('bank',total)
            else
              Config.NotifyHandler(Config.Locale["NOT_ENOUGH_MONEY"].text, Config.Locale["NOT_ENOUGH_MONEY"].type, false, src)
            end
        else
            if money >= total then 
              xPlayer.addInventoryItem(item, amount)
              xPlayer.removeMoney(total)
            else
              Config.NotifyHandler(Config.Locale["NOT_ENOUGH_MONEY"].text, Config.Locale["NOT_ENOUGH_MONEY"].type, false, src)
            end
        end
      else
        return
      end
    elseif Config.Framework == "newqb" or Config.Framework == "oldqb"  then

      local Player = FrameworkObject.Functions.GetPlayer(src)
      local money = Player.Functions.GetMoney("cash")
      local banks = Player.Functions.GetMoney("bank")
      local total = amount * price
      if total >  0 then 
        if bank then
            if banks >= total then 
              Player.Functions.AddItem(item, amount)
              Player.Functions.RemoveMoney("bank",total)
            else
             
              Config.NotifyHandler(Config.Locale["NOT_ENOUGH_MONEY"].text, Config.Locale["NOT_ENOUGH_MONEY"].type, false, src)
            end
        else
            if money >= total then 
              Player.Functions.AddItem(item, amount)
              Player.Functions.RemoveMoney("cash",total)
            else
              Config.NotifyHandler(Config.Locale["NOT_ENOUGH_MONEY"].text, Config.Locale["NOT_ENOUGH_MONEY"].type, false, src)
            end
        end
      else
        return
      end
    end
    TriggerEvent("codem-market-server-checkmoney", src)
 end)