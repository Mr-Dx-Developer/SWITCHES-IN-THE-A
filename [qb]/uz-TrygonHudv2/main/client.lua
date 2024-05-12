local speedBuffer, velBuffer, pauseActive, isCarHud, stress, speedMultiplier, PlayerData, SpeedType = {0.0,0.0}, {}, false, false, 0, nil, nil
Framework = nil
Framework = GetFramework()
Citizen.CreateThread(function()
   while Framework == nil do Citizen.Wait(750) end
   Citizen.Wait(2500)
end)
Callback = Config.Framework == "ESX" or Config.Framework == "NewESX" and Framework.TriggerServerCallback or Framework.Functions.TriggerCallback



RegisterNetEvent('SaltyChat_VoiceRangeChanged', function(voiceRange, index, availableVoiceRanges) 
   SendNUIMessage({action = "VOICE", val = index  + 1})
end)
 
RegisterNetEvent("mumble:SetVoiceData", function(player, key, value) 
   if GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId())) == player and key == 'mode' then
   SendNUIMessage({action = "VOICE", val = value})
   end
end)

RegisterNetEvent('pma-voice:setTalkingMode', function(voiceMode) 
   SendNUIMessage({action = "VOICE", val = voiceMode})
end)

RegisterNetEvent("QBCore:Player:SetPlayerData")
AddEventHandler("QBCore:Player:SetPlayerData", function(data)
   SendNUIMessage({ action = 'UPDATE_CASH',  cash = data.money.cash })
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(data)
    local JobName = Config.JobLabel and data.grade.name or data.label
    SendNUIMessage({ action = 'UPDATE_JOB',  job = data.name, label = data.label })
end)


local function calculateHealth(ped)
   local healthBase = GetEntityHealth(ped) - 100
   return GetEntityModel(ped) == `mp_f_freemode_01` and (healthBase + 25) or healthBase
end

local function sendPlayerStats(ped)
   SendNUIMessage({ action = 'HEALTH', health = calculateHealth(ped) })
   SendNUIMessage({ action = 'ARMOR',  armor = GetPedArmour(ped) })
end

Citizen.CreateThread(function()
   while true do
      Citizen.Wait(1000)
      local ped = PlayerPedId()
      sendPlayerStats(ped)
      Citizen.Wait(2500)
   end
end)

Citizen.CreateThread(function()
   local wait, LastOxygen
   while true do
      local Player = PlayerId()
      local newoxygen = GetPlayerSprintStaminaRemaining(Player)
      if IsPedInAnyVehicle(PlayerPed) then wait = 2100 end
      if LastOxygen ~= newoxygen then
         wait = 125
         if IsEntityInWater(PlayerPed) then
            oxygen = GetPlayerUnderwaterTimeRemaining(Player) * 10
         else
            oxygen = 100 - GetPlayerSprintStaminaRemaining(Player)
         end
         LastOxygen = newoxygen
         SendNUIMessage({
            action = 'STAMINA',
            stamina = math.ceil(oxygen),
         })
      else
         wait = 1850
      end
      Citizen.Wait(wait)
   end
end)


local seatbeltOn = false
local speedBuffer = {nil, nil}
local velBuffer = {nil, nil}

function Fwv(entity)
   local hr = GetEntityHeading(entity) + 90.0
   if hr < 0.0 then hr = 360.0 + hr end
   hr = hr * 0.0174533
   return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

--RegisterKeyMapping('seatbelt', 'Toggle Seatbelt', 'keyboard', Config.SeatbeltControl)

--RegisterCommand('seatbelt', function()
  -- local playerPed = PlayerPedId()
   --if IsPedInAnyVehicle(playerPed, false) then
    --  local class = GetVehicleClass(GetVehiclePedIsUsing(playerPed))
    --  if class ~= 8 and class ~= 13 and class ~= 14 then
     --    if seatbeltOn then
            -- If you want, you can put a notification belt removed information:
      --   else
            -- If you want, you can put a notification belt buckled information:
      --   end
     --    seatbeltOn = not seatbeltOn
     -- end
  -- end
--end, false)

