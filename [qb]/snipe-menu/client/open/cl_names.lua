players = {}

local function cleanUpGamerTags()
    for _, v in pairs(Tag) do
        if IsMpGamerTagActive(v) then
            RemoveMpGamerTag(v)
        end
    end
    Tag = {}
end

function DrawText3D(x, y, z, text)
	SetTextScale(0.6, 0.6)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 0, 0, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    -- DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


function ToggleNames()
    if Config.NewNamesLogic then
        if not toggleNameThread then
            TriggerServerEvent("snipe-menu:server:sendLogs", "triggered", Config.Locales["toggle_name_used"])
            toggleNameThread = true
            StartNamesThread()
            StartDistanceThread()
            StartGroupThread()
            while toggleNameThread do
                local p = promise.new()
                TriggerCallback("snipe-menu:server:getBlipsInfo", function(result)
                    p:resolve(result)
                end)
                players = Citizen.Await(p)
                Wait(2000)
            end
        else
            toggleNameThread = false
            players = {}
            CleanupOnClose()
        end
    else
        if not toggleNameThread then
            TriggerServerEvent("snipe-menu:server:sendLogs", "triggered", Config.Locales["toggle_name_used"])
            toggleNameThread = true
            while toggleNameThread do
                local curCoords = GetEntityCoords(PlayerPedId())
                local allActivePlayers = GetActivePlayers()
                for _, i in ipairs(allActivePlayers) do
                    local playeridx = GetPlayerFromServerId(i)
                    local ped = GetPlayerPed(i)
                    local name = 'ID: '..GetPlayerServerId(i)..' | '..GetPlayerName(i)

                    if not IsMpGamerTagActive(Tag[i]) then
                        Tag[i] = CreateFakeMpGamerTag(ped, name, false, false, "", false)
                    end
                    if #(curCoords - GetEntityCoords(ped)) <= 150.0 then
                        SetMpGamerTagAlpha(Tag[i], 0, 255) -- Sets "MP_TAG_GAMER_NAME" bar alpha to 100% (not needed just as a fail safe)
                        SetMpGamerTagAlpha(Tag[i], 2, 255) -- Sets "MP_TAG_HEALTH_ARMOUR" bar alpha to 100%
                        SetMpGamerTagAlpha(Tag[i], 4, 255) -- Sets "MP_TAG_AUDIO_ICON" bar alpha to 100%
                        SetMpGamerTagAlpha(Tag[i], 6, 255) -- Sets "MP_TAG_PASSIVE_MODE" bar alpha to 100%
                        SetMpGamerTagHealthBarColour(Tag[i], 25)  --https://wiki.rage.mp/index.php?title=Fonts_and_Colors

                        SetMpGamerTagVisibility(Tag[i], 0, true) -- Activates the player ID Char name and FiveM name
                        SetMpGamerTagVisibility(Tag[i], 2, true) -- Activates the health (and armor if they have it on) bar below the player names
                        if GetPlayerInvincible(playeridx) then
                            SetMpGamerTagVisibility(Tag[i], 6, true) -- If player is in godmode a circle with a line through it will show up
                        else
                            SetMpGamerTagVisibility(Tag[i], 6, false)
                        end
                    else
                        SetMpGamerTagVisibility(Tag[i], 0, 0)
                        SetMpGamerTagVisibility(Tag[i], 2, 0)
                    end
                end
                Wait(150)
            end
        else
            cleanUpGamerTags()
            toggleNameThread = false
            
            
        end
    end
end

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == "snipe-menu" then
        cleanUpGamerTags()
    end
end)