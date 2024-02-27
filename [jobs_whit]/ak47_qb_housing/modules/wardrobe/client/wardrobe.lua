Citizen.CreateThread(function()
	if Config.Wardrobe.script == 'auto' then
		if GetResourceState('ak47_qb_clothing') == 'started' or GetResourceState('ak47_qb_clothing') == 'starting' then
			Config.Wardrobe.script = 'ak47_qb_clothing'
			return
		end
		if GetResourceState('qb-clothing') == 'started' or GetResourceState('qb-clothing') == 'starting' then
			Config.Wardrobe.script = 'qb-clothing'
			return
		end
		if GetResourceState('illenium-appearance') == 'started' or GetResourceState('illenium-appearance') == 'starting' then
			Config.Wardrobe.script = 'illenium-appearance'
			return
		end
		if GetResourceState('rcore_clothes') == 'started' or GetResourceState('rcore_clothes') == 'starting' then
			Config.Wardrobe.script = 'rcore_clothes'
			return
		end
		if GetResourceState('raid_clothes') == 'started' or GetResourceState('raid_clothes') == 'starting' then
			Config.Wardrobe.script = 'raid_clothes'
			return
		end
		print('Unable to identify skin menu! Please configure your skin menu in modules/wardrobe')
	end
end)

AddEventHandler('ak47_qb_housing:openwardrobe', function(houseid, objectid)
	if Config.Wardrobe.script == 'ak47_qb_clothing' then
		TriggerEvent('ak47_qb_clothing:openOutfit')
	elseif Config.Wardrobe.script == 'raid_clothes' then
		TriggerEvent('raid_clothes:openmenu')
	elseif Config.Wardrobe.script == 'qb-clothing' then
		TriggerEvent('qb-clothing:client:openOutfitMenu')
	elseif Config.Wardrobe.script == 'rcore_clothes' then
		TriggerEvent('rcore_clothes:openOutfits')
	elseif Config.Wardrobe.script == 'illenium-appearance' then
		TriggerEvent("illenium-appearance:client:openOutfitMenu")
	end
end)