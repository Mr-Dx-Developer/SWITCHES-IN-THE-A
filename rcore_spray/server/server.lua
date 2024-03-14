SPRAYS = {}

FastBlacklist = {}

DiscordLogWebhook = ''

Citizen.CreateThread(function()
    if Config.Blacklist then
        for _, word in pairs(Config.Blacklist) do
            FastBlacklist[word] = word
        end
    end
end)

function GetSprayAtCoords(pos)
    for _, spray in pairs(SPRAYS) do
        if spray.location == pos then
            return spray
        end
    end
end

function AddSpray(Source, spray)
    local i = 1
    local nowTime = 0
    
    if not DisableMysql then
        nowTime = tonumber(math.floor(MySQL.Sync.fetchScalar('SELECT NOW()')/1000))
    end

    while true do
        if not SPRAYS[i] then
            spray.createdAt = nowTime
            SPRAYS[i] = spray
            break
        else
            i = i + 1
        end
    end

    PersistSpray(spray)

    if spray.text then
        TriggerEvent('rcore_sprays:addSpray', Source, spray.text, spray.location)
    else
        local cfgImg = FastImageMap[spray.imageDict .. spray.image]

        if cfgImg and cfgImg.gangTags then
            if type(cfgImg.gangTags) == 'string' then
                TriggerEvent('rcore_sprays:addSpray', Source, cfgImg.gangTags, spray.location)
            else
                for _, t in pairs(cfgImg.gangTags) do
                    TriggerEvent('rcore_sprays:addSpray', Source, t, spray.location)
                end
            end
        end
    end

    TriggerClientEvent('rcore_spray:addSpray', -1, spray)
end

function StartSpraying(source)
    TriggerClientEvent('rcore_spray:spray', source)

end

function RemoveSprayAtPosition(Source, pos)
    local sprayAtCoords = GetSprayAtCoords(pos)

    if sprayAtCoords.text then
        MySQL.Async.execute([[
                DELETE FROM sprays WHERE origX >= @x1 AND origY >= @y1 AND origZ >= @z1 and origX <= @x2 AND origY <= @y2 AND origZ <= @z2 and text=@text AND font=@font AND color=@color  LIMIT 1
            ]], {
            ['@x1'] = pos.x - 0.1,
            ['@y1'] = pos.y - 0.1,
            ['@z1'] = pos.z - 0.1,
            ['@x2'] = pos.x + 0.1,
            ['@y2'] = pos.y + 0.1,
            ['@z2'] = pos.z + 0.1,
            ['@text'] = sprayAtCoords.text,
            ['@font'] = sprayAtCoords.font,
            ['@color'] = sprayAtCoords.color,
        })
    elseif sprayAtCoords.image then
        MySQL.Async.execute([[
                DELETE FROM sprays WHERE origX >= @x1 AND origY >= @y1 AND origZ >= @z1 and origX <= @x2 AND origY <= @y2 AND origZ <= @z2 AND image=@image AND imageDict=@imageDict LIMIT 1
            ]], {
            ['@x1'] = pos.x - 0.1,
            ['@y1'] = pos.y - 0.1,
            ['@z1'] = pos.z - 0.1,
            ['@x2'] = pos.x + 0.1,
            ['@y2'] = pos.y + 0.1,
            ['@z2'] = pos.z + 0.1,
            ['@image'] = sprayAtCoords.image,
            ['@imageDict'] = sprayAtCoords.imageDict,
            ['@font'] = sprayAtCoords.font,
            ['@color'] = sprayAtCoords.color,
        })
    end

    for idx, s in pairs(SPRAYS) do
        if s.location.x == pos.x and s.location.y == pos.y and s.location.z == pos.z then
            table.remove(SPRAYS, idx)
        end
    end
    TriggerClientEvent('rcore_spray:removeSpray', -1, pos)

    local sprayAtCoordsAfterRemoval = GetSprayAtCoords(pos)

    -- ensure someone doesnt bug it so its trying to remove other tags
    -- while deducting loyalty from not-deleted-but-at-coords tag
    if Source and sprayAtCoords and not sprayAtCoordsAfterRemoval then
        if sprayAtCoords.text then
            TriggerEvent('rcore_sprays:removeSpray', Source, sprayAtCoords.text, sprayAtCoords.location)
        else
            local cfgImg = FastImageMap[sprayAtCoords.imageDict .. sprayAtCoords.image]
    
            if cfgImg and cfgImg.gangTags then
                if type(cfgImg.gangTags) == 'string' then
                    TriggerEvent('rcore_sprays:removeSpray', Source, cfgImg.gangTags, sprayAtCoords.location)
                else
                    for _, t in pairs(cfgImg.gangTags) do
                        TriggerEvent('rcore_sprays:removeSpray', Source, t, sprayAtCoords.location)
                    end
                end
            end
        end
    end
end

