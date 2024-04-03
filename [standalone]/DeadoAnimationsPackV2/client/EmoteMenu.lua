TriggerServerEvent("dp:CheckVersion")

rightPosition = { x = 1450, y = 100 }
leftPosition = { x = 0, y = 100 }
menuPosition = { x = 0, y = 200 }

if Config.MenuPosition then
    if Config.MenuPosition == "left" then
        menuPosition = leftPosition
    elseif Config.MenuPosition == "right" then
        menuPosition = rightPosition
    end
end

if Config.CustomMenuEnabled then
    local RuntimeTXD = CreateRuntimeTxd('Custom_Menu_Head')
    local Object = CreateDui(Config.MenuImage, 512, 128)
    _G.Object = Object
    local TextureThing = GetDuiHandle(Object)
    local Texture = CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'Custom_Menu_Head', TextureThing)
    Menuthing = "Custom_Menu_Head"
else
    Menuthing = "shopui_title_sm_hangar"
end

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu(Config.MenuTitle or "", "", menuPosition["x"], menuPosition["y"], Menuthing, Menuthing)
_menuPool:Add(mainMenu)

function ShowNotification(text)
    if Config.NotificationsAsChatMessage then
        TriggerEvent("chat:addMessage", { color = { 255, 255, 255 }, args = { tostring(text) } })
    else
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandThefeedPostTicker(false, false)
    end
end

-- Clear all the animal emotes if disabled.
if not Config.AnimalEmotesEnabled then
    DP.AnimalEmotes = {}
    for k, v in pairs(DP) do
        for i, j in pairs(v) do
            if j.AnimalEmote then
                DP[k][i] = nil
            end
        end
    end
end

local EmoteTable = {}
local FavEmoteTable = {}
local KeyEmoteTable = {}
local DanceTable = {}
local busTable = {}
local WhiteTable2do = {}
local WhiteTable4ro = {}
local WhiteTable5ro = {}
local AnimalTable = {}
local PropETable = {}
local WalkTable = {}
local FaceTable = {}
local ShareTable = {}
local FavoriteEmote = ""

if Config.FavKeybindEnabled then
    RegisterCommand('emotefav', function(source, args, raw) FavKeybind() end)

    RegisterKeyMapping("emotefav", "Execute your favorite emote", "keyboard", Config.FavKeybind)

    local doingFavoriteEmote = false
    function FavKeybind()
        if doingFavoriteEmote then return end
        doingFavoriteEmote = true
        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
            if FavoriteEmote ~= "" and (not CanUseFavKeyBind or CanUseFavKeyBind()) then
                EmoteCommandStart(nil, { FavoriteEmote, 0 })
                Wait(3000)
            end
        end
        doingFavoriteEmote = false
    end
end

lang = Config.MenuLanguage

function AddEmoteMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['emotes'], "", "", Menuthing, Menuthing)
    if Config.Search then
        submenu:AddItem(NativeUI.CreateItem(Config.Languages[lang]['searchemotes'], ""))
        table.insert(EmoteTable, Config.Languages[lang]['searchemotes'])
    end

    local busmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['whitecustom'], "", "", Menuthing, Menuthing)
    table.insert(EmoteTable, Config.Languages[lang]['whitecustom'])

    local whitemenu2do = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['whitecustom2do'], "", "", Menuthing, Menuthing)
    table.insert(EmoteTable, Config.Languages[lang]['whitecustom2do'])

    local whitemenu4ro = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['whitecustom4'], "", "", Menuthing, Menuthing)
    table.insert(EmoteTable, Config.Languages[lang]['whitecustom4'])

    local whitemenu5ro = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['whitecustom5'], "", "", Menuthing, Menuthing)
    table.insert(EmoteTable, Config.Languages[lang]['whitecustom5'])

    local dancemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['danceemotes'], "", "", Menuthing, Menuthing)
    local animalmenu
    if Config.AnimalEmotesEnabled then
        animalmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['animalemotes'], "", "", Menuthing, Menuthing)
        table.insert(EmoteTable, Config.Languages[lang]['animalemotes'])
    end
    local propmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['propemotes'], "", "", Menuthing, Menuthing)
    table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])
    table.insert(EmoteTable, Config.Languages[lang]['danceemotes'])

    if Config.SharedEmotesEnabled then
        sharemenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['shareemotes'], Config.Languages[lang]['shareemotesinfo'], "", Menuthing, Menuthing)
        shareddancemenu = _menuPool:AddSubMenu(sharemenu, Config.Languages[lang]['sharedanceemotes'], "", "", Menuthing, Menuthing)
        table.insert(ShareTable, 'none')
        table.insert(EmoteTable, Config.Languages[lang]['shareemotes'])
    end

    -- Temp var to be able to sort every emotes in the fav list
    local favEmotes = {}
    if not Config.SqlKeybinding then
        unbind2item = NativeUI.CreateItem(Config.Languages[lang]['rfavorite'], Config.Languages[lang]['rfavorite'])
        unbinditem = NativeUI.CreateItem(Config.Languages[lang]['prop2info'], "")
        favmenu = _menuPool:AddSubMenu(submenu, Config.Languages[lang]['favoriteemotes'],
            Config.Languages[lang]['favoriteinfo'], "", Menuthing, Menuthing)
        favmenu:AddItem(unbinditem)
        favmenu:AddItem(unbind2item)
        -- Add two elements as offset
        table.insert(FavEmoteTable, Config.Languages[lang]['rfavorite'])
        table.insert(FavEmoteTable, Config.Languages[lang]['rfavorite'])
        table.insert(EmoteTable, Config.Languages[lang]['favoriteemotes'])
    else
        table.insert(EmoteTable, "keybinds")
        keyinfo = NativeUI.CreateItem(Config.Languages[lang]['keybinds'],
            Config.Languages[lang]['keybindsinfo'] .. " /emotebind [~r~num4-9~w~] [~g~emotename~w~]")
        submenu:AddItem(keyinfo)
    end

    for a, b in pairsByKeys(DP.Emotes) do
        x, y, z = table.unpack(b)
        emoteitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        submenu:AddItem(emoteitem)
        table.insert(EmoteTable, a)
        if not Config.SqlKeybinding then
            favEmotes[a] = z
        end
    end

    for a, b in pairsByKeys(DP.White3ro) do
        x, y, z = table.unpack(b)
        emoteitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        busmenu:AddItem(emoteitem)
        table.insert(busTable, a)
        if not Config.SqlKeybinding then
            favEmotes[a] = z
        end
    end

    for a, b in pairsByKeys(DP.White4ro) do
        x, y, z = table.unpack(b)
        emoteitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        whitemenu4ro:AddItem(emoteitem)
        table.insert(WhiteTable4ro, a)
        if not Config.SqlKeybinding then
            favEmotes[a] = z
        end
    end

    for a, b in pairsByKeys(DP.White5ro) do
        x, y, z = table.unpack(b)
        emoteitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        whitemenu5ro:AddItem(emoteitem)
        table.insert(WhiteTable5ro, a)
        if not Config.SqlKeybinding then
            favEmotes[a] = z
        end
    end

    for a, b in pairsByKeys(DP.White2do) do
        x, y, z = table.unpack(b)
        emoteitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        whitemenu2do:AddItem(emoteitem)
        table.insert(WhiteTable2do, a)
        if not Config.SqlKeybinding then
            favEmotes[a] = z
        end
    end

    for a, b in pairsByKeys(DP.Dances) do
        x, y, z = table.unpack(b)
        danceitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        dancemenu:AddItem(danceitem)
        if Config.SharedEmotesEnabled then
            sharedanceitem = NativeUI.CreateItem(z, "/nearby (" .. a .. ")")
            shareddancemenu:AddItem(sharedanceitem)
        end
        table.insert(DanceTable, a)
        if not Config.SqlKeybinding then
            favEmotes[a] = z
        end
    end

    if Config.AnimalEmotesEnabled then
        for a, b in pairsByKeys(DP.AnimalEmotes) do
            x, y, z = table.unpack(b)
            animalitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
            animalmenu:AddItem(animalitem)
            table.insert(AnimalTable, a)
            if not Config.SqlKeybinding then
                favEmotes[a] = z
            end
        end
    end

    if Config.SharedEmotesEnabled then
        for a, b in pairsByKeys(DP.Shared) do
            x, y, z, otheremotename = table.unpack(b)
            if otheremotename == nil then
                shareitem = NativeUI.CreateItem(z, "/nearby (~g~" .. a .. "~w~)")
            else
                shareitem = NativeUI.CreateItem(z,
                    "/nearby (~g~" ..
                    a .. "~w~) " .. Config.Languages[lang]['makenearby'] .. " (~r~" .. otheremotename .. "~w~)")
            end
            sharemenu:AddItem(shareitem)
            table.insert(ShareTable, a)
        end
    end

    for a, b in pairsByKeys(DP.PropEmotes) do
        x, y, z = table.unpack(b)
        propitem = NativeUI.CreateItem(z, "/e (" .. a .. ")")
        propmenu:AddItem(propitem)
        table.insert(PropETable, a)
        if not Config.SqlKeybinding then
            favEmotes[a] = z
        end
    end

    if not Config.SqlKeybinding then
        -- Add the emotes to the fav menu
        for emoteName, emoteLabel in pairsByKeys(favEmotes) do
            favemoteitem = NativeUI.CreateItem(emoteLabel,
                Config.Languages[lang]['set'] .. emoteLabel .. Config.Languages[lang]['setboundemote'])
            favmenu:AddItem(favemoteitem)
            table.insert(FavEmoteTable, emoteName)
        end

        favmenu.OnItemSelect = function(sender, item, index)
            if FavEmoteTable[index] == Config.Languages[lang]['rfavorite'] then
                FavoriteEmote = ""
                ShowNotification(Config.Languages[lang]['rfavorite'], 2000)
                return
            end
            if Config.FavKeybindEnabled then
                FavoriteEmote = FavEmoteTable[index]
                ShowNotification("~o~" .. firstToUpper(FavoriteEmote) .. Config.Languages[lang]['newsetemote'])
            end
        end
    end
    favEmotes = nil

    busmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(busTable[index], "whitecustom")
    end

    whitemenu2do.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(WhiteTable2do[index], "whitecustom2do")
    end

    whitemenu4ro.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(WhiteTable4ro[index], "whitecustom4")
    end

    whitemenu5ro.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(WhiteTable5ro[index], "whitecustom5")
    end

    dancemenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(DanceTable[index], "dances")
    end

    if Config.AnimalEmotesEnabled then
        animalmenu.OnItemSelect = function(sender, item, index)
            EmoteMenuStart(AnimalTable[index], "animals")
        end
    end

    if Config.SharedEmotesEnabled then
        sharemenu.OnItemSelect = function(sender, item, index)
            if ShareTable[index] ~= 'none' then
                target, distance = GetClosestPlayer()
                if (distance ~= -1 and distance < 3) then
                    _, _, rename = table.unpack(DP.Shared[ShareTable[index]])
                    TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), ShareTable[index])
                    SimpleNotify(Config.Languages[lang]['sentrequestto'] .. GetPlayerName(target))
                else
                    SimpleNotify(Config.Languages[lang]['nobodyclose'])
                end
            end
        end

        shareddancemenu.OnItemSelect = function(sender, item, index)
            target, distance = GetClosestPlayer()
            if (distance ~= -1 and distance < 3) then
                _, _, rename = table.unpack(DP.Dances[DanceTable[index]])
                TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), DanceTable[index], 'Dances')
                SimpleNotify(Config.Languages[lang]['sentrequestto'] .. GetPlayerName(target))
            else
                SimpleNotify(Config.Languages[lang]['nobodyclose'])
            end
        end
    end

    propmenu.OnItemSelect = function(sender, item, index)
        EmoteMenuStart(PropETable[index], "props")
    end

    submenu.OnItemSelect = function(sender, item, index)
        if Config.Search and EmoteTable[index] == Config.Languages[lang]['searchemotes'] then
            EmoteMenuSearch(submenu)
        elseif EmoteTable[index] ~= Config.Languages[lang]['favoriteemotes'] then
            EmoteMenuStart(EmoteTable[index], "emotes")
        end
    end

    
