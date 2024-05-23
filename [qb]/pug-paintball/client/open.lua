print'Pug Paintball 3.1.4'

function PaintBallNotify(msg, type, length)
    if Framework == "ESX" then
		FWork.ShowNotification(msg)
	elseif Framework == "QBCore" then
    	FWork.Functions.Notify(msg, type, length)
	end
end

function DrawTextOptiopnForSpectate()
    if Framework == "QBCore" then
		exports[Config.CoreName]:DrawText('[E] To open menu', 'left')
	else
		FWork.TextUI('[E] To open menu', "error")
	end
end

function HideTextOptiopnForSpectate()
	if Framework == "QBCore" then
		exports[Config.CoreName]:HideText()
	else
		FWork.HideUI()
	end
end
-- Paintball toggle item function bool is true or false to give or remove item (true = give, false = remove)
local function PaintballToggleItem(bool, item, amount, info)
	return TriggerServerEvent("Pug:server:GivePaintballItem", bool, item, amount, info)
end

RegisterNetEvent('Pug:client:AddGameItems', function() -- gives items when the match starts
    if Config.UsingPmaVoice then
        if Config.RemoveAllItemsForPlayer then
            PaintballToggleItem(true, "radio", 1)
        end
    end
end)

local OriginalPlayersArmor
function HandleStartingSetup() -- When you spawn into the match this function is called
    OriginalPlayersArmor = GetPedArmour(PlayerPedId())
    if Config.RemoveAllItemsForPlayer then
        TriggerServerEvent("Pug:server:SavePaintballItems")
    end
    DoScreenFadeOut(500)
    Wait(500)
    inMatch()
    if Config.UseVrHeadSet and Config.MakeCloneOfPlayer then
        CreateClone()
    end
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "startround", 0.03)
    TriggerEvent('Pug:client:InPaintBallMatchWL')
    if not Config.UsingLastStand then
        SetEntityHealth(PlayerPedId(), 200)
    end
    TriggerEvent("Pug:client:PaintballReviveEvent")
    if Config.Debug then
        print(ClosedInfo().weapon, 'weapon chosen')
    end
    if ClosedInfo().mode == Config.GameModes[4].name then
    elseif ClosedInfo().mode == Config.GameModes[6].name then
        GiveWeaponToPed(PlayerPedId(), GetHashKey(Config.OneInTheChamberWeapon), 0, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(Config.OneInTheChamberWeapon), 1)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(Config.OneInTheChamberWeapon), true)
        SetEntityHealth(PlayerPedId(), 110)
    else
        GiveWeaponToPed(PlayerPedId(), GetHashKey(ClosedInfo().weapon), 0, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(ClosedInfo().weapon), 1000)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(ClosedInfo().weapon), true)
    end
    FreezeEntityPosition(PlayerPedId(),true)
end

-- HandleEndingSetup
RegisterNetEvent('Pug:client:RemoveGameItems', function() -- removes items when the match ends
    TriggerEvent("Pug:Anticheat:FixRemovedGun")
    RemoveAllPedWeapons(PlayerPedId(), false)
    if Config.UsingPmaVoice then
        if Config.RemoveAllItemsForPlayer then
            PaintballToggleItem(false, "radio", 1)
        end
    end
    SetEntityHealth(PlayerPedId(), 200)
    if OriginalPlayersArmor then
        SetPedArmour(PlayerPedId(), OriginalPlayersArmor)
    end
end)

local function LoadModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

local function createPaintBallZone(zones, name)
    local zone = PolyZone:Create(zones['Zone']['Shape'], {  -- create the zone
        name= name,
        minZ = zones['minZ'],
        maxZ = zones['maxZ'],
        debugPoly = Config.Debug
    })
    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
        else
            if 'ArenaMain' == zone.name then
                if ClosedInfo().ingame then
                    if ClosedInfo().map == 'gabz' then
                    else
                        SetEntityCoords(PlayerPedId(), 2930.2, -3812.9, 125.14)
                        if Framework == "QBCore" then
                            local player = Config.FrameworkFunctions.GetPlayer(true, false, true)
                            TriggerEvent('qb-log:server:CreateLog', 'paintballcheater', "Player: " .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. ' Some how left the arena, was teleported back and may be cheating')
                        end
                    end
                end
            end
        end
    end)