RegisterNetEvent('rcore_spray:addSpray')
AddEventHandler('rcore_spray:addSpray', function(spray)
    local Source = source
    
    if spray.text or spray.image then
        if Framework == FW_OTHER then
            AddSpray(Source, spray)
            return
        end

        local itemCount = GetItemCount(Source, "spray")

        if itemCount > 0 then
            RemoveInventoryItem(Source, "spray", 1)
            spray.identifier = GetPlayerIdentifier(Source)
            SendMessageToWebhook(
                GetPlayerNameForWebhook(Source, spray.identifier) .. ': Created graffiti "' .. (spray.text or spray.image) .. '" at vector3(' .. FormatSimplePos(spray.location) .. ')'
            )
            AddSpray(Source, spray)
        else
            ShowNotification(Source, Config.Text.NEED_SPRAY)
        end
    end
end)

function PersistSpray(spray)
    MySQL.Async.execute([[
        INSERT sprays
        (`x`, `y`, `z`, `origX`, `origY`, `origZ`, `rx`, `ry`, `rz`, `scale`, `text`, `imageDict`, `image`, `font`, `color`, `interior`, `identifier`)
        VALUES
        (@x, @y, @z, @origX, @origY, @origZ, @rx, @ry, @rz, @scale, @text, @imageDict, @image, @font, @color, @interior, @identifier)
    ]], {
        ['@x'] = spray.realLocation.x,
        ['@y'] = spray.realLocation.y,
        ['@z'] = spray.realLocation.z,
        ['@origX'] = spray.location.x,
        ['@origY'] = spray.location.y,
        ['@origZ'] = spray.location.z,
        ['@rx'] = spray.realRotation.x,
        ['@ry'] = spray.realRotation.y,
        ['@rz'] = spray.realRotation.z,
        ['@scale'] = spray.scale,
        ['@text'] = spray.text,
        ['@imageDict'] = spray.imageDict,
        ['@image'] = spray.image,
        ['@font'] = spray.font,
        ['@color'] = spray.color,
        ['@interior'] = spray.interior,
        ['@identifier'] = spray.identifier,
    })
end

Citizen.CreateThread(function()
    local results = MySQL.Sync.fetchAll([[
        SELECT x, y, z, origX, origY, origZ, rx, ry, rz, scale, text, imageDict, image, font, color, created_at, interior
        FROM sprays
    ]])

    for _, s in pairs(results) do
        table.insert(SPRAYS, {
            location = vector3(s.origX + 0.0, s.origY + 0.0, s.origZ + 0.0),
            realLocation = vector3(s.x + 0.0, s.y + 0.0, s.z + 0.0),
            realRotation = vector3(s.rx + 0.0, s.ry + 0.0, s.rz + 0.0),
            scale = tonumber(s.scale) + 0.0,
            text = s.text,
            imageDict = s.imageDict,
            image = s.image,
            font = s.font,
            color = s.color,
            interior = (s.interior == 1) and true or false,
            createdAt = tonumber(math.floor(s.created_at/1000))
        })
    end

    TriggerLatentClientEvent('rcore_spray:setSprays', -1, 1000000, SPRAYS)
end)

Citizen.CreateThread(function()
    if DisableMysql then
        return
    end

    while true do
        Wait(30000)

        local nowTime = tonumber(math.floor(MySQL.Sync.fetchScalar('SELECT NOW()')/1000))
        for _, s in pairs(SPRAYS) do
            local timeLeft = (s.createdAt + Config.SPRAY_PERSIST_DAYS * 24 * 60 * 60) - nowTime

            if timeLeft < 0 then
                RemoveSprayAtPosition(nil, s.location)
            end
        end
    end
end)

RegisterNetEvent('rcore_spray:playerSpawned')
AddEventHandler('rcore_spray:playerSpawned', function()
    local Source = source
    TriggerLatentClientEvent('rcore_spray:setSprays', Source, 1000000, SPRAYS)
end)

if Framework ~= FW_OTHER then
    Citizen.CreateThread(function()
        while not RegisterUsableItem do Wait(100) end
        RegisterUsableItem("spray", function(playerId)
            StartSpraying(playerId)
        end)
    end)
end

RegisterCommand('spray', function(source, args)
    if Framework == FW_OTHER then
        StartSpraying(source)
        return
    end

    local itemCount = GetItemCount(source, "spray")

    if itemCount > 0 then
        StartSpraying(source)
    else
        ShowNotification(source, Config.Text.NEED_SPRAY)
    end
end, false)

function SendMessageToWebhook(message)
    if DiscordLogWebhook and DiscordLogWebhook ~= '' then
        PerformHttpRequest(
            DiscordLogWebhook, 
            function(err, text, headers) 
            end, 
            'POST', 
            json.encode({username = 'Graffiti', content = message}),
            { ['Content-Type'] = 'application/json' }
        )
    end
end

function GetPlayerNameForWebhook(serverId, identifier)
    if serverId ~= 0 then
        if not serverId then
            serverId = '#UNKNOWN'
        end
        
        if type(serverId) == 'number' then
            return '**' .. GetPlayerName(serverId) .. '**' .. ' (#' .. serverId .. ', ' .. identifier .. ')'
        else
            return serverId
        end
    else
        return 'CONSOLE'
    end
end

function FormatSimplePos(pos)
    local x = math.floor(pos.x*10)/10
    local y = math.floor(pos.y*10)/10
    local z = math.floor(pos.z*10)/10

    return x .. ', ' .. y .. ', ' .. z
end