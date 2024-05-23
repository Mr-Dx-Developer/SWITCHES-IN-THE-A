local blueteam = {}
local redteam = {}
local ffateam = {}
local maxTeam = Config.MaxTeam
local allplayers = {}
local spectateplayers = {}
local gameStarted = false
local BombPlanted = false
local placementred = 0
local placementblue = 0
local placementffa = 0
local lives = 0
local cashprize = Config.MinWager
local richplayers = 0
local arena = math.random(1, #Config.Arenas)
local GameMode = 'Hold Your Own'
local RedFlagLocation = ' '
local BlueFlagLocation = ' '
local ABomb = ' '
local BBomb = ' '
local PaintPlayers = {}
local RedScore = 0
local BlueScore = 0
local FirstRed,SecondRed,ThirdRed,FourthRed,FithRed,SixthRed,SeventhRed,EighthRed,NinethRed,TenthRed,EleventhRed,TwelvedthRed = ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
local FirstBlue,SecondBlue,ThirdBlue,FourthBlue,FithBlue,SixthBlue,SeventhBlue,EighthBlue,NinethBlue,TenthBlue,EleventhBlue,TwelvedthBlue = ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
local GameRound = 0
local PlayerIsHoldingFlagRed
local PlayerIsHoldingFlagBlue
local GameHost
local function IsFreeForAllGameMode(Mode)
    if Mode == Config.GameModes[4].name then
        return true
    elseif Mode == Config.GameModes[5].name then
        return true
	elseif Mode == Config.GameModes[6].name then
        return true
    else
        return false
    end
end
function PugFindPlayersByItentifier(identifier)
    local players = GetPlayers()
    for _, v in ipairs(players) do
        local playerIdentifier = FWork.GetIdentifier(v)
        if playerIdentifier == identifier then
            if Config.Debug then
                print("player found:", v)
            end
            return FWork.GetPlayerFromId(v)
        end
    end
end
local function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end
local function RemoveGameItems()
	if DoesEntityExist(FlagRed) then
		DeleteEntity(FlagRed)
	end
	if DoesEntityExist(FlagBlue) then
		DeleteEntity(FlagBlue)
	end
	if DoesEntityExist(ABomb) then
		DeleteEntity(ABomb)
	end
	if DoesEntityExist(BBomb) then
		DeleteEntity(BBomb)
	end
end
local function ResetAllGameValues()
	spectateplayers = {}
	blueteam = {}
	redteam = {}
	ffateam = {}
	allplayers = {}
	GameRound = 0
	RedScore = 0
	BlueScore = 0
	PaintPlayers = {}
	gameStarted = false
	placementred = 0
	placementblue = 0
	placementffa = 0
	richplayers = 0
	lives = 0
	FirstRed,SecondRed,ThirdRed,FourthRed,FithRed,SixthRed,SeventhRed,EighthRed,NinethRed,TenthRed,EleventhRed,TwelvedthRed = ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
	FirstBlue,SecondBlue,ThirdBlue,FourthBlue,FithBlue,SixthBlue,SeventhBlue,EighthBlue,NinethBlue,TenthBlue,EleventhBlue,TwelvedthBlue = ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
	BombPlanted = false
	PlayerIsHoldingFlagBlue = false
	PlayerIsHoldingFlagRed = false
	GameHost = false
end
local function CheckToEndGame(src)
	local Rteam = (#redteam)
	local Bteam = (#blueteam)
	local winningteam = 'none'
	local teamname = 'none'
	if IsFreeForAllGameMode(GameMode) then
		winningteam = ffateam
		teamname = 'ffa'
	elseif Rteam <= 0 then
		winningteam = blueteam
		teamname = 'blue'
	elseif Bteam <= 0 then
		winningteam = redteam
		teamname = 'red'
	end
	if IsFreeForAllGameMode(GameMode) then
		if placementffa <= 1 then
			local PlayerWin
			local Winner = " "
			for _, v in pairs(ffateam) do
				PlayerWin = Config.FrameworkFunctions.GetPlayer(v)
				if Player ~= nil then
					Winner = PlayerWin.PlayerData.charinfo.firstname
				end
			end
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Winner..' won!')
				TriggerClientEvent('Pug:paintball:removeFromArena',v)
				TriggerClientEvent("Pug:client:DisableKeys",v)
			end
			if cashprize > 0 then
				local prize = round(cashprize * (#allplayers) * 0.85)
				if PlayerWin ~= nil then
					PlayerWin.AddMoney(Config.Currency, prize)
				end
				if Framework == "QBCore" then
					if Config.PaintballIsABusiness then
						local BusinessPay = round(cashprize * (#allplayers) * 0.15)
						exports["qb-banking"]:AddMoney(Config.PaintballBusinessName, tonumber(BusinessPay))
					end
				end
			end
			Wait(500)
			ResetAllGameValues()
			RemoveGameItems()
		end
	else
		if Bteam <= 0 or Rteam <= 0 then
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, teamname..' team won!')
				TriggerClientEvent('Pug:paintball:removeFromArena',v)
				TriggerClientEvent("Pug:client:DisableKeys",v)
			end
			if cashprize > 0 then
				for _, v in pairs(winningteam) do
					local Players = Config.FrameworkFunctions.GetPlayer(v)
					if Players ~= nil then
						local prize = round(cashprize * (#allplayers) / (#winningteam) * 0.85)
						if Config.Debug then
							print('red team won $', prize)
						end
						Players.AddMoney(Config.Currency, prize)
					end
				end
				if Framework == "QBCore" then
					if Config.PaintballIsABusiness then
						local BusinessPay = round(cashprize * (#allplayers) / (#winningteam) * 0.15)
						exports["qb-management"]:AddMoney(Config.PaintballBusinessName, tonumber(BusinessPay))
					end
				end
			end
			Wait(500)
			ResetAllGameValues()
			RemoveGameItems()
		end
	end
	Wait(100)
	if src and teamname == 'none' or src and teamname == 'ffa' then
		TriggerClientEvent('Pug:paintball:removeFromArena',src)
	end
end

local function RemoveAllFromArena()
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Everyone has been refunded!')
		TriggerClientEvent('Pug:paintball:removeFromArena',v)
	end
	if cashprize > 0 then
		for _, v in pairs(allplayers) do
			local Players = Config.FrameworkFunctions.GetPlayer(v)
			if Config.Debug then
				print('Everyone has been refunded $', cashprize)
			end
			Players.AddMoney(Config.Currency, cashprize)
		end
	end
	Wait(500)
	ResetAllGameValues()
	RemoveGameItems()
end

local function ResetPaintballGame(teamname,winningteam)
	if cashprize > 0 then
		for _, v in pairs(winningteam) do
			local Players = Config.FrameworkFunctions.GetPlayer(v)
			local prize = round(cashprize * (#allplayers) / (#winningteam) * 0.85)
			if Config.Debug then
				print(teamname..' team won $', prize)
			end
			Players.AddMoney(Config.Currency, prize)
		end
		if Framework == "QBCore" then
			if Config.PaintballIsABusiness then
				local BusinessPay = round(cashprize * (#allplayers) / (#winningteam) * 0.15)
				exports["qb-management"]:AddMoney(Config.PaintballBusinessName, tonumber(BusinessPay))
			end
		end
	end
	Wait(500)
	ResetAllGameValues()
	RemoveGameItems()
end

Config.FrameworkFunctions.CreateCallback('Pug:SVCB:VrVheckIfInPaintBall', function(source, cb)
    local src = source
	local IsIn = false
	for _, v in pairs(allplayers) do
		if v == src then
			IsIn = true
		end
	end
	Wait(100)
	cb(IsIn)
end)

Config.FrameworkFunctions.CreateCallback('Pug:SVCB:GetLobbyDetails', function(source, cb, Spectate)
	if Spectate then
		local Position = GetEntityCoords(GetPlayerPed(Spectate))
		lobby = {
			map = Config.Arenas[arena].name,
			location = Position,
		}
		cb(lobby)
	else
		local src = source
		local Rteam = (#redteam)
		local Bteam = (#blueteam)
		local Fteam = (#ffateam)
		local lobby = {}
		local playred
		local playblue
		local playreddisplay = {}
		local playbluedisplay = {}
		local playffaisplay = {}
		if (#allplayers) >= 1 then
			if IsFreeForAllGameMode(GameMode) then
				if Fteam >= 1 then
					local PlayersDisplayed
					for _,v in pairs(ffateam) do
						PlayersDisplayed = Config.FrameworkFunctions.GetPlayer(v)
						if PlayersDisplayed ~= nil then
							playffaisplay[#playffaisplay+1] = PlayersDisplayed.PlayerData.charinfo.firstname
						end
					end
					lobby = {
						life = lives,
						playersffa = (#ffateam),
						PlayersDisplay = playffaisplay,
						amount = cashprize,
						all = allplayers,
						map = Config.Arenas[arena].name,
						host = GameHost,
						started = gameStarted,
						mode = GameMode,
					}
				else
					lobby = {
						life = lives,
						redT = Rteam,
						blueT = Bteam,
						playsblue = '0/'..Config.MaxTeam,
						amount = cashprize,
						all = allplayers,
						map = Config.Arenas[arena].name,
						host = GameHost,
						started = gameStarted,
						mode = GameMode,
					}
				end
			else
				if Rteam >= 1 and Bteam == 0 then
					for _,v in pairs(redteam) do
						playred = Config.FrameworkFunctions.GetPlayer(v)
						if playred ~= nil then
							playreddisplay[#playreddisplay+1] = playred.PlayerData.charinfo.firstname
						end
					end
					lobby = {
						life = lives,
						redT = Rteam,
						blueT = Bteam,
						playsred = playreddisplay,
						playsblue = '0/'..Config.MaxTeam,
						amount = cashprize,
						all = allplayers,
						map = Config.Arenas[arena].name,
						host = GameHost,
						started = gameStarted,
						mode = GameMode,
					}
				elseif Bteam >= 1 and Rteam == 0 then
					for _,v in pairs(blueteam) do
						playblue = Config.FrameworkFunctions.GetPlayer(v)
						if playblue ~= nil then
							playbluedisplay[#playbluedisplay+1] = playblue.PlayerData.charinfo.firstname
						end
					end
					lobby = {
						life = lives,
						redT = Rteam,
						blueT = Bteam,
						playsred = '0/'..Config.MaxTeam,
						playsblue = playbluedisplay,
						amount = cashprize,
						all = allplayers,
						map = Config.Arenas[arena].name,
						host = GameHost,
						started = gameStarted,
						mode = GameMode,
					}
				elseif Bteam >= 1 and Rteam >= 1 then
					for _,v in pairs(blueteam) do
						playblue = Config.FrameworkFunctions.GetPlayer(v)
						if playblue ~= nil then
							playbluedisplay[#playbluedisplay+1] = playblue.PlayerData.charinfo.firstname
						end
					end
					for _,v in pairs(redteam) do
						playred = Config.FrameworkFunctions.GetPlayer(v)
						if playred ~= nil then
							playreddisplay[#playreddisplay+1] = playred.PlayerData.charinfo.firstname
						end
					end
					lobby = {
						life = lives,
						redT = Rteam,
						blueT = Bteam,
						playsred = playreddisplay,
						playsblue = playbluedisplay,
						amount = cashprize,
						map = Config.Arenas[arena].name,
						host = GameHost,
						started = gameStarted,
						all = allplayers,
						mode = GameMode,
					}
				end
			end
		else
			lobby = {
				life = lives,
				redT = Rteam,
				blueT = Bteam,
				all = allplayers,
				amount = cashprize,
				map = Config.Arenas[arena].name,
				host = GameHost,
				started = gameStarted,
				mode = GameMode,
			}
		end
		cb(lobby)
	end
end)

Config.FrameworkFunctions.CreateCallback('Pug:serverCB:Checkongoinggame', function(source, cb)
	if gameStarted then
		local PlayerPed
		local PlayersInGame = 0
		for _, v in pairs(spectateplayers) do
			if Framework == "ESX" then
				PlayerPed = FWork.GetPlayerFromId(v)
			else
				PlayerPed = FWork.Functions.GetPlayer(v)
			end
			if PlayerPed ~= nil then
				PlayersInGame = PlayersInGame + 1
			end
		end
		if PlayersInGame >= 1 then
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'ALL GAME STATS HAVE BEEN RESET! A PLAYER DID NOT DISCONNECT PROPERLY')
			ResetAllGameValues()
			RemoveGameItems()
		end
	end
	cb(gameStarted)
end)
Config.FrameworkFunctions.CreateCallback('Pug:serverCB:CheckBombStatus', function(source, cb)
	cb(BombPlanted)
end)

RegisterNetEvent("Pug:server:SetBombPlanted", function(bool)
    BombPlanted = bool
end)

RegisterNetEvent("Pug:server:BombPlantTimer", function(coords)
	local src = source
	SetTimeout(30000, function()
		if BombPlanted then
			TriggerClientEvent("Pug:Client:ApplyBombExplosion",coords)
		end
	end)
end)

RegisterNetEvent("Pug:server:DeleteClonePaintball", function(owner, entity)
    TriggerClientEvent("Pug:DeleteClonePaintball", source, owner, entity)
end)
RegisterServerEvent('Pug:SV:SetlivesOfPlayers',function(lifeNum)
	lives = lifeNum
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, lives..' lives per player has been set!')
	end
end)
RegisterServerEvent('Pug:SV:SetArenaMap',function(arenaMap)
	if arenaMap == 'random' then
		arena = math.random(1,#Config.Arenas)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Map has been set to '.. Config.Arenas[arena].name)
		end
	else
		arena = arenaMap
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Map has been set to '..Config.Arenas[arena].name)
		end
	end
end)
RegisterServerEvent('Pug:server:ChoseGameMode',function(gMode)
	local OldGameMode = GameMode
	GameMode = gMode
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'The Game Mode has been set to '..GameMode)
	end
	if IsFreeForAllGameMode(OldGameMode) and not IsFreeForAllGameMode(GameMode) then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena', v)
		end
		ResetAllGameValues()
	elseif (not IsFreeForAllGameMode(OldGameMode)) and (IsFreeForAllGameMode(GameMode)) then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena', v)
		end
		ResetAllGameValues()
	end
end)
RegisterServerEvent('Pug:SV:SetWagerOfLobby',function(WageNum)
	cashprize = WageNum
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, '$'..cashprize..' has been set for the prize pool!')
	end
end)

Config.FrameworkFunctions.CreateCallback('Pug:SVCB:Specatateplayers', function(source, cb)
    local src = source
	local info = {}
	if gameStarted then
		if (#spectateplayers) >= 1 then
			for _, v in pairs(spectateplayers) do
				local targetped = GetPlayerPed(v)
				local ped = Config.FrameworkFunctions.GetPlayer(v)
				table.insert(info, {
					coords = GetEntityCoords(targetped),
					name = ped.PlayerData.charinfo.firstname,
                    id = v,
                })
			end
		else
			cb(false)
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, 'There are no players in game')
		end
	else
		cb(false)
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, 'A game needs to be ongoing to spectate')
		TriggerClientEvent("Pug:client:ViewLobby", src)
	end
	cb(info)
end)

RegisterServerEvent('Pug:SV:NotifyLivesLeft',function(lifeLeft)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' has '..lifeLeft..' lives left')
		TriggerClientEvent("Pug:client:PlayerKilledNotification", v)
	end
end)
RegisterServerEvent('Pug:paintball:Leave',function(team)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	local TeamTable = 'none'
	local TeamName = 'none'
	if IsFreeForAllGameMode(GameMode) then
		TeamTable = ffateam
		TeamName = 'FFA'
	elseif team == 'redteam' then
		TeamTable = redteam
		TeamName = 'red'
	else
		TeamTable = blueteam
		TeamName = 'blue'
	end
	for k, v in pairs(allplayers) do
		if v == src then
			-- table.remove(allplayers,k)
			allplayers[k] = nil
		end
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' left the '..TeamName..' team!', 'error')
		TriggerClientEvent("Pug:client:PlayerKilledNotification", v)
	end
	for k,v in pairs(TeamTable) do
		if v == src then
			if IsFreeForAllGameMode(GameMode) then
				placementffa = placementffa - 1
			elseif TeamName == 'blue' then
				placementblue = placementblue - 1
			else
				placementred = placementred - 1
			end
			-- table.remove(TeamTable,k)
			TeamTable[k] = nil
		end
	end
	for k,v in pairs(spectateplayers) do
		if v == src then
			-- table.remove(spectateplayers,k)
			spectateplayers[k] = nil
		end
	end
	TriggerClientEvent('Pug:paintball:removeFromArena', src)
	local Rteam = (#redteam)
	local Bteam = (#blueteam)
	if IsFreeForAllGameMode(GameMode) then
		
	else
		if Rteam <= 0 and Bteam <= 0 then
			ResetAllGameValues()
			RemoveGameItems()
		end
	end
end)

AddEventHandler('playerDropped', function()
    local src = tonumber(source)
	local PlayerLost = false
	local CID = nil
	if GameHost then
		if src == GameHost then
			GameHost = false
		end
	end
	for k, v in pairs(allplayers) do
		if v == src then
			for key, _ in pairs(PaintPlayers) do
				if PaintPlayers[key].src == src then
					CID = key
				end 
			end
			if Config.Debug then
				print(PaintPlayers[CID].name ..' Lagged out!')
			end
			PlayerLost = true
			-- table.remove(allplayers,k)
			allplayers[k] = nil
			for _, j in pairs(allplayers) do
				if CID then
					if PaintPlayers[CID].name ~= nil then
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', j, PaintPlayers[CID].name ..' Lagged out!', 'error')
						TriggerClientEvent("Pug:client:PlayerKilledNotification", j)
					end
				end
			end
		end
	end
	Wait(550)
	if PlayerLost then
		if Config.Debug then
			print(CID, 'cid')
		end
		-- PaintPlayers[CID] = {} -- I think resetting there info here caused scoreboard error.
		for k,v in pairs(blueteam) do
			if v == src then
				-- table.remove(blueteam,k)
				blueteam[k] = nil
				placementblue = placementblue - 1
			end
		end
		Wait(100)
		for k,v in pairs(redteam) do
			if v == src then
				-- table.remove(redteam,k)
				redteam[k] = nil
				placementred = placementred - 1
			end
		end
		Wait(100)
		for k,v in pairs(ffateam) do
			if v == src then
				-- table.remove(redteam,k)
				ffateam[k] = nil
				placementffa = placementffa - 1
			end
		end
		Wait(100)
		for k,v in pairs(spectateplayers) do
			if v == src then
				-- table.remove(spectateplayers,k)
				spectateplayers[k] = nil
			end
		end
		Wait(100)
		CheckToEndGame(src)
	end
end)

RegisterServerEvent('Pug:paintball:JoinTeam',function(team)
	local _source = source
	local Player = Config.FrameworkFunctions.GetPlayer(source)
	local team = team
	local Rteam = (#redteam)
	local Bteam = (#blueteam)
	local Fteam = (#ffateam)
	if IsFreeForAllGameMode(GameMode) then
		if Fteam < 24 then
			table.insert(ffateam,source)
			table.insert(allplayers,source)
			table.insert(spectateplayers,source)
			placementffa = placementffa + 1
			TriggerClientEvent('Pug:paintball:joinedTeam',_source,"ffa",placementffa)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' joined the game!')
			end
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'Game is full', 'error')
		end
	else
		if team == 'redteam' then
			if Rteam < maxTeam then
				table.insert(redteam,source)
				table.insert(allplayers,source)
				table.insert(spectateplayers,source)
				placementred = placementred + 1
				TriggerClientEvent('Pug:paintball:joinedTeam',_source,team,placementred)
				for _, v in pairs(allplayers) do
					TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' joined the red team!', 'error')
				end
			else
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'Team is full', 'error')
			end
		else
			if Bteam < maxTeam then
				table.insert(blueteam,source)
				table.insert(allplayers,source)
				table.insert(spectateplayers,source)
				placementblue = placementblue + 1
				TriggerClientEvent('Pug:paintball:joinedTeam',_source,team,placementblue)
				for _, v in pairs(allplayers) do
					TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' joined the blue team!')
				end
			else
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'Team is full', 'error')
			end
		end
	end
end)

RegisterServerEvent('Pug:paintball:RemovePlayer',function(team)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	if IsFreeForAllGameMode(GameMode) then
		for k,v in pairs(ffateam) do
			if v == src then
				-- table.remove(ffateam,k)
				ffateam[k] = nil
				for i,j in pairs(spectateplayers) do
					if j == src then
						-- table.remove(spectateplayers,i)
						spectateplayers[i] = nil
					end
				end
				placementffa = placementffa - 1
				for _, v in pairs(allplayers) do
					if placementffa >= 1 then -- I MIGHT HAVE TO CHANGE THIS TO 0??
						TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "eliminated", 0.5)
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' has been eliminated!')
						Wait(1000)
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, placementffa..' players left in the FFA!')
					else
						TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "jointeam", 0.09)
					end
				end
			end
		end
	else
		if team == 'redteam' then
			for k,v in pairs(redteam) do
				if v == src then
					-- table.remove(redteam,k)
					redteam[k] = nil
					for i,j in pairs(spectateplayers) do
						if j == src then
							-- table.remove(spectateplayers,i)
							spectateplayers[i] = nil
						end
					end
					placementred = placementred - 1
					for _, v in pairs(allplayers) do
						if placementred >= 1 then
							TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "eliminated", 0.5)
							TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' has been eliminated!')
							Wait(1000)
							TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, placementred..' players left on the red team!')
						else
							TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
						end
					end
				end
			end
		else
			for k,v in pairs(blueteam) do
				if v == src then
					-- table.remove(blueteam,k)
					blueteam[k] = nil
					for i,j in pairs(spectateplayers) do
						if j == src then
							-- table.remove(spectateplayers,i)
							spectateplayers[i] = nil
						end
					end
					placementblue = placementblue - 1
					for _, v in pairs(allplayers) do
						if placementblue >= 1 then
							TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "eliminated", 0.5)
							TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' has been eliminated!')
							Wait(1000)
							TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, placementblue..' players left on the blue team!')
						else
							TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "blueteam", 0.5)
						end
					end
				end
			end
		end
	end
	Wait(700)
	CheckToEndGame(src)
end)
local function moneycheck(players)
	local Player = players
	if Framework == "QBCore" then
		local bankBalance = Player.PlayerData.money.cash
		if Config.Currency == "bank" then
			bankBalance = Player.PlayerData.money.bank
		end
		if bankBalance >= cashprize then
			richplayers = richplayers + 1
			return true
		end
		richplayers = richplayers - 1
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. ' '.. Player.PlayerData.charinfo.lastname ..'is missing '.. cashprize - bankBalance)
		end
		return false
	else
		local bankBalance = Player.getAccount('money').money
		if Config.Currency == "bank" then
			bankBalance = Player.getAccount('bank').money
		end
		if bankBalance >= cashprize then
			richplayers = richplayers + 1
			return true
		end
		richplayers = richplayers - 1
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.get('firstName') .. ' '.. Player.get('lastName') ..'is missing '.. cashprize - bankBalance)
		end
		return false
	end
end
if Framework == "ESX" then
	RegisterServerEvent('Pug:paintball:startGame',function()
		local src = source
		local CanStartGame
		local Whitelisted
		for _,v in pairs(Config.WhitelistedCIDsToStartGame) do
			Whitelisted = true
			local CIDPlayer = FWork.GetIdentifier(src)
			if string.upper(CIDPlayer) == string.upper(v) then
				CanStartGame = true
				break
			end
		end
		if Whitelisted then
			if not CanStartGame then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, 'You are not whitelisted to start a game.')
				return
			end
		end
		local FFA
		if IsFreeForAllGameMode(GameMode) then
			FFA = true
		end
		if (#redteam) >= 1 and (#blueteam) >= 1 or not Config.RequirePlayersOnBothTeams or FFA then
			if not gameStarted then
				if cashprize > 0 then
					for _, v in pairs(allplayers) do
						local Player = FWork.GetPlayerFromId(v)
						if Player ~= nil then
							moneycheck(Player)
							if richplayers >= (#allplayers) then
								gameStarted = true
								-- if arena == 'random' then
								-- 	arena = math.random(1,#Config.Arenas)
								-- end
							end
						else
							for u, j in pairs(allplayers) do
								if j == v then
									-- table.remove(allplayers,u)
									allplayers[u] = nil
								end
							end
							for i,t in pairs(spectateplayers) do
								if t == v then
									-- table.remove(spectateplayers,i)
									spectateplayers[i] = nil
								end
							end
							TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Your information was not gathered.')
							print("ID: "..v.." INFORMATION COULD NOT BE GATHERED")
						end
					end
				else
					gameStarted = true
				end
				Wait(100)
				if gameStarted then
					if FFA then
						blueteam = {}
						redteam = {}
						local Weapons
						if GameMode == Config.GameModes[4].name then
							Weapons = GetRandomGunGameWeapons()
						end
						for k, v in pairs(allplayers) do
							local Players = FWork.GetPlayerFromId(v)
							if Players ~= nil then
								local Ped = GetPlayerPed(v)
								local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
								if cashprize > 0 then
									Players.removeMoney(cashprize)
								end
								PaintPlayers[FWork.GetIdentifier(v)] = {
									src = v,
									kills = 0,
									Position = k,
									deaths = 0,
									points = 0,
									team = 'ffa',
									coords = Location,
									name = Players.get('firstName'),
								}
								TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode, allplayers, Weapons)
								SetPlayerRoutingBucket(v, 999)
								SetRoutingBucketPopulationEnabled(999, false)
							else
								for u, j in pairs(allplayers) do
									if j == v then
										-- table.remove(allplayers,u)
										allplayers[u] = nil
									end
								end
								for i,j in pairs(spectateplayers) do
									if j == v then
										-- table.remove(spectateplayers,i)
										spectateplayers[i] = nil
									end
								end
								TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Your information was not gathered.')
								print("ID: "..v.." INFORMATION COULD NOT BE GATHERED")
							end
						end
						TriggerClientEvent("Pug:client:CloseAllPaintballMenuWhenStart", -1)
						TriggerEvent("Pug:server:StartScoreboardData")
						Wait(10000)
						if Config.UavAlwaysOnDuringFFA then
							TriggerEvent("Pug:server:EnemyUAVEffectFreeForAll")
						end
					else
						ffateam = {}
						for k, v in pairs(blueteam) do
							local Players = FWork.GetPlayerFromId(v)
							if Players ~= nil then
								local Ped = GetPlayerPed(v)
								local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
								if cashprize > 0 then
									Players.removeMoney(cashprize)
								end
								PaintPlayers[FWork.GetIdentifier(v)] = {
									src = v,
									kills = 0,
									Position = k,
									deaths = 0,
									points = 0,
									team = 'blue',
									coords = Location,
									name = Players.get('firstName'),
								}
								TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode)
								TriggerClientEvent('Pug:paintball:GetBlipDtata',v,blueteam)
								SetPlayerRoutingBucket(v, 999)
								SetRoutingBucketPopulationEnabled(999, false)
							else
								for u, j in pairs(allplayers) do
									if j == v then
										-- table.remove(allplayers,u)
										allplayers[u] = nil
									end
								end
								for i,j in pairs(spectateplayers) do
									if j == v then
										-- table.remove(spectateplayers,i)
										spectateplayers[i] = nil
									end
								end
								TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Your information was not gathered.')
								print("ID: "..v.." INFORMATION COULD NOT BE GATHERED")
							end
						end
						Wait(50)
						for k, v in pairs(redteam) do
							local Players = FWork.GetPlayerFromId(v)
							if Players ~= nil then
								local Ped = GetPlayerPed(v)
								local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
								if cashprize > 0 then
									Players.removeMoney(cashprize)
								end
								PaintPlayers[FWork.GetIdentifier(v)] = {
									src = v,
									kills = 0,
									Position = k,
									deaths = 0,
									points = 0,
									team = 'red',
									coords = Location,
									name = Players.get('firstName'),
								}
								TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode)
								TriggerClientEvent('Pug:paintball:GetBlipDtata',v,redteam)
								SetPlayerRoutingBucket(v, 999)
								SetRoutingBucketPopulationEnabled(999, false)
							else
								for u, j in pairs(allplayers) do
									if j == v then
										-- table.remove(allplayers,u)
										allplayers[u] = nil
									end
								end
								for i,j in pairs(spectateplayers) do
									if j == v then
										-- table.remove(spectateplayers,i)
										spectateplayers[i] = nil
									end
								end
								TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Your information was not gathered.')
								print("ID: "..v.." INFORMATION COULD NOT BE GATHERED")
							end
						end
					end
					if GameMode == 'Search & Destroy' then
						ABomb = CreateObjectNoOffset(Config.BombSiteModel, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].x, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].y, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].z-1, 1, true, 0)
						BBomb = CreateObjectNoOffset(Config.BombSiteModel, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].x, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].y, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].z-1, 1, true, 0)
					end
					if GameMode == 'Capture The Flag' then
						RemoveGameItems()
						RedFlagLocation = Config.RedFlagLocation[Config.Arenas[arena].name]['Coords']
						BlueFlagLocation = Config.BlueFlagLocation[Config.Arenas[arena].name]['Coords']
						FlagRed = CreateObjectNoOffset(Config.RedFlagModel, RedFlagLocation.x, RedFlagLocation.y, RedFlagLocation.z, 1, true, 0)
						while not DoesEntityExist(FlagRed) do Wait(1000) if not DoesEntityExist(FlagRed) then
							FlagRed = CreateObjectNoOffset(Config.RedFlagModel, coords.x, coords.y, coords.z, 1, true, 0) end
						end
						FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0)
						while not DoesEntityExist(FlagBlue) do Wait(1000) print'loop' if not DoesEntityExist(FlagBlue) then
							FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0) end
						end
						-- Wait(1000)
						-- SetEntityRoutingBucket(FlagRed, 999)
						-- SetEntityRoutingBucket(FlagBlue, 999)
						for _, v in pairs(allplayers) do
							TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,RedFlagLocation,'red')
							TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,BlueFlagLocation,'blue')
							TriggerClientEvent('Pug:paintball:SpawnFlagLocation',v,RedFlagLocation,BlueFlagLocation)
						end
						FreezeEntityPosition(FlagRed, true)
						FreezeEntityPosition(FlagBlue, true)
					end
					Wait(50)
					if IsFreeForAllGameMode(GameMode) then
					else
						TriggerEvent("Pug:server:StartScoreboardData")
						TriggerEvent("Pug:server:RunBlipsUpdatingLoop")
					end
					TriggerClientEvent("Pug:client:CloseAllPaintballMenuWhenStart", -1)
				end
			else
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'A game is already started')
			end
			richplayers = 0
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'Needs to be at least 1 player per team', 'error')
		end
	end)
