QBCore = exports['qb-core']:GetCoreObject()





QBCore.Functions.CreateCallback('core_skills:getSkillsinfo', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    exports.oxmysql:scalar(
        "SELECT skillsinfo FROM players WHERE citizenid = @citizenid",
        {["@citizenid"] = Player.PlayerData.citizenid},
        function(info)
            if info ~= nil then
                if json.decode(info) ~= nil then

                    cb(json.decode(info))

                else
                    print("Setting new xp")
                    TriggerEvent('core_skills:saveSkillsinfo', source)
                end
            else
                print('[CORE SKILLS] Upload sql file!')
            end   
        end
    )
end)

RegisterServerEvent('core_skills:addSkillsInfo')
AddEventHandler('core_skills:addSkillsInfo', function(currentlevel, nextlevel, skillpoints)
    local Player = QBCore.Functions.GetPlayer(source)
        
    exports.oxmysql:scalar(
    "SELECT skillsinfo FROM players WHERE citizenid = @citizenid",
    {["@citizenid"] = Player.PlayerData.citizenid},
    function(info)
        if info ~= nil then
            if json.decode(info) ~= nil then

                info = json.decode(info)

            else
                info = {}
            end
        else
            info = {}
        end   

        info.currentlevel = currentlevel
        info.nextlevel = nextlevel
        info.skillpoints = info.skillpoints + skillpoints

        exports.oxmysql:update(
        "UPDATE players SET skillsinfo=@skillsinfo WHERE citizenid = @citizenid",
        {['@citizenid'] = Player.PlayerData.citizenid, ['@skillsinfo'] = json.encode(info)},
        function()
        
        end)
    end)
end)


RegisterServerEvent('core_skills:saveSkillsinfo')
AddEventHandler('core_skills:saveSkillsinfo', function(source)
    local Player = QBCore.Functions.GetPlayer(source)

    info = {}
    info.skillpoints = 0
    info.skillxp = 0
    info.nextlevel = 100
    info.currentlevel = 0

    exports.oxmysql:update(
    "UPDATE players SET skillsinfo=@skillsinfo WHERE citizenid = @citizenid",
    {['@citizenid'] = Player.PlayerData.citizenid, ['@skillsinfo'] = json.encode(info)},
    function()
    
    end)
end)




----- ADD POINTS 

RegisterServerEvent('core_skills:addpoints')
AddEventHandler('core_skills:addpoints', function(add)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:scalar(
    "SELECT skillsinfo FROM players WHERE citizenid = @citizenid",
    {["@citizenid"] = Player.PlayerData.citizenid},
    function(info)
        if info ~= nil then
            if json.decode(info) ~= nil then

                info = json.decode(info)

            else
                info = {}
            end
        else
            info = {}
        end   

        info.skillpoints = info.skillpoints + add

        exports.oxmysql:update(
        "UPDATE players SET skillsinfo=@skillsinfo WHERE citizenid = @citizenid",
        {['@citizenid'] = Player.PlayerData.citizenid, ['@skillsinfo'] = json.encode(info)},
        function()
        
        end)
    end)
end)

----- REMOVE POINTS 

RegisterServerEvent('core_skills:removepoints')
AddEventHandler('core_skills:removepoints', function(Purchase)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    exports.oxmysql:scalar(
    "SELECT skillsinfo FROM players WHERE citizenid = @citizenid",
    {["@citizenid"] = Player.PlayerData.citizenid},
    function(info)
        if info ~= nil then
            if json.decode(info) ~= nil then

                info = json.decode(info)

            else
                info = {}
            end
        else
            info = {}
        end   

        info.skillpoints = info.skillpoints - Purchase

        exports.oxmysql:update(
        "UPDATE players SET skillsinfo=@skillsinfo WHERE citizenid = @citizenid",
        {['@citizenid'] = Player.PlayerData.citizenid, ['@skillsinfo'] = json.encode(info)},
        function()
        
        end)
    end)
end)





--- RESET ALL
RegisterServerEvent('core_skills:resetall') ------ CIA DAR PARESETINT 
AddEventHandler('core_skills:resetall', function()

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    info = {}
    info.skillpoints = 0
    info.skillxp = 0
    info.nextlevel = 100
    info.currentlevel = 0

    exports.oxmysql:update(
    "UPDATE players SET skillsinfo=@skillsinfo WHERE citizenid = @citizenid",
    {['@citizenid'] = Player.PlayerData.citizenid, ['@skillsinfo'] = json.encode(info)},
    function()
    
    end)


    exports.oxmysql:update(
        "DELETE FROM `core_skills` WHERE citizenid = @citizenid",
        {["citizenid"] = Player.PlayerData.citizenid},
        function()
        end
    )

    exports.oxmysql:update(
        "UPDATE `players` SET `ownedskills` = '{}' WHERE citizenid = @citizenid",
        {["citizenid"] = Player.PlayerData.citizenid},
        function()
        end
    )

end)

--- end


QBCore.Functions.CreateCallback('core_skills:getSkills', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player then
        exports.oxmysql:query(
            "SELECT * FROM players WHERE citizenid = @citizenid",
            {["citizenid"] = Player.PlayerData.citizenid},
            function(data)
                data = data[1]
    
        
                if json.decode(data.ownedskills) == nil then
                    data.ownedskills = {}
                else
                    data.ownedskills = json.decode(data.ownedskills)
                end
                
                
                cb(data.ownedskills)
                
            end)
    else
        cb({})
    end
end)


