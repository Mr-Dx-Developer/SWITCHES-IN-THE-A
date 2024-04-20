---------------------------------------------------------------------------------------------
-------------------PLEASE CHECK OUR VIDEO TO KNOW HOW OUR SCRIPT WORKS-----------------------
--- Here's a bunch of unencrypted function like spawn / delete / notification              --
--- you can edit this if you want to change the notification system or if you want to add  --
--- anythiong related to the spawn or deletion of the proips used i nthis script           --
---            https://patamods.gitbook.io/patamods-documentation/scripts/baby-script      --
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------


function UPPERnotification(msg)
	SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

-- Disable controls while holding any baby props. You can uncomment the lien 10 to 26 if you want to restrict player to do some action
--Citizen.CreateThread(function()
--  while true do
--    if attachedStroller or attachedCouffin or attachedBaby then 
--      local ply = PlayerPedId()
--      local active = true
--      DisableControlAction(0, 24, active) -- Attack
--	  DisableControlAction(0, 25, active) -- aim right click
--      DisablePlayerFiring(ply, true) -- Disable weapon firing
--      DisableControlAction(0, 142, active) -- MeleeAttackAlternate
--	  DisableControlAction(0, 140, active) -- MeleeAttackAlternate
--	else 
--    Wait(100)
--	
--    end
--    Wait(2)
--  end
--end)






-- This Func are Triggered By the commands store baby You can use it to trigger your inventory system
function InventoryItemStore(typeOfObject,modelObject)
	--typeOfObject is a temporary name to identify which props is stored for example : Baby, Baby 2, Stroller 2
	--modelObject is the name of the props stored example : pata_baby, pata_baby2, pata_stroller2
end

-- (WIP) This Func are triggered by the script when you store the stroller in a car (WIP)
--function VehicleInventoryItemStore(typeOfObject,modelObject,curVeh)
	--typeOfObject is a temporary name to identify which props is stored for example : Baby, Baby 2, Stroller 2
	--modelObject is the name of the props stored example : pata_baby, pata_baby2, pata_stroller2
	--curVeh is the vehicle where you store the props
--end


function spawnObject(toto)
	tempmodel = GetHashKey(toto)
	RequestModel(tempmodel)
	
	plat = CreateObject(tempmodel,GetOffsetFromEntityInWorldCoords(GlobalPed,0.0,2.0,-1.0),true,false,true)
	SetEntityCollision(plat,false,false)
	SetEntityDynamic(plat, 	false --[[ boolean ]])
	return plat
end







--Triggered when a baby is spawned
RegisterNetEvent('PataBaby:SpawnBaby' )
AddEventHandler('PataBaby:SpawnBaby', function(model)
	-- local babyNetId = NetworkGetNetworkIdFromEntity(babyObject)
		if myAttachedBaby == nil and myAttachedStroller == nil and myAttachedCouffin == nil then
			local objecttutu = spawnObject(model)
			PickUpBaby(objecttutu)
		else
			StoreBaby()
		end
end)

--Triggered when a car seat is spawned
RegisterNetEvent('PataBaby:SpawnCouffin' )
AddEventHandler('PataBaby:SpawnCouffin', function(model)
	-- local babyNetId = NetworkGetNetworkIdFromEntity(babyObject)
		if myAttachedBaby == nil and myAttachedStroller == nil and myAttachedCouffin == nil then
			local objecttutu = spawnObject(model)
			PickUpCouffin(objecttutu)
		else
			StoreBaby()
		end
end)

--Triggered when a stroller is spawned
RegisterNetEvent('PataBaby:SpawnStroller' )
AddEventHandler('PataBaby:SpawnStroller', function(model)
	-- local babyNetId = NetworkGetNetworkIdFromEntity(babyObject)
		if myAttachedBaby == nil and myAttachedStroller == nil and myAttachedCouffin == nil then
			local objecttutu = spawnObject(model)
			PickUpStroller(objecttutu)
		else
			StoreBaby()
		end
end)