else
	RegisterServerEvent('Pug:paintball:startGame',function()
		local src = source
		local CanStartGame
		local Whitelisted
		for _,v in pairs(Config.WhitelistedCIDsToStartGame) do
			Whitelisted = true
			local CIDPlayer = FWork.Functions.GetPlayer(src)
			if string.upper(CIDPlayer.PlayerData.citizenid) == string.upper(v) then
				CanStartGame = true
				break
			end
		end
		if Whitelisted then
			if not CanStartGame then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, 'You are not whitelisted to start a game.')
				return
			end
		end
		local FFA
		if IsFreeForAllGameMode(GameMode) then
			FFA = true
		end
		if Config.RequireAdminToStartGane then
			if not QBCore.Functions.HasPermission(src, "admin") then
				TriggerClientEvent('QBCore:Notify', src, 'You need to be an admin to start the game', 'error')
				return
			end
		end
		if (#redteam) >= 1 and (#blueteam) >= 1 or not Config.RequirePlayersOnBothTeams or FFA then
			if not gameStarted then
				if cashprize > 0 then
					for _, v in pairs(allplayers) do
						local Player = FWork.Functions.GetPlayer(v)
						if Player ~= nil then
							moneycheck(Player)
							if richplayers >= (#allplayers) then
								gameStarted = true
								-- if arena == 'random' then
								-- 	arena = math.random(1,#Config.Arenas)
								-- end
							end
						else
							for u, j in pairs(allplayers) do
								if j == v then
									-- table.remove(allplayers,u)
									allplayers[u] = nil
								end
							end
							for i,t in pairs(spectateplayers) do
								if t == v then
									-- table.remove(spectateplayers,i)
									spectateplayers[i] = nil
								end
							end
							TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Your information was not gathered.')
							print("ID: "..v.." INFORMATION COULD NOT BE GATHERED")
						end
					end
				else
					gameStarted = true
				end
				Wait(100)
				if gameStarted then
					if FFA then
						blueteam = {}
						redteam = {}
						local Weapons
						if GameMode == Config.GameModes[4].name then
							Weapons = GetRandomGunGameWeapons()
						end
						for k, v in pairs(allplayers) do
							local Players = FWork.Functions.GetPlayer(v)
							if Players ~= nil then
								local Ped = GetPlayerPed(v)
								local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
								if cashprize > 0 then
									Players.Functions.RemoveMoney(Config.Currency, cashprize)
								end
								PaintPlayers[Players.PlayerData.citizenid] = {
									src = v,
									kills = 0,
									Position = k,
									deaths = 0,
									points = 0,
									team = 'ffa',
									coords = Location,
									name = Players.PlayerData.charinfo.firstname,
								}
								TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode, allplayers, Weapons)
								SetPlayerRoutingBucket(v, 999)
								SetRoutingBucketPopulationEnabled(999, false)
							else
								for u, j in pairs(allplayers) do
									if j == v then
										-- table.remove(allplayers,u)
										allplayers[u] = nil
									end
								end
								for i,j in pairs(spectateplayers) do
									if j == v then
										-- table.remove(spectateplayers,i)
										spectateplayers[i] = nil
									end
								end
								TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Your information was not gathered.')
								print("ID: "..v.." INFORMATION COULD NOT BE GATHERED")
							end
						end
						TriggerClientEvent("Pug:client:CloseAllPaintballMenuWhenStart", -1)
						TriggerEvent("Pug:server:StartScoreboardData")
						Wait(10000)
						if Config.UavAlwaysOnDuringFFA then
							TriggerEvent("Pug:server:EnemyUAVEffectFreeForAll")
						end
					else
						ffateam = {}
						for k, v in pairs(blueteam) do
							local Players = FWork.Functions.GetPlayer(v)
							if Players ~= nil then
								local Ped = GetPlayerPed(v)
								local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
								if cashprize > 0 then
									Players.Functions.RemoveMoney(Config.Currency, cashprize)
								end
								PaintPlayers[Players.PlayerData.citizenid] = {
									src = v,
									kills = 0,
									Position = k,
									deaths = 0,
									points = 0,
									team = 'blue',
									coords = Location,
									name = Players.PlayerData.charinfo.firstname,
								}
								TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode)
								TriggerClientEvent('Pug:paintball:GetBlipDtata',v,blueteam)
								SetPlayerRoutingBucket(v, 999)
								SetRoutingBucketPopulationEnabled(999, false)
							else
								for u, j in pairs(allplayers) do
									if j == v then
										-- table.remove(allplayers,u)
										allplayers[u] = nil
									end
								end
								for i,j in pairs(spectateplayers) do
									if j == v then
										-- table.remove(spectateplayers,i)
										spectateplayers[i] = nil
									end
								end
								TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Your information was not gathered.')
								print("ID: "..v.." INFORMATION COULD NOT BE GATHERED")
							end
						end
						Wait(50)
						for k, v in pairs(redteam) do
							local Players = FWork.Functions.GetPlayer(v)
							if Players ~= nil then
								local Ped = GetPlayerPed(v)
								local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
								if cashprize > 0 then
									Players.Functions.RemoveMoney(Config.Currency, cashprize)
								end
								PaintPlayers[Players.PlayerData.citizenid] = {
									src = v,
									kills = 0,
									Position = k,
									deaths = 0,
									points = 0,
									team = 'red',
									coords = Location,
									name = Players.PlayerData.charinfo.firstname,
								}
								TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode)
								TriggerClientEvent('Pug:paintball:GetBlipDtata',v,redteam)
								SetPlayerRoutingBucket(v, 999)
								SetRoutingBucketPopulationEnabled(999, false)
							else
								for u, j in pairs(allplayers) do
									if j == v then
										-- table.remove(allplayers,u)
										allplayers[u] = nil
									end
								end
								for i,j in pairs(spectateplayers) do
									if j == v then
										-- table.remove(spectateplayers,i)
										spectateplayers[i] = nil
									end
								end
								TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Your information was not gathered.')
								print("ID: "..v.." INFORMATION COULD NOT BE GATHERED")
							end
						end
					end
					if GameMode == 'Search & Destroy' then
						ABomb = CreateObjectNoOffset(Config.BombSiteModel, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].x, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].y, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].z-1, 1, true, 0)
						BBomb = CreateObjectNoOffset(Config.BombSiteModel, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].x, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].y, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].z-1, 1, true, 0)
					end
					if GameMode == 'Capture The Flag' then
						RemoveGameItems()
						RedFlagLocation = Config.RedFlagLocation[Config.Arenas[arena].name]['Coords']
						BlueFlagLocation = Config.BlueFlagLocation[Config.Arenas[arena].name]['Coords']
						FlagRed = CreateObjectNoOffset(Config.RedFlagModel, RedFlagLocation.x, RedFlagLocation.y, RedFlagLocation.z, 1, true, 0)
						while not DoesEntityExist(FlagRed) do Wait(1000) if not DoesEntityExist(FlagRed) then
							FlagRed = CreateObjectNoOffset(Config.RedFlagModel, coords.x, coords.y, coords.z, 1, true, 0) end
						end
						FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0)
						while not DoesEntityExist(FlagBlue) do Wait(1000) print'loop' if not DoesEntityExist(FlagBlue) then
							FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0) end
						end
						-- Wait(1000)
						-- SetEntityRoutingBucket(FlagRed, 999)
						-- SetEntityRoutingBucket(FlagBlue, 999)
						for _, v in pairs(allplayers) do
							TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,RedFlagLocation,'red')
							TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,BlueFlagLocation,'blue')
							TriggerClientEvent('Pug:paintball:SpawnFlagLocation',v,RedFlagLocation,BlueFlagLocation)
						end
						FreezeEntityPosition(FlagRed, true)
						FreezeEntityPosition(FlagBlue, true)
					end
					Wait(50)
					if IsFreeForAllGameMode(GameMode) then
					else
						TriggerEvent("Pug:server:StartScoreboardData")
						TriggerEvent("Pug:server:RunBlipsUpdatingLoop")
					end
					TriggerClientEvent("Pug:client:CloseAllPaintballMenuWhenStart", -1)
				end
			else
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'A game is already started')
			end
			richplayers = 0
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'Needs to be at least 1 player per team', 'error')
		end
	end)