end
for k, v in pairs(Config.ArenaZone) do
    createPaintBallZone(v, k)
end

local function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 90)
    ClearDrawOrigin()
end


CreateThread(function()
    if not Config.UseVrHeadSet then
        -- PedCreation
		ArenaPed = Config.ArenaPed
		LoadModel(ArenaPed)
		ArenaPedMan = CreatePed(2, ArenaPed, Config.PedLocation, false, false)
		SetPedFleeAttributes(ArenaPedMan, 0, 0)
		SetPedDiesWhenInjured(ArenaPedMan, false)
		SetPedKeepTask(ArenaPedMan, true)
		SetBlockingOfNonTemporaryEvents(ArenaPedMan, true)
		SetEntityInvincible(ArenaPedMan, true)
		FreezeEntityPosition(ArenaPedMan, true)
        TaskStartScenarioInPlace(ArenaPedMan, "WORLD_HUMAN_CLIPBOARD", 0, true)
        -- End
        blip = AddBlipForCoord(Config.PedLocation)
        SetBlipSprite(blip, 110)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.75)
        SetBlipColour(blip, 5)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Paint Ball")
        EndTextCommandSetBlipName(blip)
        if Config.Target then
            if Config.Target == "ox_target" then
                exports.ox_target:addLocalEntity(ArenaPedMan, {
                    {
                        name = 'ViewLobby',
                        event = 'Pug:client:ViewLobby',
                        icon = 'fas fa-clipboard',
                        label = "View Arena",
                        distance = 2.0,
                    }
                })
            else
                exports[Config.Target]:AddTargetEntity(ArenaPedMan, {
                    options = {
                        {
                            event = 'Pug:client:ViewLobby',
                            icon = "fas fa-clipboard",
                            label = "View Arena",
                        },
                    },
                    distance = 2.0
                })
            end
        else
            while true do
                Wait(1)
                if #(GetEntityCoords(PlayerPedId()) - vector3(Config.PedLocation.x, Config.PedLocation.y,Config.PedLocation.z)) <= 3 then
                    DrawText3Ds(Config.PedLocation.x, Config.PedLocation.y,Config.PedLocation.z+1, "~b~[E] ~w~View Arena")
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent("Pug:client:ViewLobby")
                        Wait(500)
                    end
                else
                    Wait(2000)
                end
            end
        end
    end
end)

RegisterNetEvent('Pug:client:ChooseMap', function()
    -- if ClosedInfo().weapon == 'weapon_unarmed' or ClosedInfo().team == nil then 
    --     PaintBallNotify(Translations.error.choose_team_first, 'error')
    --     TriggerEvent("Pug:client:ViewLobby")
    -- else
    Config.FrameworkFunctions.TriggerCallback('Pug:serverCB:Checkongoinggame', function(gamestatus)
        if gamestatus then
            PaintBallNotify(Translations.error.active_game, 'error')
            TriggerEvent("Pug:client:ViewLobby")
        else
            if Config.MapMenuPreview then
                local menu = {
                    {
                        header = Translations.menu.random,
                        context = "Randomly chosen maps",
                        event = "Pug:client:SelectChosenMap",
                    },
                }
                for k, v in pairs(Config.Arenas) do
                    menu[#menu+1] = {
                        header = v.name,
                        context = v.description,
                        event = "Pug:client:SelectChosenMap",
                        image = v.url,
                        args = {k}
                    }
                end
                menu[#menu+1] = {
                    header = " ",
                    context = Translations.menu.go_back,
                    event = "Pug:client:ViewLobby",
                }
                TriggerEvent('nh-context:createMenu', menu)
            elseif Config.Menu == "ox_lib" then
                local menu = {}
                for k, v in pairs(Config.Arenas) do
                    menu[#menu+1] = {
                        title = v.name,
                        description = v.description,
                        image = v.url,
                        event = "Pug:client:SelectChosenMap",
                        args = k,
                    }
                end
                menu[#menu+1] = {
                    title = " ",
                    description = Translations.menu.go_back,
                    isMenuHeader = true,
                    event = "Pug:client:ViewLobby",
                }
                lib.registerContext({
                    id = Translations.menu.map,
                    title = Translations.menu.map,
                    options = menu
                })
                lib.showContext(Translations.menu.map)
            else
                local menu = {
                    {
                        header = Translations.menu.map,
                        icon = "fa-solid fa-map",
                        txt = " ",
                        params = {
                            event = "Pug:client:ViewLobby",
                        }
                    }
                }
                for k, v in pairs(Config.Arenas) do
                    menu[#menu+1] = {
                        header = v.name,
                        txt = v.description,
                        params = {
                            event = "Pug:client:SelectChosenMap",
                            args = k
                        }
                    }
                end
                menu[#menu+1] = {
                    header = " ",
                    txt = Translations.menu.go_back,
                    params = {
                        event = "Pug:client:ViewLobby",
                    }
                }
                exports[Config.Menu]:openMenu(menu)
            end
        end
    end)
    -- end
end)

