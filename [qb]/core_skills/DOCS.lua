



SkillAbilities = { -- You can build your own skill tree, you can create skills with the abilities you want
            
    AddArmor = 0,--(1-100) amount of armor that will be added to player after they use /addarmor command (they will unlock this command only after they have this skill)(it could be used every 5 mins)
        
    AddHealth = 0,--(1-100) amount of hp that will be added to player after they use /addhp command (they will unlock this command only after they have this skill)(it could be used every 5 mins)
        
    AddHealthRegen = { -- adds Health regeneration
        SpeedOfRegenerationInSeconds = 0, --every ? second you will get 1hp
        StartRegeneration = 0, --(1-100) when regeneration will start in PERCENTEGES(%)
        StopRegeneration = 0, --(1-100) when regeneration will stop in PERCENTEGES(%)
    },
        
    AddArmorRegen = { -- adds Armor regeneration
        SpeedOfRegenerationInSeconds = 0, --every ? second you will get 1 Armor
        StartRegeneration = 0, --(1-100) when regeneration will start in PERCENTEGES(%) (this number cant be higher then StopRegeneration)
        StopRegeneration = 0, --(1-100) when regeneration will stop in PERCENTEGES(%)  (this number cant be lower then StartRegeneration)
    },

    AddStaminaSprint = 0, --  since it is hard to mesure an exact time, these are the numbers (basic sprint time is around 9s) with skill (10 = 18s, 20 = 26s, 30 = 30s, 40 = 33s)

    AddStaminaRecovery = 0, -- I suggest a value between (1-10) (basic recovery time is around 30sec) with skill (5 = 20s, 8 = 12s, 10 = 6s)

    AddUnderWaterTime = 0, -- (10.0 - 50.0) How long a player can stay underwater in seconds
                    
    AddSwimmingSpeed = 0, --(1.0 - 1.49) can't be higher and can't be lower. The Speed of a swimming player

    AddSpeed = 0, --(1.0 - 1.49) can't be higher and can't be lower. The Speed of a running player

    AddDrivingSpeed = 0, -- (1 = 1mph) adds to max speed of the car that player is driving

    AddBoatSpeed = 0, -- (1 = 1mph) adds to max speed of the boat that player is driving

    AddShieldWall = { ---- A defense Wall that is placed in front of a player, helpful in gunfights
        WallStandingTimeInSeconds = 0, --- how long a wall will be standing
        WallRechargeTimeInSeconds = 0, --- how long until the a player will be able to place a wall again
    }
}