end

-- this comes in when someone gets a kill then sends to the killer then sends the event below this one
RegisterServerEvent("Pug:server:PaintBallKillUpdate", function(kill, causes)
	if Config.Debug then
		print(kill, 'kill')
		print(causes, 'causes')
	end
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	local Killer = Config.FrameworkFunctions.GetPlayer(kill)
	if Player ~= nil then
		PaintPlayers[Player.PlayerData.citizenid].deaths = PaintPlayers[Player.PlayerData.citizenid].deaths + 1
	end
	if Killer ~= nil then
		if Config.Debug then
			print'killer kills + 1'
		end
		if Config.EnableKillStreaks or IsFreeForAllGameMode(GameMode) then
			TriggerClientEvent("Pug:client:UpdatePlayersKillStreak",kill)
		end
		PaintPlayers[Killer.PlayerData.citizenid].kills = PaintPlayers[Killer.PlayerData.citizenid].kills + 1
		if IsFreeForAllGameMode(GameMode) then
			PaintPlayers[Killer.PlayerData.citizenid].points = PaintPlayers[Killer.PlayerData.citizenid].points + 1
		end
		if GameMode == Config.GameModes[1].name then
			if PaintPlayers[Killer.PlayerData.citizenid].team == 'red' and PaintPlayers[Player.PlayerData.citizenid].team == 'blue' then
				RedScore = RedScore + 1
			elseif PaintPlayers[Killer.PlayerData.citizenid].team == 'blue' and PaintPlayers[Player.PlayerData.citizenid].team == 'red' then
				BlueScore = BlueScore + 1
			end
		end
	end
	Wait(100)
	for _, v in pairs(allplayers) do
		if Killer ~= nil then
			-- if not causes == 0 then
			if causes ~= 0 then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Killer.PlayerData.charinfo.firstname .. " " .. Killer.PlayerData.charinfo.lastname ..' '..causes..' '..Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, 'error')
			else
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Killer.PlayerData.charinfo.firstname .. " " .. Killer.PlayerData.charinfo.lastname ..' killed '..Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, 'error')
			end
		else
			-- if not causes == 0 then
			if causes ~= 0 then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, causes..' '..Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, 'error')
			else
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname..' died', 'error')
			end
		end
	end
	Wait(100)
	if Killer ~= nil then
		if PaintPlayers[Killer.PlayerData.citizenid].points >= Config.MaxFFAScore and IsFreeForAllGameMode(GameMode) then
			local Winner = PaintPlayers[Killer.PlayerData.citizenid].name
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Winner.." Won!")
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "killsoundeffect", 0.08)
				TriggerClientEvent("Pug:client:DisableKeys",v)
			end
			Wait(5000)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:removeFromArena',v)
			end
			if cashprize > 0 then
				local prize = round(cashprize * (#allplayers) * 0.85)
				Killer.AddMoney(Config.Currency, prize)
				if Framework == "QBCore" then
					if Config.PaintballIsABusiness then
						local BusinessPay = round(cashprize * (#allplayers) * 0.15)
						exports["qb-banking"]:AddMoney(Config.PaintballBusinessName, tonumber(BusinessPay))
					end
				end
			end
			Wait(500)
			ResetAllGameValues()
			RemoveGameItems()
			return
		end
	end
	Wait(100)
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:UpdateTeamsScore',v,RedScore,BlueScore)
	end
	Wait(100)
	TriggerClientEvent('Pug:client:UpdateKillsPaintball',src)
end)
RegisterServerEvent('Pug:server:EnemyUAVEffectPaintall',function(Team)
	local src = source
	for k,_ in pairs(PaintPlayers) do
		if PaintPlayers[k].team == Team then
			TriggerClientEvent('InteractSound_CL:PlayOnOne', PaintPlayers[k].src, "uaventeringao", 0.3)
		else
			TriggerClientEvent('InteractSound_CL:PlayOnOne', PaintPlayers[k].src, "enemyuav", 0.3)
		end
	end 
	local count = 0
    while count <= 10 do
        Wait(5000)
        count = count + 1
		for k,_ in pairs(PaintPlayers) do
			if PaintPlayers[k].team == Team then
			else
				local Coords = GetEntityCoords(GetPlayerPed(PaintPlayers[k].src))
				for U,_ in pairs(PaintPlayers) do
					if PaintPlayers[U].team == Team then
						TriggerClientEvent("Pug:client:AcivateUavPaintball",PaintPlayers[U].src,Coords, PaintPlayers[k].src)
					end
				end
			end
        end
    end
end)
RegisterServerEvent('Pug:server:SetAllPlayersWeapons', function(weapon)
	TriggerClientEvent("Pug:client:SetAllPlayersWeapons", -1, weapon)
end)
RegisterServerEvent('Pug:server:EnemyUAVEffectFreeForAll',function()
    while gameStarted do
        Wait(5000)
		for k,_ in pairs(PaintPlayers) do
			local Coords = GetEntityCoords(GetPlayerPed(PaintPlayers[k].src))
			TriggerClientEvent("Pug:client:AcivateUavPaintball",-1,Coords, PaintPlayers[k].src)
        end
    end
end)
local function getTeamPlayers(team)
    local teamPlayers = {}
    for id, player in pairs(PaintPlayers) do
        if player.team == team then
            table.insert(teamPlayers, { id = id, player = player })
        end
    end
    -- Sort the team players by kills in descending order
    table.sort(teamPlayers, function(a, b) return a.player.points > b.player.points end)
    return teamPlayers
end
local function updatePositionsForTeam(team)
    local teamPlayers = getTeamPlayers(team)
    for position, info in ipairs(teamPlayers) do
        local id, player = info.id, info.player
        PaintPlayers[id].Position = position
    end
end

local function updatePlayerPosition(src)
    local Player = Config.FrameworkFunctions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid
    if PaintPlayers[CitizenId] then
        if IsFreeForAllGameMode(GameMode) then
            updatePositionsForTeam('ffa')
        else
            updatePositionsForTeam('red')
            updatePositionsForTeam('blue')
        end
    end
end
local function buildScoreboardString(position, team)
    local teamString = ""
    local teamPlayers = getTeamPlayers(team)
    for i = 1, #teamPlayers do
        local player = teamPlayers[i].player
        if i == position then
            teamString = player.name.. ' | '..player.kills.. ' | '..player.deaths.. ' | '..player.points
            break
        end
    end
    return teamString
end
local function UpDateScoreBoard() 
	if not IsFreeForAllGameMode(GameMode) then
    	FirstRed, SecondRed, ThirdRed, FourthRed, FithRed, SixthRed, SeventhRed, EighthRed, NinethRed, TenthRed, EleventhRed, TwelvedthRed = buildScoreboardString(1, 'red'), buildScoreboardString(2, 'red'), buildScoreboardString(3, 'red'), buildScoreboardString(4, 'red'), buildScoreboardString(5, 'red'), buildScoreboardString(6, 'red'), buildScoreboardString(7, 'red'), buildScoreboardString(8, 'red'), buildScoreboardString(9, 'red'), buildScoreboardString(10, 'red'), buildScoreboardString(11, 'red'), buildScoreboardString(12, 'red')
    	FirstBlue, SecondBlue, ThirdBlue, FourthBlue, FithBlue, SixthBlue, SeventhBlue, EighthBlue, NinethBlue, TenthBlue, EleventhBlue, TwelvedthBlue = buildScoreboardString(1, 'blue'), buildScoreboardString(2, 'blue'), buildScoreboardString(3, 'blue'), buildScoreboardString(4, 'blue'), buildScoreboardString(5, 'blue'), buildScoreboardString(6, 'blue'), buildScoreboardString(7, 'blue'), buildScoreboardString(8, 'blue'), buildScoreboardString(9, 'blue'), buildScoreboardString(10, 'blue'), buildScoreboardString(11, 'blue'), buildScoreboardString(12, 'blue')
	else
		FirstRed, SecondRed, ThirdRed, FourthRed, FithRed, SixthRed, SeventhRed, EighthRed, NinethRed, TenthRed, EleventhRed, TwelvedthRed = buildScoreboardString(1, 'ffa'), buildScoreboardString(2, 'ffa'), buildScoreboardString(3, 'ffa'), buildScoreboardString(4, 'ffa'), buildScoreboardString(5, 'ffa'), buildScoreboardString(6, 'ffa'), buildScoreboardString(7, 'ffa'), buildScoreboardString(8, 'ffa'), buildScoreboardString(9, 'ffa'), buildScoreboardString(10, 'ffa'), buildScoreboardString(11, 'ffa'), buildScoreboardString(12, 'ffa')
    	FirstBlue, SecondBlue, ThirdBlue, FourthBlue, FithBlue, SixthBlue, SeventhBlue, EighthBlue, NinethBlue, TenthBlue, EleventhBlue, TwelvedthBlue = buildScoreboardString(13, 'ffa'), buildScoreboardString(14, 'ffa'), buildScoreboardString(15, 'ffa'), buildScoreboardString(16, 'ffa'), buildScoreboardString(17, 'ffa'), buildScoreboardString(18, 'ffa'), buildScoreboardString(19, 'ffa'), buildScoreboardString(20, 'ffa'), buildScoreboardString(21, 'ffa'), buildScoreboardString(22, 'ffa'), buildScoreboardString(23, 'ffa'), buildScoreboardString(24, 'ffa')
	end
    for _, v in pairs(allplayers) do
        TriggerClientEvent("Pug:Client:UpdatePaintballLeaderBoardPositions", v, FirstRed, SecondRed, ThirdRed, FourthRed, FithRed, SixthRed, SeventhRed, EighthRed, NinethRed, TenthRed, EleventhRed, TwelvedthRed, FirstBlue, SecondBlue, ThirdBlue, FourthBlue, FithBlue, SixthBlue, SeventhBlue, EighthBlue, NinethBlue, TenthBlue, EleventhBlue, TwelvedthBlue)
    end
	-- for k,_ in pairs(PaintPlayers) do
	-- 	if Config.Debug then
	-- 		print(PaintPlayers[k].Position, 'pos')
	-- 	end
	-- 	if PaintPlayers[k].Position == 1 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 1 and FFA then
	-- 		FirstRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(FirstRed, ' =d 1 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 2 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 2 and FFA then
	-- 		SecondRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(SecondRed, ' =d 2 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 3 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 3 and FFA then
	-- 		ThirdRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(ThirdRed, ' =d 3 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 4 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 4 and FFA then
	-- 		FourthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(FourthRed, ' =d 4 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 5 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 5 and FFA then
	-- 		FithRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(FithRed, ' =d 5 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 6 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 6 and FFA then
	-- 		SixthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(SixthRed, ' =d 6 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 7 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 7 and FFA then
	-- 		SeventhRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(SeventhRed, ' =d 7 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 8 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 8 and FFA then
	-- 		EighthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(EighthRed, ' =d 8 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 9 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 9 and FFA then
	-- 		NinethRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(NinethRed, ' =d 9 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 10 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 10 and FFA then
	-- 		TenthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(TenthRed, ' =d 10 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 11 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 11 and FFA then
	-- 		EleventhRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(EleventhRed, ' =d 11 red')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 12 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 12 and FFA then
	-- 		TwelvedthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(TwelvedthRed, ' =d 12 red')
	-- 		end
	-- 	end
	-- 	if PaintPlayers[k].Position == 1 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 13 and FFA then
	-- 		FirstBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(FirstBlue, ' =d 1 v')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 2 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 14 and FFA then
	-- 		SecondBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(SecondBlue, ' =d 2 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 3 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 15 and FFA then
	-- 		ThirdBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(ThirdBlue, ' =d 3 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 4 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 16 and FFA then
	-- 		FourthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(FourthBlue, ' =d 4 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 5 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 17 and FFA then
	-- 		FithBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(FithBlue, ' =d 5 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 6 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 18 and FFA then
	-- 		SixthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(SixthBlue, ' =d 6 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 7 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 19 and FFA then
	-- 		SeventhBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(SeventhBlue, ' =d 7 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 8 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 20 and FFA then
	-- 		EighthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(EighthBlue, ' =d 8 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 9 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 21 and FFA then
	-- 		NinethBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(NinethBlue, ' =d 9 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 10 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 22 and FFA then
	-- 		TenthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(TenthBlue, ' =d 10 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 11 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 23 and FFA then
	-- 		EleventhBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(EleventhBlue, ' =d 11 blue')
	-- 		end
	-- 	elseif PaintPlayers[k].Position == 12 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 24 and FFA then
	-- 		TwelvedthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
	-- 		if Config.Debug then
	-- 			print(TwelvedthBlue, ' =d 12 blue')
	-- 		end
	-- 	end
	-- end
	-- for _,v in pairs(allplayers) do
	-- 	TriggerClientEvent("Pug:Client:UpdatePaintballLeaderBoardPositions", v,FirstRed,SecondRed,ThirdRed,FourthRed,FithRed,SixthRed,SeventhRed,EighthRed,NinethRed,TenthRed,EleventhRed,TwelvedthRed,FirstBlue,SecondBlue,ThirdBlue,FourthBlue,FithBlue,SixthBlue,SeventhBlue,EighthBlue,NinethBlue,TenthBlue,EleventhBlue,TwelvedthBlue)
	-- end
end

-- this gets sent when the kill sends it after getting his kill
RegisterNetEvent("Pug:Server:UpdatePaintballLeaderBoard", function()
	local src = source
    local Player = Config.FrameworkFunctions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid
    local AllPBallers = (#allplayers)
	local FFA
	if IsFreeForAllGameMode(GameMode) then
		FFA = true
	end
	if PaintPlayers[CitizenId] ~= nil then
		if PaintPlayers[CitizenId].team == 'red' then
			AllPBallers = (#redteam)
		elseif PaintPlayers[CitizenId].team == 'blue' then
			AllPBallers = (#blueteam)
		elseif FFA then
			AllPBallers = (#ffateam)
		end
		local place = AllPBallers
		if Config.Debug then
			print(PaintPlayers[CitizenId].kills, 'kills')
		end
		for k,_ in pairs(PaintPlayers) do
			if PaintPlayers[CitizenId].kills > PaintPlayers[k].kills and PaintPlayers[CitizenId].team == 'red' and PaintPlayers[k].team == 'red' then
				place = place - 1
				if Config.Debug then
					print'place - 1'
				end
			elseif PaintPlayers[CitizenId].kills > PaintPlayers[k].kills and PaintPlayers[CitizenId].team == 'blue' and PaintPlayers[k].team == 'blue' then
				place = place - 1
				if Config.Debug then
					print'place - 1'
				end
			elseif PaintPlayers[CitizenId].kills > PaintPlayers[k].kills and FFA then 
				place = place - 1
			end
		end
		if place == 0 then
			if Config.Debug then
				print'place was 0'
			end
			place = AllPBallers
		end
		if place < PaintPlayers[CitizenId].Position then
			if Config.Debug then
				print'place less than my old place'
			end
			for k,_ in pairs(PaintPlayers) do
				if place == PaintPlayers[k].Position and PaintPlayers[k].team == 'red' or (place == PaintPlayers[k].Position and place == AllPBallers - 1 and PaintPlayers[k].team == 'red') then
					if CitizenId == k then
					else
						if Config.Debug then
							print'bumped my place up red'
						end
						PaintPlayers[k].Position = PaintPlayers[k].Position + 1
					end
				elseif place == PaintPlayers[k].Position and PaintPlayers[k].team == 'blue' or (place == PaintPlayers[k].Position and place == AllPBallers - 1 and PaintPlayers[k].team == 'blue') then
					if CitizenId == k then
					else
						if Config.Debug then
							print'bumped my place up blue'
						end
						PaintPlayers[k].Position = PaintPlayers[k].Position + 1
					end
				elseif place == PaintPlayers[k].Position and FFA or (place == PaintPlayers[k].Position and place == AllPBallers - 1 and FFA) then
					if CitizenId == k then
					else
						if Config.Debug then
							print'bumped my place up blue'
						end
						PaintPlayers[k].Position = PaintPlayers[k].Position + 1
					end
				end
			end
		end
		PaintPlayers[CitizenId].Position = place
		-- Wait(100)
		-- UpDateScoreBoard()
		-- Wait(100)
		updatePlayerPosition(src)
		Wait(100)
		UpDateScoreBoard()
		Wait(100)
		if RedScore >= Config.MaxTDMScore and GameMode == Config.GameModes[1].name then
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Red team won!')
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "blueteam", 0.5)
				TriggerClientEvent("Pug:client:DisableKeys",v)
			end
			Wait(5000)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:removeFromArena',v)
			end
			Wait(100)
			ResetPaintballGame('red', redteam)
		elseif BlueScore >= Config.MaxTDMScore and GameMode == Config.GameModes[1].name then
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Blue team won!')
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
				TriggerClientEvent("Pug:client:DisableKeys",v)
			end
			Wait(5000)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:removeFromArena',v)
			end
			Wait(100)
			ResetPaintballGame('blue', blueteam)
		-- elseif PaintPlayers[CitizenId].points >= Config.MaxFFAScore and IsFreeForAllGameMode(GameMode) then
		-- 	for _, v in pairs(allplayers) do
		-- 		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, PaintPlayers[CitizenId].name.." Won!")
		-- 		TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
		-- 		TriggerClientEvent("Pug:client:DisableKeys",v)
		-- 	end
		-- 	Wait(5000)
		-- 	for _, v in pairs(allplayers) do
		-- 		TriggerClientEvent('Pug:paintball:removeFromArena',v)
		-- 	end
		-- 	Wait(100)
		-- 	ResetPaintballGame(PaintPlayers[CitizenId].name, ffateam)
		end
	end
end)
RegisterNetEvent("Pug:server:MakePlayerGameHost", function(Player)
	local src = source
	if Player then
		if Player == "remove" then
			GameHost = false
			for _,v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, "The host was removed for going to far away")
			end
			return
		end
		if Player == GameHost then
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', Player, "You are already the game host")
			return
		end
		local NewPlayer = Config.FrameworkFunctions.GetPlayer(Player)
		if NewPlayer then
			if #(GetEntityCoords(GetPlayerPed(Player)) - GetEntityCoords(GetPlayerPed(src))) >= 20 then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "This player is too far to be given host of the lobby")
				return
			end
			GameHost = Player
			TriggerClientEvent("Pug:client:DoLobbyHostLoop", Player)
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', Player, "You are now the lobby host")
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "Player with ID: ["..Player.."] Was not found")
		end
	else
		if not GameHost then
			GameHost = src
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "You are now the lobby host")
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "Player with ID: ["..GameHost.."] is already game host")
		end
	end
end)

-- RegisterNetEvent("Pug:server:SerachAndDestroyUpdate", function(team)
-- 	local src = source
-- 	local Player = Config.FrameworkFunctions.GetPlayer(src)
-- 	local CitizenId = Player.PlayerData.citizenid
-- 	PaintPlayers[CitizenId].points = PaintPlayers[CitizenId].points + 1
-- 	UpDateScoreBoard()
-- 	if team == 'redteam' then
-- 		RedScore = RedScore + 1
-- 	elseif team == 'blueteam' then
-- 		BlueScore = BlueScore + 1
-- 	end
-- 	for _, v in pairs(allplayers) do
-- 		TriggerClientEvent('Pug:client:UpdateTeamsScore',v,RedScore,BlueScore)
-- 	end
-- 	if RedScore >= 3 then
-- 		for _, v in pairs(allplayers) do
-- 			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Red team won!')
-- 			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "blueteam", 0.5)
-- 			TriggerClientEvent("Pug:client:DisableKeys",v)
-- 		end
-- 		Wait(5000)
-- 		for _, v in pairs(allplayers) do
-- 			TriggerClientEvent('Pug:paintball:removeFromArena',v)
-- 		end
-- 		Wait(100)
-- 		ResetPaintballGame('red', redteam)
-- 	elseif BlueScore >= 3 then
-- 		for _, v in pairs(allplayers) do
-- 			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Blue team won!')
-- 			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
-- 			TriggerClientEvent("Pug:client:DisableKeys",v)
-- 		end
-- 		Wait(5000)
-- 		for _, v in pairs(allplayers) do
-- 			TriggerClientEvent('Pug:paintball:removeFromArena',v)
-- 		end
-- 		Wait(100)
-- 		ResetPaintballGame('blue', blueteam)
-- 	end
-- end)

RegisterServerEvent('Pug:server:SavePaintballItems')
AddEventHandler('Pug:server:SavePaintballItems', function(jailTime)
    local src = source
    local Player = Config.FrameworkFunctions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	local PlayerItems
	if Framework == "QBCore" then
		PlayerItems =  Player.PlayerData.items
	elseif Framework == "ESX" then
		local Player2 = FWork.GetPlayerFromId(src)
		if Config.InventoryType == "ak47_inventory" then
			if Player2 ~= nil then
				local Identify = Player2.getIdentifier()
				PlayerItems = exports["ak47_inventory"]:getInventoryItems(Identify)
			end
		elseif Config.InventoryType == "qs-inventory" then
			if Player2 ~= nil then
				local Identify = Player2.getIdentifier()
				PlayerItems = exports['qs-inventory']:GetInventory(Identify)
			end
		else
			if Player2 ~= nil then
				PlayerItems = Player2.inventory
			end
		end
	end
	local Result = MySQL.query.await('SELECT * FROM pug_paintball WHERE citizenid = ?', {CitizenId})
	if Result[1] then
		if Config.Debug then
			print(Result[1].gameitems, 'data table')
		end
		if Result[1].gameitems == "nothing" then
			MySQL.update('UPDATE pug_paintball SET gameitems = ? WHERE citizenid = ?', { json.encode(PlayerItems), CitizenId })
		end
	else
		if Config.Debug then
			print('data table not found')
		end
		MySQL.insert.await('INSERT INTO pug_paintball (citizenid, gameitems, kills, deaths, wins) VALUES (?,?,?,?,?)', {
			CitizenId, json.encode(PlayerItems), 0, 0, 0
		})
	end
	Wait(200)
	Player.ClearInventory(src)
	if Config.Debug then
		print('clearing ' .. src)
	end
end)

RegisterServerEvent('Pug:server:GivePaintballItems', function()
    local src = source
    local Player = Config.FrameworkFunctions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	local Result = MySQL.query.await('SELECT * FROM pug_paintball WHERE citizenid = ?', {CitizenId})
	if Result[1] then
		Wait(1000)
		if Config.Debug then
			print(Result[1].gameitems, 'data table2')
		end
		if Result[1].gameitems == "nothing" then
		else
			if Framework == "QBCore" then
				if json.decode(Result[1].gameitems) ~= nil then
					for k, v in pairs(json.decode(Result[1].gameitems)) do
						if tostring(string.lower(Config.InventoryType)) == "qb-inventory" then
							exports["qb-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
						elseif tostring(string.lower(Config.InventoryType)) == "lj-inventory" then
							exports["lj-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
						elseif tostring(string.lower(Config.InventoryType)) == "ps-inventory" then
							exports["ps-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
						elseif tostring(string.lower(Config.InventoryType)) == "ox_inventory" then 
							local ox_inventory = exports.ox_inventory
							if Config.Debug then
								print(v.count, "count")
							end
							ox_inventory:AddItem(src, v.name, v.count, v.metadata, v.slot)
						else
							Player.AddItem(v.name, v.amount, false, v.info)
						end
					end
				else
					print"^3 YOUR ITEMS ARE NOT SAVING PROPERLY, THIS IS AN INVENTORY ISSUE. RAISE A TICKET IN THE ^1PUG-DEVELOPMENT DISCORD ^3FOUND IN THE README"
					print("^1 YOU MUST DELETE ALL OF THE TABLES WITH NULL DATA IN THEM FROM THE PUG_PAINTBALL DATABASE TABLE. INVENTORY BEING USED IS " .. Config.InventoryType)
				end
			else
				if Config.InventoryType == "ox_inventory" then
					local ox_inventory = exports.ox_inventory
					if json.decode(Result[1].gameitems) ~= nil then
						for k, v in pairs(json.decode(Result[1].gameitems)) do
							ox_inventory:AddItem(src, v.name, v.count, v.metadata, v.slot)
						end
					else
						print"^3 YOUR ITEMS ARE NOT SAVING PROPERLY, THIS IS AN INVENTORY ISSUE. RAISE A TICKET IN THE ^1PUG-DEVELOPMENT DISCORD ^3FOUND IN THE README"
						print("^1 YOU MUST DELETE ALL OF THE TABLES WITH NULL DATA IN THEM FROM THE PUG_PAINTBALL DATABASE TABLE. INVENTORY BEING USED IS " .. Config.InventoryType)
					end
				else
					if json.decode(Result[1].gameitems) ~= nil then
						for k, v in pairs(json.decode(Result[1].gameitems)) do
							Player.AddItem(v.name, v.amount, false, v.info)
						end
					else
						print"^3 YOUR ITEMS ARE NOT SAVING PROPERLY, THIS IS AN INVENTORY ISSUE. RAISE A TICKET IN THE ^1PUG-DEVELOPMENT DISCORD ^3FOUND IN THE README"
						print("^1 YOU MUST DELETE ALL OF THE TABLES WITH NULL DATA IN THEM FROM THE PUG_PAINTBALL DATABASE TABLE. INVENTORY BEING USED IS " .. Config.InventoryType)
					end
				end
			end
			Wait(500)
			MySQL.update('UPDATE pug_paintball SET gameitems = ? WHERE citizenid = ?', { "nothing", CitizenId })
		end
	end
end)

-- STARTING BOARD
RegisterNetEvent("Pug:server:StartScoreboardData", function()
	local FFA
	if IsFreeForAllGameMode(GameMode) then
		FFA = true
	end
	for k,_ in pairs(PaintPlayers) do
		if Config.Debug then
			print(PaintPlayers[k].Position, 'pos')
		end
		if PaintPlayers[k].Position == 1 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 1 and FFA then
			FirstRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FirstRed, ' =d 1 red')
			end
		elseif PaintPlayers[k].Position == 2 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 2 and FFA then
			SecondRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SecondRed, ' =d 2 red')
			end
		elseif PaintPlayers[k].Position == 3 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 3 and FFA then
			ThirdRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(ThirdRed, ' =d 3 red')
			end
		elseif PaintPlayers[k].Position == 4 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 4 and FFA then
			FourthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FourthRed, ' =d 4 red')
			end
		elseif PaintPlayers[k].Position == 5 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 5 and FFA then
			FithRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FithRed, ' =d 5 red')
			end
		elseif PaintPlayers[k].Position == 6 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 6 and FFA then
			SixthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SixthRed, ' =d 6 red')
			end
		elseif PaintPlayers[k].Position == 7 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 7 and FFA then
			SeventhRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SeventhRed, ' =d 7 red')
			end
		elseif PaintPlayers[k].Position == 8 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 8 and FFA then
			EighthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(EighthRed, ' =d 8 red')
			end
		elseif PaintPlayers[k].Position == 9 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 9 and FFA then
			NinethRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(NinethRed, ' =d 9 red')
			end
		elseif PaintPlayers[k].Position == 10 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 10 and FFA then
			TenthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(TenthRed, ' =d 10 red')
			end
		elseif PaintPlayers[k].Position == 11 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 11 and FFA then
			EleventhRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(EleventhRed, ' =d 11 red')
			end
		elseif PaintPlayers[k].Position == 12 and PaintPlayers[k].team == 'red' or PaintPlayers[k].Position == 12 and FFA then
			TwelvedthRed = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(TwelvedthRed, ' =d 12 red')
			end
		end
		if PaintPlayers[k].Position == 1 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 13 and FFA then
			FirstBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FirstBlue, ' =d 1 v')
			end
		elseif PaintPlayers[k].Position == 2 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 14 and FFA then
			SecondBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SecondBlue, ' =d 2 blue')
			end
		elseif PaintPlayers[k].Position == 3 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 15 and FFA then
			ThirdBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(ThirdBlue, ' =d 3 blue')
			end
		elseif PaintPlayers[k].Position == 4 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 16 and FFA then
			FourthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FourthBlue, ' =d 4 blue')
			end
		elseif PaintPlayers[k].Position == 5 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 17 and FFA then
			FithBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FithBlue, ' =d 5 blue')
			end
		elseif PaintPlayers[k].Position == 6 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 18 and FFA then
			SixthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SixthBlue, ' =d 6 blue')
			end
		elseif PaintPlayers[k].Position == 7 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 19 and FFA then
			SeventhBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SeventhBlue, ' =d 7 blue')
			end
		elseif PaintPlayers[k].Position == 8 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 20 and FFA then
			EighthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(EighthBlue, ' =d 8 blue')
			end
		elseif PaintPlayers[k].Position == 9 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 21 and FFA then
			NinethBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(NinethBlue, ' =d 9 blue')
			end
		elseif PaintPlayers[k].Position == 10 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 22 and FFA then
			TenthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(TenthBlue, ' =d 10 blue')
			end
		elseif PaintPlayers[k].Position == 11 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 23 and FFA then
			EleventhBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(EleventhBlue, ' =d 11 blue')
			end
		elseif PaintPlayers[k].Position == 12 and PaintPlayers[k].team == 'blue' or PaintPlayers[k].Position == 24 and FFA then
			TwelvedthBlue = PaintPlayers[k].name.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(TwelvedthBlue, ' =d 12 blue')
			end
		end
	end
	for _,v in pairs(allplayers) do
		TriggerClientEvent("Pug:Client:UpdatePaintballLeaderBoardPositions", v,FirstRed,SecondRed,ThirdRed,FourthRed,FithRed,SixthRed,SeventhRed,EighthRed,NinethRed,TenthRed,EleventhRed,TwelvedthRed,FirstBlue,SecondBlue,ThirdBlue,FourthBlue,FithBlue,SixthBlue,SeventhBlue,EighthBlue,NinethBlue,TenthBlue,EleventhBlue,TwelvedthBlue)
	end
end)

RegisterServerEvent('Pug:Server:UpdateTeamScore',function(team)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	PaintPlayers[CitizenId].points = PaintPlayers[CitizenId].points + 1
	UpDateScoreBoard()
	if team == 'red' then
		RedScore = RedScore + 1
	elseif team == 'blue' then
		BlueScore = BlueScore + 1
	end
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:UpdateTeamsScore',v,RedScore,BlueScore)
	end
	if RedScore >= 3 then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Red team won!')
			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "blueteam", 0.5)
			TriggerClientEvent("Pug:client:DisableKeys",v)
		end
		Wait(5000)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		Wait(100)
		ResetPaintballGame('red', redteam)
	elseif BlueScore >= 3 then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Blue team won!')
			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
			TriggerClientEvent("Pug:client:DisableKeys",v)
		end
		Wait(5000)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		Wait(100)
		ResetPaintballGame('blue', blueteam)
	end
end)
RegisterServerEvent('Pug:server:UpdateFlagBlip',function(coords, team)
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,coords,team)
	end
end)

RegisterServerEvent('Pug:server:PickedUpFlagSound',function(team,type)
	local src = source
	if type == 'pickedup' then
		if team == 'redteam' then
			if not PlayerIsHoldingFlagBlue then
				PlayerIsHoldingFlagBlue = src
				for _, v in pairs(redteam) do
					TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemyflagtaken", 0.3)
					TriggerClientEvent("Pug:client:AttatchFlagToClientPlayer", v, src, team)
				end
				for _, v in pairs(blueteam) do
					TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagtaken", 0.3)
					TriggerClientEvent("Pug:client:AttatchFlagToClientPlayer", v, src, team)
				end
			end
		elseif team == 'blueteam' then
			if not PlayerIsHoldingFlagRed then
				PlayerIsHoldingFlagRed = src
				for _, v in pairs(redteam) do
					TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagtaken", 0.3)
					TriggerClientEvent("Pug:client:AttatchFlagToClientPlayer", v, src, team)
				end
				for _, v in pairs(blueteam) do
					TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemyflagtaken", 0.3)
					TriggerClientEvent("Pug:client:AttatchFlagToClientPlayer", v, src, team)
				end
			end
		end
	elseif type == 'returned' then
		if team == 'redteam' then
			PlayerIsHoldingFlagRed = false
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagreturned", 0.3)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "returned", 0.3) -- enemy flag returned
			end
		elseif team == 'blueteam' then
			PlayerIsHoldingFlagBlue = false
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "returned", 0.3)-- enemy flag returned
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagreturned", 0.3)
			end
		end
	elseif type == 'captured' then
		if team == 'redteam' then
			PlayerIsHoldingFlagBlue = false
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemycaptured", 0.1)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "captured", 0.1)
			end
		elseif team == 'blueteam' then
			PlayerIsHoldingFlagRed = false
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "captured", 0.1)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemycaptured", 0.1)
			end
		end
	end
end)

RegisterServerEvent('Pug:server:RespawnFlag',function(team, coords, NoNetwork)
	local src = source
	if team == 'red' then
		if DoesEntityExist(FlagRed) then
			DeleteEntity(FlagRed)
		end
		if coords then
			FlagRed = CreateObjectNoOffset(Config.RedFlagModel, coords.x, coords.y, coords.z, 1, true, 0)
			while not DoesEntityExist(FlagRed) do Wait(1000) if not DoesEntityExist(FlagRed) then
				FlagRed = CreateObjectNoOffset(Config.RedFlagModel, coords.x, coords.y, coords.z, 1, true, 0) end
			end
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,coords,team)
				TriggerClientEvent("Pug:client:AttatchFlagToClientPlayer", v, src, "blueteam", true)
			end
			PlayerIsHoldingFlagRed = false
			-- Wait(1000)
			-- SetEntityRoutingBucket(FlagRed, 999)
			FreezeEntityPosition(FlagRed, true)
			if NoNetwork then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "NETWORK TO THE SERVER IS POOR, FLAG WAS NOT PICKED UP.")
				print"^1NETWORK TO THE SERVER IS POOR, FLAG WAS NOT PICKED UP."
			else
				for _, v in pairs(redteam) do
					TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagdropped", 0.1)
				end
				for _, v in pairs(blueteam) do
					TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemyflagdropped", 0.1)
				end
			end
		else
			FlagRed = CreateObjectNoOffset(Config.RedFlagModel, RedFlagLocation.x, RedFlagLocation.y, RedFlagLocation.z, 1, true, 0)
			while not DoesEntityExist(FlagRed) do Wait(1000) if not DoesEntityExist(FlagRed) then
				FlagRed = CreateObjectNoOffset(Config.RedFlagModel, RedFlagLocation.x, RedFlagLocation.y, RedFlagLocation.z, 1, true, 0) end
			end
			-- Wait(1000)
			-- SetEntityRoutingBucket(FlagRed, 999)
			FreezeEntityPosition(FlagRed, true)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,RedFlagLocation,team)
				TriggerClientEvent("Pug:client:AttatchFlagToClientPlayer", v, src, "blueteam", true)
			end
			PlayerIsHoldingFlagRed = false
		end
	elseif team == 'blue' then 
		if DoesEntityExist(FlagBlue) then
			DeleteEntity(FlagBlue)
		end
		if coords then
			FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, coords.x, coords.y, coords.z, 1, true, 0)
			while not DoesEntityExist(FlagBlue) do Wait(1000) print'loop' if not DoesEntityExist(FlagBlue) then
				FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, coords.x, coords.y, coords.z, 1, true, 0) end
				print"running"
			end
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,coords,team)
				TriggerClientEvent("Pug:client:AttatchFlagToClientPlayer", v, src, "redteam", true)
			end
			PlayerIsHoldingFlagBlue = false
			-- SetEntityRoutingBucket(FlagBlue, 999)
			FreezeEntityPosition(FlagBlue, true)
			if NoNetwork then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "NETWORK TO THE SERVER IS POOR, FLAG WAS NOT PICKED UP.")
				print"^1NETWORK TO THE SERVER IS POOR, FLAG WAS NOT PICKED UP."
			else
				for _, v in pairs(redteam) do
					TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemyflagdropped", 0.1)
				end
				for _, v in pairs(blueteam) do
					TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagdropped", 0.1)
				end
			end
		else
			FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0)
			while not DoesEntityExist(FlagBlue) do Wait(1000) print'loop' if not DoesEntityExist(FlagBlue) then
				FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0) end
			end
			-- SetEntityRoutingBucket(FlagBlue, 999)
			FreezeEntityPosition(FlagBlue, true)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,BlueFlagLocation,team)
				TriggerClientEvent("Pug:client:AttatchFlagToClientPlayer", v, src, "redteam", true)
			end
			PlayerIsHoldingFlagBlue = false
		end
	end