-- This is the selecting a map event (i dont remember why i placed it in open.lua?)
RegisterNetEvent("Pug:client:SelectChosenMap", function(arenaMap)
    if Config.HostOnlyCanControllGame then
        if LobbyHost then
            if LobbyHost == GetPlayerServerId(PlayerId()) then
            else
                TriggerEvent("Pug:client:ViewLobby")
                PaintBallNotify(Translations.error.need_to_be_lobby_host, 'error')
                return
            end
        else
            TriggerEvent("Pug:client:ViewLobby")
            PaintBallNotify(Translations.error.need_to_be_lobby_host, 'error')
            return
        end
    end
    if arenaMap == nil then
        TriggerServerEvent("Pug:SV:SetArenaMap",'random')
    else
        TriggerServerEvent("Pug:SV:SetArenaMap",arenaMap)
    end
    if not ClosedInfo().ingame then
        TriggerEvent("Pug:client:ViewLobby")
    end
end)

-- Blip System --
-- local Blips = {}
-- RegisterNetEvent('Pug:client:UpdatePaintballBlips', function(data)
--     if ClosedInfo().ingame then
--         for k, v in pairs(data) do
--             if v.src == GetPlayerServerId(PlayerId()) then
--             else
--                 if tostring(v.team).."team" == ClosedInfo().team then
--                     if DoesBlipExist(Blips[k]) then
--                     else
--                         Blips[k] = AddBlipForCoord(v.coords)
--                         return
--                     end
--                     BeginTextCommandSetBlipName('STRING')
--                     AddTextComponentString(v.name)
--                     EndTextCommandSetBlipName(Blips[k])
--                     SetBlipCoords(Blips[k], v.coords.x, v.coords.y, v.coords.z)
--                     if v.team == "red" then
--                         SetBlipColour(Blips[k], 1)
--                     else
--                         SetBlipColour(Blips[k], 3)
--                     end
--                     SetBlipAsShortRange(Blips[k], false)
--                     ShowHeadingIndicatorOnBlip(Blips[k], true)
--                     SetBlipRotation(Blips[k], math.ceil(v.coords.w))
--                 end
--             end
--         end
--     end
-- end)

-- RegisterNetEvent('Pug:client:PaintballRemoveAllBlips', function()
--     for k, v in pairs(Blips) do
--         if DoesBlipExist(Blips[k]) then
--             RemoveBlip(Blips[k])
--             Blips[k] = nil
--         end
--     end
-- end)

RegisterNetEvent("Pug:client:PaintballNotifyEvent", function(msg, type, length)
	PaintBallNotify(msg, type, length)
end)

if Framework == "QBCore" then
    -- On player load to give items back to the player if the crashed or logged out during a match.
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        Wait(1000)
        if #(GetEntityCoords(PlayerPedId()) - vector3(2945.65, -3796.44, 143.26)) <= 1000 or #(GetEntityCoords(PlayerPedId()) -  vector3(-3234.46, 7045.22, 637.62)) <= 100 or 
        #(GetEntityCoords(PlayerPedId()) -  vector3(1376.41, -784.41, 67.64)) <= 100 then
            SetEntityCoords(PlayerPedId(), Config.PedLocation)
            PaintBallNotify("You have been removed from the arena area.", 'success')
        end
        if not Config.HasBattleRoyaleScript then
            if Config.RemoveAllItemsForPlayer then
                GivePaintballItems()
            end
        end
    end)