end

if Config.Search then
    local ignoredCategories = {
        ["Walks"] = true,
        ["Expressions"] = true,
        ["Shared"] = not Config.SharedEmotesEnabled
    }

    function EmoteMenuSearch(lastMenu)
        local favEnabled = not Config.SqlKeybinding and Config.FavKeybindEnabled
        AddTextEntry("PM_NAME_CHALL", Config.Languages[lang]['searchinputtitle'])
        DisplayOnscreenKeyboard(1, "PM_NAME_CHALL", "", "", "", "", "", 30)
        while UpdateOnscreenKeyboard() == 0 do
            DisableAllControlActions(0)
            Wait(100)
        end
        local input = GetOnscreenKeyboardResult()
        if input ~= nil then
            local results = {}
            for k, v in pairs(DP) do
                if not ignoredCategories[k] then
                    for a, b in pairs(v) do
                        if string.find(string.lower(a), string.lower(input)) or (b[3] ~= nil and string.find(string.lower(b[3]), string.lower(input))) then
                            table.insert(results, {table = k, name = a, data = b})
                        end
                    end
                end
            end

            if #results > 0 then
                local searchMenu = _menuPool:AddSubMenu(lastMenu, string.format(Config.Languages[lang]['searchmenudesc'], #results, input), "", true, Menuthing, Menuthing)
                local sharedDanceMenu
                if favEnabled then
                    local rFavorite = NativeUI.CreateItem(Config.Languages[lang]['rfavorite'], Config.Languages[lang]['rfavorite'])
                    searchMenu:AddItem(rFavorite)
                end

                if Config.SharedEmotesEnabled then
                    sharedDanceMenu = _menuPool:AddSubMenu(searchMenu, Config.Languages[lang]['sharedanceemotes'], "", true, Menuthing, Menuthing)
                end

                table.sort(results, function(a, b) return a.name < b.name end)
                for k, v in pairs(results) do
                    local desc = ""
                    if v.table == "Shared" then
                        local otheremotename = v.data[4]
                        if otheremotename == nil then
                           desc = "/nearby (~g~" .. v.name .. "~w~)"
                        else
                           desc = "/nearby (~g~" .. v.name .. "~w~) " .. Config.Languages[lang]['makenearby'] .. " (~r~" .. otheremotename .. "~w~)"
                        end
                    else
                        desc = "/e (" .. v.name .. ")" .. (favEnabled and "\n" .. Config.Languages[lang]['searchshifttofav'] or "")
                    end

                    local item = NativeUI.CreateItem(v.data[3], desc)
                    searchMenu:AddItem(item)
                    if v.table == "Dances" and Config.SharedEmotesEnabled then
                        local item2 = NativeUI.CreateItem(v.data[3], "")
                        sharedDanceMenu:AddItem(item2)
                    end
                end

                if favEnabled then
                    table.insert(results, 1, Config.Languages[lang]['rfavorite'])
                end

                searchMenu.OnItemSelect = function(sender, item, index)
                    local data = results[index]

                    if data == Config.Languages[lang]['sharedanceemotes'] then return end
                    if data == Config.Languages[lang]['rfavorite'] then 
                        FavoriteEmote = ""
                        ShowNotification(Config.Languages[lang]['rfavorite'], 2000)
                        return 
                    end

                    if favEnabled and IsControlPressed(0, 21) then
                        if data.table ~= "Shared" then
                            FavoriteEmote = data.name
                            ShowNotification("~o~" .. firstToUpper(data.name) .. Config.Languages[lang]['newsetemote'])
                        else
                            SimpleNotify(Config.Languages[lang]['searchcantsetfav'])
                        end
                    elseif data.table == "Emotes" or data.table == "Dances" then
                        EmoteMenuStart(data.name, string.lower(data.table))
                    elseif data.table == "PropEmotes" then
                        EmoteMenuStart(data.name, "props")
                    elseif data.table == "White2do" then
                        EmoteMenuStart(data.name, "whitecustom2do")
                    elseif data.table == "White3ro" then
                        EmoteMenuStart(data.name, "whitecustom")
                    elseif data.table == "White4ro" then
                        EmoteMenuStart(data.name, "whitecustom4")
                    elseif data.table == "White5ro" then
                        EmoteMenuStart(data.name, "whitecustom5")
                    elseif data.table == "AnimalEmotes" then
                        EmoteMenuStart(data.name, "animals")
                    elseif data.table == "Shared" then
                        target, distance = GetClosestPlayer()
                        if (distance ~= -1 and distance < 3) then
                            _, _, rename = table.unpack(DP.Shared[data.name])
                            TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), data.name)
                            SimpleNotify(Config.Languages[lang]['sentrequestto'] .. GetPlayerName(target))
                        else
                            SimpleNotify(Config.Languages[lang]['nobodyclose'])
                        end   
                    end
                end

                if Config.SharedEmotesEnabled then
                    if #sharedDanceMenu.Items > 0 then
                        table.insert(results, (favEnabled and 2 or 1), Config.Languages[lang]['sharedanceemotes'])
                        sharedDanceMenu.OnItemSelect = function(sender, item, index)
                            local data = results[index]
                            target, distance = GetClosestPlayer()
                            if (distance ~= -1 and distance < 3) then
                                _, _, rename = table.unpack(DP.Dances[data.name])
                                TriggerServerEvent("ServerEmoteRequest", GetPlayerServerId(target), data.name, 'Dances')
                                SimpleNotify(Config.Languages[lang]['sentrequestto'] .. GetPlayerName(target))
                            else
                                SimpleNotify(Config.Languages[lang]['nobodyclose'])
                            end
                        end
                    else
                        sharedDanceMenu:Clear()
                        searchMenu:RemoveItemAt((favEnabled and 2 or 1))
                    end
                end

                searchMenu.OnMenuClosed = function()
                    searchMenu:Clear()
                    lastMenu:RemoveItemAt(#lastMenu.Items)
                    _menuPool:RefreshIndex()
                    results = {}
                end

                _menuPool:RefreshIndex()
                _menuPool:CloseAllMenus()
                searchMenu:Visible(true)
            else
                SimpleNotify(string.format(Config.Languages[lang]['searchnoresult'], input))
            end
        end
    end
end

function AddCancelEmote(menu)
    local newitem = NativeUI.CreateItem(Config.Languages[lang]['cancelemote'], Config.Languages[lang]['cancelemoteinfo'])
    menu:AddItem(newitem)
    menu.OnItemSelect = function(sender, item, checked_)
        if item == newitem then
            EmoteCancel()
            DestroyAllProps()
        end
    end
end

function AddWalkMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['walkingstyles'], "", "", Menuthing, Menuthing)

    walkreset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
    submenu:AddItem(walkreset)
    table.insert(WalkTable, Config.Languages[lang]['resetdef'])

    -- This one is added here to be at the top of the list.
    WalkInjured = NativeUI.CreateItem("Injured", "/walk (injured)")
    submenu:AddItem(WalkInjured)
    table.insert(WalkTable, "move_m@injured")

    for a, b in pairsByKeys(DP.Walks) do
        x, label = table.unpack(b)
        walkitem = NativeUI.CreateItem(label or a, "/walk (" .. string.lower(a) .. ")")
        submenu:AddItem(walkitem)
        table.insert(WalkTable, x)
    end

    submenu.OnItemSelect = function(sender, item, index)
        if item ~= walkreset then
            WalkMenuStart(WalkTable[index])
        else
            ResetPedMovementClipset(PlayerPedId())
        end
    end
