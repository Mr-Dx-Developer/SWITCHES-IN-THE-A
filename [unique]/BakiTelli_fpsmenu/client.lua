
  

local refresh =true
local type = nil
local files = 0
local OpenMenu = false 

RegisterNetEvent("BakiTelli:fpsmenu:open", function (ms)
	openmenu(ms)
end)

RegisterNUICallback("reset", function ()
	RopeDrawShadowEnabled(true)
	refresh = true
	CascadeShadowsSetAircraftMode(true)
	CascadeShadowsEnableEntityTracker(false)
	CascadeShadowsSetDynamicDepthMode(true)
	CascadeShadowsSetEntityTrackerScale(5.0)
	CascadeShadowsSetDynamicDepthValue(5.0)
	CascadeShadowsSetCascadeBoundsScale(5.0)
	
	SetFlashLightFadeDistance(10.0)
	SetLightsCutoffDistanceTweak(10.0)
	DistantCopCarSirens(true)
	SetArtificialLightsState(false)
	type = nil
	SetTimecycleModifier()
	ClearTimecycleModifier()
	ClearExtraTimecycleModifier()
end)

function openmenu(ms)
	GetFiles()
	OpenMenu = true
	Fps = GetFPS()
	SetNuiFocus(true,true) 
	SendNUIMessage({
		action = "display",
		ServerName = Config.ServerName,
		SubName = Config.SubName,
		Discord = Config.Discord,
		Web = Config.Web,
		Ping = ms,
		Files = files,
		Fps = Fps
	})
end

Citizen.CreateThread(function()
    while true do
		if OpenMenu then
			Fps = GetFPS()
			SendNUIMessage({
				action = "fps-update",
				Fps = Fps
			})
		else
			Citizen.Wait(2000)
		end
		Citizen.Wait(2500)
    end
end)

function GetFPS()
	local fps = math.floor(1.0 / GetFrameTime())
	return fps
end

function GetFiles()
	files = 0
	for i = 0, GetNumResources() - 1 do
		files = files +1
	end
end

RegisterNUICallback("advancedchanger", function (data)
	id = tonumber(data.id)
	refresh = false 
	if id == 1 then 
		SetTimecycleModifier('yell_tunnel_nodirect')
	elseif id == 2 then 
		SetTimecycleModifier('tunnel')
		RopeDrawShadowEnabled(false)
	elseif id == 3 then 
		SetTimecycleModifier('MP_Powerplay_blend')
		SetExtraTimecycleModifier('reflection_correct_ambient')    
		RopeDrawShadowEnabled(false)
	elseif id == 4 then 
		refresh = true
		SetTimecycleModifier()
		ClearTimecycleModifier()
		ClearExtraTimecycleModifier()
	end
end)

RegisterNUICallback("fpschanger", function (data)
	id = tonumber(data.id)
	if id == 1 then 
		-- SetTimecycleModifier('yell_tunnel_nodirect')
		-- RopeDrawShadowEnabled(true)

		CascadeShadowsClearShadowSampleType()
		CascadeShadowsSetAircraftMode(false)
		CascadeShadowsEnableEntityTracker(true)
		CascadeShadowsSetDynamicDepthMode(false)
		CascadeShadowsSetEntityTrackerScale(5.0)
		CascadeShadowsSetDynamicDepthValue(3.0)
		CascadeShadowsSetCascadeBoundsScale(3.0)
  
		SetFlashLightFadeDistance(3.0)
		SetLightsCutoffDistanceTweak(3.0)
		DistantCopCarSirens(false)
		SetArtificialLightsState(false)
		type = "medium"
	elseif id == 2 then
		SetTimecycleModifier('tunnel')
		RopeDrawShadowEnabled(false)

		CascadeShadowsClearShadowSampleType()
		CascadeShadowsSetAircraftMode(false)
		CascadeShadowsEnableEntityTracker(true)
		CascadeShadowsSetDynamicDepthMode(false)
		CascadeShadowsSetEntityTrackerScale(0.0)
		CascadeShadowsSetDynamicDepthValue(0.0)
		CascadeShadowsSetCascadeBoundsScale(0.0)
  
		SetFlashLightFadeDistance(5.0)
		SetLightsCutoffDistanceTweak(5.0)
		DistantCopCarSirens(false)
		type = "low"
	elseif id == 3 then

		CascadeShadowsClearShadowSampleType()
		CascadeShadowsSetAircraftMode(false)
		CascadeShadowsEnableEntityTracker(true)
		CascadeShadowsSetDynamicDepthMode(false)
		CascadeShadowsSetEntityTrackerScale(0.0)
		CascadeShadowsSetDynamicDepthValue(0.0)
		CascadeShadowsSetCascadeBoundsScale(0.0)
  
		SetFlashLightFadeDistance(2.0)
		SetLightsCutoffDistanceTweak(0.0)
		DistantCopCarSirens(false)
		SetArtificialLightsState(false)
		type = "ulow"
	end
end)

