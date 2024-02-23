musics = {}
myPlaylists = {}
playlists = {}
if Config.Menu.media then
    xSound = exports.xsound
    function UpdateMyPlaylists()
        nuiMessage("UPDATE_MY_PLAYLISTS", myPlaylists) 
    end
    
    function UpdatePlaylists()
        nuiMessage("UPDATE_PLAYLISTS", playlists) 
    end
    
    RegisterNUICallback("createPlaylist", function(data, cb)
        TriggerServerEvent("mHud:CreatePlaylist", data.name, data.cover, data.songs)
    end)
    
    RegisterNUICallback("DeletePlaylist", function(data, cb)
        TriggerServerEvent("mHud:DeletePlaylist", data.id)
    end)
    
    RegisterNUICallback("addToPlaylist", function(data, cb)
        TriggerServerEvent("mHud:AddSongToPlaylist", data.id, data.name, data.url)
    end)
    RegisterNUICallback("DeleteMusic", function(data, cb)
        TriggerServerEvent("mHud:DeleteMusic", data.id, data.musicId)
    end)
    
    RegisterNUICallback("ChangePlaylistData", function(data, cb)
        TriggerServerEvent("mHud:ChangePlaylistData", data.id, data.type, data.val)
    end)
    
    
    RegisterNetEvent("mHud:SyncMyPlaylists")
    AddEventHandler("mHud:SyncMyPlaylists", function(data)
        myPlaylists = data
        UpdateMyPlaylists()
    
    end)
    
    RegisterNetEvent("mHud:SyncAllPlaylists")
    AddEventHandler("mHud:SyncAllPlaylists", function(data)
        playlists = data
        UpdatePlaylists()
    end)
    
    RegisterNetEvent("mHud:OnMyPlaylistChange")
    AddEventHandler("mHud:OnMyPlaylistChange", function(id, data)
        for _,v in pairs(myPlaylists) do
            if tonumber(v.id) == tonumber(id) then
                myPlaylists[_] = data
            end
        end
        UpdateMyPlaylists()
    end)
    
    RegisterNetEvent("mHud:UpdateMyPlaylistLikes")
    AddEventHandler("mHud:UpdateMyPlaylistLikes", function(id, data)
        for _,v in pairs(myPlaylists) do
            if tonumber(v.id) == tonumber(id) then
                myPlaylists[_].likes = data
            end
        end
        UpdateMyPlaylists()
    end)
    
    RegisterNetEvent("mHud:UpdatePlaylistLikes")
    AddEventHandler("mHud:UpdatePlaylistLikes", function(id, data)
    
        for _,v in pairs(playlists) do
            if tonumber(v.id) == tonumber(id) then
                playlists[_].likes = data
            end
        end
        UpdatePlaylists()
    end)
    
    RegisterNetEvent("mHud:OnPlaylistChange")
    AddEventHandler("mHud:OnPlaylistChange", function(id, data)
        for _,v in pairs(playlists) do
            if tonumber(v.id) == tonumber(id) then
                playlists[_] = data
            end
        end
        UpdatePlaylists()
    end)
    
    RegisterNetEvent("mHud:OnMyNewPlaylistAdd")
    AddEventHandler("mHud:OnMyNewPlaylistAdd", function(data)
        table.insert(myPlaylists, data)
        UpdateMyPlaylists()
    end)
    
    RegisterNetEvent("mHud:OnNewPlaylistAdd")
    AddEventHandler("mHud:OnNewPlaylistAdd", function(data)
        table.insert(playlists, data)
        UpdatePlaylists()
    end)
    
    RegisterNetEvent("mHud:OnMyPlaylistRemove")
    AddEventHandler("mHud:OnMyPlaylistRemove", function(id)
        for _,v in pairs(myPlaylists) do
            if tonumber(v.id) == tonumber(id) then
                table.remove(myPlaylists, _) 
            end
        end
        UpdateMyPlaylists()
    
    end)
    
    RegisterNetEvent("mHud:OnPlaylistRemove")
    AddEventHandler("mHud:OnPlaylistRemove", function(id)
        for _,v in pairs(playlists) do
            if tonumber(v.id) == tonumber(id) then
                table.remove(playlists, _) 
            end
        end
    end)
    
    RegisterNUICallback('LikePlaylist', function(data, cb)
        TriggerServerEvent('mHud:LikePlaylist', data.id)
        cb('ok')
    end)
    
    RegisterNUICallback('UnLikePlaylist', function(data, cb)
        TriggerServerEvent('mHud:UnLikePlaylist', data.id)
        cb('ok')
    end)
    
    RegisterNUICallback("musicAction", function(data, cb)
        if not IsPedInAnyVehicle(PlayerPed, false) then
            cb('ok')        
            return
        end
        if data.type == 'play' then
    
    
            TriggerServerEvent('mHud:PlayMusic', {
                url = data.url,
                name = data.name,
                isPaused = false,
                volume = 0.1,
                newTimeStamp = false,
            })
            nuiMessage("SET_SONG_INFORMATIONS", {
                type = 'name',
                value = data.name,
            })
            nuiMessage("SET_SONG_INFORMATIONS", {
                type = 'url',
                value = data.url,
            })
            SetVehicleRadioEnabled(Vehicle, false) 
            SetVehRadioStation(Vehicle, "OFF")
        end
     
        if data.type == 'toggle' then
            TriggerServerEvent('mHud:ToggleMusic')
            SetVehicleRadioEnabled(Vehicle, true) 
        end
    
        if data.type == 'volume-up' then
            TriggerServerEvent('mHud:VolumeUp')
        end
        if data.type == 'volume-down' then
            TriggerServerEvent('mHud:VolumeDown')
        end
        if data.type == 'timestamp' then
            TriggerServerEvent('mHud:SetTimeStamp', data.payload)
    
        end
        cb('ok')
    end)
    
    
    RegisterNetEvent("mHud:SynchronizeMusics")
    AddEventHandler("mHud:SynchronizeMusics", function(data, src)
        musics[src] = data
    end)
    
    RegisterNetEvent("mHud:SetTimeStamp")
    AddEventHandler("mHud:SetTimeStamp", function(src, timestamp)
        if xSound:soundExists('music-'..src) then
            xSound:setTimeStamp('music-'..src, timestamp)
        end
    end)
    
    RegisterNetEvent("mHud:musicChange")
    AddEventHandler("mHud:musicChange", function(src)
        if xSound:soundExists('music-'..src) then
            xSound:Destroy('music-'..src)
        end
    end)
    
    function GetOpenWindows(vehicle)
        local open = false
        for i=0, 3 do
            local door = i
            if door == 2 then
                door = 3
            elseif door == 3 then
                door = 2
            end
            local isclosed = IsVehicleWindowIntact(vehicle,i)
            if not isclosed and GetIsDoorValid(vehicle, door) then
                open = true
            end
        end
        return open
    end
    
    
    
    CreateThread(function()
        while true do
            for src, data in pairs(musics) do
                if data then
                    local player = GetPlayerFromServerId(src)
                    if player ~= -1 then
                        local ped = GetPlayerPed(player)
                        local vehicle = GetVehiclePedIsIn(ped)
                        
                        if vehicle and DoesEntityExist(vehicle) then
                            if not xSound:soundExists('music-'..src) then
                                xSound:PlayUrlPos('music-'..src, data.url, data.volume, GetEntityCoords(vehicle))
                                xSound:setVolumeMax('music-'..src, 1.0)
                                local myVehicle = GetVehiclePedIsIn(PlayerPed)
                                if vehicle == myVehicle then
                                    xSound:setVolume('music-'..src, data.volume)
                                else
                                    local count = 0
    
                                    if  GetOpenWindows(vehicle) then
                                        count = 1/13
                                    end
    
                                    local volume = ((0.03) + count)
                                    local distance = (#(GetEntityCoords(PlayerPed) - GetEntityCoords(vehicle))) / 90
                                    xSound:setVolume('music-'..src, volume-distance)
                                end
    
                            else                        
                                local url = xSound:getLink('music-'..src)
                                if url ~= data.url then
                                    xSound:Destroy('music-'..src)
                                    xSound:PlayUrlPos('music-'..src, data.url, data.volume, GetEntityCoords(vehicle))
                                    xSound:setVolumeMax('music-'..src, 1.0)       
                                    if xSound:isPaused('music-'..src) then
                                        xSound:Resume('music-'..src)      
                                    end                              
                                end
                                if hudSettings.streamerMode then
                                    xSound:setVolume('music-'..src, 0)
                                else
                                    local myVehicle = GetVehiclePedIsIn(PlayerPed)
                                    if vehicle == myVehicle then
                                        xSound:setVolume('music-'..src, data.volume)
                                    else
    
                                        local count = 0
                                        if  GetOpenWindows(vehicle) then
                                            count = 1/13
                                        end
    
                                        local volume = ((0.03) + count)
                                        local distance = (#(GetEntityCoords(PlayerPed) - GetEntityCoords(vehicle))) / 90
                                        xSound:setVolume('music-'..src, volume-distance)
                                    end
                                end 
                              
                                xSound:Position('music-'..src, GetEntityCoords(vehicle))
                                if data.isPaused  then
                                    xSound:Pause('music-'..src)
                                elseif not data.isPaused then
                                    xSound:Resume('music-'..src)
                                end
                          
                               
                  
                                xSound:Distance('music-'..src, 130)
                            end  
                        else
                            if xSound:soundExists('music-'..src) then
                                xSound:Pause('music-'..src)   
                                local mysrc = GetPlayerServerId(PlayerId()) 
                                
                                if mysrc == src then
                                    TriggerServerEvent("mHud:PauseMusic")
                                end
                            end 
                        end
                    end
                else
                    if xSound:soundExists('music-'..src) then
                        xSound:Destroy('music-'..src)     
                    end      
                end
            end
            Wait(350)
        end
    end)
    
    RegisterNetEvent("mHud:DestroyMusic")
    AddEventHandler("mHud:DestroyMusic", function(src)
        if xSound:soundExists('music-'..src) then
            xSound:Destroy('music-'..src)     
        end    
    end)
    
    CreateThread(function()
        while true do
            local src = GetPlayerServerId(PlayerId()) 
            local cd = 2000
            if xSound:soundExists('music-'..src) and IsPedInAnyVehicle(PlayerPedId()) then
                local maxDuration = xSound:getMaxDuration('music-'..src)
                local timeStamp = xSound:getTimeStamp('music-'..src)
     
    
         
                nuiMessage("SET_SONG_INFORMATIONS", {
                    type = 'isPaused',
                    value = xSound:isPaused('music-'..src),
                })
                nuiMessage("SET_SONG_INFORMATIONS", {
                    type = 'volume',
                    value = xSound:getVolume('music-'..src),
                })
                if not xSound:isPaused('music-'..src) then
             
                    nuiMessage("SET_MUSIC_TIME", {
                        maxDuration = maxDuration,
                        timeStamp = timeStamp,
                    })
                    if (maxDuration == math.ceil(timeStamp)+1 or maxDuration == math.ceil(timeStamp)+2 or maxDuration == math.ceil(timeStamp)) and maxDuration ~= 0 then
                        nuiMessage("CHANGE_MUSIC")   
                    end
                end
           
                cd = 1000
            end
            Wait(cd)
        end
    end)
    
end






