

local timeOutDeleteGame = 3 * 60 -- 5 * 1 minute

local currentPaintBallSession = {}
local playerDecoTab = {}

RegisterServerEvent('PaintBall:NewSession')
AddEventHandler('PaintBall:NewSession', function(data)
	local player = source
	print("creatorname : "..tostring(data.creatorname))
	if currentPaintBallSession[player] then
		print("Session déja existante pour ce joueur")
	
	else
		-- if currentPaintBallSession[player].CurStat == "WaitingPeople" or currentPaintBallSession[player].CurStat == "GameEnding" then
			currentPaintBallSession[player] = {}
			currentPaintBallSession[player].creator = data.creatorname
			currentPaintBallSession[player].sessionname = data.sessionname
			currentPaintBallSession[player].CurStat = "WaitingPeople"
			currentPaintBallSession[player].manche = 1
			currentPaintBallSession[player].nbmanche = data.nbmanche
			-- currentPaintBallSession[player].nbimpact = data.nbimpact
			currentPaintBallSession[player].nbpersequip = data.nbpersequip
			currentPaintBallSession[player].EquipA = {}
			currentPaintBallSession[player].EquipB = {}
			currentPaintBallSession[player].dateCreate = os.time()
			currentPaintBallSession[player].ScoreA = {}
			currentPaintBallSession[player].ScoreB = {}
		-- else
			-- TriggerClientEvent("PaintBall:Notif",player,"You cant create a lobby right now","info")
		-- end
	end
end)

RegisterServerEvent('PaintBall:GetAllSessions')
AddEventHandler('PaintBall:GetAllSessions', function()
	local player = source
	TriggerClientEvent("PaintBall:SendAllSessions",player,currentPaintBallSession)
end)