Citizen.CreateThread(function()
   while true do
      local playerPed = PlayerPedId()
      local Veh = GetVehiclePedIsIn(playerPed, false)
      local isCarHud = true -- Replace as per your context.

      if isCarHud then
         if seatbeltOn then DisableControlAction(0, 75) end
         speedBuffer[2] = speedBuffer[1]
         speedBuffer[1] = GetEntitySpeed(Veh)

         velBuffer[2] = velBuffer[1]
         velBuffer[1] = GetEntityVelocity(Veh)

         if speedBuffer[2] and GetEntitySpeedVector(Veh, true).y > 1.0  and speedBuffer[1] > 15 and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * 0.255) then
            if not seatbeltOn then
               local co = GetEntityCoords(playerPed)
               local fw = Fwv(playerPed)
               SetEntityCoords(playerPed, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
               SetEntityVelocity(playerPed, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
               Wait(500)
               SetPedToRagdoll(playerPed, 1000, 1000, 0, 0, 0, 0)
               seatbeltOn = false
            end
         end
      else
         Wait(3000)
      end
      Wait(0)
   end
end)

function getSeatbeltStatus() 
      return seatbeltOn
end



function UZ_DATA()
   Callback('UZPlayer', function(players, id, job, label, cash) 
      SendNUIMessage({ action = 'UZDATA', count = players, id = id, job = job, label = label, cash = cash}) 
   end) 
end


local function handleStatus(hunger, thirst)
   SendNUIMessage({action = "PLAYER_STATUS", hunger = hunger, thirst = thirst})
end

if Config.Framework == "ESX" or Config.Framework == "NewESX" then

   RegisterNetEvent('esx:setAccountMoney', function(account)
      if (account.name == 'money') then 
         SendNUIMessage({ action = 'UPDATE_CASH',  cash = account.money})
      end
   end)

   RegisterNetEvent('esx:setJob')
   AddEventHandler('esx:setJob', function(job) 
      SendNUIMessage({ action = "UPDATE_JOB", job = job.name, label = job.grade_label }) 
   end)

   RegisterNetEvent("esx_status:onTick")
   AddEventHandler("esx_status:onTick", function(data)
   for _,v in pairs(data) do
      if v.name == "hunger" then
         SendNUIMessage({
            action = "HUNGER",
            hunger = math.floor(v.percent)
         })
      elseif v.name == "thirst" then
         SendNUIMessage({
            action = "THIRST",
            thirst = math.floor(v.percent)
         })
      end
   end
   end)
TriggerEvent('esx_status:getStatus', 'hunger', function(status) 
    hunger = math.floor(status.val / 10000) 
end)

TriggerEvent('esx_status:getStatus', 'thirst', function(status) 
    thirst = math.floor(status.val / 10000) 
end)


RegisterNetEvent('HudPlayerLoad')
AddEventHandler('HudPlayerLoad', function(source)
   Citizen.Wait(2000)
   handleStatus(hunger, thirst)
   Citizen.Wait(1000)
   UZ_DATA()
   SendNUIMessage({ action = 'SERVER', server = Config.ServerName })
end)




elseif Config.Framework == 'QBCore' or Config.Framework == 'OLDQBCore' then
      RegisterNetEvent('HudPlayerLoad')
      AddEventHandler('HudPlayerLoad', function(source)
         Citizen.Wait(2000)
         SendNUIMessage({ action = 'SERVER', server = Config.ServerName })
         if PlayerData and PlayerData.metadata then
             local hunger = math.ceil(PlayerData.metadata["hunger"])
             local thirst = math.ceil(PlayerData.metadata["thirst"])
             handleStatus(hunger, thirst)
         else
            print("Could not pull status PlayerData loop problematic!")
         end
         Citizen.Wait(1000)
         UZ_DATA()
      end)
end

RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst) -- Triggered in qb-core
   local Hungerr = 0
   local Thirstt = 0
   if math.ceil(newHunger) > 100 then
       Hungerr = 100
   else
       Hungerr = math.ceil(newHunger)
   end
   if math.ceil(newThirst) > 100 then
       Thirstt = 100
   else
       Thirstt = math.ceil(newThirst)
   end
   handleStatus(Hungerr, Thirstt)
end)

