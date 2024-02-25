Config.Weed = {
    enable                  = true,                             -- Enable or Disable
    maxPlant                = 50,
    seed                    = {required = false, item = 'seed_weed', count = 1},
    getSeedOnHarvest        = {minimum = 1, maximum = 5},
    getSeedOnHarvestChance  = 50,                               --50% chance
    harvestItem             = 'weed_leaf',
    harvestItemCount        = {minimum = 5, maximum = 10},      --for each collect
    harvestSkillCheck = function()
        return lib.skillCheck({areaSize = 80, speedMultiplier = 0.5}, {'w', 'a', 's', 'd'})   --https://overextended.dev/ox_lib/Modules/Interface/Client/skillcheck
        --return true --use this if you don't need skill check
    end,
    waterRequireChance      = 10,
    fertilizerRequireChance = 10,

    sageTimer = {
        [1] = 1, --go to next stage in minute
        [2] = 2, --go to next stage in minute
        [3] = 3, --go to next stage in minute
        [4] = 4, --go to next stage in minute
        [5] = 5, --go to next stage in minute
        [6] = 6, --go to next stage in minute
        [7] = 6, --go to next stage in minute
        --There is no stage 8. So don't add any stage here
    }
}

--[[
Note: New stage will only be visable if you leave the housing zone and come back
]]