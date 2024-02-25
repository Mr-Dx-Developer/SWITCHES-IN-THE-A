local function GenerateFrameworkObject()
      local prom = promise.new()
      local OBJ
      local framework = (Config.Framework):lower()
      local esx_version = (Config.ESX_Version):lower()
      --[[ Automatic ]]
      if framework == "auto" then
            if GetResourceState("es_extended") == "started" then
                  CurrentFramework = "esx"
                  if exports["es_extended"].getSharedObject then
                        OBJ = exports["es_extended"]:getSharedObject()
                        prom:resolve(OBJ)
                  else
                        TriggerEvent(Config.ESX_GetSharedObjectEvent, function(obj) prom:resolve(obj) end)
                  end
            elseif GetResourceState("qb-core") == "started" then
                  CurrentFramework = "qb"
                  OBJ = exports['qb-core']:GetCoreObject()
                  prom:resolve(OBJ)
            end
            --[[ QBCore ]]
      elseif framework == 'qb' or framework == "qbcore" then
            CurrentFramework = "qb"
            OBJ = exports['qb-core']:GetCoreObject()
            prom:resolve(OBJ)
            --[[ ESX ]]
      elseif framework == 'esx' then
            CurrentFramework = "esx"
            if esx_version == "auto" then
                  if exports["es_extended"].getSharedObject then
                        OBJ = exports["es_extended"]:getSharedObject()
                        prom:resolve(OBJ)
                  else
                        TriggerEvent(Config.ESX_GetSharedObjectEvent, function(obj) prom:resolve(obj) end)
                  end
            elseif esx_version == 'legacy' or esx_version == 'new' then
                  OBJ = exports["es_extended"]:getSharedObject()
                  prom:resolve(OBJ)
            elseif esx_version == 'old' then
                  TriggerEvent(Config.ESX_GetSharedObjectEvent, function(obj) prom:resolve(obj) end)
            end
      else
            error('Framework not found, please check LuxuModules Config.Framework')
            prom:reject()
      end
      if CurrentFramework and IsDuplicityVersion() then SetConvarReplicated("CurrentFramework", CurrentFramework) end
      return Citizen.Await(prom)
end

local function GetFrameworkObject()
      if FrameworkObj then return FrameworkObj end
      local prom = promise.new()
      while not FrameworkObj do Wait(0) end
      prom:resolve(FrameworkObj)
      return Citizen.Await(prom)
end

exports('GetFrameworkObject', GetFrameworkObject)

return GenerateFrameworkObject()
