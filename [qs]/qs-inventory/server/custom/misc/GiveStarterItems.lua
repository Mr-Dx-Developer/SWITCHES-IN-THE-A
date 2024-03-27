--[[
    We recommend not modifying anything on this side, the Starter Items
    are all in your server/custom/framework/esx.lua, it won't work in
    qb-core since that framework has its native ones that do it automatically.
]]

RegisterServerEvent(Config.InventoryPrefix .. ':server:GiveStarterItems')
AddEventHandler(Config.InventoryPrefix .. ':server:GiveStarterItems', function()
	local src = source
	local identifier = GetPlayerIdentifier(src)
	local info = {}

	for k, v in pairs(StarterItems) do
		if k == 'id_card' then
			local _, charinfo = GetUserName(identifier)
			info.citizenid = charinfo.citizenid
			info.firstname = charinfo.firstname
			info.lastname = charinfo.lastname
			info.birthdate = charinfo.birthdate
			info.gender = Config.Genders[charinfo.gender]
			info.nationality = charinfo.nationality
		elseif k == 'weaponlicense' then
			local _, charinfo = GetUserName(identifier)
			info.firstname = charinfo.firstname
			info.lastname = charinfo.lastname
			info.birthdate = charinfo.birthdate
			info.gender = Config.Genders[charinfo.gender]
		elseif k == 'driver_license' then
			local _, charinfo = GetUserName(identifier)
			info.firstname = charinfo.firstname
			info.lastname = charinfo.lastname
			info.birthdate = charinfo.birthdate
			info.type = 'Class C Driver License'
		end

		Wait(1250)
		AddItem(src, k, v, false, info)
	end
end)
