Config.HouseTheft = {
    enable = true,
    condition = {
        owneronline = true,     --Owner must be online
        memberonline = true,    --Owner or One of the member must be online
    },
    notify = {
        owner = true,           --Notify owner
        members = true,         --Notify members
        police = true,          --Notify police [remvoe this if you want to use custom]
        --police = function(houseid, position) --use this if you want to use custom dispatch alert [don't touch if you are not a dev]
            --your custom dispatch code here
        --end
    },
    delay = 60000,
    item = 'lockpick',
    removeitemonfail = true,
    LockSkillCheck = function()
        return lib.skillCheck({'easy', 'medium', 'medium', 'hard'}, {'w', 'a', 's', 'd'}) --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
    end,
    InventorySkillCheck = function()
        return lib.skillCheck({'easy', 'medium', 'medium', 'hard'}, {'w', 'a', 's', 'd'}) --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
    end
}