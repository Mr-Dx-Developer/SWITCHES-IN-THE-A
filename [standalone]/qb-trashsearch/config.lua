Config = Config or {}

Config.ItemTiers = 1

--33% on each to get money/an item or nothing
Config.RewardTypes = {
    [1] = {
        type = "item"
    },
    [2] = {
        type = "money",
    },
    [3] = {
        type = "nothing",
    }
}

--rewards for small trashcans
Config.RewardsSmall = {
        [1] = {item = "cokebaggy", minAmount = 1, maxAmount = 3},
        [2] = {item = "lockpick", minAmount = 1, maxAmount = 2},
        [3] = {item = "metalscrap", minAmount = 1, maxAmount = 1},
        [4] = {item = "copper", minAmount = 1, maxAmount = 4},
        [5] = {item = "plastic", minAmount = 1, maxAmount = 7},
        [6] = {item = "rubber", minAmount = 1, maxAmount = 1},
        [7] = {item = "iron", minAmount = 1, maxAmount = 2},
}