Config = {     --- If you have a suggestions on new skills, contact us on discord and tag @burbonas

    -- Command for admins to add xp /addxp playerid amount

    KeyToOpenSkillMenu = '7', --(number 7 right now)
    
    LevelingDifficulty = 20,--%  the difficulty to level up in [ % ]  
    SkillPointsPerLevel = 1, -- how many skill points player will get EACH LEVEL UP

    NotificationTimeInSeconds = 7,

    RestoreDefault = {
        allowRestore = true,
        Name = "Fresh Start",
        Description = "All of the skills you have will be removed and you will start your journey again at level 0.",
        Purchase = "This is only available once every session!",
        NoSkills = "You have no skills to reset!",
        NotAvailable = "You have already used your Fresh Start!",
    },

    StartingSkill = {
        SkillName = "The Rise Of ", -- after "The Rise Of " will be a player name, it will be written automatically
        SkillDescription = "You will get 3 starting skill points, use them wisely. You will earn 1 skill point each levelup. Earn experience by working, robbing banks, shops.", ---- YOU SHOULD CHANGE THIS PART OF HOW THEY WILL EARN XP IN YOUR SERVER
        StartingSkillPoints = 2,
        Purchase = 0,
        image = "mainskill",
    },



    Skills = { --- ALL the explanations on SkillAbilities are in Skill Abilities Documentation file

        HealthRegen1 = { --- First Top skill
            ConnectLineTo = "StartingSkill",
            SkillName = "Health Recovery", 
            SkillDescription = "Health Regeneration, you will start regenerating 1HP every 5 seconds, the regeneration will start at 20HP or below and will stop at 40HP",
            Purchase = 1,
            x = 2715, -- coordinates in px (left)
            y = 1190, -- coordinates in px (top)
            image = "HealthRegen1",
            SkillAbilities = {
                AddHealthRegen = { 
                    SpeedOfRegenerationInSeconds = 5, 
                    StartRegeneration = 20, 
                    StopRegeneration = 40, 
                },
            },
        },
        StaminaSprintTime1 = { --- First Bottom Left skill
            ConnectLineTo = "StartingSkill",
            SkillName = "Stamina Capacity", 
            SkillDescription = "You will be able to sprint 30% longer",
            Purchase = 1,
            image = "staminasprint",
            x = 2332, -- coordinates in px (left)
            y = 1696, -- coordinates in px (top)
            SkillAbilities = {
                AddStaminaSprint = 5,
            },
        },
        RunningSpeed1 = { --- First Bottom Right skill
            ConnectLineTo = "StartingSkill",
            SkillName = "Running Speed", 
            SkillDescription = "Running Speed, you will be able to run 5% faster",
            Purchase = 1,
            image = "Speed",
            x = 3081, -- coordinates in px (left)
            y = 1697, -- coordinates in px (top)
            SkillAbilities = {
                AddSpeed = 1.05,
            },
        },



        --- Start of TOP LEFT SIDE skill tree
        AddHealth1 = { 
            ConnectLineTo = "HealthRegen1",
            SkillName = "Health Shot", 
            SkillDescription = "You will unlock /addhp command that gives you 10HP, usable every 5 minutes",
            Purchase = 1,
            image = "Health",
            x = 2487, -- coordinates in px (left)
            y = 941, -- coordinates in px (top)
            SkillAbilities = {
                AddHealth = 10,
            },
        },
        AddHealth2 = { 
            ConnectLineTo = "AddHealth1",
            SkillName = "Health Shot 2LVL", 
            SkillDescription = "The command /addhp now will give you 20HP, usable every 5 minutes",
            Purchase = 1,
            image = "Health",
            x = 2352, -- coordinates in px (left)
            y = 652, -- coordinates in px (top)
            SkillAbilities = {
                AddHealth = 20,
            },
        },
        AddHealth3 = { 
            ConnectLineTo = "AddHealth2",
            SkillName = "Health Shot 3LVL", 
            SkillDescription = "The command /addhp now will give you 30HP, usable every 5 minutes",
            Purchase = 2,
            image = "Health",
            x = 2479, -- coordinates in px (left)
            y = 276, -- coordinates in px (top)
            SkillAbilities = {
                AddHealth = 30,
            },
        },
        AddHealth4 = { 
            ConnectLineTo = "AddHealth3",
            SkillName = "Health Shot 4LVL", 
            SkillDescription = "The command /addhp now will give you 50HP, usable every 5 minutes",
            Purchase = 3,
            image = "Health",
            x = 1771, -- coordinates in px (left)
            y = 119, -- coordinates in px (top)
            SkillAbilities = {
                AddHealth = 50,
            },
        },


        HealthRegen2 = { 
            ConnectLineTo = "AddHealth1",
            SkillName = "Better Health Recovery", 
            SkillDescription = "Health Regeneration, now the regeneration will start from 30HP or below to 50HP",
            Purchase = 1,
            image = "HealthRegen1",
            x = 1933, -- coordinates in px (left)
            y = 833, -- coordinates in px (top)
            SkillAbilities = {
                AddHealthRegen = { 
                    StartRegeneration = 30, 
                    StopRegeneration = 50, 
                },
            },
        },
        HealthRegen3 = { 
            ConnectLineTo = "HealthRegen2",
            SkillName = "Faster Health Recovery", 
            SkillDescription = "Health Regeneration, now you will get 1HP every 4 seconds",
            Purchase = 1,
            image = "HealthRegen1",
            x = 1630, -- coordinates in px (left)
            y = 460, -- coordinates in px (top)
            SkillAbilities = {
                AddHealthRegen = { 
                    SpeedOfRegenerationInSeconds = 4, 
                },
            },
        },
        HealthRegen4 = { 
            ConnectLineTo = "HealthRegen3",
            SkillName = "Better Health Recovery 2LVL", 
            SkillDescription = "Health Regeneration, now the regeneration will start from 40HP or below to 60HP",
            Purchase = 2,
            image = "HealthRegen1",
            x = 1314, -- coordinates in px (left)
            y = 981, -- coordinates in px (top)
            SkillAbilities = {
                AddHealthRegen = { 
                    StartRegeneration = 40, 
                    StopRegeneration = 60, 
                },
            },
        },
        HealthRegen5 = { 
            ConnectLineTo = "HealthRegen4",
            SkillName = "Better Health Recovery 3LVL", 
            SkillDescription = "Health Regeneration, now the regeneration will start from 50HP or below to 90HP",
            Purchase = 3,
            image = "HealthRegen1",
            x = 785, -- coordinates in px (left)
            y = 887, -- coordinates in px (top)
            SkillAbilities = {
                AddHealthRegen = { 
                    StartRegeneration = 50, 
                    StopRegeneration = 90, 
                },
            },
        },
        HealthRegen6 = { 
            ConnectLineTo = "HealthRegen3",
            SkillName = "Faster Health Recovery 2LVL", 
            SkillDescription = "Health Regeneration, now you will get 1HP every 3 seconds",
            Purchase = 2,
            image = "HealthRegen1",
            x = 1012, -- coordinates in px (left)
            y = 509, -- coordinates in px (top)
            SkillAbilities = {
                AddHealthRegen = { 
                    SpeedOfRegenerationInSeconds = 3, 
                },
            },
        },
        HealthRegen7 = { 
            ConnectLineTo = "HealthRegen6",
            SkillName = "Faster Health Recovery 3LVL", 
            SkillDescription = "Health Regeneration, now you will get 1HP every 1 seconds",
            Purchase = 3,
            image = "HealthRegen1",
            x = 412, -- coordinates in px (left)
            y = 199, -- coordinates in px (top)
            SkillAbilities = {
                AddHealthRegen = { 
                    SpeedOfRegenerationInSeconds = 1, 
                },
            },
        },
        --- END of TOP LEFT SIDE skill tree




        --- START of TOP RIGHT SIDE skill tree
        AddArmor1 = { 
            ConnectLineTo = "HealthRegen1",
            SkillName = "Armor Shot", 
            SkillDescription = "You will unlock /addarmor command that gives you 10 Armor Points, usable every 5 minutes",
            Purchase = 1,
            image = "Armor",
            x = 2865, -- coordinates in px (left)
            y = 941, -- coordinates in px (top)
            SkillAbilities = {
                AddArmor = 10,
            },
        },
        AddArmor2 = { 
            ConnectLineTo = "AddArmor1",
            SkillName = "Armor Shot 2LVL", 
            SkillDescription = "The command /addarmor now will give you 20 Armor Points, usable every 5 minutes",
            Purchase = 1,
            image = "Armor",
            x = 2741, -- coordinates in px (left)
            y = 479, -- coordinates in px (top)
            SkillAbilities = {
                AddArmor = 20,
            },
        },
        AddArmor3 = { 
            ConnectLineTo = "AddArmor2",
            SkillName = "Armor Shot 3LVL", 
            SkillDescription = "The command /addarmor now will give you 30 Armor Points, usable every 5 minutes",
            Purchase = 2,
            image = "Armor",
            x = 3161, -- coordinates in px (left)
            y = 460, -- coordinates in px (top)
            SkillAbilities = {
                AddArmor = 30,
            },
        },
        AddArmor4 = { 
            ConnectLineTo = "AddArmor3",
            SkillName = "Armor Shot 4LVL", 
            SkillDescription = "The command /addarmor now will give you 50 Armor Points, usable every 5 minutes",
            Purchase = 3,
            image = "Armor",
            x = 3573, -- coordinates in px (left)
            y = 79, -- coordinates in px (top)
            SkillAbilities = {
                AddArmor = 50,
            },
        },
        


        ArmorRegen1 = { 
            ConnectLineTo = "AddArmor1",
            SkillName = "Armor Recovery", 
            SkillDescription = "Armor Regeneration, you will start regenerating 1 Armor Point every 5 seconds, the regeneration will start at 10 Armor or below and will stop at 30 Armor",
            Purchase = 1,
            x = 3307, -- coordinates in px (left)
            y = 782, -- coordinates in px (top)
            image = "ArmorRegen",
            SkillAbilities = {
                AddArmorRegen = { 
                    SpeedOfRegenerationInSeconds = 5, 
                    StartRegeneration = 10, 
                    StopRegeneration = 30, 
                },
            },
        },
        ArmorRegen2 = { 
            ConnectLineTo = "ArmorRegen1",
            SkillName = "Better Armor Recovery", 
            SkillDescription = "Armor Regeneration, now the regeneration will start from 30HP or below to 50HP",
            Purchase = 1,
            image = "ArmorRegen",
            x = 3780, -- coordinates in px (left)
            y = 981, -- coordinates in px (top)
            SkillAbilities = {
                AddArmorRegen = { 
                    StartRegeneration = 30, 
                    StopRegeneration = 50, 
                },
            },
        },
        ArmorRegen3 = { 
            ConnectLineTo = "ArmorRegen2",
            SkillName = "Better Armor Recovery 2LVL", 
            SkillDescription = "Armor Regeneration, now the regeneration will start from 40HP or below to 60HP",
            Purchase = 2,
            image = "ArmorRegen",
            x = 4353, -- coordinates in px (left)
            y = 861, -- coordinates in px (top)
            SkillAbilities = {
                AddArmorRegen = { 
                    StartRegeneration = 40, 
                    StopRegeneration = 60, 
                },
            },
        },
        ArmorRegen4 = { 
            ConnectLineTo = "ArmorRegen3",
            SkillName = "Better Armor Recovery 3LVL", 
            SkillDescription = "Armor Regeneration, now the regeneration will start from 50HP or below to 80HP",
            Purchase = 3,
            image = "ArmorRegen",
            x = 4998, -- coordinates in px (left)
            y = 1021, -- coordinates in px (top)
            SkillAbilities = {
                AddArmorRegen = { 
                    StartRegeneration = 50, 
                    StopRegeneration = 80, 
                },
            },
        },
        ArmorRegen5 = { 
            ConnectLineTo = "ArmorRegen2",
            SkillName = "Faster Armor Recovery", 
            SkillDescription = "Armor Regeneration, now you will get 1 Armor Point every 4 seconds",
            Purchase = 1,
            image = "ArmorRegen",
            x = 3653, -- coordinates in px (left)
            y = 509, -- coordinates in px (top)
            SkillAbilities = {
                AddArmorRegen = { 
                    SpeedOfRegenerationInSeconds = 4, 
                },
            },
        },
        ArmorRegen6 = { 
            ConnectLineTo = "ArmorRegen5",
            SkillName = "Faster Armor Recovery 2LVL", 
            SkillDescription = "Armor Regeneration, now you will get 1 Armor Point every 3 seconds",
            Purchase = 2,
            image = "ArmorRegen",
            x = 4238, -- coordinates in px (left)
            y = 199, -- coordinates in px (top)
            SkillAbilities = {
                AddArmorRegen = { 
                    SpeedOfRegenerationInSeconds = 3, 
                },
            },
        },
        ArmorRegen7 = { 
            ConnectLineTo = "ArmorRegen6",
            SkillName = "Faster Armor Recovery 3LVL", 
            SkillDescription = "Armor Regeneration, now you will get 1 Armor Point every 1 seconds",
            Purchase = 3,
            image = "ArmorRegen",
            x = 4716, -- coordinates in px (left)
            y = 559, -- coordinates in px (top)
            SkillAbilities = {
                AddArmorRegen = { 
                    SpeedOfRegenerationInSeconds = 1, 
                },
            },
        },
        --- END of TOP RIGHT SIDE skill tree





        --- START of BOTTOM RIGHT SIDE skill tree
        DriveCarFaster1 = {
            ConnectLineTo = "RunningSpeed1",
            SkillName = "Driver: Beginner", 
            SkillDescription = "The skill adds 5km/h to Top Speed of any car you drive",
            Purchase = 1,
            image = "drivingfaster1",
            x = 3244, -- coordinates in px (left)
            y = 2006, -- coordinates in px (top)
            SkillAbilities = {
                AddDrivingSpeed = 5,
            },
        },
        DriveCarFaster2 = {
            ConnectLineTo = "DriveCarFaster1",
            SkillName = "Driver: Amatuer", 
            SkillDescription = "The skill adds 10km/h to Top Speed of any car you drive",
            Purchase = 1,
            image = "drivingfaster1",
            x = 3001, -- coordinates in px (left)
            y = 2328, -- coordinates in px (top)
            SkillAbilities = {
                AddDrivingSpeed = 10,
            },
        },
        DriveCarFaster3 = {
            ConnectLineTo = "DriveCarFaster2",
            SkillName = "Driver: Pro", 
            SkillDescription = "The skill adds 15km/h to Top Speed of any car you drive",
            Purchase = 2,
            image = "drivingfaster1",
            x = 3244, -- coordinates in px (left)
            y = 2616, -- coordinates in px (top)
            SkillAbilities = {
                AddDrivingSpeed = 15,
            },
        },
        DriveCarFaster4 = {
            ConnectLineTo = "DriveCarFaster3",
            SkillName = "Driver: Racer", 
            SkillDescription = "The skill adds 20km/h to Top Speed of any car you drive",
            Purchase = 3,
            image = "drivingfaster1",
            x = 2746, -- coordinates in px (left)
            y = 2797, -- coordinates in px (top)
            SkillAbilities = {
                AddDrivingSpeed = 20,
            },
        },


        BoatFaster1 = {
            ConnectLineTo = "DriveCarFaster1",
            SkillName = "Sailor: Beginner", 
            SkillDescription = "The skill adds 5km/h to Top Speed of any boat you sail",
            Purchase = 1,
            image = "SailingFaster",
            x = 3410, -- coordinates in px (left)
            y = 2304, -- coordinates in px (top)
            SkillAbilities = {
                AddBoatSpeed = 5,
            },
        },
        BoatFaster2 = {
            ConnectLineTo = "BoatFaster1",
            SkillName = "Sailor: Amatuer", 
            SkillDescription = "The skill adds 10km/h to Top Speed of any boat you sail",
            Purchase = 1,
            image = "SailingFaster",
            x = 3780, -- coordinates in px (left)
            y = 2344, -- coordinates in px (top)
            SkillAbilities = {
                AddBoatSpeed = 10,
            },
        },
        BoatFaster3 = {
            ConnectLineTo = "BoatFaster2",
            SkillName = "Sailor: Pro", 
            SkillDescription = "The skill adds 15km/h to Top Speed of any boat you sail",
            Purchase = 2,
            image = "SailingFaster",
            x = 3860, -- coordinates in px (left)
            y = 2757, -- coordinates in px (top)
            SkillAbilities = {
                AddBoatSpeed = 15,
            },
        },
        BoatFaster4 = {
            ConnectLineTo = "BoatFaster3",
            SkillName = "Sailor: Racer", 
            SkillDescription = "The skill adds 20km/h to Top Speed of any boat you sail",
            Purchase = 3,
            image = "SailingFaster",
            x = 4278, -- coordinates in px (left)
            y = 2570, -- coordinates in px (top)
            SkillAbilities = {
                AddBoatSpeed = 20,
            },
        },


        RunningSpeed2 = {
            ConnectLineTo = "RunningSpeed1",
            SkillName = "Running Speed 2LVL", 
            SkillDescription = "Running Speed, you will be able to run 15% faster",
            Purchase = 1,
            image = "Speed",
            x = 3450, -- coordinates in px (left)
            y = 1709, -- coordinates in px (top)
            SkillAbilities = {
                AddSpeed = 1.15,
            },
        },
        RunningSpeed3 = {
            ConnectLineTo = "RunningSpeed2",
            SkillName = "Running Speed 3LVL", 
            SkillDescription = "Running Speed, you will be able to run 20% faster",
            Purchase = 2,
            image = "Speed",
            x = 3900, -- coordinates in px (left)
            y = 1892, -- coordinates in px (top)
            SkillAbilities = {
                AddSpeed = 1.20,
            },
        },
        RunningSpeed4 = {
            ConnectLineTo = "RunningSpeed3",
            SkillName = "Running Speed 4LVL", 
            SkillDescription = "Running Speed, you will be able to run 30% faster",
            Purchase = 3,
            image = "Speed",
            x = 4146, -- coordinates in px (left)
            y = 2235, -- coordinates in px (top)
            SkillAbilities = {
                AddSpeed = 1.30,
            },
        },

        ShieldWall1 = {
            ConnectLineTo = "RunningSpeed2",
            SkillName = "Defensive Wall", 
            SkillDescription = "Hold [Shift + CapsLock] and place a defensive wall which helps you in combat. The wall will be standing for 15 seconds and recharge after 3 minutes",
            Purchase = 1,
            image = "ShieldWall",
            x = 3923, -- coordinates in px (left)
            y = 1470, -- coordinates in px (top)
            SkillAbilities = {
                AddShieldWall = { 
                    WallStandingTimeInSeconds = 15,
                    WallRechargeTimeInSeconds = 180,
                },
            },
        },
        ShieldWall2 = {
            ConnectLineTo = "ShieldWall1",
            SkillName = "Wall Standing Time", 
            SkillDescription = "The wall will be standing for 20 seconds instead of 15 seconds",
            Purchase = 1,
            image = "ShieldWall",
            x = 4393, -- coordinates in px (left)
            y = 1749, -- coordinates in px (top)
            SkillAbilities = {
                AddShieldWall = { 
                    WallStandingTimeInSeconds = 20,
                },
            },
        },
        ShieldWall3 = {
            ConnectLineTo = "ShieldWall2",
            SkillName = "Wall Standing Time 2LVL", 
            SkillDescription = "The wall will be standing for 25 seconds instead of 20 seconds",
            Purchase = 2,
            image = "ShieldWall",
            x = 4636, -- coordinates in px (left)
            y = 2195, -- coordinates in px (top)
            SkillAbilities = {
                AddShieldWall = { 
                    WallStandingTimeInSeconds = 25,
                },
            },
        },
        ShieldWall4 = {
            ConnectLineTo = "ShieldWall3",
            SkillName = "Wall Standing Time 3LVL", 
            SkillDescription = "The wall will be standing for 30 seconds instead of 25 seconds",
            Purchase = 3,
            image = "ShieldWall",
            x = 5142, -- coordinates in px (left)
            y = 2155, -- coordinates in px (top)
            SkillAbilities = {
                AddShieldWall = { 
                    WallStandingTimeInSeconds = 30,
                },
            },
        },

        ShieldWall5 = {
            ConnectLineTo = "ShieldWall1",
            SkillName = "Wall Recharge Time", 
            SkillDescription = "The wall recharge time will decrease to 2 minutes and 30 seconds instead of 3 minutes",
            Purchase = 1,
            image = "ShieldWall",
            x = 4530, -- coordinates in px (left)
            y = 1390, -- coordinates in px (top)
            SkillAbilities = {
                AddShieldWall = { 
                    WallRechargeTimeInSeconds = 150,
                },
            },
        },
        ShieldWall6 = {
            ConnectLineTo = "ShieldWall5",
            SkillName = "Wall Recharge Time 2LVL", 
            SkillDescription = "The wall recharge time will decrease to 2 minutes instead of 2 minutes and 30 seconds",
            Purchase = 2,
            image = "ShieldWall",
            x = 5102, -- coordinates in px (left)
            y = 1579, -- coordinates in px (top)
            SkillAbilities = {
                AddShieldWall = { 
                    WallRechargeTimeInSeconds = 120,
                },
            },
        },
        ShieldWall7 = {
            ConnectLineTo = "ShieldWall6",
            SkillName = "Wall Recharge Time 3LVL", 
            SkillDescription = "The wall recharge time will decrease to 1 minute instead of 2 minutes",
            Purchase = 3,
            image = "ShieldWall",
            x = 4841, -- coordinates in px (left)
            y = 1831, -- coordinates in px (top)
            SkillAbilities = {
                AddShieldWall = { 
                    WallRechargeTimeInSeconds = 60,
                },
            },
        },
        --- END of BOTTOM RIGHT SIDE skill tree



        --- START of BOTTOM LEFT SIDE skill tree

        StaminaRecoveryTime1 = {
            ConnectLineTo = "StaminaSprintTime1",
            SkillName = "Stamina Recovery", 
            SkillDescription = "You will recover stamina 30% faster",
            Purchase = 1,
            image = "staminasprint",
            x = 2124, -- coordinates in px (left)
            y = 2006, -- coordinates in px (top)
            SkillAbilities = {
                AddStaminaRecovery = 3,
            },
        },
        StaminaRecoveryTime2 = { 
            ConnectLineTo = "StaminaRecoveryTime1",
            SkillName = "Stamina Recovery 2LVL", 
            SkillDescription = "You will recover stamina 60% faster",
            Purchase = 2,
            image = "staminasprint",
            x = 1685, -- coordinates in px (left)
            y = 2215, -- coordinates in px (top)
            SkillAbilities = {
                AddStaminaRecovery = 5,
            },
        },
        StaminaRecoveryTime3 = { 
            ConnectLineTo = "StaminaRecoveryTime2",
            SkillName = "Stamina Recovery 3LVL", 
            SkillDescription = "You will recover stamina 90% faster",
            Purchase = 3,
            image = "staminasprint",
            x = 1777, -- coordinates in px (left)
            y = 2635, -- coordinates in px (top)
            SkillAbilities = {
                AddStaminaRecovery = 10,
            },
        },

        StaminaSprintTime2 = { 
            ConnectLineTo = "StaminaRecoveryTime1",
            SkillName = "Stamina Capacity 2LVL", 
            SkillDescription = "You will be able to sprint 70% longer",
            Purchase = 1,
            image = "staminasprint",
            x = 2508, -- coordinates in px (left)
            y = 2304, -- coordinates in px (top)
            SkillAbilities = {
                AddStaminaSprint = 8,
            },
        },
        StaminaSprintTime3 = { 
            ConnectLineTo = "StaminaSprintTime2",
            SkillName = "Stamina Capacity 3LVL", 
            SkillDescription = "You will be able to sprint 100% longer",
            Purchase = 2,
            image = "staminasprint",
            x = 2142, -- coordinates in px (left)
            y = 2530, -- coordinates in px (top)
            SkillAbilities = {
                AddStaminaSprint = 10,
            },
        },
        StaminaSprintTime4 = { 
            ConnectLineTo = "StaminaSprintTime3",
            SkillName = "Stamina Capacity 4LVL", 
            SkillDescription = "You will be able to sprint 200% longer",
            Purchase = 3,
            image = "staminasprint",
            x = 2447, -- coordinates in px (left)
            y = 2917, -- coordinates in px (top)
            SkillAbilities = {
                AddStaminaSprint = 20,
            },
        },


        SwimmingSpeed1 = { 
            ConnectLineTo = "StaminaSprintTime1",
            SkillName = "Swimming Speed", 
            SkillDescription = "You will be able to swim 5% faster",
            Purchase = 1,
            image = "Swimming",
            x = 1918, -- coordinates in px (left)
            y = 1709, -- coordinates in px (top)
            SkillAbilities = {
                AddSwimmingSpeed = 1.05,
            },
        },
        SwimmingSpeed2 = { 
            ConnectLineTo = "SwimmingSpeed1",
            SkillName = "Swimming Speed 2LVL", 
            SkillDescription = "You will be able to swim 15% faster",
            Purchase = 1,
            image = "Swimming",
            x = 1545, -- coordinates in px (left)
            y = 1932, -- coordinates in px (top)
            SkillAbilities = {
                AddSwimmingSpeed = 1.15,
            },
        },
        SwimmingSpeed3 = { 
            ConnectLineTo = "SwimmingSpeed2",
            SkillName = "Swimming Speed 3LVL", 
            SkillDescription = "You will be able to swim 20% faster",
            Purchase = 2,
            image = "Swimming",
            x = 1337, -- coordinates in px (left)
            y = 2422, -- coordinates in px (top)
            SkillAbilities = {
                AddSwimmingSpeed = 1.20,
            },
        },
        SwimmingSpeed4 = { 
            ConnectLineTo = "SwimmingSpeed3",
            SkillName = "Swimming Speed 4LVL", 
            SkillDescription = "You will be able to swim 30% faster",
            Purchase = 3,
            image = "Swimming",
            x = 785, -- coordinates in px (left)
            y = 2288, -- coordinates in px (top)
            SkillAbilities = {
                AddSwimmingSpeed = 1.30,
            },
        },

        UnderWaterTime1 = { 
            ConnectLineTo = "SwimmingSpeed1",
            SkillName = "UnderWater Time", 
            SkillDescription = "You will be able to stay under water 10 seconds longer",
            Purchase = 1,
            image = "underwater",
            x = 1472, -- coordinates in px (left)
            y = 1485, -- coordinates in px (top)
            SkillAbilities = {
                AddUnderWaterTime = 20,
            },
        },
        UnderWaterTime2 = { 
            ConnectLineTo = "UnderWaterTime1",
            SkillName = "UnderWater Time 2LVL", 
            SkillDescription = "You will be able to stay under water 20 seconds longer",
            Purchase = 1,
            image = "underwater",
            x = 1089, -- coordinates in px (left)
            y = 1776, -- coordinates in px (top)
            SkillAbilities = {
                AddUnderWaterTime = 30,
            },
        },
        UnderWaterTime3 = { 
            ConnectLineTo = "UnderWaterTime2",
            SkillName = "UnderWater Time 3LVL", 
            SkillDescription = "You will be able to stay under water 30 seconds longer",
            Purchase = 2,
            image = "underwater",
            x = 638, -- coordinates in px (left)
            y = 1776, -- coordinates in px (top)
            SkillAbilities = {
                AddUnderWaterTime = 40,
            },
        },
        UnderWaterTime4 = { 
            ConnectLineTo = "UnderWaterTime3",
            SkillName = "UnderWater Time 4LVL", 
            SkillDescription = "You will be able to stay under water 40 seconds longer",
            Purchase = 3,
            image = "underwater",
            x = 638, -- coordinates in px (left)
            y = 1776, -- coordinates in px (top)
            SkillAbilities = {
                AddUnderWaterTime = 50,
            },
        },
    },





    Text = {

        ['notenough'] = 'You don\'t have enough Skill Points',
        ['enough'] = 'The skill was applied Skill',

        ['fullhealth'] = "You have full Health",
        ['canuseaddhp'] = "You can use /addhp again",

        ['fullarmor'] = "You have full Armor",
        ['canuseaddarmor'] = "You can use /addarmor again",

        ['notallowed'] = "You are not allowed to use this command",
        ['wait5minutes'] = "5 minutes hasn't passed",

        ['wallrecharging'] = "Defense Wall Recharging!",
        ['wallactive'] = "Defense Wall Active!",
    },
}