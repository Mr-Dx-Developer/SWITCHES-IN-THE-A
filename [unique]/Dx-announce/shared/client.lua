




--[[

-------------------------------- 

function notify(text)
      ESX.ShowNotification(text)
end

--------------------------------
function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
  
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end]]
  
--------------------------------
function addkey(plate)
    ---- code
end






  ----------------qb version





--   QBCore = nil 

--   Citizen.CreateThread(function()
--      while QBCore == nil do
--          TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
--          Citizen.Wait(30) -- Saniye Bekletme
--      end
--   end)
  
  

-- -------------------------------- 

-- function notify(text)
--     TriggerEvent('QBCore:Notify',text)
-- end

--------------------------------
-- function addkey()
--   ---- code
-- end


-- --------------------------------
-- function DrawText3D(x,y,z, text)
--     local onScreen,_x,_y=World3dToScreen2d(x,y,z)
--     local px,py,pz=table.unpack(GetGameplayCamCoords())
    
--     SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
  
--     SetTextEntry("STRING")
--     SetTextCentre(1)
--     AddTextComponentString(text)
--     DrawText(_x,_y)
--     local factor = (string.len(text)) / 370
--     DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
--   end
  