AssetDeployer:registerFileDeploy('Custom API', 'cd_spawnselect', 'client.lua', function(file, data)
    local content = file
    local startMarker = 'DestroyCam(startcam, false)'
    local endMarker = 'DestroyCam(cam2, false)'
    local stringToAdd = [[


-- This code was imported by rcore_prison, to get properLoaded user on server.

local ped = PlayerPedId()
local time = GetGameTimer()

while (not HasCollisionLoadedAroundEntity(ped) and (GetGameTimer() - time) < 5000) do
    Wait(0)
end

SetTimeout(1000, function()
    TriggerServerEvent('rcore_prison:requestInternalLoad')
end)]]

    if not startMarker then
        startMarker = ''
    end

    if not endMarker then
        endMarker = ''
    end

    local startPos, _ = string.find(file, "%s*" .. startMarker:gsub("([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1"))
    local _, endPos = string.find(file, endMarker:gsub("([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1"))

    -- Modify the content to include the sitBlockstate declaration
    local modifiedContent = string.sub(content, 1, startPos - 1)
    modifiedContent = modifiedContent .. stringToAdd .. string.sub(content, endPos + 1)

    modifiedContent = append(modifiedContent, '', ASSET_DEPLOYER_WATERMARK_PREFIX)
    modifiedContent = append(modifiedContent, '\n' .. ASSET_DEPLOYER_WATERMARK_SUFFIX)

    return modifiedContent
end)