RegisterNUICallback("close", function ()
	OpenMenu = false
	SetNuiFocus(false,false)
end)

Citizen.CreateThread(function()
    while true do
		if refresh then
        if type == "ulow" then
			--// Find closest ped and set the alpha
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    elseif GetEntityAlpha(ped) ~= 210 then
                        SetEntityAlpha(ped, 210)
                    end
                end

                SetPedAoBlobRendering(ped, false)
                Citizen.Wait(1)
            end

            --// Find closest object and set the alpha
            for obj in GetWorldObjects() do
                if not IsEntityOnScreen(obj) then
                    SetEntityAlpha(obj, 0)
                    SetEntityAsNoLongerNeeded(obj)
                else
                    if GetEntityAlpha(obj) == 0 then
                        SetEntityAlpha(obj, 255)
                    elseif GetEntityAlpha(obj) ~= 170 then
                        SetEntityAlpha(obj, 170)
                    end
                end
                Citizen.Wait(1)
            end


            DisableOcclusionThisFrame()
            SetDisableDecalRenderingThisFrame()
            RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)
            OverrideLodscaleThisFrame(0.4)
            SetArtificialLightsState(false)
        elseif type == "low" then

            --// Find closest ped and set the alpha
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    elseif GetEntityAlpha(ped) ~= 210 then
                        SetEntityAlpha(ped, 210)
                    end
                end
                SetPedAoBlobRendering(ped, false)

                Citizen.Wait(1)
            end

            --// Find closest object and set the alpha
            for obj in GetWorldObjects() do
                if not IsEntityOnScreen(obj) then
                    SetEntityAlpha(obj, 0)
                    SetEntityAsNoLongerNeeded(obj)
                else
                    if GetEntityAlpha(obj) == 0 then
                        SetEntityAlpha(obj, 255)
                    elseif GetEntityAlpha(ped) ~= 210 then
                        SetEntityAlpha(ped, 210)
                    end
                end
                Citizen.Wait(1)
            end

            SetDisableDecalRenderingThisFrame()
            RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)
            OverrideLodscaleThisFrame(0.6)
            SetArtificialLightsState(false)
        elseif type == "medium" then
			--// Find closest ped and set the alpha
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    end
                end

                SetPedAoBlobRendering(ped, false)
                Citizen.Wait(1)
            end
        
            --// Find closest object and set the alpha
            for obj in GetWorldObjects() do
                if not IsEntityOnScreen(obj) then
                    SetEntityAlpha(obj, 0)
                    SetEntityAsNoLongerNeeded(obj)
                else
                    if GetEntityAlpha(obj) == 0 then
                        SetEntityAlpha(obj, 255)
                    end
                end
                Citizen.Wait(1)
            end

            OverrideLodscaleThisFrame(0.8)
        else
            Citizen.Wait(1500)
        end
	end
        Citizen.Wait(8)
    end
end)

--// Clear broken thing, disable rain, disable wind and other tiny thing that dont require the frame tick
Citizen.CreateThread(function()
    while true do
        if type == "ulow" or type == "low" then
            ClearAllBrokenGlass()
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            ClearPedBloodDamage(PlayerPedId())
            ClearPedWetness(PlayerPedId())
            ClearPedEnvDirt(PlayerPedId())
            ResetPedVisibleDamage(PlayerPedId())
            ClearOverrideWeather()
            ClearHdArea()
            DisableVehicleDistantlights(false)
            DisableScreenblurFade()
            SetRainLevel(0.0)
            SetWindSpeed(0.0)
            Citizen.Wait(300)
        elseif type == "medium" then
            -- ClearAllBrokenGlass()
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            SetWindSpeed(0.0)
            Citizen.Wait(400)
        else
            Citizen.Wait(1500)
        end
    end
end)

--// Entity Enumerator (https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2#file-entityiter-lua)
local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(
        function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end

            local enum = {handle = iter, destructor = disposeFunc}
            setmetatable(enum, entityEnumerator)

            local next = true
            repeat
                coroutine.yield(id)
                next, id = moveFunc(iter)
            until not next

            enum.destructor, enum.handle = nil, nil
            disposeFunc(iter)
        end
    )
end

function GetWorldObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function GetWorldPeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function GetWorldVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function GetWorldPickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
