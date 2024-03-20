if not um.main.bookmark.status then return end

local lng = Lang.Bookmark

local function checkURL(input)
    if not string.match(input, "discordapp") or string.match(input, "imgur") then
        return false
    else
        return true
    end
end

local function getLocation()
    local ped = cache.ped
    local coords = GetEntityCoords(ped)
    return { x = coords.x, y = coords.y, z = coords.z, h = GetEntityHeading(ped)}
end


RegisterCommand('addbookmark', function()
    local input = lib.inputDialog(lng.input.title, {
        {type = 'input', label = lng.input.first.name, description = lng.input.first.desc, icon = 'pencil', required = true, min = 4, max = 16},
        {type = 'input', label = lng.input.second.name, description = lng.input.second.desc, icon = 'image', min = 10, required = true},
    })

    local location = getLocation()
    local moneyAmount = um.main.bookmark.money.amount

    if not input then return end

    -- if not checkURL(input[2]) then return lib.notify({title = lng.error.title,description = lng.error.link,type = 'error'}) end

    if not um.main.bookmark.money.free then

        local alert = lib.alertDialog({
            header = lng.dialog.header,
            content = string.format(lng.dialog.content, moneyAmount),
            centered = true,
            cancel = true
        })


        if alert == 'confirm' then
        local pMoney = lib.callback.await('um-spawn:server:bookmark:getMoney')
            if pMoney >= moneyAmount then
                TriggerServerEvent('um-spawn:server:bookmark:addBookmark', input, moneyAmount, location)
            else
                lib.notify({title = lng.error.title,description = lng.error.money,type = 'error'})
            end
        end
    else
        TriggerServerEvent('um-spawn:server:bookmark:addBookmark', input, false, location)
    end
end)


RegisterNUICallback('deleteBookmark', function(name,cb)
    TriggerServerEvent('um-spawn:server:bookmark:deleteBookmark', name)
    cb(1 or 'ok')
end)