PlayerData = nil
PlayerJob = nil
PlayerGrade = nil

QBCore = exports["qb-core"]:GetCoreObject()
		 
CreateThread(function()
    while true do
        PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData.citizenid ~= nil then
            PlayerJob = PlayerData.job.name
            PlayerGrade = PlayerData.job.grade.level
            break
        end
        Wait(100)
    end
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(job)
    PlayerJob = job.name
    PlayerGrade = job.grade.level
end)

CreateThread(function()
	for elevatorName, elevatorFloors in pairs(Config.Elevators) do
		for index, floor in pairs(elevatorFloors) do
            exports['qb-target']:AddBoxZone(elevatorName .. index, floor.coords, 5, 4, {
                name = elevatorName,
                heading = floor.heading,
                debugPoly = false,
                minZ = floor.coords.z - 1.5,
                maxZ = floor.coords.z + 1.5
            },
            {
                options = {
                    {
                        event = "angelicxs_elevator:showFloors",
                        icon = "fas fa-hand-point-up",
                        label = "Use Elevator From " .. floor.level,
                        elevator = elevatorName,
                        level = index
                    },
                },
                distance = 1.5 
            })
		end
	end
end)

RegisterNetEvent("angelicxs_elevator:showFloors", function(data)
	local elevator = {}
	PlayerData = QBCore.Functions.GetPlayerData()
	for index, floor in pairs(Config.Elevators[data.elevator]) do
        table.insert(elevator, {
            header = floor.level,
            txt = floor.label,
            disabled = isDisabled(index, floor, data),
            params ={ 
                event = "angelicxs_elevator:movement",
                args = floor
                }
        })
	end
    exports['qb-menu']:openMenu(elevator)
	--TriggerEvent("qb-menu:client:openMenu", elevator)
end)

RegisterNetEvent("angelicxs_elevator:movement", function(arg)
	local floor = {}
	floor = arg
	local ped = PlayerPedId()
	DoScreenFadeOut(1500)
	while not IsScreenFadedOut() do
		Wait(10)
	end
	RequestCollisionAtCoord(floor.coords.x, floor.coords.y, floor.coords.z)
	while not HasCollisionLoadedAroundEntity(ped) do
		Wait(0)
	end
	SetEntityCoords(ped, floor.coords.x, floor.coords.y, floor.coords.z, false, false, false, false)
	SetEntityHeading(ped, floor.heading and floor.heading or 0.0)
	Wait(Config.ElevatorWaitTime*1000)
	DoScreenFadeIn(1500)
end)

function isDisabled(index, floor, data)
	if index == data.level then return true end
    PlayerData = QBCore.Functions.GetPlayerData()
    local hasJob, hasItem = false, false
	if floor.jobs ~= nil and next(floor.jobs) then
		for jobName, gradeLevel in pairs(floor.jobs) do
			if PlayerJob == jobName and PlayerGrade >= gradeLevel then
				hasJob = true
				break
			end
		end
	end
	if floor.items ~= nil and next(floor.items) then
        for i = 1, #floor.items, 1 do
            for slot, item in pairs(PlayerData.items) do
                if PlayerData.items[slot] then
                    if item.name == floor.items[i] then
                        hasItem = true
                        break
                    end
                end
            end
        end
	end
	if floor.jobs == nil and floor.items == nil then return false end 
	return floor.jobAndItem and not (hasJob and hasItem) or not (hasJob or hasItem)
end