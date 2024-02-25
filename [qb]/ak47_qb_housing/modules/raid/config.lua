Config.HouseRaid = {
    enable = true,
    condition = {
        owneronline = true,     --Owner must be online
        memberonline = true,    --One of the member must be online
    },
    notify = {
        owner = true,           --Notify owner
        members = true,         --Notify members
    },
    inventoryaccess = true,
    delay = 10000,
    jobs = {
        police = 4,
    },
    LockSkillCheck = function()
        return lib.skillCheck({'easy', 'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'}) --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
    end
}