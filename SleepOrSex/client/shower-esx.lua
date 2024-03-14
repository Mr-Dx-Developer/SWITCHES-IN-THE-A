ESX = exports['es_extended']:getSharedObject()
--Shower
if Config.EnableShower then
	RegisterCommand(Config.CommandShower, function(source, args, raw)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		if Config.SkinChanger then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					local clothesSkin = Config.MaleShower
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				else
					local clothesSkinfemale = Config.FemaleShower
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkinfemale)
				end
			end)
		else
			if GetEntityModel(playerPed) == `mp_f_freemode_01` then
				StandaloneNakedFemalePeds()
			else
				StandaloneNakedMalePeds()
			end
		end

		shower = true
		FreezeEntityPosition(playerPed, true)
		if not HasNamedPtfxAssetLoaded('core') then
			RequestNamedPtfxAsset('core')
			while not HasNamedPtfxAssetLoaded('core') do
				Wait(1)
			end
		end

		loadAnimDict('mp_safehouseshower@male@')
		TaskPlayAnim(playerPed, 'mp_safehouseshower@male@', 'male_shower_idle_a', 1.0, 4.0, -1, 0, 0, false, false, false)

		UseParticleFxAssetNextCall('core')
		particles = StartNetworkedParticleFxNonLoopedAtCoord('ent_sht_water', coords.x, coords.y, coords.z +1.4, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		UseParticleFxAssetNextCall('core')
		Wait(3000)
		particles2 = StartNetworkedParticleFxNonLoopedAtCoord('ent_sht_water', coords.x, coords.y, coords.z +1.4, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		UseParticleFxAssetNextCall('core')
		Wait(3000)
		particles3 = StartNetworkedParticleFxNonLoopedAtCoord('ent_sht_water', coords.x, coords.y, coords.z +1.4, 0.0, 0.0, 0.0, 1.0, false, false, false, false) UseParticleFxAssetNextCall('core')
		Wait(3000)
		TaskPlayAnim(playerPed, 'mp_safehouseshower@male@', 'male_shower_idle_a', 1.0, 4.0, -1, 0, 0, false, false, false)
		particles4 = StartNetworkedParticleFxNonLoopedAtCoord('ent_sht_water', coords.x, coords.y, coords.z +1.4, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		UseParticleFxAssetNextCall('core')
		Wait(3000)
		particles5 = StartNetworkedParticleFxNonLoopedAtCoord('ent_sht_water', coords.x, coords.y, coords.z +1.4, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		timer = 8
		activeshower = true

		CreateThread(function()
			while activeshower do
				Wait(1000)
				if(timer > 0)then
					timer = timer - 1
				elseif (timer == 0) then
					shower = false
					FreezeEntityPosition(playerPed, false)
					ShowNotification(Strings['shower_done'])
					if Config.AddHealthAfterShower then
						local health = GetEntityHealth(playerPed)
						local maxHealth = GetEntityMaxHealth(playerPed)
						local newHealth = math.min(maxHealth, math.floor(health + Config.ValueHealthAfterShower))
						SetEntityHealth(playerPed, newHealth)
					end
					if Config.AddArmorAfterShower then
						AddArmourToPed(playerPed, Config.ValueArmorAfterShower)
					end
					ClearPedTasks(playerPed)
					ClearPedBloodDamage(playerPed)
					if Config.SkinChanger then
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)
					else
						if GetEntityModel(playerPed) == `mp_f_freemode_01` then
							ResetFemalePeds()
						else
							ResetMalePeds()
						end
					end
					StopParticleFxLooped(particles, 0)
					StopParticleFxLooped(particles2, 0)
					StopParticleFxLooped(particles3, 0)
					StopParticleFxLooped(particles4, 0)
					activeshower = false
				end
			end
		end)
	end, false)
end