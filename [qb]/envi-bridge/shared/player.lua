---Get Player
---@class Player
Framework.Player = {
    Identifier = nil,
    Name = nil,
    Firstname = nil,
    Lastname = nil,
    Job = {
        Name = nil,
        Label = nil,
        Duty = false,
        Boss = false,
        Grade = {
            Name = nil,
            Level = nil

        }
    },
    Gang = {
        Name = nil,
        Label = nil,
        Boss = false,
        Grade = {
            Name = nil,
            Level = nil
        },
    },
    Metadata = nil
}

Framework.HasJob = function(job, player)
    if type(job) == 'table' then
        job = job[player.Job.Name]
        if job and player.Job.Grade.Level >= job then
            return true
        end
    elseif job == player.Job.Name then
        return true
    end
    return false
end

Framework.HasGang = function(gang, player)
    if type(gang) == 'table' then
        gang = gang[player.Gang.Name]
        if gang and player.Gang.Grade.Level >= gang then
            return true
        end
    elseif gang == player.Gang.Name then
        return true
    end
    return false
end