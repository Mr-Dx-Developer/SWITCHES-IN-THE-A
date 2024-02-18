
RegisterCommand(Config.command.admin, function (source)
  local zrt = getplayer()
  local xPlayer = zrt(source)	
  local identifier = getidentifier(source)
  if checkAllowed(identifier) then
    TriggerClientEvent("Debux:open:admin", source)
    local data5 = ExecuteSql("SELECT * FROM `debux_recentpost` ORDER BY id")
    for k,v in pairs(data5) do
      TriggerClientEvent("Debux:addpost", source,v.time,v.text) 
    end
  else 
    nofitylao(source,Config.lang.noperm)
  end
end)


AddEventHandler("button:server-1")
RegisterNetEvent("button:server-1",function (text)
    local zrt = getplayer()
    local xPlayer = zrt(source)	
    local identifier = getidentifier(source)
      TriggerClientEvent("notify-1", -1,text)
end)

AddEventHandler("button:server-2")
RegisterNetEvent("button:server-2",function (text)
    local zrt = getplayer()
    local xPlayer = zrt(source)	
    local identifier = getidentifier(source)
      TriggerClientEvent("notify-2", -1,text)
end)

AddEventHandler("debux:databasesave")
RegisterNetEvent("debux:databasesave",function (tarih,text)
  ExecuteSql("INSERT INTO `debux_recentpost` (`time`, `text`) VALUES ('"..tarih.."','"..text.."')")
end)

local liste = true
RegisterCommand(Config.command.player, function (source)
    addplayerpost(source)
    Citizen.Wait(100)
    addplayerpost(source)
end)

function addplayerpost(source)
  TriggerClientEvent("Debux:open:client", source)
  local data5 = ExecuteSql("SELECT * FROM `debux_recentpost` ORDER BY id DESC")
    if liste then
      TriggerClientEvent("Debux:addpost-2-big", source,data5[1].time,data5[1].text) 
      liste = false
    else
      print("kaka")
      local data6 = ExecuteSql("SELECT * FROM `debux_recentpost` ORDER BY id")
      for k,v in pairs(data6) do
      TriggerClientEvent("Debux:addpost-2", source,v.time,v.text) 
      end
  end
end


CreateThread(function()
  while true do
    if liste == false then
    liste = true 
  end
    Wait(7000)
end
end) 