Citizen.CreateThread(function()
   local LastStreetName1, LastStreetName2 = nil, nil
   while true do
      Citizen.Wait(2000)
     local Coords = GetEntityCoords(PlayerPedId())
     local Street1, Street2 = GetStreetNameAtCoord(Coords.x, Coords.y, Coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
     local StreetName1 = GetLabelText(GetNameOfZone(Coords.x, Coords.y, Coords.z))
     local StreetName2 = GetStreetNameFromHashKey(Street1)
     if StreetName1 ~= LastStreetName1 or StreetName2 ~= LastStreetName2 then
       if StreetName1 ~= nil and StreetName1 ~= "" and StreetName2 ~= nil and StreetName2 ~= "" then
         SendNUIMessage({
           action = 'STREET',
           StreetName1 = StreetName1,
           StreetName2 = StreetName2,
         })
         LastStreetName1, LastStreetName2 = StreetName1, StreetName2
       end
     end
     local wait = IsPedInAnyVehicle(PlayerPedId()) and 500 or 2000
     Citizen.Wait(wait)
   end
 end)
 
 
 Citizen.CreateThread(function()
   while true do
       Citizen.Wait(100)  
       local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
       if vehicle ~= 0 then
           local currentIndicatorState = GetVehicleIndicatorLights(vehicle)
           if IsControlJustReleased(0, Config.LeftSignalControl) then
               local newState = (currentIndicatorState == 0 or currentIndicatorState == 1)
               SetVehicleIndicatorLights(vehicle, 0, newState)
           end
           if IsControlJustReleased(0, Config.RightSignalControl) then
               local newState = (currentIndicatorState == 0 or currentIndicatorState == 2)
               SetVehicleIndicatorLights(vehicle, 1, newState)
           end
       end
   end
end)


RegisterNUICallback("GetSpeedClass",function(data, cb)
   SpeedType = data.class == "MP/H" and 2.23694 or 3.6
   cb("Speed Class loaded successfully!")
end)

local LastData = {
   Speed = 0,
   Rpm = 0,
   Fuel = 0,
   Engine = false,
   Signal = -1,
   Light = false
}

Citizen.CreateThread(function()
   while true do
       Citizen.Wait(100)
       local ped = PlayerPedId()
       local vehicle = GetVehiclePedIsIn(ped, false)
       if IsPedInVehicle(ped, vehicle, true) and SpeedType then
           local LightVal, LightLights, LightHighlights = GetVehicleLightsState(vehicle)
           local Light = LightLights == 1 or LightHighlights == 1
           local Speed, Rpm, Fuel, Engine, Signal, Seatbelt = GetEntitySpeed(vehicle), GetVehicleCurrentRpm(vehicle), getFuelLevel(vehicle), GetIsVehicleEngineRunning(vehicle), GetVehicleIndicatorLights(vehicle), getSeatbeltStatus()
           SendNUIMessage({ action = 'SETCARHUD', variable = true })
           DisplayRadar(true)
           if LastData.Speed ~= Speed or LastData.Rpm ~= Rpm or LastData.Fuel ~= Fuel or LastData.Engine ~= Engine or LastData.Signal ~= Signal or LastData.Light ~= Light then
               SendNUIMessage({
                   action = 'CARHUD',
                   speed = math.floor(Speed * SpeedType),
                   rpm = math.ceil(Rpm * 78),
                   fuel = Fuel,
                   engine = engineHealth,
                   state = Light,
                   seatbelt = Seatbelt,
                   signal = Signal,
                   type = Config.DefaultSpeedUnit
               })
               LastData.Speed, LastData.Rpm, LastData.Fuel, LastData.Engine, LastData.Signal, LastData.Light = Speed, Rpm, Fuel, Engine, Signal, Light
           end
       else
           SendNUIMessage({ action = 'SETCARHUD', variable = false })
           DisplayRadar(false)
           Citizen.Wait(500)
       end
   end
end)


function getSeatbeltStatus() 
    return seatbeltOn
end

local lastFuelUpdate = 0
function getFuelLevel(vehicle)
    local updateTick = GetGameTimer()
    if (updateTick - lastFuelUpdate) > 2000 then
        lastFuelUpdate = updateTick
        LastFuel = math.floor(Config.GetVehFuel(vehicle))
    end
    return LastFuel
end

RegisterKeyMapping(Config.Hud, 'Hud Settings', 'keyboard', Config.HudSettingsOpen)



RegisterCommand(Config.Hud, function()
    SendNUIMessage({ action = 'MENU' })
    SetDisplay(true, true)
    end)
    
    local display = false
    
    function SetDisplay(bool)
       display = bool
       SetNuiFocus(bool, bool)
    end
    
    RegisterNUICallback(
    "exit",
    function(data)
       SetDisplay(false)
    end
    )

    Citizen.CreateThread(function()
      local minimap = RequestScaleformMovie("minimap")
      SetRadarBigmapEnabled(true, false)
      Wait(0)
      SetRadarBigmapEnabled(false, false)
      end)
      

      CreateThread(function()
         while true do
            SetRadarBigmapEnabled(false, false)
            SetRadarZoom(1000)
            Wait(500)
         end
      end)

      RegisterNUICallback("GetMap",function(data, cb)
         if data.mapType == 'radial' then 
            local defaultAspectRatio = 1920/1080 -- Don't change this.
            local resolutionX, resolutionY = GetActiveScreenResolution()
            local aspectRatio = resolutionX/resolutionY
            local minimapOffset = 0
            if aspectRatio > defaultAspectRatio then
                minimapOffset = ((defaultAspectRatio-aspectRatio)/3.6)-0.008
            end
            RequestStreamedTextureDict("circlemap", false)
            while not HasStreamedTextureDictLoaded("circlemap") do
                Wait(150)
            end
            SetMinimapClipType(1)
            AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
            AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "circlemap", "radarmasksm")
            -- -0.0100 = nav symbol and icons left
            -- 0.180 = nav symbol and icons stretched
            -- 0.258 = nav symbol and icons raised up
            SetMinimapComponentPosition("minimap", "L", "B", 0.00999 + minimapOffset, -0.085 - minimapOffset, 0.15, 0.170);
            SetMinimapComponentPosition("minimap_mask", "L", "B", 0.2125 + minimapOffset, -0.045 - minimapOffset, 0.065, 0.20);
            SetMinimapComponentPosition('minimap_blur', 'L', 'B', 0.030 + minimapOffset, 0.009 - minimapOffset, 0.190, 0.290);
            SetBlipAlpha(GetNorthRadarBlip(), 0)
            SetMinimapClipType(1)
            SetRadarBigmapEnabled(true, false)
            Wait(0)
            SetRadarBigmapEnabled(false, false)
            
         else
            local defaultAspectRatio = 1920/1080 -- Don't change this.
            local resolutionX, resolutionY = GetActiveScreenResolution()
            local aspectRatio = resolutionX/resolutionY
            local minimapOffset = 0
            if aspectRatio > defaultAspectRatio then
                minimapOffset = ((defaultAspectRatio-aspectRatio)/3.6)-0.008
            end
            RequestStreamedTextureDict("squaremap", false)
            while not HasStreamedTextureDictLoaded("squaremap") do
                Wait(150)
            end
        
            SetMinimapClipType(0)
            AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "squaremap", "radarmasksm")
            AddReplaceTexture("platform:/textures/graphics", "radarmask1g", "squaremap", "radarmasksm")
            -- 0.0 = nav symbol and icons left
            -- 0.1638 = nav symbol and icons stretched
            -- 0.216 = nav symbol and icons raised up
            SetMinimapComponentPosition("minimap", "L", "B", 0.0 + minimapOffset, -0.047, 0.1638, 0.183)
        
            -- icons within map
            SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0 + minimapOffset, 0.0, 0.128, 0.20)
        
            -- -0.01 = map pulled left
            -- 0.025 = map raised up
            -- 0.262 = map stretched
            -- 0.315 = map shorten
            SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0 + minimapOffset, 0.025, 0.262, 0.300)
        
            SetBlipAlpha(GetNorthRadarBlip(), 0)
            SetRadarBigmapEnabled(true, false)
            SetMinimapClipType(0)
            Wait(0)
            SetRadarBigmapEnabled(false, false)
         end
         cb("Map loaded successfully!")
      end)