RegisterServerEvent('core_skills:saveSkills')  
AddEventHandler('core_skills:saveSkills', function(skill)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    exports.oxmysql:scalar(
    "SELECT `ownedskills` FROM players WHERE citizenid = :citizenid ",
    {["citizenid"] = Player.PlayerData.citizenid},
    function(data)

        local ownedskills = json.decode(data)

        if ownedskills == nil then
            ownedskills = {}
        end

        for _,v in pairs(ownedskills) do
            if v == skill then
                return;
            end
        end

        table.insert(ownedskills, skill)

        exports.oxmysql:update(
            "UPDATE `players` SET ownedskills= :ownedskills WHERE `citizenid` = :citizenid",
            {["ownedskills"] = json.encode(ownedskills), ["citizenid"] = Player.PlayerData.citizenid},
            function()
            end
        )
    end)
end)



QBCore.Functions.CreateCallback('core_skills:getAbilities', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    exports.oxmysql:query(
    "SELECT * FROM core_skills WHERE citizenid = :citizenid",
    {["citizenid"] = Player.PlayerData.citizenid},
    function(data)
        cb(data)
    end)
end)



RegisterServerEvent('core_skills:saveAbilities')  
AddEventHandler('core_skills:saveAbilities', function(name, value1, value2, value3)

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local Have = false
    local id = nil

    if value1 == nil then
        value1 = 0
    end
    if value2 == nil then
        value2 = 0
    end
    if value3 == nil then
        value3 = 0
    end 

    exports.oxmysql:query(
    "SELECT * FROM core_skills WHERE citizenid = :citizenid",
    {["citizenid"] = Player.PlayerData.citizenid},
    function(data)


        if data ~= nil then
            for k,v in pairs(data) do
                if v.skill_name == name then
                    Have = true
                    exports.oxmysql:update(
                    "UPDATE `core_skills` SET value1 = :value1, value2 = :value2, value3 = :value3 WHERE `id` = :id",
                    {
                        ["value1"] = value1, 
                        ["value2"] = value2, 
                        ["value3"] = value3,
                        ["id"] = v.id
                    },
                    function()
                    end)


                end
            end
        end


        if Have == false then
            exports.oxmysql:update(
            "INSERT INTO `core_skills` (`citizenid`, `skill_name`, `value1`, `value2`, `value3`) VALUES (:citizenid,:skill_name,:value1,:value2,:value3)",
            {
                ["citizenid"] = Player.PlayerData.citizenid,
                ["skill_name"] = name, 
                ["value1"] = value1, 
                ["value2"] = value2, 
                ["value3"] = value3
            },
            function()
            end)
        end

    end)

end)

RegisterServerEvent('core_skills:addExperianceEvent')  
AddEventHandler('core_skills:addExperianceEvent', function(source, earned)

    local Player = QBCore.Functions.GetPlayer(source)

    if Player == nil then return end
    
    exports.oxmysql:scalar(
    "SELECT skillsinfo FROM players WHERE citizenid = @citizenid",
    {["@citizenid"] = Player.PlayerData.citizenid},
    function(info)
        if info ~= nil then
            if json.decode(info) ~= nil then

                info = json.decode(info)

            else
                info = { }
                info.skillpoints = 0
                info.skillxp = 0
                info.nextlevel = 100
                info.currentlevel = 0
            end
        else
            info = { }
            info.skillpoints = 0
            info.skillxp = 0
            info.nextlevel = 100
            info.currentlevel = 0
        end   

        info.skillxp = info.skillxp + earned

        exports.oxmysql:update(
        "UPDATE players SET skillsinfo=@skillsinfo WHERE citizenid = @citizenid",
        {['@citizenid'] = Player.PlayerData.citizenid, ['@skillsinfo'] = json.encode(info)},
        function()
            TriggerClientEvent('core_skills:earnedxp', source, earned)
        end)
    end)

end)

function addExperiance(source, earned)

    local Player = QBCore.Functions.GetPlayer(source)

    exports.oxmysql:scalar(
    "SELECT skillsinfo FROM players WHERE citizenid = @citizenid",
    {["@citizenid"] = Player.PlayerData.citizenid},
    function(info)
        if info ~= nil then
            if json.decode(info) ~= nil then

                info = json.decode(info)

            else
                info = {}
                info.skillpoints = 0
                info.skillxp = 0
                info.nextlevel = 100
                info.currentlevel = 0
            end
        else
            info = {}
            info.skillpoints = 0
            info.skillxp = 0
            info.nextlevel = 100
            info.currentlevel = 0
        end   

        info.skillxp = info.skillxp + earned

        exports.oxmysql:update(
        "UPDATE players SET skillsinfo=@skillsinfo WHERE citizenid = @citizenid",
        {['@citizenid'] = Player.PlayerData.citizenid, ['@skillsinfo'] = json.encode(info)},
        function()
            TriggerClientEvent('core_skills:earnedxp', source, earned)
        end)
    end)
end


exports('AddExperience', addExperiance)





QBCore.Commands.Add('addxp', 'Add xp to a Player (Admin Only)', { { name = 'id', help = 'ID of player' }, { name = 'amount', help = 'Amount of XP to add' } }, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local Amount = tonumber(args[2])
    if Player then
        addExperiance(tonumber(args[1]), Amount)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Player is not online')
    end
end, 'admin')