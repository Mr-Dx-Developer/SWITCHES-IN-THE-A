--[[ Weather ⛅ ]]
RegisterNetEvent('LuxuAdmin:ChangeWeather', function(type)
      --[[ Only being used by ESX ]]
      ClearWeatherTypePersist()

      SetWeatherTypeNow(type)
      SetWeatherTypeNowPersist(type)
end)


--[[ TIME ⏲️ ]]
RegisterNetEvent('LuxuAdmin:ChangeTime', function(data)
      --[[ Only being used by ESX ]]
      local hours = data.hours
      local minutes = data.minutes
      NetworkOverrideClockTime(hours, minutes, 0)
end)

--[[ FREEZE TIME ]]
local TimeIsFrozen = false
RegisterNetEvent('LuxuAdmin:FreezeTime', function()
      --[[ Only being used by ESX ]]
      TimeIsFrozen = not TimeIsFrozen
      Notify(('Time Frozen: %s'):format(TimeIsFrozen), 'success', 2500)
      local hours = GetClockHours()
      local minutes = GetClockMinutes()
      local seconds = GetClockSeconds()
      while TimeIsFrozen do
            if TimeIsFrozen then NetworkOverrideClockTime(hours, minutes, seconds) end
            Wait(60000)
      end
end)


RegisterNetEvent('LuxuAdmin:Client:KillSelf', function()
      SetEntityHealth(PlayerPedId(), 0)
end)


local OriginalOutfit = {
      model = "",
      props = {},
      accessories = {},
}

local function SaveOutfit()
      local ped = PlayerPedId()
      local model = GetEntityModel(ped)
      OriginalOutfit.model = model
      for i = 0, 11 do
            OriginalOutfit.props[i] = {
                  drawable = GetPedDrawableVariation(ped, i),
                  texture = GetPedTextureVariation(ped, i),
            }
      end

      local accessories = { 0, 1, 2, 6, 7 }
      for _, v in ipairs(accessories) do
            table.insert(OriginalOutfit.accessories, {
                  componentID = v,
                  drawableId = GetPedPropIndex(ped, v),
                  textureId = GetPedPropTextureIndex(ped, v),
                  attach = true,
            })
      end
end

local function AddAcessories()
      local ped = PlayerPedId()
      if not Config.AdminClothing.enable then return end
      ClearAllPedProps(ped)
      RemovePedHelmet(ped, true)
      for k, v in pairs(Config.AdminClothing.accessories) do
            if v.enabled then
                  if k == 'helmet' then
                        SetPedHelmetPropIndex(ped, v.propIndex)
                        SetPedHelmetTextureIndex(ped, v.textureIndex)
                        SetPedHelmet(ped, true)
                  else
                        SetPedPropIndex(ped, v.componentID, v.drawableId, v.textureId, v.attach)
                  end
            end
      end
end

RegisterNetEvent('LuxuAdmin:Client:ToggleDuty', function(duty)
      if not Config.AdminClothing.enable then return end

      if not duty then
            local ped = PlayerPedId()
            if GetEntityModel(ped) ~= OriginalOutfit.model then
                  local model = OriginalOutfit.model
                  if not HasModelLoaded(model) then
                        RequestModel(model)
                        repeat Wait(10) until HasModelLoaded(model)
                  end
                  SetPlayerModel(PlayerId(), model)
            end
            for k, v in pairs(OriginalOutfit.props) do
                  SetPedComponentVariation(ped, k, v.drawable, v.texture, 0)
            end
            ClearAllPedProps(ped)
            RemovePedHelmet(ped, true)
            for _, v in ipairs(OriginalOutfit.accessories) do
                  SetPedPropIndex(ped, v.componentID, v.drawableId, v.textureId, v.attach)
            end
      else
            SaveOutfit()
            AddAcessories()
      end
end)


-- This will execute everytime we move using noclip or teleport
-- Add your anticheat bypass here
function TeleportBypass()
      TriggerEvent("PAC:IgnoreNextTeleportFlag")
end