RegisterServerEvent('PaintBall:JoinBlue')
AddEventHandler('PaintBall:JoinBlue', function(idx)
	local player = source
	print("player : "..tostring(player).." ask to join: "..tostring(idx))
	local nbPlayer = currentPaintBallSession[idx].EquipA
	local alreadyIn = false
	for k,v in pairs(currentPaintBallSession[idx].EquipA) do
		if v == player then
			alreadyIn = true
		end
	end
	
	
	for k,v in pairs(currentPaintBallSession[idx].EquipB) do
		print("k : "..tostring(k).." v : "..tostring(v))
		if v == player then
			table.remove(currentPaintBallSession[idx].EquipB,k)
			print("remove player from another team")
		end
	end
	
	
	if not alreadyIn then
		if #nbPlayer == nil then
			currentPaintBallSession[idx].EquipA[1] = player
		else
			if #nbPlayer < tonumber(currentPaintBallSession[idx].nbpersequip) then
				currentPaintBallSession[idx].EquipA[#nbPlayer+1] = player
				TriggerClientEvent("PaintBall:Notif",player,"You've joined blue team","info")
			else
				TriggerClientEvent("PaintBall:Notif",player,"Team is full","error")
			end
		end
	else
		TriggerClientEvent("PaintBall:Notif",player,"You're already in this team","error")
	end
end)

RegisterServerEvent('PaintBall:JoinRed')
AddEventHandler('PaintBall:JoinRed', function(idx)
	local player = source
	print("player : "..tostring(player).." ask to join: "..tostring(idx))
	local nbPlayer = currentPaintBallSession[idx].EquipB
	local alreadyIn = false
	for k,v in pairs(currentPaintBallSession[idx].EquipB) do
		print("k : "..tostring(k).." v : "..tostring(v))
		if v == player then
			alreadyIn = true
		end
	end
	
	for k,v in pairs(currentPaintBallSession[idx].EquipA) do
		print("k : "..tostring(k).." v : "..tostring(v))
		if v == player then
		table.remove(currentPaintBallSession[idx].EquipA,k)
		print("remove player from another team")
		end
	end
	
	if not alreadyIn then
		if #nbPlayer == nil then
			currentPaintBallSession[idx].EquipB[1] = player
		else
			if #nbPlayer < tonumber(currentPaintBallSession[idx].nbpersequip) then
				currentPaintBallSession[idx].EquipB[#nbPlayer+1] = player
				TriggerClientEvent("PaintBall:Notif",player,"You've joined red team","info")
			else
				TriggerClientEvent("PaintBall:Notif",player,"Team is full","error")
			end
		end
	else
		TriggerClientEvent("PaintBall:Notif",player,"You're already in this team","error")
	end
end)

RegisterServerEvent('PaintBall:LeaveTheGame')
AddEventHandler('PaintBall:LeaveTheGame', function(idx)
	local player = source
	local gameFounded = false
	local playerFounded = false
	if idx ~= 0 then
		for k,v in pairs(currentPaintBallSession) do
			if k == idx then
				
				gameFounded = true
				
				for k1,v1 in pairs(currentPaintBallSession[k].EquipA) do
					if v1 == player then
						table.remove(currentPaintBallSession[k].EquipA,k1)
						TriggerClientEvent("PaintBall:GoToLeaveMatchMSG",player,"tie")
						SetPlayerRoutingBucket(player,0)
					end
				end
				
				for k1,v1 in pairs(currentPaintBallSession[k].EquipB) do
					if v1 == player then
						table.remove(currentPaintBallSession[k].EquipB,k1)
						TriggerClientEvent("PaintBall:GoToLeaveMatchMSG",player,"tie")
						SetPlayerRoutingBucket(player,0)
					end
				end
				
			end
		
		end
	else
		TriggerClientEvent("PaintBall:GoToLeaveMatchMSG",player,"tie")
		SetPlayerRoutingBucket(player,0)
	end
end)


RegisterServerEvent('PaintBall:StartTheGame')
AddEventHandler('PaintBall:StartTheGame', function(idx)
	local player = source
	currentPaintBallSession[idx].CurStat = "GameStarting"
	sendToPlayerTheStart(idx)
end)

RegisterServerEvent('PaintBall:addPoint')
AddEventHandler('PaintBall:addPoint', function(color,idx)
	local player = source
	print("player : "..tostring(player).." is dead game : "..tostring(idx).." color : "..tostring(color))
	if currentPaintBallSession[idx] then
		local CurrentManche = currentPaintBallSession[idx].manche
		if color == "red" then
			currentPaintBallSession[idx].ScoreA[CurrentManche] = currentPaintBallSession[idx].ScoreA[CurrentManche] + 1
		end
		if color == "blue" then
			currentPaintBallSession[idx].ScoreB[CurrentManche] = currentPaintBallSession[idx].ScoreB[CurrentManche] + 1
		end
	else
		print("error game not found")
	end
end)



function sendToPlayerTheStart(idx)
	local allPlayer = {}
	local cptPlayer = 0
	local currentManche = currentPaintBallSession[idx].manche
	
	for k,v in pairs(currentPaintBallSession[idx].EquipA) do
		TriggerClientEvent("PaintBall:GoForStartTheGame",v,"blue",idx,currentManche)
		print("Set bucket : "..tostring(v).." to: "..tostring(idx).." type of idx : "..type(idx))
		SetPlayerRoutingBucket(v,tonumber(idx))
	end
	
	for k,v in pairs(currentPaintBallSession[idx].EquipB) do
		TriggerClientEvent("PaintBall:GoForStartTheGame",v,"red",idx,currentManche)
		print("Set bucket : "..tostring(v).." to: "..tostring(idx).." type of idx : "..type(idx))
		SetPlayerRoutingBucket(v,tonumber(idx))
	end

	cptManche = tonumber(currentPaintBallSession[idx].nbmanche)
	
	while cptManche > 0 do
		print("init score of manche : "..tostring(cptManche))
		currentPaintBallSession[idx].ScoreA[cptManche] = 0
		currentPaintBallSession[idx].ScoreB[cptManche] = 0
		
		cptManche = cptManche - 1
	end
	
end

function sendToPlayerTheNextManche(idx)
	local allPlayer = {}
	local cptPlayer = 0
	local currentManche = currentPaintBallSession[idx].manche
	for k,v in pairs(currentPaintBallSession[idx].EquipA) do
		TriggerClientEvent("PaintBall:GoForTheNextGame",v,"blue",idx,currentManche)
	end
	
	for k,v in pairs(currentPaintBallSession[idx].EquipB) do
		TriggerClientEvent("PaintBall:GoForTheNextGame",v,"red",idx,currentManche)
	end
end

function NextManche(idx,winner)
	Citizen.CreateThread(function()
		for k,v in pairs(currentPaintBallSession[idx].EquipA) do
			TriggerClientEvent("PaintBall:GoToNextMancheMSG",v,winner)
		end
		
		for k,v in pairs(currentPaintBallSession[idx].EquipB) do
			TriggerClientEvent("PaintBall:GoToNextMancheMSG",v,winner)
		end
		
		Wait(8000)
		
		sendToPlayerTheNextManche(idx)
	end)
end

function FinManche(idx)
	Citizen.CreateThread(function()
		local TotScoreA = 0
		local TotScoreB = 0
		
		for k,v in pairs(currentPaintBallSession[idx].ScoreA) do
			print("Score A : "..tostring(v))
			TotScoreA = TotScoreA + v
		end
		
		for k,v in pairs(currentPaintBallSession[idx].ScoreB) do
			print("Score B : "..tostring(v))
			TotScoreB = TotScoreB + v
		end
		
		if TotScoreA > TotScoreB then
			winner = "blue"
		elseif TotScoreA < TotScoreB then
			winner = "red"
		elseif TotScoreA == TotScoreB then
			winner = "tie"
		end
		
		for k,v in pairs(currentPaintBallSession[idx].EquipA) do
			TriggerClientEvent("PaintBall:GoToFinMatchMSG",v,winner)
			SetPlayerRoutingBucket(v,0)
		end
		
		for k,v in pairs(currentPaintBallSession[idx].EquipB) do
			TriggerClientEvent("PaintBall:GoToFinMatchMSG",v,winner)
			SetPlayerRoutingBucket(v,0)
		end
		
		currentPaintBallSession[idx] = nil
	end)
end

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		local curTime = os.time()
		
		for k,v in pairs(currentPaintBallSession) do
			if (curTime - v.dateCreate) > timeOutDeleteGame and (v.CurStat == "WaitingPeople") then
				print("Must delete Game")
				currentPaintBallSession[k] = nil
			end
			
			local nbPlayerA = #v.EquipA
			local nbPlayerB = #v.EquipB
			local nbPlayerMax = tonumber(v.nbpersequip)
			
			if nbPlayerA == nbPlayerMax and nbPlayerB == nbPlayerMax and (v.CurStat == "WaitingPeople") then
				currentPaintBallSession[k].CurStat = "GameStarting"
				sendToPlayerTheStart(k)
			end
			
			if v.CurStat == "GameStarting" then
				if v.manche <= tonumber(v.nbmanche) then
					if v.ScoreA[v.manche] ~= nil then
						if v.ScoreA[v.manche] >= nbPlayerB then
							print("Manche: "..tostring(v.manche).." Fini Blue Win")
							currentPaintBallSession[k].manche = currentPaintBallSession[k].manche + 1
							
							if currentPaintBallSession[k].manche <= tonumber(v.nbmanche) then
								NextManche(k,"blue")
							end
						end
					end
					
					if v.ScoreA[v.manche] ~= nil then
						if v.ScoreB[v.manche] >= nbPlayerA then
							print("Manche: "..tostring(v.manche).." Fini Red Win")
							currentPaintBallSession[k].manche = currentPaintBallSession[k].manche + 1
							if currentPaintBallSession[k].manche <= tonumber(v.nbmanche) then
								NextManche(k,"red")
							end
						end
					end
					
					if v.ScoreA[v.manche] ~= nil then
						if v.ScoreA[v.manche] + v.ScoreB[v.manche] >= nbPlayerA + nbPlayerB then
							print("Manche: "..tostring(v.manche).." Fini Tie")
							currentPaintBallSession[k].manche = currentPaintBallSession[k].manche + 1
							if currentPaintBallSession[k].manche <= tonumber(v.nbmanche) then
								NextManche(k,"tie")
							end
						end
					end
					
					for k2,v2 in pairs(v.EquipA) do
						if GetPlayerRoutingBucket(v2) ~= k then
							print("^1Player "..tostring(v2).." is not in good bucket^7")
							SetPlayerRoutingBucket(v2,k)
						end
						if GetPlayerPing(v2) == 0 then
							print("GetPlayerPing("..tostring(v2)..") : "..tostring(GetPlayerPing(v2)))
							
							if playerDecoTab[v2] == nil then
								playerDecoTab[v2] = true
								Citizen.CreateThread(function()
									
									local currentDecoSession = k
									local currentDecoPlayer = v2
									print("CreateThread for deco : "..tostring(currentDecoPlayer))
									local cptTimeoutDeco = 0
									local mustRemove = true
									while cptTimeoutDeco < 100 do
										cptTimeoutDeco = cptTimeoutDeco + 1
										if GetPlayerPing(v2) ~= 0 then
											mustRemove = false
										end
										Wait(1)
									end
									if mustRemove then
										print("mustRemove for deco : "..tostring(currentDecoPlayer))
										for k12,v12 in pairs(currentPaintBallSession[currentDecoSession].EquipA) do
											print("k12: "..tostring(k12).." v12: "..tostring(v12))
											if v12 == currentDecoPlayer then
												table.remove(currentPaintBallSession[currentDecoSession].EquipA,k12)
												print("founded and deleted")
											end
										end
										currentPaintBallSession[currentDecoSession].EquipB[currentDecoPlayer] = nil
										playerDecoTab[v2] = nil
									else
										print("not remove for deco : "..tostring(currentDecoPlayer))
										playerDecoTab[v2] = nil
									end
								end)
							end
						end
						
					end
					
					for k2,v2 in pairs(v.EquipB) do
						if GetPlayerRoutingBucket(v2) ~= k then
							print("^1Player "..tostring(v2).." is not in good bucket^7")
							SetPlayerRoutingBucket(v2,k)
						end
						if GetPlayerPing(v2) == 0 then
							print("GetPlayerPing("..tostring(v2)..") : "..tostring(GetPlayerPing(v2)))
							
							if playerDecoTab[v2] == nil then
								playerDecoTab[v2] = true
								Citizen.CreateThread(function()
									
									local currentDecoSession = k
									local currentDecoPlayer = v2
									print("CreateThread for deco : "..tostring(currentDecoPlayer))
									local cptTimeoutDeco = 0
									local mustRemove = true
									while cptTimeoutDeco < 100 do
										cptTimeoutDeco = cptTimeoutDeco + 1
										if GetPlayerPing(v2) ~= 0 then
											mustRemove = false
										end
										Wait(1)
									end
									if mustRemove then
										print("mustRemove for deco : "..tostring(currentDecoPlayer))
										for k12,v12 in pairs(currentPaintBallSession[currentDecoSession].EquipB) do
											print("k12: "..tostring(k12).." v12: "..tostring(v12))
											if v12 == currentDecoPlayer then
												table.remove(currentPaintBallSession[currentDecoSession].EquipB,k12)
												print("founded and deleted")
											end
										end
										currentPaintBallSession[currentDecoSession].EquipB[currentDecoPlayer] = nil
										playerDecoTab[v2] = nil
									else
										print("not remove for deco : "..tostring(currentDecoPlayer))
										playerDecoTab[v2] = nil
									end
								end)
							end
						end
						-- print("GetPlayerPing(v2) : "..tostring(GetPlayerPing(v2)))
					end
				else
					print("game fini")
					currentPaintBallSession[k].CurStat = "GameEnding"
					FinManche(k)
				end
			end
			
		end
	end
end)