end)
RegisterServerEvent("Pug:server:PaintballSetBucket", function(tog)
	local src = source
	if tog then
		SetPlayerRoutingBucket(src, 999)
	else
		SetPlayerRoutingBucket(src, 0)
	end
end)

if Framework == "ESX" then
	function ClearInventoryESX(source)
		local xPlayer = FWork.GetPlayerFromId(source)
		for k, _ in pairs(xPlayer.inventory) do
			if xPlayer.inventory[k].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[k].name, 0)
			end
		end
	end
	function GetInventoryItemsESX(source)
		if source then
			local src = source
			local Player = FWork.GetPlayerFromId(src)
			return Player.inventory
		end
	end
    Config.FrameworkFunctions.CreateCallback('Pug:serverESX:GetItemESXPaintball', function(source, cb, item, amount)
        local retval = false
        local Player = FWork.GetPlayerFromId(source)
        local PlayerItem = Player.getInventoryItem(item)
        local Cost = amount or 1
        if PlayerItem then
            if PlayerItem.count >= Cost then
                retval = true
            end
        end
        cb(retval)
    end)
end

Config.FrameworkFunctions.CreateCallback('Pug:serverCB:IsFlagAvailableToTake', function(source, cb, type, team)
	local retval = false
	if type == "enemy" then
		if team == 'redteam' then
			if not PlayerIsHoldingFlagBlue then
				retval = true
			end
		else
			if not PlayerIsHoldingFlagRed then
				retval = true
			end
		end
	end
	cb(retval)
end)