end

function AddFaceMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['moods'], "", "", Menuthing, Menuthing)

    facereset = NativeUI.CreateItem(Config.Languages[lang]['normalreset'], Config.Languages[lang]['resetdef'])
    submenu:AddItem(facereset)
    table.insert(FaceTable, "")

    for a, b in pairsByKeys(DP.Expressions) do
        x, y, z = table.unpack(b)
        faceitem = NativeUI.CreateItem(a, "")
        submenu:AddItem(faceitem)
        table.insert(FaceTable, a)
    end

    submenu.OnItemSelect = function(sender, item, index)
        if item ~= facereset then
            EmoteMenuStart(FaceTable[index], "expression")
        else
            ClearFacialIdleAnimOverride(PlayerPedId())
        end
    end
end

function AddInfoMenu(menu)
    if not UpdateAvailable then
        infomenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['infoupdate'], "Thank You ❤️", "",
            Menuthing, Menuthing)
    else
        infomenu = _menuPool:AddSubMenu(menu, Config.Languages[lang]['infoupdateav'],
            Config.Languages[lang]['infoupdateavtext'], "", Menuthing, Menuthing)
    end
    infomenu:AddItem(NativeUI.CreateItem(Config.Languages[lang]['suggestions'],
        Config.Languages[lang]['suggestionsinfo'
        ]))
    infomenu:AddItem(NativeUI.CreateItem("Join the <font color=\"#00ceff\">Discord</font>",
        "Join Discord! 💬 <font color=\"#00ceff\">https://discord.gg/HqWARfaueE</font>"))
    infomenu:AddItem(NativeUI.CreateItem("Thanks ~o~TBS~s~", "~o~TBS~s~ for the original dpemotes ❤️"))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <b>TBS</b>",
        "<b>TBS</b> for the addition of Animal Emotes 🐩 submenu."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks ~r~TBS~s~",
        "~r~TBS~s~ for reformatting and assisting with code and additional features 🙏"))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#3b8eea\">TBS</font>",
        "<font color=\"#3b8eea\">TBS</font> for the custom pride flags 🏳️‍🌈."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#a356fa\">TBS</font>",
        "<font color=\"#a356fa\">TBS</font> for the custom emotes 💜."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#ff00c3\">TBS</font>",
        "<font color=\"#ff00c3\">TBS</font> for assisting with attached Shared Emotes ⚙️."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#7dbf7b\">TBS</font>",
        "<font color=\"#7dbf7b\">TBS</font> for the custom emotes 🐇."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#FF6100\">TBS</font>",
        "<font color=\"#FF6100\">TBS</font> for the custom emotes 🤙🏼."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks ~b~TBS~s~", "~b~TBS~s~ for the custom emotes ☺️."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#37DA00\">TBS</font>",
        "<font color=\"#37DA00\">TBS</font> for the custom food props 🍩."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#C40A7D\">TBS</font>",
        "<font color=\"#C40A7D\">TBS</font> for the custom lollipop props 🍭."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#189FD0\">TBS</font>",
        "<font color=\"#189FD0\">TBS</font> for the search feature 🔎."))
    infomenu:AddItem(NativeUI.CreateItem("Thanks <font color=\"#ff61a0\">TBS</font>",
        "<font color=\"#ff61a0\">TBS</font> for all da shit ☺️."))

    infomenu:AddItem(NativeUI.CreateItem("Thanks to the community", "Translations, bug reports and moral support 🌐"))
end

function OpenEmoteMenu()
    if _menuPool:IsAnyMenuOpen() then
        _menuPool:CloseAllMenus()
    else
        mainMenu:Visible(true)
        ProcessMenu()
    end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

AddEmoteMenu(mainMenu)
AddCancelEmote(mainMenu)
if Config.WalkingStylesEnabled then
    AddWalkMenu(mainMenu)
end
if Config.ExpressionsEnabled then
    AddFaceMenu(mainMenu)
end

_menuPool:RefreshIndex()

local isMenuProcessing = false
function ProcessMenu()
    if isMenuProcessing then return end
    isMenuProcessing = true
    while _menuPool:IsAnyMenuOpen() do
        _menuPool:ProcessMenus()
        Wait(0)
    end
    isMenuProcessing = false
end

RegisterNetEvent("dp:Update")
AddEventHandler("dp:Update", function(state)
    UpdateAvailable = state
    AddInfoMenu(mainMenu)
    _menuPool:RefreshIndex()
end)

RegisterNetEvent("dp:RecieveMenu") -- For opening the emote menu from another resource.
AddEventHandler("dp:RecieveMenu", function()
    OpenEmoteMenu()
end)
