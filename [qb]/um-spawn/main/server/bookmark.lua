if not um.main.bookmark.status then return end

lib.callback.register('um-spawn:server:bookmark:getMoney', function(source)
  local Player = GetPlayer(source)
  if Player then return Player.Functions.GetMoney('bank') end
end)

RegisterNetEvent('um-spawn:server:bookmark:addBookmark', function(input,money,location)
  local src = source
  local Player = GetPlayer(src)
  if money then Player.Functions.RemoveMoney("bank", money) end
  MySQL.insert.await('INSERT INTO `spawnbookmarks` (citizenid, name, image, location) VALUES (?, ?, ?, ?)',
      {   GetCitizenID(Player),
          input[1],
          input[2],
          json.encode(location)
      })
end)


lib.callback.register('getBookmarks', function(source)
  local citizenid = GetCitizenID(GetPlayer(source))
  local result = MySQL.query.await('SELECT * FROM spawnbookmarks WHERE citizenid = ?', { citizenid })

  local found = result[1] ~= nil
  Debug(found and 'Bookmarks: Found Bookmarks' or 'Bookmarks: Not Found')

  return found and result or false
end)


RegisterNetEvent('um-spawn:server:bookmark:deleteBookmark', function(name)
  local deleteBookmark = MySQL.query.await('DELETE FROM spawnbookmarks WHERE name = ?', { name })
  if deleteBookmark then
    print('Delete Bookmark'.. name)
  end
end)