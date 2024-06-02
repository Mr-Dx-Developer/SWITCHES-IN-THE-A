
AddEventHandler('onResourceStart', function(name,tekrar,tekrarla)
  print("discord.gg/debux | debux.shop")
  print("discord.gg/chp | leaked by mikaa")
end)

AddEventHandler("buy:pet")
  RegisterNetEvent("buy:pet", function (petcode,price)
    local zrt = getplayer()
    local xPlayer = zrt(source)	
    identifier = getidentifier(xPlayer)
    money = getmoney(source)
    src = source
    local data5 = ExecuteSql("SELECT * FROM `debux_petshop`")
    kusen = data5[1]
    if kusen == nil then
      pet = false
    else
      pet = true
    end
    for k,v in pairs(data5) do
      if v.identifier == identifier then
        pet = false
      else
        pet = true
        notify("You Already Have a Pet !")
      end
    end
    if tonumber(money) >= tonumber(price) and pet then
      removemoney(src,tonumber(price))
    ExecuteSql("INSERT INTO `debux_petshop` (`identifier`, `pet_code`) VALUES ('"..identifier.."','"..petcode.."')")
    notify("Successfully Purchased !")
    else
      notify("no money")
  end
end)


AddEventHandler("delete:et")
  RegisterNetEvent("delete:pet", function ()
    local zrt = getplayer()
    local xPlayer = zrt(source)	
    identifier = getidentifier(xPlayer)
    ExecuteSql("DELETE FROM `debux_petshop` WHERE `identifier` = '" ..identifier.. "'")
    notify("Successfully Purchased !")
end)

local var = false
AddEventHandler("pet:control")
  RegisterNetEvent("pet:control", function ()
    local zrt = getplayer()
    local xPlayer = zrt(source)	
    identifier = getidentifier(xPlayer)
    src = source
    local data5 = ExecuteSql("SELECT * FROM `debux_petshop`")
    for k,v in pairs(data5) do
      if v.identifier == identifier then
        var = true
        TriggerClientEvent("pet:cl:control", src, var,v.pet_code)
      end
    end
end)

AddEventHandler("sv:getname")
  RegisterNetEvent("sv:getname", function ()
    local zrt = getplayer()
    local xPlayer = zrt(source)	
    identifier = getidentifier(xPlayer)
    src = source
    name = getname(xPlayer)
    TriggerClientEvent("cl:getname", source, name,getmoney(source))
end)



--mikaa leak discord.gg/chp