elseif Framework == "ESX" then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function()
        Wait(1000)
        if #(GetEntityCoords(PlayerPedId()) - vector3(2945.65, -3796.44, 143.26)) <= 1000 or #(GetEntityCoords(PlayerPedId()) -  vector3(-3234.46, 7045.22, 637.62)) <= 100 or 
        #(GetEntityCoords(PlayerPedId()) -  vector3(1376.41, -784.41, 67.64)) <= 100 then
            SetEntityCoords(PlayerPedId(), Config.PedLocation)
            PaintBallNotify("You have been removed from the arena area.", 'success')
        end
        if not Config.HasBattleRoyaleScript then
            if Config.RemoveAllItemsForPlayer then
                GivePaintballItems()
            end
        end
    end)
end

-- Outffi for red and blue team (THIS CAN ALL BE ADJUSTED IN THE CONFIG. DONT TOUCH THIS HERE.)
function OutFitRed()
    local GenderType = 'mp_m_freemode_01'
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        GenderType =  'mp_m_freemode_01'
    else
        GenderType = 'mp_f_freemode_01'
    end 
    local Info = {
        Gender = GenderType,
        Team = "redteam",
    }
    Config.FrameworkFunctions.TriggerCallback('Pug:SVCB:GetTeamOutfits', function(Data)
        if Data then
            for clothingPiece, _ in pairs(Data) do
                if clothingPiece == 'hat' then -- 'hat' is a prop, not a component
                    SetPedPropIndex(PlayerPedId(), 0, Data.hat, Data.that)
                else
                    local componentId
                    if clothingPiece == 'torso' then
                        componentId = 3
                    elseif clothingPiece == 'mask' then
                        componentId = 1
                    elseif clothingPiece == 'pants' then
                        componentId = 4
                    elseif clothingPiece == 'jacket' then
                        componentId = 11
                    elseif clothingPiece == 'shoes' then
                        componentId = 6
                    elseif clothingPiece == 'undershirt' then
                        componentId = 8
                    elseif clothingPiece == 'bag' then
                        componentId = 5
                    end
                    if componentId then
                        SetPedComponentVariation(PlayerPedId(), componentId, Data[clothingPiece], Data['t'..clothingPiece])
                    end
                end
            end
        end
    end, Info)
end

function OutFitBlue()
    local GenderType = 'mp_m_freemode_01'
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        GenderType =  'mp_m_freemode_01'
    else
        GenderType = 'mp_f_freemode_01'
    end 
    local Info = {
        Gender = GenderType,
        Team = "blueteam",
    }
    Config.FrameworkFunctions.TriggerCallback('Pug:SVCB:GetTeamOutfits', function(Data)
        if Data then
            for clothingPiece, _ in pairs(Data) do
                if clothingPiece == 'hat' then -- 'hat' is a prop, not a component
                    SetPedPropIndex(PlayerPedId(), 0, Data.hat, Data.that)
                else
                    local componentId
                    if clothingPiece == 'torso' then
                        componentId = 3
                    elseif clothingPiece == 'mask' then
                        componentId = 1
                    elseif clothingPiece == 'pants' then
                        componentId = 4
                    elseif clothingPiece == 'jacket' then
                        componentId = 11
                    elseif clothingPiece == 'shoes' then
                        componentId = 6
                    elseif clothingPiece == 'undershirt' then
                        componentId = 8
                    elseif clothingPiece == 'bag' then
                        componentId = 5
                    end
                    if componentId then
                        SetPedComponentVariation(PlayerPedId(), componentId, Data[clothingPiece], Data['t'..clothingPiece])
                    end
                end
            end
        end
    end, Info)
end
RegisterNetEvent('Pug:client:CloseAllPaintballMenuWhenStart',function()
    if #(GetEntityCoords(PlayerPedId()) - vector3(Config.PedLocation.x,Config.PedLocation.y,Config.PedLocation.z)) <= 50.0 then
        if Config.Menu == "ox_lib" then
            lib.hideContext(false)
        else
            exports[Config.Menu]:closeMenu()
        end
    end
end)

RegisterNetEvent('Pug:client:AcivateUavPaintball',function(coords,id)
    if ClosedInfo().ingame then
        if tonumber(GetPlayerServerId(PlayerId())) == tonumber(id) then return end
        local uavblip = {}
        local alpha = 250
        uavblip[id] = AddBlipForRadius(coords.x,coords.y,coords.z, 7.0)
        SetBlipSprite(uavblip[id],9)
        SetBlipColour(uavblip[id],49)
        SetBlipAlpha(uavblip[id],alpha)
        SetBlipAsShortRange(uavblip[id], false)

        while alpha ~= 0 do
            Wait(100)
            alpha = alpha - 5
            SetBlipAlpha(uavblip[id], alpha)
            if alpha == 0 then
                RemoveBlip(uavblip[id])
                uavblip[id] = nil
                return
            end
        end
    end
end)

