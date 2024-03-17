local b, c, w = false, false, 250

Citizen.CreateThread(function()		
	while true do        
        w = 250
		if DoesEntityExist(b) then
            w = 0
            if #(GetEntityCoords(b) - GetEntityCoords(PlayerPedId())) >= Config.MaxDistance then
                SetEntityCoords(b, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.0, -0.98))
            end
            if #(GetEntityCoords(b) - GetEntityCoords(PlayerPedId())) >= 2.0 then
                TaskGoToCoordAnyMeans(b, GetEntityCoords(PlayerPedId()), 5.0, 0, 0, 786603, 0xbf800000)
                w = 500
            end
        end
        Citizen.Wait(w)
    end
end)

RegisterCommand(Config.CarryArm, function()
	if not c then
		TriggerEvent('av_baby:cargar')
	else
		if DoesEntityExist(b) then
			s()
		end
	end
end)

RegisterCommand(Config.CarryShoulders, function()
	if not c then
		TriggerEvent('av_baby:caballito')
	else
		if DoesEntityExist(b) then
			s()
		end
	end	
end)

RegisterCommand(Config.Scare, function()
	if not c then
		if DoesEntityExist(b) then
			a()
		end
	end	
end)

RegisterCommand(Config.Despawn, function()
	if not c then
		DeletePed(b)
		b = false
		ClearPedTasksImmediately(p)
	else		
		if DoesEntityExist(b) then	
			s()
			DeletePed(b)
			b = false
			ClearPedTasksImmediately(p)
		end	
	end	
end)

RegisterNetEvent('av_baby:spawn')
AddEventHandler('av_baby:spawn', function(m)
	local p = PlayerPedId()
	if not DoesEntityExist(b) then
		RequestModel(m)
		while not HasModelLoaded(m) do Wait(500) end
		b = CreatePed(4, m, GetOffsetFromEntityInWorldCoords(p, 0.0, 1.0, -0.98), 0.0, true, false)
		SetEntityAsMissionEntity(b, true, true)                
		TaskSetBlockingOfNonTemporaryEvents(b, true)
		SetBlockingOfNonTemporaryEvents(b, true)
		SetPedDiesWhenInjured(b, false)
		SetPedCanPlayAmbientAnims(b, true)
		SetPedCanRagdollFromPlayerImpact(b, false)
		SetEntityInvincible(b, true)
		RequestWalking('anim_group_move_ballistic')
		SetPedMovementClipset(b, 'anim_group_move_ballistic', 0.2)
	end
end)