------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
   if Config.RemoveStress["on_swimming"].enable then
      while true do
         Citizen.Wait(10000)
         if IsPedSwimming(playerPed) then
            local val = math.random(Config.RemoveStress["on_swimming"].min, Config.RemoveStress["on_swimming"].max)
            TriggerServerEvent('hud:server:RelieveStress', val)
         end
      end
   end
   end)
   
   Citizen.CreateThread(function()
   if Config.RemoveStress["on_running"].enable then
      while true do
         Citizen.Wait(10000)
         if IsPedRunning(playerPed) then
            local val = math.random(Config.RemoveStress["on_running"].min, Config.RemoveStress["on_running"].max)
            TriggerServerEvent('hud:server:RelieveStress', val)
         end
      end
   end
   end)
   
   Citizen.CreateThread(function() -- Speeding
   if Config.AddStress["on_fastdrive"].enable  then
      while true do
         local ped = PlayerPedId() -- corrected line
         if IsPedInAnyVehicle(ped, false) then
            local speed = GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * 15
            local stressSpeed = 110
            if speed >= stressSpeed then
               TriggerServerEvent('hud:server:GainStress', math.random(Config.AddStress["on_fastdrive"].min, Config.AddStress["on_fastdrive"].max))
            end
         end
         Wait(10000)
      end
   end
   end)
   
   
   CreateThread(function() -- Shooting
   if Config.AddStress["on_shoot"].enable  then
      while true do
         local ped = playerPed
         local weapon = GetSelectedPedWeapon(ped)
         if weapon ~= `WEAPON_UNARMED` then
            if IsPedShooting(ped) then
               if math.random() < 0.15 and not IsWhitelistedWeaponStress(weapon) then
                  TriggerServerEvent('hud:server:GainStress', math.random(Config.AddStress["on_shoot"].min, Config.AddStress["on_shoot"].max))
               end
            end
         else
            Wait(900)
         end
         Wait(8)
      end
   
   end
   
   end)
   
   function IsWhitelistedWeaponStress(weapon)
      if weapon then
         for _, v in pairs(Config.WhitelistedWeaponStress) do
            if weapon == v then
               return true
            end
         end
      end
      return false
   end
   
   Citizen.CreateThread(function()
   while true do
      local ped = PlayerPedId()
      if tonumber(stress) >= 100 then
         local ShakeIntensity = GetShakeIntensity(stress)
         local FallRepeat = math.random(2, 4)
         local RagdollTimeout = (FallRepeat * 1750)
         ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
         SetFlash(0, 0, 500, 3000, 500)
   
         if not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
            SetPedToRagdollWithFall(ped, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
         end
   
         Wait(500)
         for i=1, FallRepeat, 1 do
            Wait(750)
            DoScreenFadeOut(200)
            Wait(1000)
            DoScreenFadeIn(200)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 200, 750, 200)
         end
      end
   
      if stress >= 50 then
         local ShakeIntensity = GetShakeIntensity(stress)
         ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
         SetFlash(0, 0, 500, 2500, 500)
      end
      Wait(GetEffectInterval(stress))
   end
   end)
   
   
   function GetShakeIntensity(stresslevel)
      local retval = 0.05
      local Intensity = {
         ["shake"] = {
            [1] = {
               min = 50,
               max = 60,
               intensity = 0.12,
            },
            [2] = {
               min = 60,
               max = 70,
               intensity = 0.17,
            },
            [3] = {
               min = 70,
               max = 80,
               intensity = 0.22,
            },
            [4] = {
               min = 80,
               max = 90,
               intensity = 0.28,
            },
            [5] = {
               min = 90,
               max = 100,
               intensity = 0.32,
            },
         }
      }
      for k, v in pairs(Intensity['shake']) do
         if stresslevel >= v.min and stresslevel <= v.max then
            retval = v.intensity
            break
         end
      end
      return retval
   end
   
   function GetEffectInterval(stresslevel)
      local EffectInterval = {
         [1] = {
            min = 50,
            max = 60,
            timeout = math.random(14000, 15000)
         },
         [2] = {
            min = 60,
            max = 70,
            timeout = math.random(12000, 13000)
         },
         [3] = {
            min = 70,
            max = 80,
            timeout = math.random(10000, 11000)
         },
         [4] = {
            min = 80,
            max = 90,
            timeout = math.random(8000, 9000)
         },
         [5] = {
            min = 90,
            max = 100,
            timeout = math.random(6000, 7000)
         }
      }
      local retval = 10000
      for k, v in pairs(EffectInterval) do
         if stresslevel >= v.min and stresslevel <= v.max then
            retval = v.timeout
            break
         end
      end
      return retval
   end
   
   RegisterNetEvent('hud:client:UpdateStress', function(newStress) -- Add this event with adding stress elsewhere
   stress = newStress
   SendNUIMessage({
      action = 'STRESS',
      stress = math.ceil(newStress),
   })
   end)
   
   RegisterNetEvent('esx_basicneeds:onEat')
   AddEventHandler('esx_basicneeds:onEat', function()
   if Config.RemoveStress["on_eat"].enable then
      local val = math.random(Config.RemoveStress["on_eat"].min, Config.RemoveStress["on_eat"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   
   RegisterNetEvent('consumables:client:Eat')
   AddEventHandler('consumables:client:Eat', function()
   if Config.RemoveStress["on_eat"].enable then
      local val = math.random(Config.RemoveStress["on_eat"].min, Config.RemoveStress["on_eat"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   
   
   RegisterNetEvent('consumables:client:Drink')
   AddEventHandler('consumables:client:Drink', function()
   if Config.RemoveStress["on_drink"].enable then
      local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   RegisterNetEvent('consumables:client:DrinkAlcohol')
   AddEventHandler('consumables:client:DrinkAlcohol', function()
   if Config.RemoveStress["on_drink"].enable then
      local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   
   RegisterNetEvent('devcore_needs:client:StartEat')
   AddEventHandler('devcore_needs:client:StartEat', function()
   if Config.RemoveStress["on_eat"].enable then
      local val = math.random(Config.RemoveStress["on_eat"].min, Config.RemoveStress["on_eat"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   RegisterNetEvent('devcore_needs:client:DrinkShot')
   AddEventHandler('devcore_needs:client:DrinkShot', function()
   if Config.RemoveStress["on_drink"].enable then
      local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   
   RegisterNetEvent('devcore_needs:client:StartDrink')
   AddEventHandler('devcore_needs:client:StartDrink', function()
   if Config.RemoveStress["on_drink"].enable then
      local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   
   RegisterNetEvent('esx_optionalneeds:onDrink')
   AddEventHandler('esx_optionalneeds:onDrink', function()
   if Config.RemoveStress["on_drink"].enable then
      local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   
   
   RegisterNetEvent('esx_basicneeds:onDrink')
   AddEventHandler('esx_basicneeds:onDrink', function()
   if Config.RemoveStress["on_drink"].enable then
      local val = math.random(Config.RemoveStress["on_drink"].min, Config.RemoveStress["on_drink"].max)
      TriggerServerEvent('hud:server:RelieveStress', val)
   end
   end)
   
   AddEventHandler('esx:onPlayerDeath', function()
   TriggerServerEvent('hud:server:RelieveStress', 10000)
   end)
   
   RegisterNetEvent('hospital:client:RespawnAtHospital')
   AddEventHandler('hospital:client:RespawnAtHospital', function()
   TriggerServerEvent('hud:server:RelieveStress', 10000)
   end)
   
   Citizen.CreateThread(function()
   if Config.RemoveStress["on_swimming"].enable then
      while true do
         Citizen.Wait(10000)
         if IsPedSwimming(playerPed) then
            local val = math.random(Config.RemoveStress["on_swimming"].min, Config.RemoveStress["on_swimming"].max)
            TriggerServerEvent('hud:server:RelieveStress', val)
         end
      end
   end
   end)
   
   Citizen.CreateThread(function()
   if Config.RemoveStress["on_running"].enable then
      while true do
         Citizen.Wait(10000)
         if IsPedRunning(playerPed) then
            local val = math.random(Config.RemoveStress["on_running"].min, Config.RemoveStress["on_running"].max)
            TriggerServerEvent('hud:server:RelieveStress', val)
         end
      end
   end
   end)
   

------------------------------------------------------------------------------------------------------------------------------------------------