-- RegisterServerEvent('Pug:server:RunBlipsUpdatingLoop', function()
--     while gameStarted do
-- 		if gameStarted then
-- 			for k, v in pairs(redteam) do
-- 				local Player = Config.FrameworkFunctions.GetPlayer(v)
-- 				if Player ~= nil then
-- 					local CID = Player.PlayerData.citizenid
-- 					local Ped = GetPlayerPed(PaintPlayers[CID].src)
-- 					PaintPlayers[CID].coords = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
-- 					TriggerClientEvent('Pug:client:UpdatePaintballBlips', PaintPlayers[CID].src, PaintPlayers)
-- 				end
-- 				Wait(4)
-- 			end
-- 			for k, v in pairs(blueteam) do
-- 				local Player = Config.FrameworkFunctions.GetPlayer(v)
-- 				if Player ~= nil then
-- 					local CID = Player.PlayerData.citizenid
-- 					local Ped = GetPlayerPed(PaintPlayers[CID].src)
-- 					PaintPlayers[CID].coords = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
-- 					TriggerClientEvent('Pug:client:UpdatePaintballBlips', PaintPlayers[CID].src, PaintPlayers)
-- 				end
-- 				Wait(4)
-- 			end
-- 		else
-- 			break
-- 		end
--         Wait(700)
--     end
-- end)