RegisterNetEvent('av_baby:cargar')
AddEventHandler('av_baby:cargar', function()
	local p = PlayerPedId()
	LoadAnim("anim@sports@ballgame@handball@")
	LoadAnim("amb@prop_human_seat_chair@male@elbows_on_knees@idle_a")
	LoadAnim("random@mugging3")
	LoadAnim("anim@move_m@trash")
	if #(GetEntityCoords(p) - GetEntityCoords(b)) < 2 then				
		c = true
		TaskTurnPedToFaceEntity(b,p,-1)
		Citizen.Wait(1500)
		TaskPlayAnim(b, "random@mugging3", "handsup_standing_base", 8.0, 8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(50)
		TaskPlayAnim(p, "anim@move_m@trash","pickup", 8.0, 8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1300)
		AttachEntityToEntity(b, p,GetPedBoneIndex(p, 28252), 0.150, 0.010, 0.150, 185, 100, 90,true, true, true, true, 1,true)
		Citizen.Wait(200)
		AttachEntityToEntity(b, p,GetPedBoneIndex(p, 60309), -0.10, -0.49, -0.496, 134.0, 10.0, 0.0,true, true, true, true, 1,true)
		Citizen.Wait(50)
		ClearPedTasksImmediately(b)
		ClearPedTasksImmediately(p)		
		while c do
			if Config.NoWeapons then DisablePlayerFiring(p) end
			if not IsEntityPlayingAnim(b, 'amb@prop_human_seat_chair@male@elbows_on_knees@idle_a', "idle_a", 3) then
				TaskPlayAnim(b, 'amb@prop_human_seat_chair@male@elbows_on_knees@idle_a', "idle_a", 8.0, -8, -1, 1, 0, 0, 0, 0)
			end
			if not IsEntityPlayingAnim(p, 'anim@sports@ballgame@handball@', "ball_idle", 3) then
				TaskPlayAnim(p, 'anim@sports@ballgame@handball@', "ball_idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
			end
			Citizen.Wait(5)
		end
	else
		TriggerEvent('av_baby:notification',Config.Lang['far_away'])
	end
end)

RegisterNetEvent('av_baby:caballito')
AddEventHandler('av_baby:caballito', function()
	local p = PlayerPedId()
	local nt = true
	LoadAnim("move_m@hiking")
	LoadAnim("veh@boat@speed@fds@base")
	LoadAnim("random@mugging3")
	LoadAnim("anim@move_m@trash")
	if #(GetEntityCoords(p) - GetEntityCoords(b)) < 2 then				
		c = true
		TaskTurnPedToFaceEntity(b,p,-1)
		Citizen.Wait(1500)
		TaskPlayAnim(b, "random@mugging3", "handsup_standing_base", 8.0, 8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(50)
		TaskPlayAnim(p, "anim@move_m@trash","pickup", 8.0, 8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(1300)
		AttachEntityToEntity(b, p,GetPedBoneIndex(p, 28252), 0.150, 0.010, 0.150, 185, 100, 90,true, true, true, true, 1,true)
		Citizen.Wait(200)
		AttachEntityToEntity(b, p,GetPedBoneIndex(p, 31086), 0.35, -0.35, 0.0, -0.10, 90.0, 0,true, true, true, true, 1,true)
		TaskLookAtEntity(b, p, -1, 2048, 3)
		Citizen.Wait(100)
		ClearPedTasksImmediately(b)
		ClearPedTasksImmediately(p)		
		while c do			
			if Config.NoWeapons then DisablePlayerFiring(p) end
			if IsControlJustPressed(0,Config.AnimKey) then
				nt = not nt
				if not nt then
					ClearPedTasksImmediately(p)
				end
			end			
			if not IsEntityPlayingAnim(b, 'veh@boat@speed@fds@base', "sit_high", 3) and nt then
				TaskPlayAnim(b, 'veh@boat@speed@fds@base', "sit_high", 8.0, -8, -1, 1, 0, 0, 0, 0)
			end
			if not IsEntityPlayingAnim(p, 'move_m@hiking', "idle", 3) and nt then
				TaskPlayAnim(p, 'move_m@hiking', "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
			end				
			Citizen.Wait(5)
		end
	else
		TriggerEvent('av_baby:notification',Config.Lang['far_away'])
	end
end)

function a()
	local p = PlayerPedId()
	LoadAnim("random@rescue_hostage")
	LoadAnim("anim@mp_player_intcelebrationfemale@jazz_hands")
	if #(GetEntityCoords(p) - GetEntityCoords(b)) < 2.5 then				
		TaskTurnPedToFaceEntity(b,p,-1)
		Citizen.Wait(1500)
		TaskPlayAnim(p, "anim@mp_player_intcelebrationfemale@jazz_hands","jazz_hands", 8.0, 8.0, -1, 50, 0, false, false, false)
		Citizen.Wait(2000)
		TaskPlayAnim(b, "random@rescue_hostage", "girl_struggle_loop", 8.0, 8.0, 5000, 50, 0, false, false, false)
		Citizen.Wait(6000)
		ClearPedTasksImmediately(b)
		ClearPedTasksImmediately(p)
	else
		TriggerEvent('av_baby:notification',Config.Lang['far_away'])
	end
end

function s()
	local p = PlayerPedId()
	RequestWalking('move_ped_crouched')
	c = false				
	SetPedMovementClipset(p, "move_ped_crouched", 0.25)
	Citizen.Wait(450)
	DetachEntity(b, 1, 1)
	Citizen.Wait(50)
	ClearPedTasksImmediately(b)
	ClearPedTasksImmediately(p)
	Citizen.Wait(150)				
	ResetPedMovementClipset(p,0)
end

function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

function RequestWalking(set)
	RequestAnimSet(set)
	while not HasAnimSetLoaded(set) do
		Citizen.Wait(1)
	end 
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
		if DoesEntityExist(b) then	
			DeletePed(b)
			b = false
			ClearPedTasksImmediately(p)
		end
	end
end)