--Triggered when a stroller or a baby or a carseat is deleted
RegisterNetEvent('PataBaby:Store' )
AddEventHandler('PataBaby:Store', function(model)

	StoreBaby()
end)


function StoreBaby()
	if myAttachedStroller ~= nil then 
		local tempModel = GetEntityModel(myAttachedStroller)
		for k,v in pairs(strollerList) do
			if tempModel == v.hash then
				local tempStroller = myAttachedStroller
				attachedStroller = false
				local tempBaby,_,_ ,_ = getBabyInObject(tempStroller,v)
				local timeout = 5
				while tempBaby > 0 do
					DetachEntity(tempBaby, true, true)
					Wait(5)
					DeleteEntity(tempBaby)
					timeout = timeout - 1
					if timeout < 0 then
						break;
					end
					tempBaby,_,_ ,_ = getBabyInObject(tempStroller,v)
				end
				Wait(5)
				DetachEntity(tempStroller, true, true)
				ClearPedTasks(PlayerPedId())
				DeleteEntity(tempStroller)
				InventoryItemStore(v.uiname,v.model)
				break;
			end
		end
	elseif myAttachedCouffin ~= nil then 
		local tempModel = GetEntityModel(myAttachedCouffin)
		-- local tempModel = GetEntityModel(myAttachedBaby)
		for k,v in pairs(couffinList) do
			if tempModel == v.hash then
				local tempCouffin = myAttachedCouffin
				attachedCouffin = false
				local tempBaby,_,_ ,_ = getBabyInObject(tempCouffin,v)
				local timeout = 5
				while tempBaby > 0 do
					DetachEntity(tempBaby, true, true)
					Wait(5)
					DeleteEntity(tempBaby)
					timeout = timeout - 1
					if timeout < 0 then
						break;
					end
					tempBaby,_,_ ,_ = getBabyInObject(tempStroller,v)
				end
				Wait(5)
				DetachEntity(tempCouffin, true, true)
				ClearPedTasks(PlayerPedId())
				DeleteEntity(tempCouffin)
				InventoryItemStore(v.uiname,v.model)
				break;
			end
		end
	elseif myAttachedBaby~= nil then
		local tempModel = GetEntityModel(myAttachedBaby)
		for k,v in pairs(babyList) do
			if tempModel == v.hash then
				local tempBaby = myAttachedBaby
				attachedBaby = false
				Wait(5)
				DetachEntity(tempBaby, true, true)
				ClearPedTasks(PlayerPedId())
				DeleteEntity(tempBaby)
				InventoryItemStore(v.uiname,v.model)
				break;
			end
		end
	end
end


---- DEBUG Command to spawn every baby, the command name is the name found in BabyConfig (model)
-- for k,v in pairs(babyList) do
	-- RegisterCommand(v.model, function(source, args, fullCommand)
		-- if myAttachedBaby == nil and myAttachedStroller == nil and myAttachedCouffin == nil then
		-- objecttutu = spawnObject(v.model)
		-- PickUpBaby(objecttutu)
		-- else
			-- StoreBaby()
		-- end
	-- end, false)
-- end

---- DEBUG Command to spawn every carseat, the command name is the name found in BabyConfig (model)
-- for k,v in pairs(couffinList) do
	-- RegisterCommand(v.model, function(source, args, fullCommand)
		-- if myAttachedBaby == nil and myAttachedStroller == nil and myAttachedCouffin == nil then
		-- objecttutu = spawnObject(v.model)
		-- PickUpCouffin(objecttutu)
		-- else
			-- StoreBaby()
		-- end
	-- end, false)
-- end

---- DEBUG Command to spawn every stroller, the command name is the name found in BabyConfig (model)
-- for k,v in pairs(strollerList) do
	-- RegisterCommand(v.model, function(source, args, fullCommand)
		-- if myAttachedBaby == nil and myAttachedStroller == nil and myAttachedCouffin == nil then
		-- objecttutu = spawnObject(v.model)
		-- PickUpStroller(objecttutu)
		-- else
			-- StoreBaby()
		-- end
	-- end, false)
-- end