RegisterServerEvent('Pug:server:GivePaintballItem', function(bool, item, amount, info)
    local src = source
    local Player = Config.FrameworkFunctions.GetPlayer(src)
	if bool then
        if amount then
            Player.AddItem(item, amount, false, info)
        else
            Player.AddItem(item, 1, false, info)
        end
        if Framework == "QBCore" then
		    TriggerClientEvent('inventory:client:ItemBox', src, FWork.Shared.Items[item], "add")
        end
    else
        if amount then
            Player.RemoveItem(item, amount)
        else
            Player.RemoveItem(item, 1)
        end
        if Framework == "QBCore" then
		    TriggerClientEvent('inventory:client:ItemBox', src, FWork.Shared.Items[item], "remove")
        end
	end
end)

if Framework == "QBCore" then
	FWork.Commands.Add(Config.RedOutfitCommand, "Save your current outfit for the red team of paintball", {}, false, function(source, args)
		local src = source
		TriggerClientEvent("Pug:client:StoreRedTeamClothes",src)
	end,"admin")
	FWork.Commands.Add(Config.BlueOutfitCommand, "Save your current outfit for the blue team of paintball", {}, false, function(source, args)
		local src = source
		TriggerClientEvent("Pug:client:StoreBlueTeamClothes",src)
	end,"admin")
