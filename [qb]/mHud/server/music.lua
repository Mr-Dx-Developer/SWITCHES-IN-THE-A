musics = {}
playlists = {}
if Config.Menu.media then
    CreateThread(function()
        Wait(1000)
        playlists = ExecuteSql(string.format("SELECT * FROM `m_hud_playlists`"))
        local playlistSongs = ExecuteSql(string.format("SELECT * FROM `m_hud_playlist_songs`"))
    
        for _,v in pairs(playlists) do
            v.likes = json.decode(v.likes)
            if not v.musics then
                v.musics = {}
            end
            for __,vv in pairs(playlistSongs) do
              
                if vv.playlist_id == v.id then
                    
                    table.insert(v.musics, {url = vv.url, name = vv.name, id = vv.id, playlist_id = vv.playlist_id})
                end
            end
        end    
    end)
    
    AddEventHandler('playerDropped', function()
        local src = source
        if musics[src] then
            musics[src] = false
            TriggerClientEvent("mHud:DestroyMusic", -1, src)
            TriggerClientEvent("mHud:SynchronizeMusics", -1, data, src)
        end
    end)
    
    function AddSongToPlaylist(playListId, name, url)
        local playlist = GetPlaylistById(playListId)
        if playlist then    
            for _,v in pairs(playlist.musics) do
                if v.url == url then
                    return
                end
            end
            
            local parameters = { ['@playlistId'] = playListId,  ['@url'] = url, ['@name'] = name }
    
            local insertData = ExecuteSql('INSERT INTO m_hud_playlist_songs (playlist_id, url, name) VALUES (@playlistId, @url, @name)', parameters)
            if insertData then
                local id = insertData.insertId
                table.insert(playlist.musics, {
                    id = id,
                    playlist_id = playListId,
                    name = name,
                    url = url,            
                })
            end
            -- ExecuteSql('INSERT INTO `m_hud_playlist_songs` (`id`, `url`, `name`) VALUES ('..playListId..', '..json.encode(url)..', '..json.encode(name)..')')
        end
    end
    
    RegisterServerEvent("mHud:ChangePlaylistData")
    AddEventHandler("mHud:ChangePlaylistData", function(playlistid, type, newval)
        local src = source
        local identifier = GetIdentifier(src)
        local playlist = GetPlaylistById(playlistid)
    
        if playlist and playlist.owner == identifier then
            playlist[type] = newval
            ExecuteSql(string.format("UPDATE `m_hud_playlists` SET "..type.." = '%s' WHERE id='%s'", newval, playlistid))
            TriggerClientEvent("mHud:OnMyPlaylistChange", src, playlistid, GetPlaylistById(playlistid))
            TriggerClientEvent("mHud:OnPlaylistChange", -1, playlistid, GetPlaylistById(playlistid)) 
        end
    end)
    
    RegisterServerEvent("mHud:DeleteMusic")
    AddEventHandler("mHud:DeleteMusic", function(id, musicId)
        local src = source
        local identifier = GetIdentifier(src)
        local playlist = GetPlaylistById(id)
    
        if playlist and playlist.owner == identifier then
            for _,v in pairs(playlist.musics) do
                if tonumber(v.id) == tonumber(musicId) then
                    table.remove(playlist.musics, _)
                    TriggerClientEvent("mHud:OnMyPlaylistChange", src, id, playlist)
                    TriggerClientEvent("mHud:OnPlaylistChange", -1, id, playlist) 
                    ExecuteSql(string.format("DELETE FROM `m_hud_playlist_songs` WHERE id = '%s'", musicId))
                end
            end
        end
    end)
    
    RegisterServerEvent("mHud:musicChange")
    AddEventHandler("mHud:musicChange", function()
        local src = source
        TriggerClientEvent('mHud:musicChange', -1, src)
    end)
    
    
    RegisterServerEvent("mHud:LikePlaylist")
    AddEventHandler("mHud:LikePlaylist", function(id)
        local src = source
        local playlist = GetPlaylistById(id)
        local identifier = GetIdentifier(src)
        if playlist then
            for _,v in pairs(playlist.likes) do
                if v == identifier then
                    return
                end
            end
            table.insert(playlist.likes, identifier)
            ExecuteSql(string.format("UPDATE `m_hud_playlists` SET likes = %q WHERE id='%s'", json.encode(playlist.likes), id))
            TriggerClientEvent("mHud:UpdateMyPlaylistLikes", src, id, playlist.likes)        
            TriggerClientEvent("mHud:UpdatePlaylistLikes", -1, id, playlist.likes)
    
        end
    end)
    
    
    RegisterServerEvent("mHud:UnLikePlaylist")
    AddEventHandler("mHud:UnLikePlaylist", function(id)
        local src = source
        local playlist = GetPlaylistById(id)
        local identifier = GetIdentifier(src)
        if playlist then
            local index = false
            for _,v in pairs(playlist.likes) do
                if v == identifier then
                    index = _
                end
            end
            if index then
                table.remove(playlist.likes, index)
                ExecuteSql(string.format("UPDATE `m_hud_playlists` SET likes = %q WHERE id='%s'", json.encode(playlist.likes), id))
                TriggerClientEvent("mHud:UpdateMyPlaylistLikes", src, id, playlist.likes)        
                TriggerClientEvent("mHud:UpdatePlaylistLikes", -1, id, playlist.likes)
            end
        end
    end)
    
    RegisterServerEvent('mHud:AddSongToPlaylist')
    AddEventHandler('mHud:AddSongToPlaylist', function(playListId, name, url)
        local src = source
        AddSongToPlaylist(playListId, name, url)
        TriggerClientEvent("mHud:OnMyPlaylistChange", src, playListId, GetPlaylistById(playListId))
        TriggerClientEvent("mHud:OnPlaylistChange", -1, playListId, GetPlaylistById(playListId)) 
    end)
    
    function GetPlaylistById(id)
        for _,v in pairs(playlists) do
            if tonumber(v.id) == tonumber(id) then
                return v, _
            end 
        end
        return false
    end
    
    function GetMyPlaylists(source)
        local myPlaylists = {}
        local identifier = GetIdentifier(source)
        if identifier then
            for _,v in pairs(playlists) do
                if v.owner == identifier then
                    table.insert(myPlaylists, v)
                end
            end
        end
        return myPlaylists
    end
    
    RegisterServerEvent("mHud:CreatePlaylist")
    AddEventHandler("mHud:CreatePlaylist", function(name, cover, songs)
        local src = source
        local identifier = GetIdentifier(src)
        local playerName = GetPlayerRoleplayName(src)
        if identifier and playerName then
            local insertData = ExecuteSql(string.format("INSERT INTO `m_hud_playlists` (name, cover, owner, creatorname, likes) VALUES ('%s', '%s', '%s', '%s', %q)", name, cover, identifier, playerName, json.encode({})))
            if insertData then
                local id = insertData.insertId
                local data = {
                    id = id,
                    owner = identifier,
                    name = name,
                    cover = cover,
                    musics = {},
                    likes = {},
                    creatorname = playerName,
                }
                table.insert(playlists, data)
                for _,v in pairs(songs) do
                    AddSongToPlaylist(id, v.name, v.url)
                end
                TriggerClientEvent("mHud:OnMyNewPlaylistAdd", src, GetPlaylistById(id))
                TriggerClientEvent("mHud:OnNewPlaylistAdd", -1, GetPlaylistById(id))            
            end
        end
    end)
    
    RegisterServerEvent("mHud:DeletePlaylist")
    AddEventHandler("mHud:DeletePlaylist", function(id)
        local src = source
        local identifier = GetIdentifier(src)
        local playlist, index = GetPlaylistById(id)
        if identifier and playlist and playlist.owner == identifier then
            table.remove(playlists, index)
            ExecuteSql(string.format("DELETE FROM `m_hud_playlists` WHERE id = '%s' AND owner = '%s'", id, identifier))
            ExecuteSql(string.format("DELETE FROM `m_hud_playlist_songs` WHERE playlist_id = '%s'", id))
            
            TriggerClientEvent("mHud:OnMyPlaylistRemove", src, id)
            TriggerClientEvent("mHud:OnPlaylistRemove", -1, id)  
        end
    end)
    
    RegisterServerEvent("mHud:RequestPlaylists")
    AddEventHandler("mHud:RequestPlaylists", function()
        local src = source
        TriggerClientEvent('mHud:SyncAllPlaylists', src, playlists)
        TriggerClientEvent('mHud:SyncMyPlaylists', src, GetMyPlaylists(src))
    end)
    
    RegisterServerEvent("mHud:PlayMusic")
    AddEventHandler("mHud:PlayMusic", function(data)
        local src = source
        if not musics[src] then
            musics[src] = {}
        else
            data.volume = musics[src].volume
        end
        
        musics[src] = data
        TriggerClientEvent("mHud:SynchronizeMusics", -1, data, src)
    end)
    
    RegisterServerEvent("mHud:DestroyMusic")
    AddEventHandler("mHud:DestroyMusic", function()
        local src = source
        if musics[src] then
            musics[src] = false
            TriggerClientEvent("mHud:DestroyMusic", -1, src)
            TriggerClientEvent("mHud:SynchronizeMusics", -1, data, src)
        end
    end)
    
    RegisterServerEvent("mHud:ToggleMusic")
    AddEventHandler("mHud:ToggleMusic", function()
        local src = source
        if musics[src] then
            musics[src].isPaused = not musics[src].isPaused
            TriggerClientEvent("mHud:SynchronizeMusics", -1, musics[src], src)
        end
    end)
    
    
    RegisterServerEvent("mHud:PauseMusic")
    AddEventHandler("mHud:PauseMusic", function()
        local src = source
        if musics[src] then
            if not musics[src].isPaused then            
                musics[src].isPaused = true
                TriggerClientEvent("mHud:SynchronizeMusics", -1, musics[src], src)
            end
        end
    end)
    
    RegisterServerEvent("mHud:ResumeMusic")
    AddEventHandler("mHud:ResumeMusic", function()
        local src = source
        if musics[src] then
            if musics[src].isPaused then
                musics[src].isPaused = false
                TriggerClientEvent("mHud:SynchronizeMusics", -1, musics[src], src)
            end
        end
    end)
    
    
    RegisterServerEvent('mHud:VolumeUp')
    AddEventHandler('mHud:VolumeUp', function()
        local src = source
        if musics[src] then
        
            musics[src].volume = musics[src].volume + 0.1
            if musics[src].volume > 1.0 then
                musics[src].volume = 1.0
            end
            TriggerClientEvent("mHud:SynchronizeMusics", -1, musics[src], src)
        end
    end)
    
    
    RegisterServerEvent('mHud:SetTimeStamp')
    AddEventHandler('mHud:SetTimeStamp', function(timestamp)
        local src = source
        TriggerClientEvent("mHud:SetTimeStamp", -1, src, timestamp)
    end)
    
    RegisterServerEvent('mHud:VolumeDown')
    AddEventHandler('mHud:VolumeDown', function()
        local src = source
        if musics[src] then
    
            musics[src].volume = musics[src].volume - 0.1
            if musics[src].volume < 0.1 then
                musics[src].volume = 0.1
            end
            TriggerClientEvent("mHud:SynchronizeMusics", -1, musics[src], src)
        end
    end)
end