RegisterNetEvent("Pug:client:StoreRedTeamClothes", function()
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        PlayersGender = "mp_m_freemode_01"
    else
        PlayersGender = "mp_f_freemode_01"
    end
    local Data = {
        torso = GetPedDrawableVariation(PlayerPedId(),3),
        ttorso = GetPedTextureVariation(PlayerPedId(),3),
        mask = GetPedDrawableVariation(PlayerPedId(),1),
        tmask = GetPedTextureVariation(PlayerPedId(),1),
        pants = GetPedDrawableVariation(PlayerPedId(),4),
        tpants = GetPedTextureVariation(PlayerPedId(),4),
        jacket = GetPedDrawableVariation(PlayerPedId(),11),
        tjacket = GetPedTextureVariation(PlayerPedId(),11),
        shoes = GetPedDrawableVariation(PlayerPedId(),6),
        tshoes = GetPedTextureVariation(PlayerPedId(),6),
        undershirt = GetPedDrawableVariation(PlayerPedId(),8),
        tundershirt = GetPedTextureVariation(PlayerPedId(),8),
        bag = GetPedDrawableVariation(PlayerPedId(),5),
        tbag = GetPedTextureVariation(PlayerPedId(),5),
        hat = GetPedPropIndex(PlayerPedId(),0),
        that = GetPedPropTextureIndex(PlayerPedId(), 0),
        Gender = PlayersGender,
    }
    TriggerServerEvent("Pug:server:UpdateRedTeamsClothes", Data)
end)

RegisterNetEvent("Pug:client:StoreBlueTeamClothes", function()
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        PlayersGender = "mp_m_freemode_01"
    else
        PlayersGender = "mp_f_freemode_01"
    end
    local Data = {
        torso = GetPedDrawableVariation(PlayerPedId(),3),
        ttorso = GetPedTextureVariation(PlayerPedId(),3),
        mask = GetPedDrawableVariation(PlayerPedId(),1),
        tmask = GetPedTextureVariation(PlayerPedId(),1),
        pants = GetPedDrawableVariation(PlayerPedId(),4),
        tpants = GetPedTextureVariation(PlayerPedId(),4),
        jacket = GetPedDrawableVariation(PlayerPedId(),11),
        tjacket = GetPedTextureVariation(PlayerPedId(),11),
        shoes = GetPedDrawableVariation(PlayerPedId(),6),
        tshoes = GetPedTextureVariation(PlayerPedId(),6),
        undershirt = GetPedDrawableVariation(PlayerPedId(),8),
        tundershirt = GetPedTextureVariation(PlayerPedId(),8),
        bag = GetPedDrawableVariation(PlayerPedId(),5),
        tbag = GetPedTextureVariation(PlayerPedId(),5),
        hat = GetPedPropIndex(PlayerPedId(),0),
        that = GetPedPropTextureIndex(PlayerPedId(), 0),
        Gender = PlayersGender,
    }
    TriggerServerEvent("Pug:server:UpdateBlueTeamsClothes", Data)
end)

local function IsInPaintball()
    return ClosedInfo().ingame
end
exports("IsInPaintball", IsInPaintball)

function CheckingIfDeadFunction() -- NEVER CHANGE THIS UNLESS I HAVE DIRECTED YOU TO.
    return IsPedFatallyInjured(PlayerPedId())
end

RegisterNetEvent("Pug:client:PaintballReviveEvent", function()
    TriggerEvent('ak47_qb_ambulancejob:revive')
    TriggerEvent('ak47_qb_ambulancejob:skellyfix')
    TriggerEvent('hospital:client:Revive')
    TriggerEvent('esx_ambulancejob:revive')
    TriggerEvent('wasabi_ambulance:revive')
    TriggerEvent('visn_are:resetHealthBuffer')
    TriggerEvent("qbx_medical:client:playerRevived")
    -- if ClosedInfo().ingame then
    --     TriggerServerEvent("Pug:server:PaintballSetBucket", true)
    -- end
end)