else
	FWork.RegisterCommand(Config.RedOutfitCommand, 'admin', function(xPlayer, args)
		local src = xPlayer.source
		TriggerClientEvent("Pug:client:StoreRedTeamClothes",src)
	end, true, {help = 'Save your current outfit for the red team of paintball', validate = true, arguments = {} })
	FWork.RegisterCommand(Config.BlueOutfitCommand, 'admin', function(xPlayer, args)
		local src = xPlayer.source
		TriggerClientEvent("Pug:client:StoreBlueTeamClothes",src)
	end, true, {help = 'Save your current outfit for the blue team of paintball', validate = true, arguments = {} })
end

RegisterNetEvent('Pug:server:UpdateRedTeamsClothes', function(Data)
	local src = source
	MySQL.ready(function()
		MySQL.Async.fetchScalar("SHOW TABLES LIKE 'paintball_outfits'", {}, function(result)
			if not result then
				print("^1 YOU NEED TO RUN THE ^2TEAMOUTFITS.SQL ^1FILE FOR THIS COMMAND TO WORK.")
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "YOU NEED TO RUN THE TEAMOUTFITS.SQL FILE FOR THIS TO WORK.")
			else
				local Result = MySQL.query.await('SELECT * FROM paintball_outfits')
				if Result[1] then
					local FinalData = {}
					local DidintFindGender
					if json.decode(Result[1].readoutfit) ~= nil then
						for _, v in pairs(json.decode(Result[1].readoutfit)) do
							if tostring(v.Gender) == tostring(Data.Gender) then
								FinalData[#FinalData+1] = Data
								print("^2Genders matched")
							else
								DidintFindGender = true
								FinalData[#FinalData+1] = v
								print("^2new gender added")
							end
						end
						if DidintFindGender then
							FinalData[#FinalData+1] = Data
						end
						MySQL.update('UPDATE paintball_outfits SET readoutfit = ? WHERE main = ?', { json.encode(FinalData), "main" })
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "Red team outfil successfully updated.")
					else
						MySQL.update('UPDATE paintball_outfits SET readoutfit = ? WHERE main = ?', { json.encode({Data}), "main" })
					end
				else
					MySQL.insert.await('INSERT INTO paintball_outfits (readoutfit, main) VALUES (?,?)', {
						json.encode({Data}), "main"
					})
				end
			end
		end)
	end)
end)
RegisterServerEvent('Pug:server:UpdateBlueTeamsClothes', function(Data)
	local src = source
	MySQL.ready(function()
		MySQL.Async.fetchScalar("SHOW TABLES LIKE 'paintball_outfits'", {}, function(result)
			if not result then
				print("^1 YOU NEED TO RUN THE ^2TEAMOUTFITS.SQL ^1FILE FOR THIS COMMAND TO WORK.")
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "YOU NEED TO RUN THE TEAMOUTFITS.SQL FILE FOR THIS TO WORK.")
			else
				local Result = MySQL.query.await('SELECT * FROM paintball_outfits')
				if Result[1] then
					local FinalData = {}
					local DidintFindGender
					if json.decode(Result[1].blueoutfit) ~= nil then
						for _, v in pairs(json.decode(Result[1].blueoutfit)) do
							if tostring(v.Gender) == tostring(Data.Gender) then
								FinalData[#FinalData+1] = Data
								print("^2Genders matched")
							else
								DidintFindGender = true
								FinalData[#FinalData+1] = v
								print("^2new gender added")
							end
						end
						if DidintFindGender then
							FinalData[#FinalData+1] = Data
						end
						MySQL.update('UPDATE paintball_outfits SET blueoutfit = ? WHERE main = ?', { json.encode(FinalData), "main" })
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, "Red team outfil successfully updated.")
					else
						MySQL.update('UPDATE paintball_outfits SET blueoutfit = ? WHERE main = ?', {json.encode({Data}), "main" })
					end
				else
					MySQL.insert.await('INSERT INTO paintball_outfits (blueoutfit, main) VALUES (?,?)', {
						json.encode({Data}), "main"
					})
				end
			end
		end)
	end)
end)

Config.FrameworkFunctions.CreateCallback('Pug:SVCB:GetTeamOutfits', function(source, cb, Data)
	local FinalData
	if Data.Team == "redteam" then
		local Result = MySQL.query.await('SELECT readoutfit FROM paintball_outfits WHERE main = ?', { "main" })
		if Result[1] then
			for _, v in pairs(json.decode(Result[1].readoutfit)) do
				if tostring(v.Gender) == tostring(Data.Gender) then
					FinalData = v
				end
			end
		end
	else
		local Result = MySQL.query.await('SELECT blueoutfit FROM paintball_outfits WHERE main = ?', { "main" })
		if Result[1] then
			for _, v in pairs(json.decode(Result[1].blueoutfit)) do
				if tostring(v.Gender) == tostring(Data.Gender) then
					FinalData = v
				end
			end
		end
	end
	Wait(500)
	cb(FinalData)
end)


if Framework == "QBCore" then
	-- optional and was requested this from a customer
	FWork.Functions.CreateUseableItem('paint_ammo', function(source, item)
		TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_PAINT', 50, item)
	end)
end

function GetRandomGunGameWeapons()
	local RandomWeaponsTable = {}
	for k, v in pairs(Config.WeaponItems) do
		RandomWeaponsTable[#RandomWeaponsTable+1] = v.name
	end
	local RandomWeapons = {
		[1] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[2] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[3] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[4] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[5] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[6] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[7] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[8] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[9] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[10] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[11] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[12] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[13] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[14] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[15] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[16] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[17] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[18] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[19] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[20] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[21] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[22] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[23] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[24] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[25] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[26] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[27] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[28] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[29] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
		[30] = RandomWeaponsTable[math.random(1, #RandomWeaponsTable)],
	}
	return RandomWeapons
end