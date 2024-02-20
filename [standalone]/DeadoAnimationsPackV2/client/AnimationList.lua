-- DPEmotes forked by TayMcKenzieNZ requires you to be on the latest FiveM Gamebuild for all emotes to function.
-- If an emote does not work, you may be on an older gamebuild.
-- To get a higher gamebuild, see ReadMe on github repositorty
DP = {}

-- EXPRESSIONS --

DP.Expressions = {
    ["Angry"] = {
        "Expression",
        "mood_angry_1"
    },
    ["Drunk"] = {
        "Expression",
        "mood_drunk_1"
    },
    ["Dumb"] = {
        "Expression",
        "pose_injured_1"
    },
    ["Electrocuted"] = {
        "Expression",
        "electrocuted_1"
    },
    ["Grumpy"] = {
        "Expression",
        "effort_1"
    },
    ["Grumpy2"] = {
        "Expression",
        "mood_drivefast_1"
    },
    ["Grumpy3"] = {
        "Expression",
        "pose_angry_1"
    },
    ["Happy"] = {
        "Expression",
        "mood_happy_1"
    },
    ["Injured"] = {
        "Expression",
        "mood_injured_1"
    },
    ["Joyful"] = {
        "Expression",
        "mood_dancing_low_1"
    },
    ["Mouthbreather"] = {
        "Expression",
        "smoking_hold_1"
    },
    ["Never Blink"] = {
        "Expression",
        "pose_normal_1"
    },
    ["One Eye"] = {
        "Expression",
        "pose_aiming_1"
    },
    ["Shocked"] = {
        "Expression",
        "shocked_1"
    },
    ["Shocked2"] = {
        "Expression",
        "shocked_2"
    },
    ["Sleeping"] = {
        "Expression",
        "mood_sleeping_1"
    },
    ["Sleeping2"] = {
        "Expression",
        "dead_1"
    },
    ["Sleeping3"] = {
        "Expression",
        "dead_2"
    },
    ["Smug"] = {
        "Expression",
        "mood_smug_1"
    },
    ["Speculative"] = {
        "Expression",
        "mood_aiming_1"
    },
    ["Stressed"] = {
        "Expression",
        "mood_stressed_1"
    },
    ["Sulking"] = {
        "Expression",
        "mood_sulk_1"
    },
    ["Weird"] = {
        "Expression",
        "effort_2"
    },
    ["Weird2"] = {
        "Expression",
        "effort_3"
    },
}


--- WALKSTYLES ---

DP.Walks = {
    -- The key shouldn't have any other uppercase letter than the first one!
    -- The first letter HAS to be uppercase!
    -- First element of array is the walk animation
    -- Second element is the label, this is optional
    ["Alien"] = {
        "move_m@alien"
    },
    ["Armored"] = {
        "anim_group_move_ballistic"
    },
    ["Arrogant"] = {
        "move_f@arrogant@a"
    },
    ["Brave"] = {
        "move_m@brave"
    },
    ["Casual"] = {
        "move_m@casual@a"
    },
    ["Casual2"] = {
        "move_m@casual@b",
        "Casual 2"
    },
    ["Casual3"] = {
        "move_m@casual@c",
        "Casual 3"
    },
    ["Casual4"] = {
        "move_m@casual@d",
        "Casual 4"
    },
    ["Casual5"] = {
        "move_m@casual@e",
        "Casual 5"
    },
    ["Casual6"] = {
        "move_m@casual@f",
        "Casual 6"
    },
    ["Chichi"] = {
        "move_f@chichi"
    },
    ["Confident"] = {
        "move_m@confident"
    },
    ["Cop"] = {
        "move_m@business@a"
    },
    ["Cop2"] = {
        "move_m@business@b",
        "Cop 2"
    },
    ["Cop3"] = {
        "move_m@business@c",
        "Cop 3"
    },
    ["Defaultfemale"] = {
        "move_f@multiplayer",
        "Default Female"
    },
    ["Defaultmale"] = {
        "move_m@multiplayer",
        "Default Male"
    },
    ["Drunk"] = {
        "move_m@drunk@a"
    },
    ["Drunk2"] = {
        "move_m@buzzed",
        "Drunk 2"
    },
    ["Drunk3"] = {
        "move_m@drunk@verydrunk",
        "Drunk 3"
    },
    ["Drunk4"] = {
        "move_m@drunk@slightlydrunk",
        "Drunk 4"
    },
    ["Femme"] = {
        "move_f@femme@"
    },
    ["Fire"] = {
        "move_characters@franklin@fire"
    },
    ["Fire2"] = {
        "move_characters@michael@fire",
        "Fire 2"
    },
    ["Fire3"] = {
        "move_m@fire",
        "Fire 3"
    },
    ["Flee"] = {
        "move_f@flee@a"
    },
    --["Flee4"] = {
        --"move_m@flee@a"
    --},
    ["Franklin"] = {
        "move_p_m_one"
    },
    ["Gangster"] = {
        "move_m@gangster@generic"
    },
    ["Gangster2"] = {
        "move_m@gangster@ng",
        "Gangster 2"
    },
    ["Gangster3"] = {
        "move_m@gangster@var_e",
        "Gangster 3"
    },
    ["Gangster4"] = {
        "move_m@gangster@var_f",
        "Gangster 4"
    },
    ["Gangster5"] = {
        "move_m@gangster@var_i",
        "Gangster 5"
    },
    ["Grooving"] = {
        "anim@move_m@grooving@"
    },
    ["Guard"] = {
        "move_m@prison_gaurd"
    },
    ["Handcuffs"] = {
        "move_m@prisoner_cuffed"
    },
    ["Heels"] = {
        "move_f@heels@c"
    },
    ["Heels2"] = {
        "move_f@heels@d",
        "Heels 2"
    },
    ["Hiking"] = {
        "move_m@hiking"
    },
    ["Hipster"] = {
        "move_m@hipster@a"
    },
    ["Hobo"] = {
        "move_m@hobo@a"
    },
    ["Hurry"] = {
        "move_f@hurry@a"
    },
    ["Janitor"] = {
        "move_p_m_zero_janitor"
    },
    ["Janitor2"] = {
        "move_p_m_zero_slow",
        "Janitor 2"
    },
    ["Jog"] = {
        "move_m@jog@"
    },
    ["Lemar"] = {
        "anim_group_move_lemar_alley"
    },
    ["Lester"] = {
        "move_heist_lester"
    },
    ["Lester2"] = {
        "move_lester_caneup",
        "Lester 2"
    },
    ["Maneater"] = {
        "move_f@maneater"
    },
    ["Michael"] = {
        "move_ped_bucket"
    },
    ["Money"] = {
        "move_m@money"
    },
    ["Muscle"] = {
        "move_m@muscle@a"
    },
    ["Posh"] = {
        "move_m@posh@"
    },
    ["Posh2"] = {
        "move_f@posh@",
        "Posh 2"
    },
    ["Quick"] = {
        "move_m@quick"
    },
    ["Runner"] = {
        "female_fast_runner"
    },
    ["Sad"] = {
        "move_m@sad@a"
    },
    ["Sassy"] = {
        "move_m@sassy"
    },
    ["Sassy2"] = {
        "move_f@sassy",
        "Sassy 2"
    },
    ["Scared"] = {
        "move_f@scared"
    },
    ["Sexy"] = {
        "move_f@sexy@a"
    },
    ["Shady"] = {
        "move_m@shadyped@a"
    },
    ["Slow"] = {
        "move_characters@jimmy@slow@"
    },
    ["Swagger"] = {
        "move_m@swagger"
    },
    ["Tough"] = {
        "move_m@tough_guy@"
    },
    ["Tough2"] = {
        "move_f@tough_guy@",
        "Tough 2"
    },
    ["Trash"] = {
        "clipset@move@trash_fast_turn"
    },
    ["Trash2"] = {
        "missfbi4prepp1_garbageman",
        "Trash 2"
    },
    ["Trevor"] = {
        "move_p_m_two"
    },
    ["Wide"] = {
        "move_m@bag"
    },
    ["Chubbymale"] = {
        "move_chubby",
        "Chubby Male"
    },
    -- male
    ["Chubbyfemale"] = {
        "move_f@chubby@a",
        "Chubby Female"
    },
    -- female
    ["Depressed"] = {
        "move_m@depressed@a"
    },
    ["Depressed2"] = {
        "move_m@depressed@b",
        "Depressed 2"
    },

    -- I cant get these to work for some reason, if anyone knows a fix, let me know
    -- ? The break menu part should be that the game can't find the anim dict and loop for it infinitely
    -- ["Caution"] = {"move_m@caution"}, -- breaks menu
    -- ["Chubby"] = {"anim@move_m@chubby@a"}, -- breaks menu
    -- ["Crazy"] = {"move_m@crazy"},-- breaks menu
    -- ["Joy"] = {"move_m@joy@a"},-- breaks menu
    -- ["Power"] = {"move_m@power"},-- breaks menu
    -- ["Wading"] = {"move_m@wading"} -- breaks menu
    -- ["Depressed 3"] = {"move_m@depressed@c" }, -- breaks menu
    -- ["Depressed 4"] = {"move_m@depressed@d" }, -- breaks menu
    -- ["Caution"] = {"move_m@caution" },-- breaks menu
    -- ["Crazy"] = {"move_m@crazy" }, -- breaks menu
    -- ["Joy"] = {"move_m@joy@a" }, -- breaks menu
    -- ["Power"] = {"move_m@power" }, -- breaks menu
    -- ["Power Walk"] = {"move_m@powerwalk" }, -- breaks menu
    -- ["Tired"] = {"move_m@tired" }, -- breaks menu
    -- -- ["Wading"] = {"move_m@wading"},-- breaks menu
}


--- SHARED EMOTES ---

DP.Shared = {

    --[emotename] = {dictionary, animation, displayname, targetemotename, additionalanimationoptions} --
    -- You don't have to specify targetemotename; If you don't, it will just play the same animation on both.--
    -- targetemote is used for animations that have a corresponding animation to the other player, ie Carry and Be Carried --
    -- Emotes will work with either SyncOffset or Attachto. We can attach players either in front of us, to a specific bone, or either side of us. --

    ["kiss5"] = {
        "tigerle@custom@couple@kissing1a",
        "tigerle_couple_kissing1a",
        "Kiss 5",
        "kiss6",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["kiss6"] = {
        "tigerle@custom@couple@kissing1b",
        "tigerle_couple_kissing1b",
        "Kiss 6",
        "kiss5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    }, 
    ["kiss7"] = {
        "tigerle@custom@couple@kissing2a",
        "tigerle_couple_kissing2a",
        "Kiss 7",
        "kiss8",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["kiss8"] = {
        "tigerle@custom@couple@kissing2b",
        "tigerle_couple_kissing2b",
        "Kiss 8",
        "kiss7",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["cuddleet"] = {
        "tigerle@custom@couple@cuddle1a",
        "tigerle_couple_cuddle1a",
        "Kiss 7",
        "cuddleet2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["cuddleet2"] = {
        "tigerle@custom@couple@cuddle1b",
        "tigerle_couple_cuddle1b",
        "Kiss 8",
        "cuddleet",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["cuddleet3"] = {
        "tigerle@custom@couple@cuddle@no2a",
        "tigerle_couple_cuddleno2a",
        "Kiss 7",
        "cuddleet4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["cuddleet4"] = {
        "tigerle@custom@couple@cuddle@no2b",
        "tigerle_couple_cuddleno2b",
        "Kiss 8",
        "cuddleet3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["layying"] = {
        "tigerle@custom@couple@laying1a",
        "tigerle_couple_laying1a",
        "Kiss 7",
        "layying2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["layying2"] = {
        "tigerle@custom@couple@laying1b",
        "tigerle_couple_laying1b",
        "Kiss 8",
        "layying",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["sitting"] = {
        "tigerle@custom@couple@sittingonbench@no1a",
        "tigerle_couple_sittingonbench_no1a",
        "Kiss 7",
        "sitting2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["sitting2"] = {
        "tigerle@custom@couple@sittingonbench@no1b",
        "tigerle_couple_sittingonbench_no1b",
        "Kiss 8",
        "sitting",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["cuddleet5"] = {
        "tigerle@custom@couple@standcuddle_a",
        "tigerle_couple_standcuddle_a",
        "Kiss 7",
        "cuddleet6",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["cuddleet6"] = {
        "tigerle@custom@couple@standcuddle_b",
        "tigerle_couple_standcuddle_b",
        "Kiss 8",
        "cuddleet5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.35,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 180.0,
        }
    },
    ["standingg"] = {
        "tigerle@custom@couple@standing_a",
        "tigerle_couple_standing_a",
        "Kiss 7",
        "standingg2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["standingg2"] = {
        "tigerle@custom@couple@standing_b",
        "tigerle_couple_standing_b",
        "Kiss 8",
        "standingg",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.10,
            yPos = 0.30,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["titanic"] = {
        "tigerle@custom@pose@titanic1a",
        "tigerle_pose_titanic1a",
        "Kiss 7",
        "titanic2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["titanic2"] = {
        "tigerle@custom@pose@titanic1b",
        "tigerle_pose_titanic1b",
        "Kiss 8",
        "titanic",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.10,
            yPos = 0.30,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["bfff"] = {
        "tigerle@custom@pose@bff1a",
        "tigerle_pose_bff1a",
        "Kiss 7",
        "bfff2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["bfff2"] = {
        "tigerle@custom@pose@bff1b",
        "tigerle_pose_bff1b",
        "Kiss 8",
        "bfff",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.70,
            yPos = 0.0,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["handshake"] = {
        "mp_ped_interaction",
        "handshake_guy_a",
        "Handshake",
        "handshake2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000,
            SyncOffsetFront = 0.9
        }
    },
    ["handshake2"] = {
        "mp_ped_interaction",
        "handshake_guy_b",
        "Handshake 2",
        "handshake",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["hug"] = {
        "mp_ped_interaction",
        "kisses_guy_a",
        "Hug",
        "hug2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
            SyncOffsetFront = 1.05,
        }
    },
    ["hug2"] = {
        "mp_ped_interaction",
        "kisses_guy_b",
        "Hug 2",
        "hug",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 5000,
            SyncOffsetFront = 1.18
        }
    },
    ["hug3"] = {
        "misscarsteal2chad_goodbye",
        "chad_armsaround_chad",
        "Hug Romantic 1",
        "hug4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetSide = -0.05,
            SyncOffsetFront = 0.52,
        }
    },
    ["hug4"] = {
        "misscarsteal2chad_goodbye",
        "chad_armsaround_girl",
        "Hug Romantic 2",
        "hug3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetSide = -0.05,
            SyncOffsetFront = 0.52,
        }
    },
    ["bro"] = {
        "mp_ped_interaction",
        "hugs_guy_a",
        "Bro",
        "bro2",
        AnimationOptions = {
            SyncOffsetFront = 1.14
        }
    },
    ["bro2"] = {
        "mp_ped_interaction",
        "hugs_guy_b",
        "Bro 2",
        "bro",
        AnimationOptions = {
            SyncOffsetFront = 1.14
        }
    },
    ["give"] = {
        "mp_common",
        "givetake1_a",
        "Give",
        "give2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["give2"] = {
        "mp_common",
        "givetake1_b",
        "Give 2",
        "give",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["baseball"] = {
        "anim@arena@celeb@flat@paired@no_props@",
        "baseball_a_player_a",
        "Baseball",
        "baseballthrow"
    },
    ["baseballthrow"] = {
        "anim@arena@celeb@flat@paired@no_props@",
        "baseball_a_player_b",
        "Baseball Throw",
        "baseball"
    },
    ["stickup"] = {
        "random@countryside_gang_fight",
        "biker_02_stickup_loop",
        "Stick Up",
        "stickupscared",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["stickupscared"] = {
        "missminuteman_1ig_2",
        "handsup_base",
        "Stickup Scared",
        "stickup",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["punch"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_rear_lefthook",
        "Punch",
        "punched"
    },
    ["punched"] = {
        "melee@unarmed@streamed_variations",
        "victim_takedown_front_cross_r",
        "Punched",
        "punch"
    },
    ["headbutt"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_headbutt",
        "Headbutt",
        "headbutted"
    },
    ["headbutted"] = {
        "melee@unarmed@streamed_variations",
        "victim_takedown_front_headbutt",
        "Headbutted",
        "headbutt"
    },
    ["slap2"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_backslap",
        "Slap 2",
        "slapped2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000,
        }
    },
    ["slap"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_slap",
        "Slap",
        "slapped",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000,
        }
    },
    ["slapped"] = {
        "melee@unarmed@streamed_variations",
        "victim_takedown_front_slap",
        "Slapped",
        "slap"
    },
    ["slapped2"] = {
        "melee@unarmed@streamed_variations",
        "victim_takedown_front_backslap",
        "Slapped 2",
        "slap2"
    },
    ["receiveblowjob"] = {
        "misscarsteal2pimpsex",
        "pimpsex_punter",
        "Receive Blowjob",
        "giveblowjob",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 30000,
            SyncOffsetFront = 0.63
        },
        AdultAnimation = true
    },
    ["giveblowjob"] = {
        "misscarsteal2pimpsex",
        "pimpsex_hooker",
        "Give Blowjob",
        "receiveblowjob",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 30000,
            SyncOffsetFront = 0.63
        },
        AdultAnimation = true
    },
    ["streetsexmale"] = {
        "misscarsteal2pimpsex",
        "shagloop_pimp",
        "Street Sex Male",
        "streetsexfemale",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = 0.50
        },
        AdultAnimation = true
    },
    ["streetsexfemale"] = {
        "misscarsteal2pimpsex",
        "shagloop_hooker",
        "Street Sex Female",
        "streetsexmale",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            SyncOffsetFront = 0.50
        },
        AdultAnimation = true
    },
    ["carry"] = {
        "missfinale_c2mcs_1",
        "fin_c2_mcs_1_camman",
        "Carry",
        "carry2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["carry2"] = {
        "nm",
        "firemans_carry",
        "Be carried",
        "carry",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 40269,
            xPos = -0.14,
            yPos = 0.15,
            zPos = 0.14,
            xRot = 0.0,
            yRot = -59.0,
            zRot = -4.5,
        }
    },
    ["carry3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry 2",
        "carry4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["carry4"] = {
        "amb@code_human_in_car_idles@generic@ps@base",
        "base",
        "Be carried 2",
        "carry3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 28252,
            xPos = 0.350,
            yPos = 0.15,
            zPos = -0.15,
            xRot = -42.50,
            yRot = -22.50,
            zRot = 22.50,
        }
    },
    ["csdog"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Small Dog",
        "csdog2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        },
        AnimalEmote = true,
    },
    ["csdog2"] = { -- Emote by MissSnowie
        "misssnowie@little_doggy_lying_down",
        "base",
        "Small Dog Carried",
        "csdog",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = -0.040,
            yPos = 0.330,
            zPos = 0.280,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 80.0,
        },
        AnimalEmote = true,
    },
    ["csdog3"] = { -- Custom Emote by MissSnowie
        "hooman@hugging_little_doggy",
        "base",
        "Carry Small Dog 2",
        "csdog4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        },
        AnimalEmote = true,
    },
    ["csdog4"] = { -- Custom Emote by MissSnowie
        "little_doggy@hugging_hooman",
        "base",
        "Small Dog Carried 2",
        "csdog3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 24818,
            xPos = -0.95,
            yPos = 0.16,
            zPos = -0.15,
            xRot = 3.70,
            yRot = 75.00,
            zRot = -161.90,
        },
        AnimalEmote = true,
    },
    ["cbdog"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Big Dog",
        "cbdog2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        },
        AnimalEmote = true,
    },
    ["cbdog2"] = {
        "creatures@rottweiler@amb@sleep_in_kennel@",
        "sleep_in_kennel",
        "Big Dog Carried",
        "cbdog",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            xPos = -0.100,
            yPos = 0.650,
            zPos = 0.430,
            xRot = 0.0,
            yRot = 0.0,
            zRot = -100.00,
        },
        AnimalEmote = true,
    },
    ["pback"] = {
        "anim@arena@celeb@flat@paired@no_props@",
        "piggyback_c_player_a",
        "Offer Piggy Back",
        "pback2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["pback2"] = {
        "anim@arena@celeb@flat@paired@no_props@",
        "piggyback_c_player_b",
        "Be Piggy Backed",
        "pback",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Attachto = true,
            bone = 0,
            xPos = 0.0,
            yPos = -0.07,
            zPos = 0.4,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["cprs"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "Give CPR",
        "cprs2",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 250,
        }
    },
    ["cprs2"] = {
        "mini@cpr@char_b@cpr_str",
        "cpr_pumpchest",
        "Get CPR",
        "cprs",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.35,
            yPos = 0.8,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 270.0,
        }
    },
    ["cprs3"] = {
        "missheistfbi3b_ig8_2",
        "cpr_loop_paramedic",
        "Give CPR 2",
        "cprs4",
        AnimationOptions = {
            EmoteLoop = true,
            StartDelay = 250,
        }
    },
    ["cprs4"] = {
        "missheistfbi3b_ig8_2",
        "cpr_loop_victim",
        "Get CPR 2",
        "cprs3",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.35,
            yPos = 0.65,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 270.0,
        }
    },
    ["hostage"] = {
        "anim@gangops@hostage@",
        "perp_idle",
        "Take hostage",
        "hostage2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["hostage2"] = {
        "anim@gangops@hostage@",
        "victim_idle",
        "Be hostage",
        "hostage",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            xPos = -0.3,
            yPos = 0.1,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["search"] = { -- Custom Emote By ultrahacx
        "custom@police",
        "police",
        "Search",
        "search2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = false,
            -- EmoteDuration = 9700,
        }
    },
    ["search2"] = {
        "missfam5_yoga",
        "a2_pose",
        "Be searched",
        "search",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = false,
            -- EmoteDuration = 9700,
            Attachto = true,
            xPos = 0.0,
            yPos = 0.5,
            zPos = 0.0,
            xRot = 0.0,
            yRot = 0.0,
            zRot = 0.0,
        }
    },
    ["followa"] = { -- Custom Ped In Front Emote By Dollie Mods
        "dollie_mods@follow_me_001",
        "follow_me_001",
        "Follow A (Front)",
        "followb",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
            -- We can set this to true for lols, however it messes up if you walk through doors. Either player can press X to cancel the shared emotes
        }
    },
    ["followb"] = { -- Custom Ped At Back Emote by Dollie Mods
        "dollie_mods@follow_me_002",
        "follow_me_002",
        "Follow B (Back)",
        "followa",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            xPos = 0.078,
            yPos = 0.018,
            zPos = 0.00,
            xRot = 0.00,
            yRot = 0.00,
            zRot = 0.00,
        }
    },
    ["kiss"] = {
        "hs3_ext-20",
        "cs_lestercrest_3_dual-20",
        "Kiss",
        "kiss2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 10000,
            SyncOffsetFront = 0.08
        }
    },
    ["kiss2"] = {
        "hs3_ext-20",
        "csb_georginacheng_dual-20",
        "Kiss 2",
        "kiss",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 10000,
            SyncOffsetFront = 0.08
        }
    },
    ["kiss3"] = {
        "hs3_ext-19",
        "cs_lestercrest_3_dual-19",
        "Kiss 3",
        "kiss4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 10000,
            SyncOffsetFront = 0.08
        }
    },
    ["kiss4"] = {
        "hs3_ext-19",
        "csb_georginacheng_dual-19",
        "Kiss 4",
        "kiss3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 10000,
            SyncOffsetFront = 0.08
        }
    },
    ["coupleanim"] = {
        "anim@scripted@robbery@tun_prep_uni_ig1_couple@",
        "action_var_01_bank_manager",
        "Couple Drinking (Wine Glasses)",
        "coupleanim2",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 60309,
            PropPlacement = {
                -0.0500,
                -0.0100,
                -0.1700,
                0.0,
                0.0,
                0.0,
            },
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["coupleanim2"] = {
        "anim@scripted@robbery@tun_prep_uni_ig1_couple@",
        "action_var_01_female",
        "Couple Drinking F (Wine Glasses)",
        "coupleanim",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
            },
            SyncOffsetSide = -0.04125,
            SyncOffsetFront = 0.11,
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
}

--- DANCING EMOTES, SOME WITH PROPS ---

DP.Dances = {

    ["dance2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "high_center_down",
        "Dance 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dance3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
        "high_center",
        "Dance 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dance4"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "high_center_up",
        "Dance 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dance5"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_a@",
        "med_center",
        "Dance 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dance6"] = {
        "misschinese2_crystalmazemcs1_cs",
        "dance_loop_tao",
        "Dance 6",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dance7"] = {
        "misschinese2_crystalmazemcs1_ig",
        "dance_loop_tao",
        "Dance 7",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dance8"] = {
        "missfbi3_sniping",
        "dance_m_default",
        "Dance 8",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dance9"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "med_center_up",
        "Dance 9",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancef"] = {
        "anim@amb@nightclub@dancers@solomun_entourage@",
        "mi_dance_facedj_17_v1_female^1",
        "Dance F",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancef2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center",
        "Dance F2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancef3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance F3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancef4"] = {
        "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
        "hi_dance_facedj_09_v2_female^1",
        "Dance F4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancef5"] = {
        "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity",
        "hi_dance_facedj_09_v2_female^3",
        "Dance F5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancef6"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance F6",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclub"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m03",
        "Dance Club",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubb"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m05",
        "Dance Club 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubc"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_a_m02",
        "Dance Club 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubd"] = {
        "anim@amb@nightclub_island@dancers@beachdance@",
        "hi_idle_b_f01",
        "Dance Club 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclube"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_a_f02",
        "Dance Club 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubf"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_b_m03",
        "Dance Club 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubg"] = {
        "anim@amb@nightclub_island@dancers@club@",
        "hi_idle_d_f01",
        "Dance Club 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceclubh"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_17_v2_male^4",
        "Dance Club 8 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclubi"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "mi_dance_prop_13_v1_male^3",
        "Dance Club 9 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclubj"] = {
        "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@",
        "mi_dance_crowd_13_v2_male^1",
        "Dance Club 10 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclubk"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_15_v2_male^4",
        "Dance Club 11 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclubl"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "high_center_up",
        "Dance Club 12",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclubm"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_15_v2_male^5",
        "Dance Club 13 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclubn"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_17_male^5",
        "Dance Club 14 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclubo"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_center",
        "Dance Club 15 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceclubp"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_left_down",
        "Dance Club 16 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancedrink"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_idle_c_m01",
        "Dance Drink (Beer)",
        AnimationOptions = {
            Prop = 'prop_beer_amopen',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.00,
                0.0,
                0.0,
                0.0,
                20.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancedrink2"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_loop_f1",
        "Dance Drink 2 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0900,
                0.0,
                0.0,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancedrink3"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprop@",
        "mi_loop_m04",
        "Dance Drink 3 (Whiskey)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_opaque_s',
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.00,
                0.0,
                0.0,
                0.0,
                10.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancedrink4"] = {
        "anim@amb@nightclub_island@dancers@beachdanceprops@male@",
        "mi_idle_b_m04",
        "Dance Drink 4 (Whiskey)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_opaque_s',
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.00,
                0.0,
                0.0,
                0.0,
                10.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancedrink5"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_09_v1_female^3",
        "Dance Drink 5 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0900,
                0.0,
                0.0,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancedrink6"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_09_v1_male^3",
        "Dance Drink 6 (Beer)",
        AnimationOptions = {
            Prop = 'prop_beer_logopen',
            PropBone = 28422,
            PropPlacement = {
                0.0090,
                0.0010,
                -0.0310,
                180.0,
                180.0,
                -69.99
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancedrink7"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_11_v1_female^3",
        "Dance Drink 7 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0900,
                0.0,
                0.0,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancedrink8"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "hi_dance_prop_11_v1_female^1",
        "Dance Drink 8 (Wine)",
        AnimationOptions = {
            Prop = 'p_wine_glass_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0900,
                0.0,
                0.0,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["danceslow2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "low_center",
        "Dance Slow 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceslow3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@",
        "low_center_down",
        "Dance Slow 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceslow4"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "low_center",
        "Dance Slow 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceupper"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "high_center",
        "Dance Upper",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["danceupper2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "high_center_up",
        "Dance Upper 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["danceshy"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@",
        "low_center",
        "Dance Shy",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceshy2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@",
        "low_center_down",
        "Dance Shy 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceslow"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@",
        "low_center",
        "Dance Slow",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancesilly1"] = {
        "rcmnigel1bnmt_1b",
        "dance_loop_tyler",
        "Dance Silly 1",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancesilly"] = {
        "special_ped@mountain_dancer@monologue_3@monologue_3a",
        "mnt_dnc_buttwag",
        "Dance Silly",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancesilly2"] = {
        "move_clown@p_m_zero_idles@",
        "fidget_short_dance",
        "Dance Silly 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancesilly3"] = {
        "move_clown@p_m_two_idles@",
        "fidget_short_dance",
        "Dance Silly 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancesilly4"] = {
        "anim@amb@nightclub@lazlow@hi_podium@",
        "danceidle_hi_11_buttwiggle_b_laz",
        "Dance Silly 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancesilly5"] = {
        "timetable@tracy@ig_5@idle_a",
        "idle_a",
        "Dance Silly 5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancesilly6"] = {
        "timetable@tracy@ig_8@idle_b",
        "idle_d",
        "Dance Silly 6",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancesilly7"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_b@",
        "med_center",
        "Dance Silly 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly8"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_b@",
        "high_center",
        "Dance Silly 8",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["dancesilly9"] = {
        "anim@mp_player_intcelebrationfemale@the_woogie",
        "the_woogie",
        "Dance Silly 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["danceold"] = {
        "anim@mp_player_intupperuncle_disco",
        "idle_a",
        "Dance Old",
        AnimationOptions = {
            EmoteLoop = true,
            --			EmoteMoving = true,-- Removing the comment will allow for you to mix and match dance emotes, ie /e danceold and /e dance to control the bottom half of the body.
        }
    },
    ["danceglowstick"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_13_mi_hi_sexualgriding_laz",
        "Dance Glowsticks",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.1400,
                0.0,
                -80.0,
                20.0
            },
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0700,
                0.0900,
                0.0,
                -120.0,
                -20.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["danceglowstick2"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_12_mi_hi_bootyshake_laz",
        "Dance Glowsticks 2",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.1400,
                0.0,
                -80.0,
                20.0
            },
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0700,
                0.0900,
                0.0,
                -120.0,
                -20.0
            },
            EmoteLoop = true,
        }
    },
    ["danceglowstick3"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Glowsticks 3",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.1400,
                0.0,
                -80.0,
                20.0
            },
            SecondProp = 'ba_prop_battle_glowstick_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0700,
                0.0900,
                0.0,
                -120.0,
                -20.0
            },
            EmoteLoop = true,
        }
    },
    ["dancehorse"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "dancecrowd_li_15_handup_laz",
        "Dance Horse",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["dancehorse2"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "crowddance_hi_11_handup_laz",
        "Dance Horse 2",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["dancehorse3"] = {
        "anim@amb@nightclub@lazlow@hi_dancefloor@",
        "dancecrowd_li_11_hu_shimmy_laz",
        "Dance Horse 3",
        AnimationOptions = {
            Prop = "ba_prop_battle_hobby_horse",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["dj"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_dance_cntr_open_dix",
        "DJ",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["dj2"] = {
        "anim@amb@nightclub@djs@solomun@",
        "sol_idle_ctr_mid_a_sol",
        "DJ 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dj3"] = {
        "anim@amb@nightclub@djs@solomun@",
        "sol_dance_l_sol",
        "DJ 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dj4"] = {
        "anim@amb@nightclub@djs@black_madonna@",
        "dance_b_idle_a_blamadon",
        "DJ 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dj1"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_end_dix",
        "DJ 1",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dj5"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_a_dix",
        "DJ 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dj6"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_b_dix",
        "DJ 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dj7"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_g_dix",
        "DJ 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dj8"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_idle_cntr_gb_dix",
        "DJ 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dj9"] = {
        "anim@amb@nightclub@djs@dixon@",
        "dixn_sync_cntr_j_dix",
        "DJ 9",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["twerk"] = {
        "switch@trevor@mocks_lapdance",
        "001443_01_trvs_28_idle_stripper",
        "Twerk",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapdance"] = {
        "mp_safehouse",
        "lap_dance_girl",
        "Lapdance"
    },
    ["lapdance2"] = {
        "mini@strip_club@private_dance@idle",
        "priv_dance_idle",
        "Lapdance 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapdance3"] = {
        "mini@strip_club@private_dance@part1",
        "priv_dance_p1",
        "Lapdance 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapdance4"] = {
        "mini@strip_club@private_dance@part2",
        "priv_dance_p2",
        "Lapdance 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapdance5"] = {
        "mini@strip_club@private_dance@part3",
        "priv_dance_p3",
        "Lapdance 5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapdance6"] = {
        "oddjobs@assassinate@multi@yachttarget@lapdance",
        "yacht_ld_f",
        "Lapdance 6",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapdancewith"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p3",
        "ld_2g_p3_s2",
        "Lapdance With",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapdancewith2"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p2",
        "ld_2g_p2_s2",
        "Lapdance With2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapdancewith3"] = {
        "mini@strip_club@lap_dance_2g@ld_2g_p1",
        "ld_2g_p1_s2",
        "Lapdance With3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapchair"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p1",
        "ld_girl_a_song_a_p1_f",
        "Lap Chair",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapchair2"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p2",
        "ld_girl_a_song_a_p2_f",
        "Lap Chair2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lapchair3"] = {
        "mini@strip_club@lap_dance@ld_girl_a_song_a_p3",
        "ld_girl_a_song_a_p3_f",
        "Lap Chair3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["salsa"] = {
        "anim@mp_player_intuppersalsa_roll",
        "idle_a",
        "Salso Roll",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancecrankdat"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_up",
        "Dance Crank Dat",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancecrankdat2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_down",
        "Dance Crank Dat 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancemonkey"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center",
        "Monkey Dance  ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancemonkey2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center_down",
        "Monkey Dance 2  ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancemonkey3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "med_center_down",
        "Monkey Dance 3  ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["boxdance"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@",
        "med_right_down",
        "Boxing Dance Solo  ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancehiphop"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_d@",
        "ped_a_dance_idle",
        "Hip Hop Dance ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancehiphop2"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_b@",
        "ped_a_dance_idle",
        "Hip Hop Dance 2 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancehiphop3"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_a@",
        "ped_a_dance_idle",
        "Hip Hop Dance 3 ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancepride"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride A",
        AnimationOptions = {
            Prop = 'lilprideflag1', --- Rainbow
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag1',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["danceprideb"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride B - LGBTQIA",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag2',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancepridea"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride A - Bisexual",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag3',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancepridec"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride C - Lesbian",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag4',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["danceprided"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride D - Pansexual",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag5',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancepridee"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride E - Transexual",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transexual
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag6',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dancepridef"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride F - Non Binary",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Lesbian
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag7',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["danceprideg"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride G - Asexual",
        AnimationOptions = {
            Prop = 'lilprideflag8', -- Asexual
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag8',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["danceprideh"] = {
        "anim@amb@nightclub@lazlow@hi_railing@",
        "ambclub_09_mi_hi_bellydancer_laz",
        "Dance Pride H - Straight Ally",
        AnimationOptions = {
            Prop = 'lilprideflag9', -- Straight Ally
            PropBone = 18905,
            PropPlacement = {
                0.0900,
                0.0000,
                0.0300,
                -39.911,
                93.9166,
                -5.8062
            },
            SecondProp = 'lilprideflag9',
            SecondPropBone = 57005,
            SecondPropPlacement = {
                0.0900,
                -0.0200,
                -0.0300,
                -90.2454,
                5.7068,
                -28.7797
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
}


---- ANIMAL EMOTES ----
----    BIG DOG    ----

DP.AnimalEmotes = {
    ["bdogbark"] = {
        "creatures@rottweiler@amb@world_dog_barking@idle_a",
        "idle_a",
        "Bark (big dog)",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["bdogbeg"] = {
        "creatures@rottweiler@tricks@",
        "beg_loop",
        "Beg (big dog)",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["bdogbeg2"] = {
        "creatures@rottweiler@tricks@",
        "paw_right_loop",
        "Beg 2 (big dog)",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["bdogdump"] = {
        "creatures@rottweiler@move",
        "dump_loop",
        "Dump (big dog)",
        AnimationOptions = {
            Prop = 'prop_big_shit_02',
            PropBone = 51826,
            PropPlacement = {
                0.0,
                0.2000,
                -0.4600,
                0.0,
                -20.00,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogitch"] = {
        "creatures@rottweiler@amb@world_dog_sitting@idle_a",
        "idle_a",
        "Itch (big dog)",
        AnimationOptions = {
            EmoteDuration = 2000
        }
    },
    ["bdogsleep"] = {
        "creatures@rottweiler@amb@sleep_in_kennel@",
        "sleep_in_kennel",
        "Sleep (big dog)",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["bdogsit"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit (big dog)",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["bdogpee"] = {
        "creatures@rottweiler@move",
        "pee_left_idle",
        "Pee (big dog)",
        AnimationOptions = {
            EmoteLoop = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {
                -0.15,
                -0.35,
                0.0,
                0.0,
                90.0,
                180.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
            PtfxWait = 3000,
            PtfxCanHold = true,
        }
    },
    ["bdogpee2"] = {
        "creatures@rottweiler@move",
        "pee_right_idle",
        "Pee 2 (big dog)",
        AnimationOptions = {
            EmoteLoop = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {
                0.15,
                -0.35,
                0.0,
                0.0,
                90.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
            PtfxWait = 3000,
            PtfxCanHold = true,
        }
    },
    ["sdogbark"] = {
        "creatures@pug@amb@world_dog_barking@idle_a",
        "idle_a",
        "Bark (small dog)",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["bdogglowa"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "nill",
        "Glow Stick (big dog)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {
                0.2000,
                0.000,
                -0.0600,
                90.00,
                0.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["bdogglowb"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Glow Stick Sitting (big dog)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {
                0.2000,
                0.000,
                -0.0600,
                90.00,
                0.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogpridea"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride A (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag1', -- Rainbow
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag1',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogprideb"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride B - LGBTQIA (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag2',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogpridec"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride C - Bisexual (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag3',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogprided"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride D - Lesbian (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag4',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogpridee"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride E - Pansexual (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag5',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogpridef"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride F - Transexual (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transexual
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag6',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogprideg"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride G - Non Binary (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Non Binary
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag7',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogprideh"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride H - Asexual (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag8', -- Asexual
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag8',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bdogpridei"] = {
        "creatures@rottweiler@amb@world_dog_sitting@base",
        "base",
        "Sit Pride I - Straight Ally (big dog)",
        AnimationOptions = {
            Prop = 'lilprideflag9', -- Straight Ally
            PropBone = 31086,
            PropPlacement = {
                0.1900,
                0.0000,
                -0.0500,
                100.0000,
                90.0000,
                0.0000
            },
            SecondProp = 'lilprideflag9',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.1940,
                0.020,
                -0.0500,
                -90.0000,
                -90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },

    ---- ANIMAL EMOTES ----
    ----   SMALL DOG   ----

    ["sdogitch"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_a",
        "Itch (small dog)",
        AnimationOptions = {
            EmoteDuration = 2000
        }
    },
    ["sdogsit"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Sit (small dog)",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sdogld"] = {
        "misssnowie@little_doggy_lying_down",
        "base",
        "Lay Down (small dog)",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogshake"] = {
        "creatures@pug@amb@world_dog_barking@idle_a",
        "idle_c",
        "Shake (small dog)",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["sdogdance"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance (small dog)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdance2"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance 2 (small dog)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_glowstick_01',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdancepridea"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride A (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag1',
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdanceprideb"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride B - LGBTQIA (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdancepridec"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride C - Bisexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdanceprided"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride D - Lesbian (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdancepridee"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride E - Pansexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdancepridef"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride F - Transexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdanceprideg"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride G - Non Binary (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Non Binary
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdanceprideh"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride H - Asexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag8', -- Asexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdancepridei"] = {
        "creatures@pug@move",
        "idle_turn_0",
        "Dance Pride I - Straight Ally (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag9', -- Straight Ally
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            SecondProp = 'prop_cs_sol_glasses',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogbb"] = {
        "creatures@pug@move",
        "nill",
        "Baseball (small dog)",
        AnimationOptions = {
            Prop = 'w_am_baseball',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.0500,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogburger"] = {
        "creatures@pug@move",
        "nill",
        "Burger (small dog)",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.0400,
                0.0000,
                -90.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogcontroller"] = {
        "creatures@pug@move",
        "nill",
        "Controller (small dog)",
        AnimationOptions = {
            Prop = 'prop_controller_01',
            PropBone = 31086,
            PropPlacement = {
                0.1800,
                -0.0300,
                0.0000,
                -180.000,
                90.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdolla"] = {
        "creatures@pug@move",
        "nill",
        "Dollar Bill (small dog)",
        AnimationOptions = {
            Prop = 'p_banknote_onedollar_s',
            PropBone = 31086,
            PropPlacement = {
                0.1700,
                -0.0100,
                0.0000,
                90.0000,
                0.0000,
                0.000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdolla2"] = {
        "creatures@pug@move",
        "nill",
        "Dollar Bill Scrunched  (small dog)",
        AnimationOptions = {
            Prop = 'bkr_prop_scrunched_moneypage',
            PropBone = 31086,
            PropPlacement = {
                0.1700,
                0.000,
                0.0000,
                90.0000,
                00.0000,
                00.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdolla3"] = {
        "creatures@pug@move",
        "nill",
        "Money Stack  (small dog)",
        AnimationOptions = {
            Prop = 'bkr_prop_money_wrapped_01',
            PropBone = 31086,
            PropPlacement = {
                0.1700,
                -0.0100,
                0.0000,
                90.0000,
                0.0000,
                0.000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogdolla4"] = {
        "creatures@pug@move",
        "nill",
        "Money Bag  (small dog)",
        AnimationOptions = {
            Prop = 'ch_prop_ch_moneybag_01a',
            PropBone = 31086,
            PropPlacement = {
                0.1200,
                -0.2000,
                0.0000,
                -79.9999997,
                90.00,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogmic"] = {
        "creatures@pug@move",
        "nill",
        "Microphone (small dog)",
        AnimationOptions = {
            Prop = 'p_ing_microphonel_01',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.0170,
                0.0300,
                0.000,
                0.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogteddy"] = {
        "creatures@pug@move",
        "nill",
        "Teddy (small dog)",
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.1100,
                -0.23,
                0.000,
                0.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogteddy2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Teddy 2 (small dog)",
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.1100,
                -0.23,
                0.000,
                0.0000,
                0.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogtennis"] = {
        "creatures@pug@move",
        "nill",
        "Tennis Ball (small dog)",
        AnimationOptions = {
            Prop = 'prop_tennis_ball',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.0600,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogtennisr"] = {
        "creatures@pug@move",
        "nill",
        "Tennis Racket (small dog)",
        AnimationOptions = {
            Prop = 'prop_tennis_rack_01',
            PropBone = 31086,
            PropPlacement = {
                0.1500,
                -0.0200,
                0.00,
                0.000,
                0.0000,
                -28.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogrose"] = {
        "creatures@pug@move",
        "nill",
        "Rose (small dog)",
        AnimationOptions = {
            Prop = 'prop_single_rose',
            PropBone = 12844,
            PropPlacement = {
                0.1090,
                -0.0140,
                0.0500,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogrose2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Rose Sit (small dog)",
        AnimationOptions = {
            Prop = 'prop_single_rose',
            PropBone = 12844,
            PropPlacement = {
                0.1090,
                -0.0140,
                0.0500,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogggun"] = {
        "creatures@pug@move",
        "nill",
        "Gun Gold (small dog)",
        AnimationOptions = {
            Prop = 'w_pi_pistol_luxe',
            PropBone = 12844,
            PropPlacement = {
                0.2010,
                -0.0080,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoggun2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Gun Gold Sit (small dog)",
        AnimationOptions = {
            Prop = 'w_pi_pistol_luxe',
            PropBone = 12844,
            PropPlacement = {
                0.2010,
                -0.0080,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogstun"] = {
        "creatures@pug@move",
        "nill",
        "Stun Gun (small dog)",
        AnimationOptions = {
            Prop = 'w_pi_stungun',
            PropBone = 12844,
            PropPlacement = {
                0.1400,
                -0.0100,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = "core",
            PtfxName = "blood_stungun",
            PtfxPlacement = {
                0.208,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['stun'],
            PtfxWait = 200,
        }
    },
    ["sdoggl1"] = {
        "creatures@pug@move",
        "nill",
        "Aviators (small dog)",
        AnimationOptions = {
            Prop = 'prop_aviators_01',
            PropBone = 31086,
            PropPlacement = {
                0.0500,
                0.0400,
                0.000,
                -90.00,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoggl2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Aviators Sitting (small dog)",
        AnimationOptions = {
            Prop = 'prop_aviators_01',
            PropBone = 31086,
            PropPlacement = {
                0.0500,
                0.0400,
                0.000,
                -90.00,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoggl3"] = {
        "creatures@pug@move",
        "nill",
        "Sunglasses (small dog)",
        AnimationOptions = {
            Prop = 'prop_cs_sol_glasses',
            PropBone = 31086,
            PropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoggl4"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Sunglasses Sitting (small dog)",
        AnimationOptions = {
            Prop = 'prop_cs_sol_glasses',
            PropBone = 31086,
            PropPlacement = {
                0.0500,
                0.0300,
                0.000,
                -100.0000003,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoghd1"] = {
        "creatures@pug@move",
        "nill",
        "Hot Dog (small dog)",
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_01',
            PropBone = 31086,
            PropPlacement = {
                0.1300,
                -0.0250,
                0.000,
                -88.272053,
                -9.8465858,
                -0.1488562
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoghd2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Hot Dog Sitting (small dog)",
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_01',
            PropBone = 31086,
            PropPlacement = {
                0.1300,
                -0.0250,
                0.000,
                -88.272053,
                -9.8465858,
                -0.1488562
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoghlmt1"] = {
        "creatures@pug@move",
        "nill",
        "Helmet 1 (small dog)",
        AnimationOptions = {
            Prop = 'ba_prop_battle_sports_helmet',
            PropBone = 31086,
            PropPlacement = {
                0.00,
                -0.0200,
                0.000,
                -90.00,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoghlmt2"] = {
        "creatures@pug@move",
        "nill",
        "Helmet 2 (small dog)",
        AnimationOptions = {
            Prop = 'prop_hard_hat_01',
            PropBone = 31086,
            PropPlacement = {
                0.00,
                0.1300,
                0.000,
                -90.00,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoghat"] = {
        "creatures@pug@move",
        "nill",
        "Hat 1 (small dog)",
        AnimationOptions = {
            Prop = 'prop_proxy_hat_01',
            PropBone = 31086,
            PropPlacement = {
                0.0,
                0.1200,
                0.000,
                -99.8510766,
                80.1489234,
                1.7279411
            },
            SecondProp = 'prop_aviators_01',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0400,
                0.000,
                -90.00,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdoghat2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Hat 2 Sitting (small dog)",
        AnimationOptions = {
            Prop = 'prop_proxy_hat_01',
            PropBone = 31086,
            PropPlacement = {
                0.0,
                0.1200,
                0.000,
                -99.8510766,
                80.1489234,
                1.7279411
            },
            SecondProp = 'prop_aviators_01',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.0500,
                0.0400,
                0.000,
                -90.00,
                90.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogsteak"] = {
        "creatures@pug@move",
        "nill",
        "Steak (small dog)",
        AnimationOptions = {
            Prop = 'prop_cs_steak',
            PropBone = 31086,
            PropPlacement = {
                0.1800,
                -0.0200,
                0.000,
                90.00,
                0.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogsteak2"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_c",
        "Steak 2 Lay Down (small dog)",
        AnimationOptions = {
            Prop = 'prop_cs_steak',
            PropBone = 31086,
            PropPlacement = {
                0.1800,
                -0.0200,
                0.000,
                90.00,
                0.00,
                0.00
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridea"] = {
        "creatures@pug@move",
        "nill",
        "Pride A (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag1',
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogprideb"] = {
        "creatures@pug@move",
        "nill",
        "Pride B - LGBTQIA (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridec"] = {
        "creatures@pug@move",
        "nill",
        "Pride C - Bisexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogprided"] = {
        "creatures@pug@move",
        "nill",
        "Pride D - Lesbian (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridee"] = {
        "creatures@pug@move",
        "nill",
        "Pride E - Pansexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridef"] = {
        "creatures@pug@move",
        "nill",
        "Pride F - Transexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogprideg"] = {
        "creatures@pug@move",
        "nill",
        "Pride G - Non Binary (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Non Binary
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogprideh"] = {
        "creatures@pug@move",
        "nill",
        "Pride H - Non Binary (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Non Binary
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridei"] = {
        "creatures@pug@move",
        "nill",
        "Pride I - Asexual (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag8', -- Asexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesita"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride A Sit (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag1',
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesitb"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride B Sit LGBTQIA  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag2', -- LGBTQIA
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesitc"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride C Sit Bisexual  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag3', -- Bisexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesitd"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride D Sit Lesbian (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag4', -- Lesbian
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesite"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride E Sit Pansexual  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag5', -- Pansexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesitf"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride F Sit Transexual  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag6', -- Transexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesitg"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride G Sit Non Binary (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag7', -- Non Binary
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesith"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride H Sit Asexual  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag8',
            -- Asexual
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpridesiti"] = {
        "creatures@pug@amb@world_dog_sitting@idle_a",
        "idle_b",
        "Pride I Sit Straight Ally  (small dog)",
        AnimationOptions = {
            Prop = 'lilprideflag9', -- Straight Ally
            PropBone = 31086,
            PropPlacement = {
                0.1240,
                -0.0080,
                0.000,
                0.0,
                0.0,
                -74.6999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sdogpee"] = {
        "creatures@pug@move",
        "nill",
        "Pee (Small Dog)",
        AnimationOptions = {
            EmoteLoop = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {
                -0.01,
                -0.17,
                0.09,
                0.0,
                90.0,
                140.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
            PtfxWait = 3000,
            PtfxCanHold = true,
        }
    },
}


--- EMOTES NO PROPS ---

DP.Emotes = {

    ["dispenser"] = {
        "mini@sprunk",
        "plyr_buy_drink_pt1",
        "Dispenser",
        AnimationOptions =
        {
            EmoteLoop = false,
        }
    },
    ["beast"] = {
        "anim@mp_fm_event@intro",
        "beast_transform",
        "Beast",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000,
        }
    },
    ["chill"] = {
        "switch@trevor@scares_tramp",
        "trev_scares_tramp_idle_tramp",
        "Chill",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["cloudgaze"] = {
        "switch@trevor@annoys_sunbathers",
        "trev_annoys_sunbathers_loop_girl",
        "Cloudgaze",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["cloudgaze2"] = {
        "switch@trevor@annoys_sunbathers",
        "trev_annoys_sunbathers_loop_guy",
        "Cloudgaze 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["prone"] = {
        "missfbi3_sniping",
        "prone_dave",
        "Prone",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["pullover"] = {
        "misscarsteal3pullover",
        "pull_over_right",
        "Pullover",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1300,
        }
    },
    ["idle"] = {
        "anim@heists@heist_corona@team_idles@male_a",
        "idle",
        "Idle",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["kick"] = {
        "missheistdockssetup1ig_13@kick_idle",
        "guard_beatup_kickidle_guard1",
        "Kick ~r~New",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["kick2"] = {
        "missheistdockssetup1ig_13@kick_idle",
        "guard_beatup_kickidle_guard2",
        "Kick 2 ~r~New",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["kick3"] = {
        "melee@unarmed@streamed_core",
        "kick_close_a",
        "Kick 3 ~r~New",
        AnimationOptions = {
            EmoteDuration = 1750
        }
    },
    ["idle8"] = {
        "amb@world_human_hang_out_street@male_b@idle_a",
        "idle_b",
        "Idle 8"
    },
    ["idle9"] = {
        "friends@fra@ig_1",
        "base_idle",
        "Idle 9",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idle10"] = {
        "mp_move@prostitute@m@french",
        "idle",
        "Idle 10",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["idle11"] = {
        "random@countrysiderobbery",
        "idle_a",
        "Idle 11",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idle2"] = {
        "anim@heists@heist_corona@team_idles@female_a",
        "idle",
        "Idle 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idle3"] = {
        "anim@heists@humane_labs@finale@strip_club",
        "ped_b_celebrate_loop",
        "Idle 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idle4"] = {
        "anim@mp_celebration@idles@female",
        "celebration_idle_f_a",
        "Idle 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idle5"] = {
        "anim@mp_corona_idles@female_b@idle_a",
        "idle_a",
        "Idle 5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idle6"] = {
        "anim@mp_corona_idles@male_c@idle_a",
        "idle_a",
        "Idle 6",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idle7"] = {
        "anim@mp_corona_idles@male_d@idle_a",
        "idle_a",
        "Idle 7",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idledrunk"] = {
        "random@drunk_driver_1",
        "drunk_driver_stand_loop_dd1",
        "Idle Drunk",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idledrunk2"] = {
        "random@drunk_driver_1",
        "drunk_driver_stand_loop_dd2",
        "Idle Drunk 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["idledrunk3"] = {
        "missarmenian2",
        "standing_idle_loop_drunk",
        "Idle Drunk 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["airguitar"] = {
        "anim@mp_player_intcelebrationfemale@air_guitar",
        "air_guitar",
        "Air Guitar"
    },
    ["airsynth"] = {
        "anim@mp_player_intcelebrationfemale@air_synth",
        "air_synth",
        "Air Synth"
    },
    ["argue"] = {
        "misscarsteal4@actor",
        "actor_berating_loop",
        "Argue",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["argue2"] = {
        "oddjobs@assassinate@vice@hooker",
        "argue_a",
        "Argue 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["bartender"] = {
        "anim@amb@clubhouse@bar@drink@idle_a",
        "idle_a_bartender",
        "Bartender",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["blowkiss"] = {
        "anim@mp_player_intcelebrationfemale@blow_kiss",
        "blow_kiss",
        "Blow Kiss"
    },
    ["blowkiss2"] = {
        "anim@mp_player_intselfieblow_kiss",
        "exit",
        "Blow Kiss 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["curtsy"] = {
        "anim@mp_player_intcelebrationpaired@f_f_sarcastic",
        "sarcastic_left",
        "Curtsy"
    },
    ["bringiton"] = {
        "misscommon@response",
        "bring_it_on",
        "Bring It On",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["comeatmebro"] = {
        "mini@triathlon",
        "want_some_of_this",
        "Come at me bro",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000
        }
    },
    ["cop2"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Cop 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["cop3"] = {
        "amb@code_human_police_investigate@idle_a",
        "idle_b",
        "Cop 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["crossarms"] = {
        "amb@world_human_hang_out_street@female_arms_crossed@idle_a",
        "idle_a",
        "Crossarms",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["crossarms2"] = {
        "amb@world_human_hang_out_street@male_c@idle_a",
        "idle_b",
        "Crossarms 2",
        AnimationOptions = {
            EmoteMoving = true,
        }
    },
    ["crossarms3"] = {
        "anim@heists@heist_corona@single_team",
        "single_team_loop_boss",
        "Crossarms 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["crossarms4"] = {
        "random@street_race",
        "_car_b_lookout",
        "Crossarms 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["crossarms5"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Crossarms 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foldarms2"] = {
        "anim@amb@nightclub@peds@",
        "rcmme_amanda1_stand_loop_cop",
        "Fold Arms 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["crossarms6"] = {
        "random@shop_gunstore",
        "_idle",
        "Crossarms 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foldarms"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "stand_phone_phoneputdown_idle_nowork",
        "Fold Arms",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["crossarmsside"] = {
        "rcmnigel1a_band_groupies",
        "base_m2",
        "Crossarms Side",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["damn"] = {
        "gestures@m@standing@casual",
        "gesture_damn",
        "Damn",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["damn2"] = {
        "anim@am_hold_up@male",
        "shoplift_mid",
        "Damn 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["pointdown"] = {
        "gestures@f@standing@casual",
        "gesture_hand_down",
        "Point Down",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["surrender"] = {
        "random@arrests@busted",
        "idle_a",
        "Surrender",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["surrender2"] = {
        "mp_bank_heist_1",
        "f_cower_02",
        "Surrender 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["surrender3"] = {
        "mp_bank_heist_1",
        "m_cower_01",
        "Surrender 3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["surrender4"] = {
        "mp_bank_heist_1",
        "m_cower_02",
        "Surrender 4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["surrender5"] = {
        "random@arrests",
        "kneeling_arrest_idle",
        "Surrender 5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["surrender6"] = {
        "rcmbarry",
        "m_cower_01",
        "Surrender 6",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["facepalm2"] = {
        "anim@mp_player_intcelebrationfemale@face_palm",
        "face_palm",
        "Facepalm 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm"] = {
        "random@car_thief@agitated@idle_a",
        "agitated_idle_a",
        "Facepalm",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm3"] = {
        "missminuteman_1ig_2",
        "tasered_2",
        "Facepalm 3",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 8000
        }
    },
    ["facepalm4"] = {
        "anim@mp_player_intupperface_palm",
        "idle_a",
        "Facepalm 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["fallover"] = {
        "random@drunk_driver_1",
        "drunk_fall_over",
        "Fall Over"
    },
    ["fallover2"] = {
        "mp_suicide",
        "pistol",
        "Fall Over 2"
    },
    ["fallover3"] = {
        "mp_suicide",
        "pill",
        "Fall Over 3"
    },
    ["fallover4"] = {
        "friends@frf@ig_2",
        "knockout_plyr",
        "Fall Over 4"
    },
    ["fallover5"] = {
        "anim@gangops@hostage@",
        "victim_fail",
        "Fall Over 5"
    },
    ["fallasleep"] = {
        "mp_sleep",
        "sleep_loop",
        "Fall Asleep",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["fightme"] = {
        "anim@deathmatch_intros@unarmed",
        "intro_male_unarmed_c",
        "Fight Me"
    },
    ["fightme2"] = {
        "anim@deathmatch_intros@unarmed",
        "intro_male_unarmed_e",
        "Fight Me 2"
    },
    ["finger"] = {
        "anim@mp_player_intselfiethe_bird",
        "idle_a",
        "Finger",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["finger2"] = {
        "anim@mp_player_intupperfinger",
        "idle_a_fp",
        "Finger 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["handshake"] = {
        "mp_ped_interaction",
        "handshake_guy_a",
        "Handshake",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["handshake2"] = {
        "mp_ped_interaction",
        "handshake_guy_b",
        "Handshake 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000
        }
    },
    ["wait"] = {
        "random@shop_tattoo",
        "_idle_a",
        "Wait",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait2"] = {
        "missbigscore2aig_3",
        "wait_for_van_c",
        "Wait 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait3"] = {
        "amb@world_human_hang_out_street@female_hold_arm@idle_a",
        "idle_a",
        "Wait 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait4"] = {
        "amb@world_human_hang_out_street@Female_arm_side@idle_a",
        "idle_a",
        "Wait 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait5"] = {
        "missclothing",
        "idle_storeclerk",
        "Wait 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait6"] = {
        "timetable@amanda@ig_2",
        "ig_2_base_amanda",
        "Wait 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait7"] = {
        "rcmnigel1cnmt_1c",
        "base",
        "Wait 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait8"] = {
        "rcmjosh1",
        "idle",
        "Wait 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait9"] = {
        "rcmjosh2",
        "josh_2_intp1_base",
        "Wait 9",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait10"] = {
        "timetable@amanda@ig_3",
        "ig_3_base_tracy",
        "Wait 10",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait11"] = {
        "misshair_shop@hair_dressers",
        "keeper_base",
        "Wait 11",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait12"] = {
        "rcmjosh1",
        "keeper_base",
        "Wait 12",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wait13"] = {
        "rcmnigel1a",
        "base",
        "Wait 13",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["hiking"] = {
        "move_m@hiking",
        "idle",
        "Hiking",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["hug"] = {
        "mp_ped_interaction",
        "kisses_guy_a",
        "Hug"
    },
    ["hug2"] = {
        "mp_ped_interaction",
        "kisses_guy_b",
        "Hug 2"
    },
    ["hug3"] = {
        "mp_ped_interaction",
        "hugs_guy_a",
        "Hug 3"
    },
    ["inspect"] = {
        "random@train_tracks",
        "idle_e",
        "Inspect"
    },
    ["jazzhands"] = {
        "anim@mp_player_intcelebrationfemale@jazz_hands",
        "jazz_hands",
        "Jazzhands",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 6000,
        }
    },
    ["jog2"] = {
        "amb@world_human_jog_standing@male@idle_a",
        "idle_a",
        "Jog 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["jog3"] = {
        "amb@world_human_jog_standing@female@idle_a",
        "idle_a",
        "Jog 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["jog4"] = {
        "amb@world_human_power_walker@female@idle_a",
        "idle_a",
        "Jog 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["jog5"] = {
        "move_m@joy@a",
        "walk",
        "Jog 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["jumpingjacks"] = {
        "timetable@reunited@ig_2",
        "jimmy_getknocked",
        "Jumping Jacks",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["kneel2"] = {
        "rcmextreme3",
        "idle",
        "Kneel 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["kneel3"] = {
        "amb@world_human_bum_wash@male@low@idle_a",
        "idle_a",
        "Kneel 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["kneelthot"] = {
        "anim@model_kylie_insta",
        "kylie_insta_clip",
        "Kneel Thot Instagram",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["knock"] = {
        "timetable@jimmy@doorknock@",
        "knockdoor_idle",
        "Knock",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["knock2"] = {
        "missheistfbi3b_ig7",
        "lift_fibagent_loop",
        "Knock 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["knucklecrunch"] = {
        "anim@mp_player_intcelebrationfemale@knuckle_crunch",
        "knuckle_crunch",
        "Knuckle Crunch",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lean2"] = {
        "amb@world_human_leaning@female@wall@back@hand_up@idle_a",
        "idle_a",
        "Lean 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lean3"] = {
        "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a",
        "idle_a",
        "Lean 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lean4"] = {
        "amb@world_human_leaning@male@wall@back@foot_up@idle_a",
        "idle_a",
        "Lean 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lean5"] = {
        "amb@world_human_leaning@male@wall@back@hands_together@idle_b",
        "idle_b",
        "Lean 5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["leanflirt"] = {
        "random@street_race",
        "_car_a_flirt_girl",
        "Lean Flirt",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["leanbar2"] = {
        "amb@prop_human_bum_shopping_cart@male@idle_a",
        "idle_c",
        "Lean Bar 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["leanbar3"] = {
        "anim@amb@nightclub@lazlow@ig1_vip@",
        "clubvip_base_laz",
        "Lean Bar 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["leanbar4"] = {
        "anim@heists@prison_heist",
        "ped_b_loop_a",
        "Lean Bar 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["leanhigh"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_one",
        "Lean High",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["leanhigh2"] = {
        "anim@mp_ferris_wheel",
        "idle_a_player_two",
        "Lean High 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["leanside"] = {
        "timetable@mime@01_gc",
        "idle_a",
        "Leanside",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["leanside2"] = {
        "misscarstealfinale",
        "packer_idle_1_trevor",
        "Leanside 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["leanside3"] = {
        "misscarstealfinalecar_5_ig_1",
        "waitloop_lamar",
        "Leanside 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["leanside4"] = {
        "misscarstealfinalecar_5_ig_1",
        "waitloop_lamar",
        "Leanside 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["leanside5"] = {
        "rcmjosh2",
        "josh_2_intp1_base",
        "Leanside 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["me"] = {
        "gestures@f@standing@casual",
        "gesture_me_hard",
        "Me",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000
        }
    },
    ["mechanic"] = {
        "mini@repair",
        "fixing_a_ped",
        "Mechanic",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["mechanic2"] = {
        "mini@repair",
        "fixing_a_player",
        "Mechanic 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["mechanic3"] = {
        "amb@world_human_vehicle_mechanic@male@base",
        "base",
        "Mechanic 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["mechanic4"] = {
        "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        "machinic_loop_mechandplayer",
        "Mechanic 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["mechanic5"] = {
        "amb@prop_human_movie_bulb@idle_a",
        "idle_b",
        "Mechanic 5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["medic2"] = {
        "amb@medic@standing@tendtodead@base",
        "base",
        "Medic 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["meditate"] = {
        "rcmcollect_paperleadinout@",
        "meditiate_idle",
        "Meditiate",
        AnimationOptions = {
            -- CHANGE ME
            EmoteLoop = true,
        }
    },
    ["meditate2"] = {
        "rcmepsilonism3",
        "ep_3_rcm_marnie_meditating",
        "Meditiate 2",
        AnimationOptions = {
            -- CHANGE ME
            EmoteLoop = true,
        }
    },
    ["meditate3"] = {
        "rcmepsilonism3",
        "base_loop",
        "Meditiate 3",
        AnimationOptions = {
            -- CHANGE ME
            EmoteLoop = true,
        }
    },
    ["metal"] = {
        "anim@mp_player_intincarrockstd@ps@",
        "idle_a",
        "Metal",
        AnimationOptions = {
            -- CHANGE ME
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["no"] = {
        "anim@heists@ornate_bank@chat_manager",
        "fail",
        "No",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["no2"] = {
        "mp_player_int_upper_nod",
        "mp_player_int_nod_no",
        "No 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["nosepick"] = {
        "anim@mp_player_intcelebrationfemale@nose_pick",
        "nose_pick",
        "Nose Pick",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["noway"] = {
        "gestures@m@standing@casual",
        "gesture_no_way",
        "No Way",
        AnimationOptions = {
            EmoteDuration = 1500,
            EmoteMoving = true,
        }
    },
    ["ok"] = {
        "anim@mp_player_intselfiedock",
        "idle_a",
        "OK",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["dock"] = {
        "anim@mp_player_intincardockstd@rds@",
        "idle_a",
        "Dock",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["outofbreath"] = {
        "re@construction",
        "out_of_breath",
        "Out of Breath",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["pickup"] = {
        "random@domestic",
        "pickup_low",
        "Pickup"
    },
    ["push"] = {
        "missfinale_c2ig_11",
        "pushcar_offcliff_f",
        "Push",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["push2"] = {
        "missfinale_c2ig_11",
        "pushcar_offcliff_m",
        "Push 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["point"] = {
        "gestures@f@standing@casual",
        "gesture_point",
        "Point",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["pushup"] = {
        "amb@world_human_push_ups@male@idle_a",
        "idle_d",
        "Pushup",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["countdown"] = {
        "random@street_race",
        "grid_girl_race_start",
        "Countdown",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["pointright"] = {
        "mp_gun_shop_tut",
        "indicate_right",
        "Point Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["salute"] = {
        "anim@mp_player_intincarsalutestd@ds@",
        "idle_a",
        "Salute",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["salute2"] = {
        "anim@mp_player_intincarsalutestd@ps@",
        "idle_a",
        "Salute 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["salute3"] = {
        "anim@mp_player_intuppersalute",
        "idle_a",
        "Salute 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["scared"] = {
        "random@domestic",
        "f_distressed_loop",
        "Scared",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["scared2"] = {
        "random@homelandsecurity",
        "knees_loop_girl",
        "Scared 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["screwyou"] = {
        "misscommon@response",
        "screw_you",
        "Screw You",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shakeoff"] = {
        "move_m@_idles@shake_off",
        "shakeoff_1",
        "Shake Off",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3500,
        }
    },
    ["shot"] = {
        "random@dealgonewrong",
        "idle_a",
        "Shot",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sleep"] = {
        "timetable@tracy@sleep@",
        "idle_c",
        "Sleep",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["shrug"] = {
        "gestures@f@standing@casual",
        "gesture_shrug_hard",
        "Shrug",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000,
        }
    },
    ["shrug2"] = {
        "gestures@m@standing@casual",
        "gesture_shrug_hard",
        "Shrug 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1000,
        }
    },
    ["sit"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_idle_nowork",
        "Sit",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sit2"] = {
        "rcm_barry3",
        "barry_3_sit_loop",
        "Sit 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sit3"] = {
        "amb@world_human_picnic@male@idle_a",
        "idle_a",
        "Sit 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sit4"] = {
        "amb@world_human_picnic@female@idle_a",
        "idle_a",
        "Sit 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sit5"] = {
        "anim@heists@fleeca_bank@ig_7_jetski_owner",
        "owner_idle",
        "Sit 5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sit6"] = {
        "timetable@jimmy@mics3_ig_15@",
        "idle_a_jimmy",
        "Sit 6",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sit7"] = {
        "anim@amb@nightclub@lazlow@lo_alone@",
        "lowalone_base_laz",
        "Sit 7",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sit8"] = {
        "timetable@jimmy@mics3_ig_15@",
        "mics3_15_base_jimmy",
        "Sit 8",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sit9"] = {
        "amb@world_human_stupor@male@idle_a",
        "idle_a",
        "Sit 9",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitlow"] = {
        "anim@veh@lowrider@std@ds@arm@base",
        "sit_low_lowdoor",
        "Sit Lowrider",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitlean"] = {
        "timetable@tracy@ig_14@",
        "ig_14_base_tracy",
        "Sit Lean",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitsad"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_sleeping-noworkfemale",
        "Sit Sad",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitscared"] = {
        "anim@heists@ornate_bank@hostages@hit",
        "hit_loop_ped_b",
        "Sit Scared",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitscared2"] = {
        "anim@heists@ornate_bank@hostages@ped_c@",
        "flinch_loop",
        "Sit Scared 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitscared3"] = {
        "anim@heists@ornate_bank@hostages@ped_e@",
        "flinch_loop",
        "Sit Scared 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitdrunk"] = {
        "timetable@amanda@drunk@base",
        "base",
        "Sit Drunk",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitchair2"] = {
        "timetable@ron@ig_5_p3",
        "ig_5_p3_base",
        "Sit Chair 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitchair3"] = {
        "timetable@reunited@ig_10",
        "base_amanda",
        "Sit Chair 3 (Female)",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitchair4"] = {
        "timetable@ron@ig_3_couch",
        "base",
        "Sit Chair 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitchair5"] = {
        "timetable@jimmy@mics3_ig_15@",
        "mics3_15_base_tracy",
        "Sit Chair Legs Crossed",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitchair6"] = {
        "timetable@maid@couch@",
        "base",
        "Sit Chair Lean Back",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sitchairside"] = {
        "timetable@ron@ron_ig_2_alt1",
        "ig_2_alt1_base",
        "Sit Chair Side",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["situp"] = {
        "amb@world_human_sit_ups@male@idle_a",
        "idle_a",
        "Sit Up",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["clapangry"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "angry_clap_a_player_a",
        "Clap Angry",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["slowclap3"] = {
        "anim@mp_player_intupperslow_clap",
        "idle_a",
        "Slow Clap 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["clap"] = {
        "amb@world_human_cheering@male_a",
        "base",
        "Clap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["slowclap"] = {
        "anim@mp_player_intcelebrationfemale@slow_clap",
        "slow_clap",
        "Slow Clap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["slowclap2"] = {
        "anim@mp_player_intcelebrationmale@slow_clap",
        "slow_clap",
        "Slow Clap 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["smell"] = {
        "move_p_m_two_idles@generic",
        "fidget_sniff_fingers",
        "Smell",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["stickup"] = {
        "random@countryside_gang_fight",
        "biker_02_stickup_loop",
        "Stick Up",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["stumble"] = {
        "misscarsteal4@actor",
        "stumble",
        "Stumble",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["stunned"] = {
        "stungun@standing",
        "damage",
        "Stunned",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sunbathe"] = {
        "amb@world_human_sunbathe@male@back@base",
        "base",
        "Sunbathe",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["sunbathe2"] = {
        "amb@world_human_sunbathe@female@back@base",
        "base",
        "Sunbathe 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["t"] = {
        "missfam5_yoga",
        "a2_pose",
        "T",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["t2"] = {
        "mp_sleep",
        "bind_pose_180",
        "T 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["think5"] = {
        "mp_cp_welcome_tutthink",
        "b_think",
        "Think 5",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000,
        }
    },
    ["think"] = {
        "misscarsteal4@aliens",
        "rehearsal_base_idle_director",
        "Think",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["think3"] = {
        "timetable@tracy@ig_8@base",
        "base",
        "Think 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["think2"] = {
        "missheist_jewelleadinout",
        "jh_int_outro_loop_a",
        "Think 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["thumbsup3"] = {
        "anim@mp_player_intincarthumbs_uplow@ds@",
        "enter",
        "Thumbs Up 3",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000,
        }
    },
    ["thumbsup2"] = {
        "anim@mp_player_intselfiethumbs_up",
        "idle_a",
        "Thumbs Up 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["thumbsup"] = {
        "anim@mp_player_intupperthumbs_up",
        "idle_a",
        "Thumbs Up",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["type"] = {
        "anim@heists@prison_heiststation@cop_reactions",
        "cop_b_idle",
        "Type",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["type2"] = {
        "anim@heists@prison_heistig1_p1_guard_checks_bus",
        "loop",
        "Type 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["type3"] = {
        "mp_prison_break",
        "hack_loop",
        "Type 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["type4"] = {
        "mp_fbi_heist",
        "loop",
        "Type 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["warmth"] = {
        "amb@world_human_stand_fire@male@idle_a",
        "idle_a",
        "Warmth",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wave4"] = {
        "random@mugging5",
        "001445_01_gangintimidation_1_female_idle_b",
        "Wave 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000,
        }
    },
    ["wave2"] = {
        "anim@mp_player_intcelebrationfemale@wave",
        "wave",
        "Wave 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wave3"] = {
        "friends@fra@ig_1",
        "over_here_idle_a",
        "Wave 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wave"] = {
        "friends@frj@ig_1",
        "wave_a",
        "Wave",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wave5"] = {
        "friends@frj@ig_1",
        "wave_b",
        "Wave 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wave6"] = {
        "friends@frj@ig_1",
        "wave_c",
        "Wave 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wave7"] = {
        "friends@frj@ig_1",
        "wave_d",
        "Wave 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wave8"] = {
        "friends@frj@ig_1",
        "wave_e",
        "Wave 8",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wave9"] = {
        "gestures@m@standing@casual",
        "gesture_hello",
        "Wave 9",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["whistle"] = {
        "taxi_hail",
        "hail_taxi",
        "Whistle",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 1300,
        }
    },
    ["whistle2"] = {
        "rcmnigel1c",
        "hailing_whistle_waive_a",
        "Whistle 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 2000,
        }
    },
    ["yeah"] = {
        "anim@mp_player_intupperair_shagging",
        "idle_a",
        "Yeah",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lift"] = {
        "random@hitch_lift",
        "idle_f",
        "Lift",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lol"] = {
        "anim@arena@celeb@flat@paired@no_props@",
        "laugh_a_player_b",
        "LOL",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lol2"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "giggle_a_player_b",
        "LOL 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["statue3"] = {
        "club_intro2-0",
        "csb_englishdave_dual-0",
        "Statue 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["gangsign"] = {
        "mp_player_int_uppergang_sign_a",
        "mp_player_int_gang_sign_a",
        "Gang Sign",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gangsign2"] = {
        "mp_player_int_uppergang_sign_b",
        "mp_player_int_gang_sign_b",
        "Gang Sign 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["passout"] = {
        "missarmenian2",
        "drunk_loop",
        "Passout",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["passout2"] = {
        "missarmenian2",
        "corpse_search_exit_ped",
        "Passout 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["passout3"] = {
        "anim@gangops@morgue@table@",
        "body_search",
        "Passout 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["passout4"] = {
        "mini@cpr@char_b@cpr_def",
        "cpr_pumpchest_idle",
        "Passout 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["passout5"] = {
        "random@mugging4",
        "flee_backward_loop_shopkeeper",
        "Passout 5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["petting"] = {
        "creatures@rottweiler@tricks@",
        "petting_franklin",
        "Petting",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["crawl"] = {
        "move_injured_ground",
        "front_loop",
        "Crawl",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["flip2"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "cap_a_player_a",
        "Flip 2"
    },
    ["flip"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "flip_a_player_a",
        "Flip"
    },
    ["slide"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "slide_a_player_a",
        "Slide"
    },
    ["slide2"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "slide_b_player_a",
        "Slide 2"
    },
    ["slide3"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "slide_c_player_a",
        "Slide 3"
    },
    ["slugger"] = {
        "anim@arena@celeb@flat@solo@no_props@",
        "slugger_a_player_a",
        "Slugger"
    },
    ["flipoff"] = {
        "anim@arena@celeb@podium@no_prop@",
        "flip_off_a_1st",
        "Flip Off",
        AnimationOptions = {
            EmoteMoving = true,
        }
    },
    ["flipoff2"] = {
        "anim@arena@celeb@podium@no_prop@",
        "flip_off_c_1st",
        "Flip Off 2",
        AnimationOptions = {
            EmoteMoving = true,
        }
    },
    ["bow"] = {
        "anim@arena@celeb@podium@no_prop@",
        "regal_c_1st",
        "Bow",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["bow2"] = {
        "anim@arena@celeb@podium@no_prop@",
        "regal_a_1st",
        "Bow 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["keyfob"] = {
        "anim@mp_player_intmenu@key_fob@",
        "fob_click",
        "Key Fob",
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = true,
            EmoteDuration = 1000,
        }
    },
    ["reaching"] = {
        "move_m@intimidation@cop@unarmed",
        "idle",
        "Reaching",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["slap"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_slap",
        "Slap",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
            EmoteDuration = 2000,
        }
    },
    ["headbutt"] = {
        "melee@unarmed@streamed_variations",
        "plyr_takedown_front_headbutt",
        "Headbutt"
    },
    ["fishdance"] = {
        "anim@mp_player_intupperfind_the_fish",
        "idle_a",
        "Fish Dance",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peace"] = {
        "mp_player_int_upperpeace_sign",
        "mp_player_int_peace_sign",
        "Peace",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peace2"] = {
        "anim@mp_player_intupperpeace",
        "idle_a",
        "Peace 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peace3"] = {
        "anim@mp_player_intupperpeace",
        "idle_a_fp",
        "Peace 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peace4"] = {
        "anim@mp_player_intincarpeacestd@ds@",
        "idle_a",
        "Peace 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peace5"] = {
        "anim@mp_player_intincarpeacestd@ds@",
        "idle_a_fp",
        "Peace 5",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peace6"] = {
        "anim@mp_player_intincarpeacebodhi@ds@",
        "idle_a",
        "Peace 6",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peace7"] = {
        "anim@mp_player_intincarpeacebodhi@ds@",
        "idle_a_fp",
        "Peace 7",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peacef"] = {
        "anim@mp_player_intcelebrationfemale@peace",
        "peace",
        "Peace Female",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cpr"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "CPR",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["cpr2"] = {
        "mini@cpr@char_a@cpr_str",
        "cpr_pumpchest",
        "CPR 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ledge"] = {
        "missfbi1",
        "ledge_loop",
        "Ledge",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["airplane"] = {
        "missfbi1",
        "ledge_loop",
        "Air Plane",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["peek"] = {
        "random@paparazzi@peek",
        "left_peek_a",
        "Peek",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["cough"] = {
        "timetable@gardener@smoking_joint",
        "idle_cough",
        "Cough",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["stretch"] = {
        "mini@triathlon",
        "idle_e",
        "Stretch",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["stretch2"] = {
        "mini@triathlon",
        "idle_f",
        "Stretch 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["stretch3"] = {
        "mini@triathlon",
        "idle_d",
        "Stretch 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["stretch4"] = {
        "rcmfanatic1maryann_stretchidle_b",
        "idle_e",
        "Stretch 4",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["celebrate"] = {
        "rcmfanatic1celebrate",
        "celebrate",
        "Celebrate",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["punching"] = {
        "rcmextreme2",
        "loop_punching",
        "Punching",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["superhero"] = {
        "rcmbarry",
        "base",
        "Superhero",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["superhero2"] = {
        "rcmbarry",
        "base",
        "Superhero 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["mindcontrol"] = {
        "rcmbarry",
        "mind_control_b_loop",
        "Mind Control",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["mindcontrol2"] = {
        "rcmbarry",
        "bar_1_attack_idle_aln",
        "Mind Control 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["clown"] = {
        "rcm_barry2",
        "clown_idle_0",
        "Clown",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["clown2"] = {
        "rcm_barry2",
        "clown_idle_1",
        "Clown 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["clown3"] = {
        "rcm_barry2",
        "clown_idle_2",
        "Clown 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["clown4"] = {
        "rcm_barry2",
        "clown_idle_3",
        "Clown 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["clown5"] = {
        "rcm_barry2",
        "clown_idle_6",
        "Clown 5",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["tryclothes"] = {
        "mp_clothing@female@trousers",
        "try_trousers_neutral_a",
        "Try Clothes",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["tryclothes2"] = {
        "mp_clothing@female@shirt",
        "try_shirt_positive_a",
        "Try Clothes 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["tryclothes3"] = {
        "mp_clothing@female@shoes",
        "try_shoes_positive_a",
        "Try Clothes 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["nervous2"] = {
        "mp_missheist_countrybank@nervous",
        "nervous_idle",
        "Nervous 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["nervous"] = {
        "amb@world_human_bum_standing@twitchy@idle_a",
        "idle_c",
        "Nervous",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["nervous3"] = {
        "rcmme_tracey1",
        "nervous_loop",
        "Nervous 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["uncuff"] = {
        "mp_arresting",
        "a_uncuff",
        "Uncuff",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["namaste"] = {
        "timetable@amanda@ig_4",
        "ig_4_base",
        "Namaste",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["threaten"] = {
        "random@atmrobberygen",
        "b_atm_mugging",
        "Threaten",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["radio"] = {
        "random@arrests",
        "generic_radio_chatter",
        "Radio",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["pull"] = {
        "random@mugging4",
        "struggle_loop_b_thief",
        "Pull",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["bird"] = {
        "random@peyote@bird",
        "wakeup",
        "Bird"
    },
    ["chicken"] = {
        "random@peyote@chicken",
        "wakeup",
        "Chicken",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["bark"] = {
        "random@peyote@dog",
        "wakeup",
        "Bark"
    },
    ["rabbit"] = {
        "random@peyote@rabbit",
        "wakeup",
        "Rabbit"
    },
    ["spiderman"] = {
        "missexile3",
        "ex03_train_roof_idle",
        "Spider-Man",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["boi"] = {
        "special_ped@jane@monologue_5@monologue_5c",
        "brotheradrianhasshown_2",
        "BOI",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 3000,
        }
    },
    ["adjust"] = {
        "missmic4",
        "michael_tux_fidget",
        "Adjust",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000,
        }
    },
    ["handsup"] = {
        "missminuteman_1ig_2",
        "handsup_base",
        "Hands Up",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["handsup2"] = {
        "anim@mp_player_intuppersurrender",
        "idle_a_fp",
        "Hands Up 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["valet"] = {
        "anim@amb@casino@valet_scenario@pose_a@",
        "base_a_m_y_vinewood_01",
        "Valet",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["valet2"] = {
        "anim@amb@casino@valet_scenario@pose_b@",
        "base_a_m_y_vinewood_01",
        "Valet 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["valet3"] = {
        "anim@amb@casino@valet_scenario@pose_d@",
        "base_a_m_y_vinewood_01",
        "Valet 3",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tighten"] = {
        "timetable@denice@ig_1",
        "idle_b",
        "Tigten (Yoga)",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["fspose"] = {
        "missfam5_yoga",
        "c2_pose",
        "F Sex Pose",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["fspose2"] = {
        "missfam5_yoga",
        "c6_pose",
        "F Sex Pose 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["fspose4"] = {
        "anim@amb@carmeet@checkout_car@",
        "female_c_idle_d",
        "F Sex Pose 4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["showerf"] = {
        "mp_safehouseshower@female@",
        "shower_enter_into_idle",
        "Shower Enter Female",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["showerf2"] = {
        "mp_safehouseshower@female@",
        "shower_idle_a",
        "Shower Female",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["showerf3"] = {
        "mp_safehouseshower@female@",
        "shower_idle_b",
        "Shower Female 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["showerm"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_a",
        "Shower Enter Male",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["showerm2"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_b",
        "Shower Male 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["showerm3"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_c",
        "Shower Male 3",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["showerm4"] = {
        "mp_safehouseshower@male@",
        "male_shower_idle_d",
        "Shower Male 4",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["picklock"] = {
        "missheistfbisetup1",
        "hassle_intro_loop_f",
        "Picklock",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["cleanhands"] = {
        "missheist_agency3aig_23",
        "urinal_sink_loop",
        "Clean Them Filthy Hands",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["cleanface"] = {
        "switch@michael@wash_face",
        "loop_michael",
        "Clean Your Face",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["buzz"] = {
        "anim@apt_trans@buzzer",
        "buzz_reg",
        "Buzz Door",
        AnimationOptions = {
            EmoteLoop = false,
            EmoteMoving = false,
        }
    },
    ["grieve"] = {
        "anim@miss@low@fin@vagos@",
        "idle_ped05",
        "Grieve The Dead",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["respect"] = {
        "anim@mp_player_intcelebrationmale@respect",
        "respect",
        "Respect Male",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = false,
        }
    },
    ["respectf"] = {
        "anim@mp_player_intcelebrationfemale@respect",
        "respect",
        "Respect Female",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = false,
        }
    },
    ["bang"] = {
        "anim@mp_player_intcelebrationfemale@bang_bang",
        "bang_bang",
        "Bang Bang ",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["checkcar"] = {
        "anim@amb@carmeet@checkout_car@male_a@idles",
        "idle_b",
        "Check Out · Female ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["checkcar2"] = {
        "anim@amb@carmeet@checkout_car@male_c@idles",
        "idle_a",
        "Check Out 2 · Male ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["showboobs"] = {
        "mini@strip_club@backroom@",
        "stripper_b_backroom_idle_b",
        "Show Boobs ",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000,
        },
        AdultAnimation = true
    },
    ["showboobs2"] = {
        "mini@strip_club@idles@stripper",
        "stripper_idle_05",
        "Show Boobs 2",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000,
        },
        AdultAnimation = true
    },
    ["watchstripper"] = {
        "amb@world_human_strip_watch_stand@male_c@idle_a",
        "idle_b",
        "Watch Stripper ",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteDuration = 6000,
        },
        AdultAnimation = true
    },
    ["hhands"] = {
        "misssnowie@hearthands",
        "base",
        "Heart Hands",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["pee"] = {
        "misscarsteal2peeing",
        "peeing_loop",
        "Pee (Male)",
        AnimationOptions = {
            EmoteStuck = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {
                -0.05,
                0.3,
                0.0,
                0.0,
                90.0,
                90.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
            PtfxWait = 3000,
            PtfxCanHold = true,
        },
        AdultAnimation = true
    },
    ["pee2"] = {
        "missbigscore1switch_trevor_piss",
        "piss_loop",
        "Pee 2 (Male)",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            PtfxAsset = "scr_amb_chop",
            PtfxName = "ent_anim_dog_peeing",
            PtfxNoProp = true,
            PtfxPlacement = {
                0.0130,
                0.1030,
                0.0,
                0.0,
                90.0,
                90.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['pee'],
            PtfxWait = 3000,
            PtfxCanHold = true,
        },
        AdultAnimation = true
    },
    ["hump"] = {
        "timetable@trevor@skull_loving_bear",
        "skull_loving_bear",
        "Hump",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["wank"] = {
        "anim@mp_player_intselfiewank",
        "idle_a",
        "Wank",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["wank2"] = {
        "anim@mp_player_intupperwank",
        "idle_a",
        "Wank 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["wank3"] = {
        "mp_player_int_upperwank",
        "mp_player_int_wank_02",
        "Wank 3",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["wank4"] = {
        "mp_player_int_upperwank",
        "mp_player_int_wank_02_fp",
        "Wank 4",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["wank5"] = {
        "mp_player_intwank",
        "mp_player_int_wank",
        "Wank 5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = false,
        },
        AdultAnimation = true
    },


    -----------------------------------------------------------------------------------------------------------
    ------ The male and female 'interaction menu' emotes from GTA Online can be found under the following animation directories:
    ------
    ------ Male: anim@mp_player_intcelebrationmale
    ------
    ------ Female: anim@mp_player_intcelebrationfemale

    -----------------------------------------------------------------------------------------------------------




    -----------------------------------------------------------------------------------------------------------
    ------ These are Scenarios, some of these dont work on women and some other issues, but still good to have.
    -----------------------------------------------------------------------------------------------------------
    ["atm"] = {
        "Scenario",
        "PROP_HUMAN_ATM",
        "ATM"
    },
    ["bbq"] = {
        "MaleScenario",
        "PROP_HUMAN_BBQ",
        "BBQ"
    },
    ["bumbin"] = {
        "Scenario",
        "PROP_HUMAN_BUM_BIN",
        "Bum Bin"
    },
    ["bumsleep"] = {
        "Scenario",
        "WORLD_HUMAN_BUM_SLUMPED",
        "Bum Sleep"
    },
    ["cheer"] = {
        "Scenario",
        "WORLD_HUMAN_CHEERING",
        "Cheer"
    },
    ["chinup"] = {
        "Scenario",
        "PROP_HUMAN_MUSCLE_CHIN_UPS",
        "Chinup"
    },
    ["clipboard2"] = {
        "MaleScenario",
        "WORLD_HUMAN_CLIPBOARD",
        "Clipboard 2"
    },
    ["cop"] = {
        "Scenario",
        "WORLD_HUMAN_COP_IDLES",
        "Cop"
    },
    ["drill"] = {
        "Scenario",
        "WORLD_HUMAN_CONST_DRILL",
        "Construction Drilling"
    },
    ["filmshocking"] = {
        "Scenario",
        "WORLD_HUMAN_MOBILE_FILM_SHOCKING",
        "Film Shocking"
    },
    ["flex"] = {
        "Scenario",
        "WORLD_HUMAN_MUSCLE_FLEX",
        "Flex"
    },
    ["flex2"] = { -- Custom Emote By Frabi
        "frabi@malepose@solo@firstsport",
        "pose_sport_002",
        "Flex 2",
        AnimationOptions = {
            EmoteLoop = true,
			EmoteMoving = true, --- Allows us to flex while performing another animation 
        }
    },
	 ["gympose"] = { -- Custom Emote By Frabi
        "frabi@malepose@solo@firstsport",
        "pose_sport_001",
        "Gym Pose",
        AnimationOptions = {
		
            EmoteLoop = true,
        }
   },
	 ["gympose2"] = { -- Custom Emote By Frabi
        "frabi@malepose@solo@firstsport",
        "pose_sport_005",
        "Gym Pose 2 - One Handed Push Up",
        AnimationOptions = {
		
            EmoteLoop = true,
        }
    },
    ["guard"] = {
        "Scenario",
        "WORLD_HUMAN_GUARD_STAND",
        "Guard"
    },
    ["garden"] = {
        "Scenario",
        "WORLD_HUMAN_GARDENER_PLANT",
        "Gardening"
    },
    ["hammer"] = {
        "Scenario",
        "WORLD_HUMAN_HAMMERING",
        "Hammer"
    },
    ["hangout"] = {
        "Scenario",
        "WORLD_HUMAN_HANG_OUT_STREET",
        "Hangout"
    },
    ["impatient"] = {
        "Scenario",
        "WORLD_HUMAN_STAND_IMPATIENT",
        "Impatient"
    },
    ["janitor"] = {
        "Scenario",
        "WORLD_HUMAN_JANITOR",
        "Janitor"
    },
    ["jog"] = {
        "Scenario",
        "WORLD_HUMAN_JOG_STANDING",
        "Jog"
    },
    ["kneel"] = {
        "Scenario",
        "CODE_HUMAN_MEDIC_KNEEL",
        "Kneel"
    },
    ["lean"] = {
        "Scenario",
        "WORLD_HUMAN_LEANING",
        "Lean"
    },
    ["leanbar"] = {
        "Scenario",
        "PROP_HUMAN_BUM_SHOPPING_CART",
        "Lean Bar"
    },
    ["lookout"] = {
        "Scenario",
        "CODE_HUMAN_CROSS_ROAD_WAIT",
        "Lookout"
    },
    ["maid"] = {
        "Scenario",
        "WORLD_HUMAN_MAID_CLEAN",
        "Maid"
    },
    ["medic"] = {
        "Scenario",
        "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
        "Medic"
    },
    ["musician"] = {
        "MaleScenario",
        "WORLD_HUMAN_MUSICIAN",
        "Musician"
    },
    -- Ambient Music Doesn't Seem To Work For Female, Hence It's Male Only
    ["notepad2"] = {
        "Scenario",
        "CODE_HUMAN_MEDIC_TIME_OF_DEATH",
        "Notepad 2"
    },
    ["parkingmeter"] = {
        "Scenario",
        "PROP_HUMAN_PARKING_METER",
        "Parking Meter"
    },
    ["party"] = {
        "Scenario",
        "WORLD_HUMAN_PARTYING",
        "Party"
    },
    ["texting"] = {
        "Scenario",
        "WORLD_HUMAN_STAND_MOBILE",
        "Texting"
    },
    ["prosthigh"] = {
        "Scenario",
        "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS",
        "Prostitue High"
    },
    ["prostlow"] = {
        "Scenario",
        "WORLD_HUMAN_PROSTITUTE_LOW_CLASS",
        "Prostitue Low"
    },
    ["puddle"] = {
        "Scenario",
        "WORLD_HUMAN_BUM_WASH",
        "Puddle"
    },
    ["record"] = {
        "Scenario",
        "WORLD_HUMAN_MOBILE_FILM_SHOCKING",
        "Record"
    },

    -- Sitchair is a litte special, since you want the player to be seated correctly.
    -- So we set it as "ScenarioObject" and do TaskStartScenarioAtPosition() instead of "AtPlace"
    ["sitchair"] = {
        "ScenarioObject",
        "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER",
        "Sit Chair"
    },
    ["smoke"] = {
        "Scenario",
        "WORLD_HUMAN_SMOKING",
        "Smoke"
    },
    ["smokeweed"] = {
        "MaleScenario",
        "WORLD_HUMAN_DRUG_DEALER",
        "Smoke Weed (Male)"
    },
    -- Male
    ["smokepot"] = {
        "Scenario",
        "WORLD_HUMAN_SMOKING_POT",
        "Smoke Weed (Female)"
    },
    -- Female
    ["statue"] = {
        "Scenario",
        "WORLD_HUMAN_HUMAN_STATUE",
        "Statue"
    },
    ["sunbathe3"] = {
        "Scenario",
        "WORLD_HUMAN_SUNBATHE",
        "Sunbathe 3"
    },
    ["sunbatheback"] = {
        "Scenario",
        "WORLD_HUMAN_SUNBATHE_BACK",
        "Sunbathe Back"
    },
    ["weld"] = {
        "Scenario",
        "WORLD_HUMAN_WELDING",
        "Weld"
    },
    ["windowshop"] = {
        "Scenario",
        "WORLD_HUMAN_WINDOW_SHOP_BROWSE",
        "Window Shop"
    },
    ["yoga"] = {
        "Scenario",
        "WORLD_HUMAN_YOGA",
        "Yoga"
    },

    -- CASINO DLC EMOTES (Requires gamebuild 2060 or higher)
    ["karate"] = {
        "anim@mp_player_intcelebrationfemale@karate_chops",
        "karate_chops",
        "Karate"
    },
    ["karate2"] = {
        "anim@mp_player_intcelebrationmale@karate_chops",
        "karate_chops",
        "Karate 2"
    },
    ["cutthroat"] = {
        "anim@mp_player_intcelebrationmale@cut_throat",
        "cut_throat",
        "Cut Throat"
    },
    ["cutthroat2"] = {
        "anim@mp_player_intcelebrationfemale@cut_throat",
        "cut_throat",
        "Cut Throat 2"
    },
    ["mindblown"] = {
        "anim@mp_player_intcelebrationmale@mind_blown",
        "mind_blown",
        "Mind Blown",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["mindblown2"] = {
        "anim@mp_player_intcelebrationfemale@mind_blown",
        "mind_blown",
        "Mind Blown 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["boxing"] = {
        "anim@mp_player_intcelebrationmale@shadow_boxing",
        "shadow_boxing",
        "Boxing",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["boxing2"] = {
        "anim@mp_player_intcelebrationfemale@shadow_boxing",
        "shadow_boxing",
        "Boxing 2",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 4000
        }
    },
    ["stink"] = {
        "anim@mp_player_intcelebrationfemale@stinker",
        "stinker",
        "Stink",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["think4"] = {
        "anim@amb@casino@hangout@ped_male@stand@02b@idles",
        "idle_a",
        "Think 4",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["adjusttie"] = {
        "clothingtie",
        "try_tie_positive_a",
        "Adjust Tie",
        AnimationOptions = {
            EmoteMoving = true,
            EmoteDuration = 5000
        }
    },
    ["shaka"] = {
        "sign@hang_loose",
        "base",
        "Shaka 'Hang Loose'",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shaka2"] = {
        "sign@hang_loose_casual",
        "base",
        "Shaka 'Hang Loose Casual'",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["relax"] = {
        "lying@on_grass",
        "base",
        "Relax ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["relax2"] = {
        "lying@on_couch_legs_crossed",
        "base",
        "Relax ",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["uwu"] = {
        "uwu@egirl",
        "base",
        "uWu",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
}

--- EMOTES WITH 1 OR 2 PROPS ---
DP.PropEmotes = {
    ["umbrella"] = {
        "amb@world_human_drinking@coffee@male@base",
        "base",
        "Umbrella",
        AnimationOptions = {
            Prop = "p_amb_brolly_01",
            PropBone = 57005,
            PropPlacement = {
                0.15,
                0.005,
                0.0,
                87.0,
                -20.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['umbrella2'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Umbrella 2',
        AnimationOptions = {
            Prop = 'p_amb_brolly_01',
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                0.0100,
                0.1100,
                2.3402393,
                -150.9605721,
                57.3374916
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    -----------------------------------------------------------------------------------------------------
    ------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
    -----------------------------------------------------------------------------------------------------
    ["notepad"] = {
        "missheistdockssetup1clipboard@base",
        "base",
        "Notepad",
        AnimationOptions = {
            Prop = 'prop_notepad_01',
            PropBone = 18905,
            PropPlacement = {
                0.1,
                0.02,
                0.05,
                10.0,
                0.0,
                0.0
            },
            SecondProp = 'prop_pencil_01',
            SecondPropBone = 58866,
            SecondPropPlacement = {
                0.11,
                -0.02,
                0.001,
                -120.0,
                0.0,
                0.0
            },
            -- EmoteLoop is used for emotes that should loop, its as simple as that.
            -- Then EmoteMoving is used for emotes that should only play on the upperbody.
            -- The code then checks both values and sets the MovementType to the correct one
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["box"] = {
        "anim@heists@box_carry@",
        "idle",
        "Box",
        AnimationOptions = {
            Prop = "hei_prop_heist_box",
            PropBone = 60309,
            PropPlacement = {
                0.025,
                0.08,
                0.255,
                -145.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["rose"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Rose",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.15,
                0.0,
                -100.0,
                0.0,
                -20.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["smoke2"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_c",
        "Smoke 2",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["smoke3"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_b",
        "Smoke 3",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["smoke4"] = {
        "amb@world_human_smoking@female@idle_a",
        "idle_b",
        "Smoke 4",
        AnimationOptions = {
            Prop = 'prop_cs_ciggy_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
	["vape"] = {
        "amb@world_human_smoking@male@male_b@base",
        "base",
         "Vape",
        AnimationOptions = {
            Prop = 'ba_prop_battle_vape_01',
            PropBone = 28422,
            PropPlacement = {
                -0.0290,
                0.0070,
                -0.0050,
                41.9596,
                40.0102,
                 -62.7294
            },
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "core",
            PtfxName = "exp_grd_bzgas_smoke",
			PtfxNoProp = true,
            PtfxPlacement = {
                -0.0100,
				0.0600,
				0.6600,
                0.0,
                0.0,
                0.0,
                2.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['vape'],
            PtfxWait = 0,
            PtfxCanHold = true,
        }
    },
    ["bong"] = {
        "anim@safehouse@bong",
        "bong_stage3",
        "Bong",
        AnimationOptions = {
            Prop = 'hei_heist_sh_bong_01',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.25,
                0.0,
                95.0,
                190.0,
                180.0
            },
        }
    },
    ["fishing1"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_a",
        "Fishing 1",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["fishing2"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_b",
        "Fishing 2",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["fishing3"] = {
        "amb@world_human_stand_fishing@idle_a",
        "idle_c",
        "Fishing 3",
        AnimationOptions = {
            Prop = 'prop_fishing_rod_01',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["suitcase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Suitcase",
        AnimationOptions = {
            Prop = "prop_ld_suitcase_01",
            PropBone = 57005,
            PropPlacement = {
                0.35,
                0.0,
                0.0,
                0.0,
                266.0,
                90.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["suitcase2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Suitcase 2",
        AnimationOptions = {
            Prop = "prop_security_case_01",
            PropBone = 57005,
            PropPlacement = {
                0.13,
                0.0,
                -0.01,
                0.0,
                280.0,
                90.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["boombox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Boombox",
        AnimationOptions = {
            Prop = "prop_boombox_01",
            PropBone = 57005,
            PropPlacement = {
                0.27,
                0.0,
                0.0,
                0.0,
                263.0,
                58.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["boombox2"] = {
        "molly@boombox1",
        "boombox1_clip",
        "Boombox 2",
        AnimationOptions = {
            Prop = "prop_cs_sol_glasses",
            PropBone = 31086,
            PropPlacement = {
                0.0440,
                0.0740,
                0.0000,
                -160.9843,
                -88.7288,
                -0.6197
            },
            SecondProp = 'prop_ghettoblast_02',
            SecondPropBone = 10706,
            SecondPropPlacement = {
                -0.2310,
                -0.0770,
                0.2410,
                -179.7256,
                176.7406,
                23.0190
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["toolbox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Toolbox",
        AnimationOptions = {
            Prop = "prop_tool_box_04",
            PropBone = 28422,
            PropPlacement = {
                0.3960,
                0.0410,
                -0.0030,
                -90.00,
                0.0,
                90.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["toolbox2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Toolbox 2",
        AnimationOptions = {
            Prop = "imp_prop_tool_box_01a",
            PropBone = 28422,
            PropPlacement = {
                0.3700,
                0.0200,
                0.0,
                90.00,
                0.0,
                -90.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gbag"] = {
        "missfbi4prepp1",
        "_idle_garbage_man",
        "Garbage Bag",
        AnimationOptions = {
            Prop = "prop_cs_street_binbag_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0400,
                -0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beerbox"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Beer Box 1",
        AnimationOptions = {
            Prop = "v_ret_ml_beerdus",
            PropBone = 57005,
            PropPlacement = {
                0.22,
                0.0,
                0.0,
                0.0,
                266.0,
                48.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beerbox2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Beer Box 2",
        AnimationOptions = {
            Prop = "v_ret_ml_beeram",
            PropBone = 57005,
            PropPlacement = {
                0.22,
                0.0,
                0.0,
                0.0,
                266.0,
                48.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beerbox3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Beer Box 3",
        AnimationOptions = {
            Prop = "v_ret_ml_beerpride",
            PropBone = 57005,
            PropPlacement = {
                0.22,
                0.0,
                0.0,
                0.0,
                266.0,
                48.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beerbox4"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Beer Box 4",
        AnimationOptions = {
            Prop = "v_ret_ml_beerbar",
            PropBone = 57005,
            PropPlacement = {
                0.22,
                0.0,
                0.0,
                0.0,
                266.0,
                60.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["mugshot"] = {
        "mp_character_creation@customise@male_a",
        "loop",
        "Mugshot",
        AnimationOptions = {
            Prop = 'prop_police_id_board',
            PropBone = 58868,
            PropPlacement = {
                0.12,
                0.24,
                0.0,
                5.0,
                0.0,
                70.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["coffee"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Coffee",
        AnimationOptions = {
            Prop = 'p_amb_coffeecup_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["whiskey"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Whiskey",
        AnimationOptions = {
            Prop = 'prop_drink_whisky',
            PropBone = 28422,
            PropPlacement = {
                0.01,
                -0.01,
                -0.06,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["whiskeyb"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Whiskey Bottle",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.05,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beer"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_c",
        "Beer",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.06,
                0.0,
                15.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["whiskeyb2"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Whiskey Bottle 2",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.05,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beer2"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_c",
        "Beer 2",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.06,
                0.0,
                15.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["whiskeyb3"] = {
        "amb@world_human_drinking@beer@male@idle_a",
        "idle_a",
        "Whiskey Bottle 3",
        AnimationOptions = {
            Prop = 'ba_prop_battle_whiskey_bottle_2_s',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.05,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["beerf"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_a",
        "Beer Female",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.0,
                0.05,
                15.0,
                15.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wine2"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_e",
        "Wine 2 - Bottle",
        AnimationOptions = {
            Prop = 'prop_wine_rose',
            PropBone = 28422,
            PropPlacement = {
                -0.0,
                0.04,
                -0.19,
                10.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
            ---       PropPlacement = {-0.0, 0.03, -0.20, 5.0, 0.0, 0.0},
            ---     F&B   L&R   U&D  R.F&B
        }
    },
    ["beerf3"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_a",
        "Beer Female 3",
        AnimationOptions = {
            Prop = 'prop_amb_beer_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.0,
                0.05,
                15.0,
                15.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["wine3"] = {
        "amb@world_human_drinking@beer@female@idle_a",
        "idle_e",
        "Wine 3 - Bottle",
        AnimationOptions = {
            Prop = 'prop_wine_rose',
            PropBone = 28422,
            PropPlacement = {
                -0.0,
                0.04,
                -0.19,
                10.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["cup"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Cup",
        AnimationOptions = {
            Prop = 'prop_plastic_cup_02',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["taco"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Taco",
        AnimationOptions = {
            Prop = 'prop_taco_01',
            PropBone = 60309,
            PropPlacement = {
                -0.0170,
                0.0070,
                -0.0210,
                107.9846,
                -105.0251,
                55.7779
            },
            EmoteMoving = true,
        }
    },
    ["hotdog"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Hotdog",
        AnimationOptions = {
            Prop = 'prop_cs_hotdog_02',
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                0.0100,
                -0.0100,
                95.1071,
                94.7001,
                -66.9179
            },
            EmoteMoving = true,
        }
    },
    ["donut"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Donut",
        AnimationOptions = {
            Prop = 'prop_amb_donut',
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.05,
                0.02,
                -50.0,
                16.0,
                60.0
            },
            EmoteMoving = true,
        }
    },
    ["donut2"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Donut Chocolate",
        AnimationOptions = {
            Prop = 'bzzz_foodpack_donut002',
            PropBone = 60309,
            PropPlacement = {
                0.0000,
                -0.0300,
                -0.0100,
                10.0000,
                0.0000,
                -1.0000
            },
            EmoteMoving = true,
        }
    },
    ["donut3"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Donut Raspberry",
        AnimationOptions = {
            Prop = 'bzzz_foodpack_donut001',
            PropBone = 60309,
            PropPlacement = {
                0.0000,
                -0.0300,
                -0.0100,
                10.0000,
                0.0000,
                -1.0000
            },
            EmoteMoving = true,
        }
    },
    ["croissant"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Croissant",
        AnimationOptions = {
            Prop = 'bzzz_foodpack_croissant001',
            PropBone = 60309,
            PropPlacement = {
                0.0000,
                0.0000,
                -0.0100,
                0.0000,
                0.0000,
                90.0000
            },
            EmoteMoving = true,
        }
    },
    ["burger"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Burger",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.05,
                0.02,
                -50.0,
                16.0,
                60.0
            },
            EmoteMoving = true,
        }
    },
    ["sandwich"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Sandwich",
        AnimationOptions = {
            Prop = 'prop_sandwich_01',
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.05,
                0.02,
                -50.0,
                16.0,
                60.0
            },
            EmoteMoving = true,
        }
    },
    ["soda"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Soda",
        AnimationOptions = {
            Prop = 'prop_ecola_can',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                130.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["water"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Water",
        AnimationOptions = {
            Prop = 'ba_prop_club_water_bottle',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.090,
                0.0,
                0.0,
                130.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["egobar"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Ego Bar",
        AnimationOptions = {
            Prop = 'prop_choc_ego',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteMoving = true,
        }
    },
    ["candy"] = {
        "mp_player_inteat@pnq",
        "loop",
        "Candy",
        AnimationOptions = {
            Prop = 'prop_candy_pqs',
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                0.0180,
                0.0,
                180.0,
                180.0,
                -88.099
            },
            EmoteMoving = true,
        }
    },
    ["lollipop1"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Lollipop Spiral Red",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral01',
            PropBone = 60309,
            PropPlacement = {
                -0.0100,
                0.0200,
                -0.0100,
                -175.1935,
                97.6975,
                20.9598
            },
            EmoteMoving = true,
        }
    },
    ["lollipop1b"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Lollipop Spiral Pink",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral02',
            PropBone = 60309,
            PropPlacement = {
                -0.0100,
                0.0200,
                -0.0100,
                -175.1935,
                97.6975,
                20.9598
            },
            EmoteMoving = true,
        }
    },
    ["lollipop1c"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Lollipop Spiral Green",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral03',
            PropBone = 60309,
            PropPlacement = {
                -0.0100,
                0.0200,
                -0.0100,
                -175.1935,
                97.6975,
                20.9598
            },
            EmoteMoving = true,
        }
    },
    ["lollipop1d"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Lollipop Spiral Blue",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral04',
            PropBone = 60309,
            PropPlacement = {
                -0.0100,
                0.0200,
                -0.0100,
                -175.1935,
                97.6975,
                20.9598
            },
            EmoteMoving = true,
        }
    },
    ["lollipop1e"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Lollipop Spiral Yellow",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral05',
            PropBone = 60309,
            PropPlacement = {
                -0.0100,
                0.0200,
                -0.0100,
                -175.1935,
                97.6975,
                20.9598
            },
            EmoteMoving = true,
        }
    },
    ["lollipop1f"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Lollipop Spiral Purple",
        AnimationOptions = {
            Prop = 'natty_lollipop_spiral06',
            PropBone = 60309,
            PropPlacement = {
                -0.0100,
                0.0200,
                -0.0100,
                -175.1935,
                97.6975,
                20.9598
            },
            EmoteMoving = true,
        }
    },
    ["lollipop2a"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Lollipop Spin Red",
        AnimationOptions = {
            Prop = "natty_lollipop_spin01",
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                -0.0500,
                0.0500,
                112.4227,
                -128.8559,
                15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lollipop2b"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Lollipop Spin Yellow And Pink",
        AnimationOptions = {
            Prop = "natty_lollipop_spin02",
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                -0.0500,
                0.0500,
                112.4227,
                -128.8559,
                15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lollipop2c"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Lollipop Spin Yellow And Green",
        AnimationOptions = {
            Prop = "natty_lollipop_spin03",
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                -0.0500,
                0.0500,
                112.4227,
                -128.8559,
                15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lollipop2d"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Lollipop Spin Yellow And White",
        AnimationOptions = {
            Prop = "natty_lollipop_spin04",
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                -0.0500,
                0.0500,
                112.4227,
                -128.8559,
                15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lollipop2e"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Lollipop Spin Pink And White",
        AnimationOptions = {
            Prop = "natty_lollipop_spin05",
            PropBone = 60309,
            PropPlacement = {
                -0.0300,
                -0.0500,
                0.0500,
                112.4227,
                -128.8559,
                15.6107
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lollipop3a"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Lollipop Suck",
        AnimationOptions = {
            Prop = 'natty_lollipop01',
            PropBone = 47419,
            PropPlacement = {
                0.0100,
                0.0300,
                0.0100,
                -90.0000,
                10.0000,
                -10.0000
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["wine"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Wine",
        AnimationOptions = {
            Prop = 'prop_drink_redwine',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.03,
                0.03,
                -100.0,
                0.0,
                -10.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["flute"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Flute",
        AnimationOptions = {
            Prop = 'prop_champ_flute',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.03,
                0.03,
                -100.0,
                0.0,
                -10.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["champagne"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "Champagne",
        AnimationOptions = {
            Prop = 'prop_drink_champ',
            PropBone = 18905,
            PropPlacement = {
                0.10,
                -0.03,
                0.03,
                -100.0,
                0.0,
                -10.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["cigar"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigar",
        AnimationOptions = {
            Prop = 'prop_cigar_02',
            PropBone = 47419,
            PropPlacement = {
                0.010,
                0.0,
                0.0,
                50.0,
                0.0,
                -80.0
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cigar2"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cigar 2",
        AnimationOptions = {
            Prop = 'prop_cigar_01',
            PropBone = 47419,
            PropPlacement = {
                0.010,
                0.0,
                0.0,
                50.0,
                0.0,
                -80.0
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["guitar"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar",
        AnimationOptions = {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {
                -0.1,
                0.31,
                0.1,
                0.0,
                20.0,
                150.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitar2"] = {
        "switch@trevor@guitar_beatdown",
        "001370_02_trvs_8_guitar_beatdown_idle_busker",
        "Guitar 2",
        AnimationOptions = {
            Prop = 'prop_acc_guitar_01',
            PropBone = 24818,
            PropPlacement = {
                -0.05,
                0.31,
                0.1,
                0.0,
                20.0,
                150.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar Electric",
        AnimationOptions = {
            Prop = 'prop_el_guitar_01',
            PropBone = 24818,
            PropPlacement = {
                -0.1,
                0.31,
                0.1,
                0.0,
                20.0,
                150.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarelectric2"] = {
        "amb@world_human_musician@guitar@male@idle_a",
        "idle_b",
        "Guitar Electric 2",
        AnimationOptions = {
            Prop = 'prop_el_guitar_03',
            PropBone = 24818,
            PropPlacement = {
                -0.1,
                0.31,
                0.1,
                0.0,
                20.0,
                150.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["guitarcarry2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Accoustic",
        AnimationOptions = {
            Prop = "prop_acc_guitar_01",
            PropBone = 28422,
            PropPlacement = {
                0.1500,
                -0.1400,
                -0.0200,
                -101.5083,
                5.7251,
                29.4987
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["guitarcarry3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric ",
        AnimationOptions = {
            Prop = "prop_el_guitar_01",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["guitarcarry4"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 2 ",
        AnimationOptions = {
            Prop = "prop_el_guitar_02",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["guitarcarry5"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 3 ",
        AnimationOptions = {
            Prop = "prop_el_guitar_03",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["guitarcarry6"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guitar Carry Electric 4 ",
        AnimationOptions = {
            Prop = "vw_prop_casino_art_guitar_01a",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.1200,
                -0.0500,
                -80.0000,
                0.0,
                21.9999
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["guitarsit"] = {
        "misssnowie@gatlax",
        "base",
        "Guitar Sit And Play",
        AnimationOptions = {
            Prop = "prop_acc_guitar_01",
            PropBone = 24818,
            PropPlacement = {
                -0.0510,
                0.2770,
                -0.0299,
                -140.3349,
                166.3300,
                29.7590
            },
            EmoteLoop = true,
        }
    },
    ["book"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Book",
        AnimationOptions = {
            Prop = 'prop_novel_01',
            PropBone = 6286,
            PropPlacement = {
                0.15,
                0.03,
                -0.065,
                0.0,
                180.0,
                90.0
            },
            -- This positioning isnt too great, was to much of a hassle
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["bouquet"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Bouquet",
        AnimationOptions = {
            Prop = 'prop_snow_flower_02',
            PropBone = 24817,
            PropPlacement = {
                -0.29,
                0.40,
                -0.02,
                -90.0,
                -90.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["teddy"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Teddy",
        AnimationOptions = {
            Prop = 'v_ilev_mr_rasberryclean',
            PropBone = 24817,
            PropPlacement = {
                -0.20,
                0.46,
                -0.016,
                -180.0,
                -90.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["backpack"] = {
        "move_p_m_zero_rucksack",
        "nill",
        "Backpack",
        AnimationOptions = {
            Prop = 'p_michael_backpack_s',
            PropBone = 24818,
            PropPlacement = {
                0.07,
                -0.11,
                -0.05,
                0.0,
                90.0,
                175.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["clipboard"] = {
        "missfam4",
        "base",
        "Clipboard",
        AnimationOptions = {
            Prop = 'p_amb_clipboard_01',
            PropBone = 36029,
            PropPlacement = {
                0.16,
                0.08,
                0.1,
                -130.0,
                -50.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["map"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Map",
        AnimationOptions = {
            Prop = 'prop_tourist_map_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["map2"] = {
        "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        "idle_a",
        "Map 2",
        AnimationOptions = {
            Prop = "prop_tourist_map_01",
            PropBone = 28422,
            PropPlacement = {
                -0.05,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beg"] = {
        "amb@world_human_bum_freeway@male@base",
        "base",
        "Beg",
        AnimationOptions = {
            Prop = 'prop_beggers_sign_03',
            PropBone = 58868,
            PropPlacement = {
                0.19,
                0.18,
                0.0,
                5.0,
                0.0,
                40.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["newspaper"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Newspaper",
        AnimationOptions = {
            Prop = 'prop_cliff_paper',
            PropBone = 60309,
            PropPlacement = {
                0.0970,
                -0.0280,
                -0.0170,
                107.4008,
                3.2712,
                -10.5080
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["newspaper2"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Newspaper 2",
        AnimationOptions = {
            Prop = 'ng_proc_paper_news_quik',
            PropBone = 60309,
            PropPlacement = {
                0.1590,
                0.0290,
                -0.0100,
                90.9998,
                0.0087,
                0.5000
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["newspaper3"] = {
        "amb@world_human_clipboard@male@idle_a",
        "idle_a",
        "Newspaper 3",
        AnimationOptions = {
            Prop = 'ng_proc_paper_news_rag',
            PropBone = 60309,
            PropPlacement = {
                0.1760,
                -0.00070,
                0.0200,
                99.8306,
                3.2841,
                -4.7185
            },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["pornmag"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine",
        AnimationOptions = {
            Prop = 'prop_porn_mag_02',
            PropBone = 60309,
            PropPlacement = {
                0.1000,
                -0.0360,
                -0.0300,
                -86.9096,
                179.2527,
                13.8804
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag2"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 2",
        AnimationOptions = {
            Prop = 'prop_cs_magazine',
            PropBone = 60309,
            PropPlacement = {
                0.0800,
                -0.0490,
                -0.0500,
                87.9369,
                -0.4292,
                -14.3925
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag3"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 3",
        AnimationOptions = {
            Prop = 'prop_porn_mag_03',
            PropBone = 60309,
            PropPlacement = {
                0.1000,
                -0.0700,
                -0.0200,
                -90.0000,
                -180.0000,
                22.7007
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag4"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 4",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag01',
            PropBone = 60309,
            PropPlacement = {
                -0.0200,
                -0.0300,
                0.0000,
                88.9862,
                0.2032,
                -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag5"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 5",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag02',
            PropBone = 60309,
            PropPlacement = {
                -0.0200,
                -0.0300,
                0.0000,
                88.9862,
                0.2032,
                -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag6"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 6",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag03',
            PropBone = 60309,
            PropPlacement = {
                -0.0200,
                -0.0300,
                0.0000,
                88.9862,
                0.2032,
                -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["pornmag7"] = {
        "amb@world_human_clipboard@male@base",
        "base",
        "Porn Magazine 7",
        AnimationOptions = {
            Prop = 'v_res_tt_pornmag04',
            PropBone = 60309,
            PropPlacement = {
                -0.0200,
                -0.0300,
                0.0000,
                88.9862,
                0.2032,
                -20.0016
            },
            EmoteMoving = true,
            EmoteLoop = true
        },
        AdultAnimation = true
    },
    ["makeitrain"] = {
        "anim@mp_player_intupperraining_cash",
        "idle_a",
        "Make It Rain",
        AnimationOptions = {
            Prop = 'prop_anim_cash_pile_01',
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                180.0,
                0.0,
                70.0
            },
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_xs_celebration",
            PtfxName = "scr_xs_money_rain",
            PtfxPlacement = {
                0.0,
                0.0,
                -0.09,
                -80.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['makeitrain'],
            PtfxWait = 500,
            PtfxCanHold = true,
        }
    },
    ["camera"] = {
        "amb@world_human_paparazzi@male@base",
        "base",
        "Camera",
        AnimationOptions = {
            Prop = 'prop_pap_camera_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_bike_business",
            PtfxName = "scr_bike_cfid_camera_flash",
            PtfxPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["camera2"] = {
        "cellphone@female",
        "cellphone_text_read_base_cover_low",
        "Camera 2",
        AnimationOptions = {
            Prop = "prop_ing_camera_01",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0300,
                0.0520,
                -172.0487,
                -163.9389,
                -29.0221
            },
            EmoteLoop = false,
            EmoteMoving = true,
            PtfxAsset = "scr_bike_business",
            PtfxName = "scr_bike_cfid_camera_flash",
            PtfxPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["champagnespray"] = {
        "anim@mp_player_intupperspray_champagne",
        "idle_a",
        "Champagne Spray",
        AnimationOptions = {
            Prop = 'ba_prop_battle_champ_open',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteMoving = true,
            EmoteLoop = true,
            PtfxAsset = "scr_ba_club",
            PtfxName = "scr_ba_club_champagne_spray",
            PtfxPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['spraychamp'],
            PtfxWait = 500,
            PtfxCanHold = true,
        }
    },
    ["joint"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Joint",
        AnimationOptions = {
            Prop = 'p_cs_joint_02',
            PropBone = 47419,
            PropPlacement = {
                0.015,
                -0.009,
                0.003,
                55.0,
                0.0,
                110.0
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["cig"] = {
        "amb@world_human_smoking@male@male_a@enter",
        "enter",
        "Cig",
        AnimationOptions = {
            Prop = 'prop_amb_ciggy_01',
            PropBone = 47419,
            PropPlacement = {
                0.015,
                -0.009,
                0.003,
                55.0,
                0.0,
                110.0
            },
            EmoteMoving = true,
            EmoteDuration = 2600
        }
    },
    ["brief"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Briefcase",
        AnimationOptions = {
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {
                0.12,
                0.0,
                0.0,
                0.0,
                255.0,
                80.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["brief2"] = { -- Added for compatibility
        "missheistdocksprep1hold_cellphone",
        "static",
        "Briefcase 2",
        AnimationOptions =
        {
            Prop = "prop_ld_case_01",
            PropBone = 57005,
            PropPlacement = {
                0.10,
                0.0,
                0.0,
                0.0,
                280.0,
                53.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["guncase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Guncase",
        AnimationOptions =
        {
            Prop = "prop_gun_case_01",
            PropBone = 57005,
            PropPlacement = {
                0.10,
                0.02,
                -0.02,
                40.0,
                145.0,
                115.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tablet"] = {
        "amb@world_human_tourist_map@male@base",
        "base",
        "Tablet",
        AnimationOptions = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.03,
                0.0,
                20.0,
                -90.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tablet2"] = {
        "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        "idle_a",
        "Tablet 2",
        AnimationOptions = {
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {
                -0.05,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["phonecall"] = {
        "cellphone@",
        "cellphone_call_listen_base",
        "Phone Call",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["phonecall2"] = {
        "random@kidnap_girl",
        "ig_1_girl_on_phone_loop",
        "Phone Call 2",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["wt"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "Walkie Talkie",
        AnimationOptions = {
            Prop = "prop_cs_hand_radio",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["clean"] = {
        "timetable@floyd@clean_kitchen@base",
        "base",
        "Clean",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.01,
                90.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["clean2"] = {
        "amb@world_human_maid_clean@",
        "base",
        "Clean 2",
        AnimationOptions = {
            Prop = "prop_sponge_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.01,
                90.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["protest"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Protest",
        AnimationOptions = {
            Prop = "prop_cs_protest_sign_01",
            PropBone = 57005,
            PropPlacement = {
                0.1820,
                0.2400,
                0.0600,
                -69.3774235,
                5.9142048,
                -13.9572354
            },
            --
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["protest2"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Protest 2 - Pride ",
        AnimationOptions = {
            Prop = "pride_sign_01",
            PropBone = 57005,
            PropPlacement = {
                0.1820,
                0.2400,
                0.0600,
                -69.3774235,
                5.9142048,
                -13.9572354
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["binoculars"] = {
        "amb@world_human_binoculars@male@idle_b",
        "idle_f",
        "Binoculars",
        AnimationOptions = {
            Prop = "prop_binoc_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["binoculars2"] = {
        "amb@world_human_binoculars@male@idle_a",
        "idle_c",
        "Binoculars 2",
        AnimationOptions = {
            Prop = "prop_binoc_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tennisplay"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Tennis Play",
        AnimationOptions = {
            Prop = "prop_tennis_bag_01",
            PropBone = 57005,
            PropPlacement = {
                0.27,
                0.0,
                0.0,
                91.0,
                0.0,
                -82.9999951
            },
            SecondProp = 'prop_tennis_rack_01',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0800,
                0.0300,
                0.0,
                -130.2907295,
                3.8782324,
                6.588224
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["weights"] = {
        "amb@world_human_muscle_free_weights@male@barbell@base",
        "base",
        "Weights",
        AnimationOptions = {
            Prop = "prop_curl_bar_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["weights2"] = {
        "amb@world_human_muscle_free_weights@male@barbell@idle_a",
        "idle_d",
        "Weights 2",
        AnimationOptions = {
            Prop = "prop_curl_bar_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
     },
	 ["weights3"] = { -- Custom Emote By Frabi
        "frabi@malepose@solo@firstsport",
        "pose_sport_004",
        "Weights 3 - Pose",
        AnimationOptions = {
		Prop = 'prop_barbell_01',
            PropBone = 28422,
            PropPlacement = {
                0.0660,
				0.0100,
				-0.0300,
				90.0000,
				90.0000,
				-79.9999
            },
            EmoteLoop = true,
         }
    },
	 ["weights4"] = { -- Custom Emote By Frabi
        "frabi@malepose@solo@firstsport",
        "pose_sport_003",
        "Weights 4 - Pose",
        AnimationOptions = {
		Prop = 'prop_barbell_01', -- Left Wrist 
            PropBone = 60309,
            PropPlacement = {
                0.0520,
                -0.0010,
                0.0131,
                21.5428,
                70.2098,
				74.5019
            },
            SecondProp = 'prop_barbell_01', -- Right Wrist 
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0660,
				0.0100,
				-0.0300,
				90.0000,
				90.0000,
				-79.9999
            },
            EmoteLoop = true,
         }
    },
    ["fuel"] = {
        "weapons@misc@jerrycan@",
        "fire",
        "Fuel",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 57005,
            PropPlacement = {
                0.1800,
                0.1300,
                -0.2400,
                -165.8693883,
                -11.2122753,
                -32.9453021
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["fuel2"] = {
        "weapons@misc@jerrycan@franklin",
        "idle",
        "Fuel 2 (Carry)",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 28422,
            PropPlacement = {
                0.26,
                0.050,
                0.0300,
                80.00,
                180.000,
                79.99
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["hitchhike"] = {
        "random@hitch_lift",
        "idle_f",
        "Hitchhike",
        AnimationOptions = {
            Prop = "w_am_jerrycan",
            PropBone = 18905,
            PropPlacement = {
                0.32,
                -0.0100,
                0.0,
                -162.423,
                74.83,
                58.79
            },
            SecondProp = 'prop_michael_backpack',
            SecondPropBone = 40269,
            SecondPropPlacement = {
                -0.07,
                -0.21,
                -0.11,
                -144.93,
                117.358,
                -6.16
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Stop Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_01a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign2"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Yield Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_02a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign3"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Hospital Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_03d",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign4"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Parking Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_04a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign5"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Parking Sign 2 ",
        AnimationOptions = {
            Prop = "prop_sign_road_04w",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign6"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Pedestrian Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_05a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign7"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Street Sign ",
        AnimationOptions = {
            Prop = "prop_sign_road_05t",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign8"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Freeway Sign ",
        AnimationOptions = {
            Prop = "prop_sign_freewayentrance",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["ssign9"] = {
        "rcmnigel1d",
        "base_club_shoulder",
        "Steal Stop Sign Snow ",
        AnimationOptions = {
            Prop = "prop_snow_sign_road_01a",
            PropBone = 60309,
            PropPlacement = {
                -0.1390,
                -0.9870,
                0.4300,
                -67.3315314,
                145.0627869,
                -4.4318885
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["conehead"] = {
        "move_m@drunk@verydrunk_idles@",
        "fidget_07",
        "Cone Head ",
        AnimationOptions = {
            Prop = "prop_roadcone02b",
            PropBone = 31086,
            PropPlacement = {
                0.0500,
                0.0200,
                -0.000,
                30.0000004,
                90.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtraya"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_03",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayb"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray B",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayc"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray C",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayd"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray D",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtraye"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray E",
        AnimationOptions = {
            Prop = "prop_food_tray_03",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.0400,
                -0.1390,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayf"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray F",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500,
                0.1000,
                0.0700,
                -110.5483936,
                73.3529273,
                -16.338362
            },
            SecondProp = 'prop_food_bs_tray_03',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200,
                0.1300,
                -0.1000,
                -127.7725487,
                110.2074758,
                -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayg"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray G",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500,
                0.1000,
                0.0700,
                -110.5483936,
                73.3529273,
                -16.338362
            },
            SecondProp = 'prop_food_cb_tray_02',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200,
                0.1300,
                -0.1000,
                -127.7725487,
                110.2074758,
                -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayh"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray H",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500,
                0.1000,
                0.0700,
                -110.5483936,
                73.3529273,
                -16.338362
            },
            SecondProp = 'prop_food_tray_03',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200,
                0.1300,
                -0.1000,
                -127.7725487,
                110.2074758,
                -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayi"] = {
        "anim@heists@box_carry@",
        "idle",
        "Food Tray I",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 57005,
            PropPlacement = {
                0.2500,
                0.1000,
                0.0700,
                -110.5483936,
                73.3529273,
                -16.338362
            },
            SecondProp = 'prop_food_tray_02',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                0.2200,
                0.1300,
                -0.1000,
                -127.7725487,
                110.2074758,
                -3.5886263
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayj"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray J",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayk"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray K",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayl"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray L",
        AnimationOptions = {
            Prop = "prop_food_bs_tray_03",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtraym"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray M",
        AnimationOptions = {
            Prop = "prop_food_cb_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayn"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray N",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["foodtrayo"] = {
        "anim@move_f@waitress",
        "idle",
        "Food Tray O",
        AnimationOptions = {
            Prop = "prop_food_tray_02",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carrypizza"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Pizza Box",
        AnimationOptions = {
            Prop = "prop_pizza_box_02",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.1000,
                -0.1590,
                20.0000007,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Carry Food Bag",
        AnimationOptions = {
            Prop = "prop_food_bs_bag_01",
            PropBone = 57005,
            PropPlacement = {
                0.3300,
                0.0,
                -0.0300,
                0.0017365,
                -79.9999997,
                110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodbag2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Carry Food Bag 2",
        AnimationOptions = {
            Prop = "prop_food_cb_bag_01",
            PropBone = 57005,
            PropPlacement = {
                0.3800,
                0.0,
                -0.0300,
                0.0017365,
                -79.9999997,
                110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["carryfoodbag3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Carry Food Bag 3",
        AnimationOptions = {
            Prop = "prop_food_bag1",
            PropBone = 57005,
            PropPlacement = {
                0.3800,
                0.0,
                -0.0300,
                0.0017365,
                -79.9999997,
                110.0651988
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "shake_can_male",
        "Tagging Shake Can Male",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag2"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "shake_can_female",
        "Tagging Shake Can Female",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag3"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "spray_can_var_01_male",
        "Tagging Male 1",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag4"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@male@",
        "spray_can_var_02_male",
        "Tagging Male 2",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag5"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "spray_can_var_01_female",
        "Tagging Female 1",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["tag6"] = {
        "anim@scripted@freemode@postertag@graffiti_spray@heeled@",
        "spray_can_var_02_female",
        "Tagging Female 2",
        AnimationOptions = {
            Prop = "prop_cs_spray_can",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0700,
                0.0017365,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beans"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        "base_idle",
        "Beans",
        AnimationOptions = {
            Prop = "h4_prop_h4_caviar_tin_01a",
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0300,
                0.0100,
                0.0,
                0.0,
                0.0
            },
            SecondProp = 'h4_prop_h4_caviar_spoon_01a',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["newscam"] = {
        "missfinale_c2mcs_1",
        "fin_c2_mcs_1_camman",
        "News Camera",
        AnimationOptions = {
            Prop = "prop_v_cam_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0300,
                0.0100,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["newsmic"] = {
        "anim@heists@humane_labs@finale@keycards",
        "ped_a_enter_loop",
        "News Microphone",
        AnimationOptions = {
            Prop = "p_ing_microphonel_01",
            PropBone = 4154,
            PropPlacement = {
                -0.00,
                -0.0200,
                0.1100,
                0.00,
                0.0,
                60.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["newsbmic"] = {
        "missfra1",
        "mcs2_crew_idle_m_boom",
        "News Boom Microphone",
        AnimationOptions = {
            Prop = "prop_v_bmike_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["leafblower"] = {
        "amb@world_human_gardener_leaf_blower@base",
        "base",
        "Leaf Blower",
        AnimationOptions = {
            Prop = "prop_leaf_blower_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_armenian3",
            PtfxName = "ent_anim_leaf_blower",
            PtfxPlacement = {
                1.0,
                0.0,
                -0.25,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['useleafblower'],
            PtfxWait = 2000,
            PtfxCanHold = true,
        }
    },
    ["bbqf"] = {
        "amb@prop_human_bbq@male@idle_a",
        "idle_b",
        "BBQ (Female)",
        AnimationOptions = {
            Prop = "prop_fish_slice_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["pump"] = {
        "missfbi4prepp1",
        "idle",
        "Pumpkin",
        AnimationOptions = {
            Prop = "prop_veg_crop_03_pump",
            PropBone = 28422,
            PropPlacement = {
                0.0200,
                0.0600,
                -0.1200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["pump2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pumpkin 2",
        AnimationOptions = {
            Prop = "prop_veg_crop_03_pump",
            PropBone = 28422,
            PropPlacement = {
                0.0100,
                -0.16000,
                -0.2100,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },

    ["mop"] = {
        "missfbi4prepp1",
        "idle",
        "Mop",
        AnimationOptions = {
            Prop = "prop_cs_mop_s",
            PropBone = 28422,
            PropPlacement = {
                -0.0200,
                -0.0600,
                -0.2000,
                -13.377,
                10.3568,
                17.9681
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["mop2"] = {
        "move_mop",
        "idle_scrub_small_player",
        "Mop 2",
        AnimationOptions = {
            Prop = "prop_cs_mop_s",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.1200,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["jerkf"] = {
        "switch@trevor@jerking_off",
        "trev_jerking_off_loop",
        "JerkOff! Female",
        AnimationOptions = {
            Prop = 'prop_cs_dildo_01',
            PropBone = 28422,
            PropPlacement = {
                0.09,
                0.05,
                -0.03,
                90.0,
                80.0,
                30.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        },
        AdultAnimation = true
    },
    ["rake"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Rake",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["rake2"] = {
        "anim@amb@drug_field_workers@rake@male_a@idles",
        "idle_b",
        "Rake 2",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["rake3"] = {
        "anim@amb@drug_field_workers@rake@male_b@base",
        "base",
        "Rake 3",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["rake4"] = {
        "anim@amb@drug_field_workers@rake@male_b@idles",
        "idle_d",
        "Rake 4",
        AnimationOptions = {
            Prop = "prop_tool_rake",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["broom"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Broom",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.0400,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["broom2"] = {
        "anim@amb@drug_field_workers@rake@male_a@idles",
        "idle_b",
        "Broom 2",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.0400,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["broom3"] = {
        "anim@amb@drug_field_workers@rake@male_b@base",
        "base",
        "Broom 3",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.0400,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["broom4"] = {
        "anim@amb@drug_field_workers@rake@male_b@idles",
        "idle_d",
        "Broom 4",
        AnimationOptions = {
            Prop = "prop_tool_broom",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                0.0400,
                -0.0300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
        }
    },
    ["champw"] = {
        "anim@move_f@waitress",
        "idle",
        "Champagne Waiter",
        AnimationOptions = {
            Prop = "vw_prop_vw_tray_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0100,
                0.0,
                0.0,
                0.0
            },
            SecondProp = 'prop_champ_cool',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,
                0.0,
                0.010,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shit"] = {
        "missfbi3ig_0",
        "shit_loop_trev",
        "Shit",
        AnimationOptions = {
            Prop = "prop_toilet_roll_01",
            PropBone = 28422,
            PropPlacement = {
                0.0700,
                -0.02000,
                -0.2100,
                0,
                0,
                0.0,
                0.0
            },
            SecondProp = 'prop_big_shit_01',
            SecondPropBone = 0,
            SecondPropPlacement = {
                -0.0100,
                0.0600,
                -0.1550,
                101.3015175,
                7.3512213,
                -29.2665794
            },
            EmoteLoop = true,
            EmoteMoving = false,
        },
        AdultAnimation = true
    },
    ["selfie"] = {
        "anim@mp_player_intuppertake_selfie",
        "idle_a",
        "Selfie",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["selfie2"] = {
        "cellphone@self@franklin@",
        "peace",
        "Selfie 2",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["selfie3"] = {
        "cellphone@self@franklin@",
        "west_coast",
        "Selfie 3 - West Side",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["selfie4"] = {
        "cellphone@self@trevor@",
        "aggressive_finger",
        "Selfie 4 - Finger",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["selfie5"] = {
        "cellphone@self@trevor@",
        "proud_finger",
        "Selfie 5 - Finger 2",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["selfie6"] = {
        "cellphone@self@trevor@",
        "throat_slit",
        "Selfie 6 - Throat Slit",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["selfie7"] = {
        "cellphone@self@franklin@",
        "chest_bump",
        "Selfie 7 - Chest Bump",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["selfiepeace"] = { -- MissSnowie Custom Emote
        "mirror_selfie@peace_sign",
        "base",
        "Selfie Peace",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 57005,
            PropPlacement = {
                0.1700,
                0.0299,
                -0.0159,
                -126.2687,
                -139.9058,
                35.6203
            },
            EmoteLoop = true,
            EmoteMoving = true,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["selfiecrouch"] = { -- MissSnowie Custom Emote
        "crouching@taking_selfie",
        "base",
        "Selfie Crouching",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 18905,
            PropPlacement = {
                0.1580,
                0.0180,
                0.0300,
                -150.4798,
                -67.8240,
                -46.0417
            },
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["selfiecrouch2"] = { -- Wolf's Square Custom Emote
        "eagle@girlphonepose13",
        "girl",
        "Selfie Crouching 2",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 60309,
            PropPlacement = {
                0.0670,
                0.0300,
                0.0300,
                -90.0000,
                0.0000,
                -25.9000
            },
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["selfiecrouch3"] = { -- Custom Emote By Struggleville
        "anim@male_insta_selfie",
        "insta_selfie_clip",
        "Selfie Crouching 3",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 60309,
            PropPlacement = {
                0.0700,
                0.0100,
                0.0690,
                0.0,
                0.0,
                -150.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["selfiesit"] = { -- Emote by WhiskerValeMods
        "mouse@female_sitting_selfie",
        "female_sitting_selfie_clip",
        "Selfie Sitting",
        AnimationOptions = {
            Prop = 'prop_phone_ing',
            PropBone = 57005,
            PropPlacement = {
                0.1380,
                0.0300,
                -0.0430,
                -111.0946,
                -117.8069,
                11.7386
            },
            SecondProp = 'apa_mp_h_stn_chairarm_23',
            SecondPropBone = 0,
            SecondPropPlacement = {
                -0.0100,
                -0.0800,
                -0.6800,
                -180.0000,
                -180.0000,
                10.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["selfiefu"] = { -- Struggleville
        "anim@fuck_you_selfie",
        "fuck_you_selfie_clip",
        "Selfie Middle Finger",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.1200,
                0.0220,
                -0.0210,
                98.6822,
                -4.9809,
                109.6216
            },
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["selfiethot"] = { -- Struggleville
        "anim@sitting_thot",
        "sitting_thot_clip",
        "Selfie Thot Instagram",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.1030,
                0.0440,
                -0.0270,
                -160.2802,
                -99.4080,
                -3.4048
            },
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["selfiefloor"] = { -- Custom Emote By Struggleville
        "anim@selfie_floor_cute",
        "floor_cute_clip",
        "Selfie Floor Instagram",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 60309,
            PropPlacement = {
                0.0930,
                0.0230,
                0.0260,
                -158.8271,
                -82.9040,
                -18.7472
            },
            EmoteLoop = true,
            EmoteMoving = false,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["sittv"] = {
        "anim@heists@heist_safehouse_intro@variations@male@tv",
        "tv_part_one_loop",
        "Sit TV",
        AnimationOptions = {
            Prop = "v_res_tre_remote",
            PropBone = 57005,
            PropPlacement = {
                0.0990,
                0.0170,
                -0.0300,
                -64.760,
                -109.544,
                18.717
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sitchairf"] = { -- Emote by WhiskerValeMods
        "mouse@femalearmchair",
        "female_armchair_clip_01",
        "Sit Chair - Armchair",
        AnimationOptions = {
            Prop = "p_armchair_01_s",
            PropBone = 11816,
            PropPlacement = {
                0.5320,
                -0.3310,
                0.2000,
                -90.0000,
                -180.0000,
                -40.9999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sitchairf2"] = { -- Custom Emote by WhiskerValeMods
        "mouse@female_sitting_folded",
        "female_sitting_folded_clip",
        "Sit Chair - Arms Folded",
        AnimationOptions = {
            Prop = "ba_prop_battle_club_chair_03",
            PropBone = 0,
            PropPlacement = { 0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                -170.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sitchairf3"] = { -- Custom Emote by WhiskerValeMods
        "mouse@female_sitting_forward",
        "female_sitting_forward_clip",
        "Sit Chair - Leaning Forward",
        AnimationOptions = {
            Prop = "ba_prop_battle_club_chair_03",
            PropBone = 0,
            PropPlacement = { 0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                -170.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sitchairf4"] = { -- Custom Emote by WhiskerValeMods
        "mouse@female_smart_sitting",
        "female_smart_sitting_clip",
        "Sit Chair - Smart",
        AnimationOptions = {
            Prop = "ba_prop_battle_club_chair_03",
            PropBone = 0,
            PropPlacement = { 0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                -170.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sitchairf5"] = { -- Custom Emote By WhiskerValeMods
        "mouse@female_smart_sitting_crossed",
        "female_smart_sitting_crossed_clip",
        "Sit Chair - Legs Crossed",
        AnimationOptions = {
            Prop = "ba_prop_battle_club_chair_03",
            PropBone = 0,
            PropPlacement = { 0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                -170.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sitchairf6"] = { -- Custom Emote By WhiskerValeMods
        "mouse@female_sitting_laptop",
        "female_sitting_laptop_clip",
        "Sit Chair - Laptop",
        AnimationOptions = {
            Prop = 'ba_prop_club_laptop_dj_02',
            PropBone = 57005,
            PropPlacement = {
                0.0860,
                -0.1370,
                -0.1750,
                -79.9999,
                -90.0000,
                0.0000
            },
            SecondProp = 'ba_prop_battle_club_chair_02',
            SecondPropBone = 0,
            SecondPropPlacement = {
                -0.0400,
                -0.1900,
                0.0000,
                -180.0000,
                -180.0000,
                9.0999
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sitchairf7"] = { -- Custom Emote By Emote by WhiskerValeMods
        "mouse@female_sitting_tablet",
        "female_sitting_tablet_clip",
        "Sit Chair - Tablet",
        AnimationOptions = {
            Prop = 'hei_prop_dlc_tablet',
            PropBone = 28422,
            PropPlacement = {
                0.0870,
                0.1030,
                -0.1240,
                144.3540,
                157.8527,
                -4.6318
            },
            SecondProp = 'ba_prop_battle_club_chair_02',
            SecondPropBone = 0,
            SecondPropPlacement = {
                0.0100,
                -0.0800,
                0.0200,
                150.0000,
                -180.0000,
                10.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["sitchairf8"] = { -- Custom Emote By Emote by WhiskerValeMods
        "mouse@female_sitting_tablet",
        "female_sitting_tablet_clip",
        "Sit Chair - Book",
        AnimationOptions = {
            Prop = 'v_ilev_mp_bedsidebook',
            PropBone = 28422,
            PropPlacement = {
                0.1300,
                0.1100,
                -0.1200,
                120.3356,
                -15.9891,
                26.1497
            },
            SecondProp = 'ba_prop_battle_club_chair_02',
            SecondPropBone = 0,
            SecondPropPlacement = {
                0.0100,
                -0.0800,
                0.0200,
                150.0000,
                -180.0000,
                10.0000
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["dig"] = {
        "random@burial",
        "a_burial",
        "Dig",
        AnimationOptions = {
            Prop = "prop_tool_shovel",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.24,
                0,
                0,
                0.0,
                0.0
            },
            SecondProp = 'prop_ld_shovel_dirt',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,
                0.0,
                0.24,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bongos"] = {
        "amb@world_human_musician@bongos@male@base",
        "base",
        "Bongo Drums",
        AnimationOptions = {
            Prop = "prop_bongos_01",
            PropBone = 60309,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["medbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Medic Bag",
        AnimationOptions = {
            Prop = "xm_prop_x17_bag_med_01a",
            PropBone = 57005,
            PropPlacement = {
                0.3900,
                -0.0600,
                -0.0600,
                -100.00,
                -180.00,
                -78.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["dufbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Duffel Bag",
        AnimationOptions = {
            Prop = "bkr_prop_duffel_bag_01a",
            PropBone = 28422,
            PropPlacement = {
                0.2600,
                0.0400,
                0.00,
                90.00,
                0.00,
                -78.99
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shopbag"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Shopping Bag",
        AnimationOptions = {
            Prop = "vw_prop_casino_shopping_bag_01a",
            PropBone = 28422,
            PropPlacement = {
                0.24,
                0.03,
                -0.04,
                0.00,
                -90.00,
                10.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shopbag2"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Shopping Bag 2",
        AnimationOptions = {
            Prop = "prop_shopping_bags02",
            PropBone = 28422,
            PropPlacement = {
                0.05,
                0.02,
                0.00,
                178.80,
                91.19,
                9.97
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["shopbag3"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Shopping Bag 3",
        AnimationOptions = {
            Prop = "prop_cs_shopping_bag",
            PropBone = 28422,
            PropPlacement = {
                0.24,
                0.03,
                -0.04,
                0.00,
                -90.00,
                10.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["idcard"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 1",
        AnimationOptions = {
            Prop = "prop_franklin_dl",
            PropBone = 57005,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.000,
                170.000,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardb"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 2 - FIB",
        AnimationOptions = {
            Prop = "prop_fib_badge",
            PropBone = 28422,
            PropPlacement = {
                0.0600,
                0.0210,
                -0.0400,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardc"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 3",
        AnimationOptions = {
            Prop = "prop_michael_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardd"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 4",
        AnimationOptions = {
            Prop = "prop_trev_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcarde"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 5",
        AnimationOptions = {
            Prop = "p_ld_id_card_002",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardf"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 6",
        AnimationOptions = {
            Prop = "prop_cs_r_business_card",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardg"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 7",
        AnimationOptions = {
            Prop = "prop_michael_sec_id",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0200,
                -0.0300,
                -90.00,
                -180.00,
                78.999
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["idcardh"] = {
        "paper_1_rcm_alt1-8",
        "player_one_dual-8",
        "ID Card 8",
        AnimationOptions = {
            Prop = "prop_cop_badge",
            PropBone = 28422,
            PropPlacement = {
                0.0800,
                -0.0120,
                -0.0600,
                -90.00,
                180.00,
                69.99
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["phone"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "SMS",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["sms"] = {
        "cellphone@",
        "cellphone_text_read_base",
        "SMS",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["sms2"] = {
        "cellphone@female",
        "cellphone_text_read_base",
        "SMS 2",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                0.00,
                0.0301,
                0.000,
                00.00,
                00.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["sms3"] = {
        "cellphone@female",
        "cellphone_email_read_base",
        "SMS 3",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                -0.0190,
                -0.0240,
                0.0300,
                18.99,
                -72.07,
                6.39
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["sms4"] = {
        "cellphone@female",
        "cellphone_text_read_base_cover_low",
        "SMS 4",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                -0.0190,
                -0.0250,
                0.0400,
                19.17,
                -78.50,
                14.97
            },
            EmoteLoop = false,
            EmoteMoving = true,
            PtfxAsset = "scr_tn_meet",
            PtfxName = "scr_tn_meet_phone_camera_flash",
            PtfxPlacement = {
                -0.015,
                0.0,
                0.041,
                0.0,
                0.0,
                0.0,
                1.0
            },
            PtfxInfo = Config.Languages[Config.MenuLanguage]['camera'],
            PtfxWait = 200,
        }
    },
    ["sms5"] = {
        "amb@code_human_wander_texting_fat@male@base",
        "static",
        "SMS 6",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                -0.0200,
                -0.0100,
                0.00,
                2.309,
                88.845,
                29.979
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["tire"] = {
        "anim@heists@box_carry@",
        "idle",
        "Tire",
        AnimationOptions = {
            Prop = "prop_wheel_tyre",
            PropBone = 60309,
            PropPlacement = {
                -0.05,
                0.16,
                0.32,
                -130.0,
                -55.0,
                150.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["golfswing"] = {
        "rcmnigel1d",
        "swing_a_mark",
        "Golf Swing",
        AnimationOptions = {
            EmoteLoop = true,
            Prop = "prop_golf_wood_01",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
        }
    },
    ["register"] = {
        "anim@heists@box_carry@",
        "idle",
        "Register",
        AnimationOptions = {
            Prop = "v_ret_gc_cashreg",
            PropBone = 60309,
            PropPlacement = {
                0.138,
                0.2,
                0.2,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["weedbrick"] = {
        "impexp_int-0",
        "mp_m_waremech_01_dual-0",
        "Weed Brick",
        AnimationOptions = {
            Prop = "prop_weed_block_01",
            PropBone = 60309,
            PropPlacement = {
                0.1,
                0.1,
                0.05,
                0.0,
                -90.0,
                90.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["weedbrick2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Weed Brick BIG",
        AnimationOptions = {
            Prop = "bkr_prop_weed_bigbag_01a",
            PropBone = 60309,
            PropPlacement = {
                0.158,
                -0.05,
                0.23,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["potplant"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pot Plant (Small)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_01_small_01c",
            PropBone = 60309,
            PropPlacement = {
                0.138,
                -0.05,
                0.23,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["potplant2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pot Plant (Medium)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_01_small_01b",
            PropBone = 60309,
            PropPlacement = {
                0.138,
                -0.05,
                0.23,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["potplant3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Pot Plant (Large)",
        AnimationOptions = {
            Prop = "bkr_prop_weed_lrg_01b",
            PropBone = 60309,
            PropPlacement = {
                0.138,
                -0.05,
                0.23,
                -50.0,
                290.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["weedbucket"] = {
        "anim@heists@box_carry@",
        "idle",
        "Weed Bucket",
        AnimationOptions = {
            Prop = "bkr_prop_weed_bucket_open_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.1000,
                -0.1800,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["lawnchair"] = {
        "timetable@ron@ig_5_p3",
        "ig_5_p3_base",
        "Lawnchair",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {
                0.025,
                -0.2,
                -0.1,
                45.0,
                -5.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["lawnchair2"] = {
        "timetable@reunited@ig_10",
        "base_amanda",
        "Lawnchair 2",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {
                0.025,
                -0.15,
                -0.1,
                45.0,
                5.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["lawnchair3"] = {
        "timetable@ron@ig_3_couch",
        "base",
        "Lawnchair 3",
        AnimationOptions = {
            Prop = "prop_skid_chair_02",
            PropBone = 0,
            PropPlacement = {
                -0.05,
                0.0,
                -0.2,
                5.0,
                0.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["rose2"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Rose 2 (Male)",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 31086,
            PropPlacement = {
                -0.0140,
                0.1030,
                0.0620,
                -2.932,
                4.564,
                39.910
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["rose3"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Rose 3 (Female)",
        AnimationOptions = {
            Prop = "prop_single_rose",
            PropBone = 31086,
            PropPlacement = {
                -0.0140,
                0.1070,
                0.0720,
                0.00,
                0.00,
                2.99
            },
            EmoteLoop = false,
            EmoteMoving = true,
        }
    },
    ["cbbox"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box",
        AnimationOptions = {
            Prop = "v_ret_ml_beerben1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cbbox2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 2",
        AnimationOptions = {
            Prop = "v_ret_ml_beerbla1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cbbox3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 3",
        AnimationOptions = {
            Prop = "v_ret_ml_beerjak1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cbbox4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 4",
        AnimationOptions = {
            Prop = "v_ret_ml_beerlog1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cbbox5"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 5",
        AnimationOptions = {
            Prop = "v_ret_ml_beerpis1",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cbbox6"] = {
        "anim@heists@box_carry@",
        "idle",
        "Carry Beer Box 6",
        AnimationOptions = {
            Prop = "prop_beer_box_01",
            PropBone = 28422,
            PropPlacement = {
                0.0200,
                -0.0600,
                -0.1200,
                -180.00,
                -180.00,
                1.99
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gbin"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin",
        AnimationOptions = {
            Prop = "prop_bin_08open",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -1,0290
                -10.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gbin2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin 2",
        AnimationOptions = {
            Prop = "prop_cs_bin_01",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gbin3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin 3",
        AnimationOptions = {
            Prop = "prop_cs_bin_03",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gbin4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin 4",
        AnimationOptions = {
            Prop = "prop_bin_08a",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gbin5"] = {
        "anim@heists@box_carry@",
        "idle",
        "Garbage Bin 5",
        AnimationOptions = {
            Prop = "prop_bin_07d",
            PropBone = 28422,
            PropPlacement = {
                -0.0100,
                -0.2200,
                -0.8600,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau - Bronx',
        AnimationOptions = {
            Prop = 'prideflag1',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag2'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau - Californie',
        AnimationOptions = {
            Prop = 'prideflag2',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag3'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau - Dominicain',
        AnimationOptions = {
            Prop = 'prideflag3',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag4'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau - Jamaicain',
        AnimationOptions = {
            Prop = 'prideflag4',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag5'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau - Los Angeles',
        AnimationOptions = {
            Prop = 'prideflag5',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag6'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau - NYC',
        AnimationOptions = {
            Prop = 'prideflag6',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag7'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Drapeau - Porto-Ricain',
        AnimationOptions = {
            Prop = 'prideflag7',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag8'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Pride Flag 8 - Asexual ',
        AnimationOptions = {
            Prop = 'prideflag8',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['pflag9'] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Pride Flag 9 - Straight Ally ',
        AnimationOptions = {
            Prop = 'prideflag9',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['old'] = {
        'missbigscore2aleadinout@bs_2a_2b_int',
        'lester_base_idle',
        'Old Man Walking Stick',
        AnimationOptions = {
            Prop = 'prop_cs_walking_stick',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            SecondProp = 'prop_phone_ing',
            SecondPropBone = 60309,
            SecondPropPlacement = {
                0.0800,
                0.0300,
                0.0100,
                -107.9999,
                0.0,
                -4.6003
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['digiscan'] = {
        'weapons@misc@digi_scanner',
        'aim_med_loop',
        'Digiscan 1 ',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {
                0.0480,
                0.0780,
                0.0040,
                -81.6893,
                2.5616,
                -15.7909
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['digiscan2'] = {
        'weapons@misc@digi_scanner',
        'aim_low_loop',
        'Digiscan 2 ',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {
                0.0480,
                0.0780,
                0.0040,
                -81.6893,
                2.5616,
                -15.7909
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ['digiscan3'] = {
        'weapons@misc@digi_scanner',
        'aim_high_loop',
        'Digiscan 3 ',
        AnimationOptions = {
            Prop = 'w_am_digiscanner',
            PropBone = 28422,
            PropPlacement = {
                0.0480,
                0.0780,
                0.0040,
                -81.6893,
                2.5616,
                -15.7909
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cop4"] = {
        "amb@world_human_car_park_attendant@male@base",
        "base",
        "Cop 4",
        AnimationOptions = {
            Prop = "prop_parking_wand_01",
            PropBone = 57005,
            PropPlacement = {
                0.12,
                0.05,
                0.0,
                80.0,
                -20.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["copbeacon"] = { -- Added for compatibility
        "amb@world_human_car_park_attendant@male@base",
        "base",
        "Cop Beacon",
        AnimationOptions = {
            Prop = "prop_parking_wand_01",
            PropBone = 57005,
            PropPlacement = {
                0.12,
                0.05,
                0.0,
                80.0,
                -20.0,
                180.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["leanphone"] = {
        "amb@world_human_leaning@male@wall@back@mobile@base",
        "base",
        "Leaning With Phone",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true,
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
        }
    },
    ["hump2"] = {
        "timetable@trevor@skull_loving_bear",
        "skull_loving_bear",
        "Hump (Bear)",
        AnimationOptions = {
            Prop = 'prop_mr_raspberry_01',
            PropBone = 28422,
            PropPlacement = {
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0
            },
            EmoteMoving = false,
            EmoteLoop = true,
        },
        AdultAnimation = true
    },
    ["eat"] = {
        "mp_player_inteat@burger",
        "mp_player_int_eat_burger",
        "Eat",
        AnimationOptions = {
            Prop = 'prop_cs_burger_01',
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.05,
                0.02,
                -50.0,
                16.0,
                60.0
            },
            EmoteMoving = true,
        }
    },
    ["drink"] = {
        "mp_player_intdrink",
        "loop_bottle",
        "Drink",
        AnimationOptions =
        {
            Prop = "prop_ld_flow_bottle",
            PropBone = 18905,
            PropPlacement = {
                0.12,
                0.008,
                0.03,
                240.0,
                -60.0
            },
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },
    ["surfboard"] = { -- Emote by Molly
        "beachanims@molly",
        "beachanim_surf_clip",
        "Surf Board",
        AnimationOptions =
        {
            Prop = "prop_surf_board_01",
            PropBone = 28252,
            PropPlacement = {
                0.1020,
                -0.1460,
                -0.1160,
                -85.5416,
                176.1446,
                -2.1500
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["stealtv"] = { -- Emote by Molly
        "beachanims@molly",
        "beachanim_surf_clip",
        "Steal TV",
        AnimationOptions =
        {
            Prop = "xs_prop_arena_screen_tv_01",
            PropBone = 28252,
            PropPlacement = {
                0.2600,
                0.1100,
                -0.1400,
                96.1620,
                168.9069,
                84.2402
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["beachring"] = { -- Emote by Molly
        "beachanims@free",
        "beachanim_clip",
        "Beach Floatie Thingy",
        AnimationOptions = {

            Prop = "prop_beach_ring_01",
            PropBone = 0,
            PropPlacement = {
                0.0,
                0.0,
                0.0100,
                -12.0,
                0.0,
                -2.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cashcase"] = {
        "move_weapon@jerrycan@generic",
        "idle",
        "Cash Briefcase",
        AnimationOptions = {
            Prop = "bkr_prop_biker_case_shut",
            PropBone = 28422,
            PropPlacement = {
                0.1000,
                0.0100,
                0.0040,
                0.0,
                0.0,
                -90.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cashcase2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Cash Briefcase 2",
        AnimationOptions = {
            Prop = "prop_cash_case_01",
            PropBone = 28422,
            PropPlacement = {
                -0.0050,
                -0.1870,
                -0.1400,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cashcase3"] = {
        "anim@heists@box_carry@",
        "idle",
        "Cash Briefcase 3",
        AnimationOptions = {
            Prop = "prop_cash_case_02",
            PropBone = 28422,
            PropPlacement = {
                0.0050,
                -0.1170,
                -0.1400,
                14.000,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cashcase4"] = {
        "anim@heists@box_carry@",
        "idle",
        "Cash Briefcase 4 - Diamonds",
        AnimationOptions = {
            Prop = "ch_prop_ch_security_case_01a",
            PropBone = 28422,
            PropPlacement = {
                0.0,
                -0.0900,
                -0.1800,
                14.4000,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["airportbag"] = {
        "anim@heists@narcotics@trash",
        "idle",
        "Airport Bag",
        AnimationOptions = {
            Prop = "prop_suitcase_01c",
            PropBone = 28422,
            PropPlacement = {
                0.1100,
                -0.2100,
                -0.4300,
                -11.8999,
                0.0,
                30.0000
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["megaphone"] = { -- Custom Emote By MollyEmotes
        "molly@megaphone",
        "megaphone_clip",
        "Megaphone",
        AnimationOptions = {
            Prop = "prop_megaphone_01",
            PropBone = 28422,
            PropPlacement = {
                0.0500,
                0.0540,
                -0.0060,
                -71.8855,
                -13.0889,
                -16.0242
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["megaphone2"] = { -- Custom Emote By MollyEmotes
        "molly@megaphone2",
        "megaphone_clip",
        "Megaphone 2",
        AnimationOptions = {
            Prop = "prop_megaphone_01",
            PropBone = 28422,
            PropPlacement = {
                0.0500,
                0.0540,
                -0.0060,
                -71.8855,
                -13.0889,
                -16.0242
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["bball"] = { -- Custom Emote By Struggleville
        "anim@male_bskball_hold",
        "bskball_hold_clip",
        "Basketball Hold",
        AnimationOptions = {
            Prop = "prop_bskball_01",
            PropBone = 28422,
            PropPlacement = {
                0.0600,
                0.0400,
                -0.1200,
                0.0,
                0.0,
                40.00
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["bball2"] = { -- Custom Emote By Struggleville
        "anim@male_bskball_photo_pose",
        "photo_pose_clip",
        "Basketball Pose",
        AnimationOptions = {
            Prop = "prop_bskball_01",
            PropBone = 60309,
            PropPlacement = {
                -0.0100,
                0.0200,
                0.1300,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
     },
    ["watchstripper2"] = {
        "amb@world_human_strip_watch_stand@male_c@base",
        "base",
        "Watch Stripper 2",
        AnimationOptions = {
            Prop = "prop_beer_am",
            PropBone = 60309,
            PropPlacement = {
                0.0880,
                -0.1360,
                0.1450,
                -102.9624,
                81.7098,
                -39.2734
            },
            EmoteLoop = true,
            EmoteMoving = true,
        },
        AdultAnimation = true
    },
    ["babe1"] = {
        "anim@heists@box_carry@",
        "idle",
        "Baby Seat 1",
        AnimationOptions = {
            Prop = "prop_busbebek_dark_01",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["babe2"] = {
        "anim@heists@box_carry@",
        "idle",
        "Baby Seat 2",
        AnimationOptions = {
            Prop = "prop_busbebek_light_01",
            PropBone = 28422,
            PropPlacement = {
                0.00,
                -0.420,
                -1.290,
                0.0,
                0.0,
                0.0
            },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
}

DP.White3ro = {

    ["zsturdy"] = {"div@woowalk@test", "sturdy2", "Get Sturdy 1", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zsturdy2"] = {"divined@drillb2@new", "sturdy", "Get Sturdy 2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zwalknstep"] = {"divined@drillb2@new", "walknstep", "Walk N Step", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zsturdy3"] = {"divined@drillb2@new", "sturdyground", "Get Sturdy 3", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zsturdy4"] = {"nito_sturdy18@animation", "nito_sturdy18_clip", "Get Sturdy 4", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zsturdy5"] = {"div@woowalk@test", "woowalk", "Get Sturdy 5 ~b~Woo Walk", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zsturdy6"] = {"div@woowalk@test", "blixkytwirl2", "Get Sturdy 6 ~b~Blixky Twirl", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zsturdy7"] = {"divined@drpackv3@new", "kaisturdy", "Get Sturdy 7", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy8"] = {"adxttisturdy@animation", "adxttisturdy_clip", "Get Sturdy 8 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy9"] = {"adxttisturdy2@animation", "adxttisturdy2_clip", "Get Sturdy 9 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy91"] = {"adxttisturdy3@animation", "adxttisturdy3_clip", "Get Sturdy 10 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy92"] = {"adxttisturdy4@animation", "adxttisturdy4_clip", "Get Sturdy 11 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy93"] = {"adxttisturdy5@animation", "adxttisturdy5_clip", "Get Sturdy 12 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy94"] = {"adxttisturdy6@animation", "adxttisturdy6_clip", "Get Sturdy 13 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy95"] = {"nito_sturdy_dance1@animation", "nito_sturdy_dance1_clip", "Get Sturdy 14 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy96"] = {"nito_sturdy20@animation", "nito_sturdy20_clip", "Get Sturdy 15 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy97"] = {"nito_sturdy5@animation", "nito_sturdy5_clip", "Get Sturdy 16 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy98"] = {"nito_sturdy2_freethehometeam@animation", "nito_sturdy2_freethehometeam_clip", "Get Sturdy 17 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy99"] = {"nito_sturdy7@animation", "nito_sturdy7_clip", "Get Sturdy 18 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy991"] = {"nito_sturdy8@animation", "nito_sturdy8_clip", "Get Sturdy 19 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy992"] = {"nito_sturdy11@animation", "nito_sturdy11_clip", "Get Sturdy 20 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy993"] = {"nito_sturdy3_freethehometeam@animation", "nito_sturdy3_freethehometeam_clip", "Get Sturdy 21 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy994"] = {"nito_sturdy_mightyz@animation", "nito_sturdy_mightyz_clip", "Get Sturdy 22 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy995"] = {"nito_sturdy1@animation", "nito_sturdy1_clip", "Get Sturdy 23 ~r~ New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zsturdy996"] = {"divined@drpack@new", "cripwalk3", "Get Sturdy 24 (Crip Walk) ~r~ New", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zsturdy997"] = {"divined@drpack@new", "bloodwalk", "Get Sturdy 25 (Blood Walk) ~r~ New", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zsturdy998"] = {"divined@drpack@new", "woowalkinx", "Get Sturdy 26 (Woo Walk) ~r~ New", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["ztoomanyglockies"] = {"divined@drillb2@new", "toomanyglockies", "Too Many Glockies", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zhitemwithdat"] = {"divined@drillb2@new", "hitemwithdat", "Hit 'Em With Dat", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zslutmeout"] = {"divined@drillb2@new", "slutmeout", "Slut Me Out", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["ztoosieslide"] = {"divined@drillb2@new", "toosieslide", "Toosie Slide", AnimationOptions =
    {
        EmoteLoop = true
    }},
   ["cripwalk2"] = {"div@woowalk@test", "cripwalk2", "Crip Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["bloodwalk2"] = {"div@woowalk@test", "bloodwalk2", "Blood Walk", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["femaledance1"] = {"femaledancesbygoldiemods30@animation", "femaledancesbygoldiemods30_clip", "Female Dances ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance2"] = {"femaledancesbygoldiemods31@animation", "femaledancesbygoldiemods31_clip", "Female Dances 2 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance3"] = {"femaledancesbygoldiemods39@animation", "femaledancesbygoldiemods39_clip", "Female Dances 3 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance4"] = {"femaledancesbygoldiemods49@animation", "femaledancesbygoldiemods49_clip", "Female Dances 4 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance5"] = {"femaledancesbygoldiemods40@animation", "femaledancesbygoldiemods40_clip", "Female Dances 5 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance6"] = {"femaledancesbygoldiemods52@animation", "femaledancesbygoldiemods52_clip", "Female Dances 6 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance7"] = {"femaledancesbygoldiemods11@animation", "femaledancesbygoldiemods11_clip", "Female Dances 7 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance8"] = {"femaledancesbygoldiemods13@animation", "femaledancesbygoldiemods13_clip", "Female Dances 8 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance9"] = {"femaledancesbygoldiemods15@animation", "femaledancesbygoldiemods15_clip", "Female Dances 9 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance10"] = {"femaledancesbygoldiemods18@animation", "femaledancesbygoldiemods18_clip", "Female Dances 10 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance11"] = {"femaledancesbygoldiemods21@animation", "femaledancesbygoldiemods21_clip", "Female Dances 11 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance12"] = {"femaledancesbygoldiemods24@animation", "femaledancesbygoldiemods24_clip", "Female Dances 12 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance13"] = {"femaledancesbygoldiemods27@animation", "femaledancesbygoldiemods27_clip", "Female Dances 13 ~r~New", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign004"] = {"pose11@94glocky", "pose11_clip", "Pose 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign005"] = {"qpacc@nygang1", "nygang1_clip", "NY Gang 1 ~b~Crips", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign006"] = {"qpacc@nygang2", "nygang2_clip", "NY Gang 2 ~b~DOAK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign007"] = {"qpacc@nygang3", "nygang3_clip", "NY Gang 3 ~b~YGz", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign008"] = {"qpacc@nygang4", "nygang4_clip", "NY Gang 4 ~b~WOO", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign009"] = {"qpacc@nygang5", "nygang5_clip", "NY Gang 5 ~b~SexMoneyMurda", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign010"] = {"qpacc@nygang6", "nygang6_clip", "NY Gang 6 ~b~OGz", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign011"] = {"qpacc@nygang7", "nygang7_clip", "NY Gang 7 ~b~OYK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign012"] = {"qpacc@nygang8", "nygang8_clip", "NY Gang 8 ~b~MakkBallaFamily", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign013"] = {"qpacc@nygang9", "nygang9_clip", "NY Gang 9 ~b~NHC", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign014"] = {"qpacc@nygang10", "nygang10_clip", "NY Gang 10 ~b~MakkBalla & Fukk", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign015"] = {"qpacc@nygang11", "nygang11_clip", "NY Gang 11 ~b~DOAK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign016"] = {"qpacc@nygang12", "nygang12_clip", "NY Gang 12 ~b~4z", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign017"] = {"qpacc@nygang13", "nygang13_clip", "NY Gang 13 ~b~NHC", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign018"] = {"qpacc@nygang14", "nygang14_clip", "NY Gang 14 ~b~NHCK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign019"] = {"qpacc@nygang15", "nygang15_clip", "NY Gang 15 ~b~HoundK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign020"] = {"qpacc@nygang16", "nygang16_clip", "NY Gang 16 ~b~GDK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign021"] = {"qpacc@nygang17", "nygang17_clip", "NY Gang 17 ~b~WOOK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign022"] = {"qpacc@nygang18", "nygang18_clip", "NY Gang 18 ~b~B", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign023"] = {"qpacc@nygang19", "nygang19_clip", "NY Gang 19 ~b~OYK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign024"] = {"qpacc@nygang20", "nygang20_clip", "NY Gang 20 ~b~Slime ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign025"] = {"qpacc@nygang21", "nygang21_clip", "NY Gang 21 ~b~Hound", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign026"] = {"qpacc@nygang22", "nygang22_clip", "NY Gang 22", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign027"] = {"qpacc@nygang23", "nygang23_clip", "NY Gang 23 ~b~OYK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign028"] = {"qpacc@nygang24", "nygang24_clip", "NY Gang 24 ~b~GD", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign029"] = {"qpacc@nygang25", "nygang25_clip", "NY Gang 25 ~b~MakkBallaFamily", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign030"] = {"qpacc@nygang26", "nygang26_clip", "NY Gang 26 ~b~YGz", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign031"] = {"qpacc@nygang27", "nygang27_clip", "NY Gang 27 ~b~MakkBalla & Props", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign032"] = {"qpacc@nygang28", "nygang28_clip", "NY Gang 28", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign033"] = {"qpacc@nygang29", "nygang29_clip", "NY Gang 29 ~b~4z", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign034"] = {"qpacc@nygang30", "nygang30_clip", "NY Gang 30 ~b~5zK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign035"] = {"qpacc@nygang31", "nygang31_clip", "NY Gang 31 ~b~HoundK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign036"] = {"qpacc@nygang32", "nygang32_clip", "NY Gang 32", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign037"] = {"qpacc@nygang33", "nygang33_clip", "NY Gang 33 ~b~GDK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign038"] = {"qpacc@regularstance1", "regularstance1_clip", "Regular Stance 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign039"] = {"qpacc@regularstance2", "regularstance2_clip", "Regular Stance 2 ~b~Gun Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign040"] = {"qpacc@regularstance3", "regularstance3_clip", "Regular Stance 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign041"] = {"qpacc@regularstance4", "regularstance4_clip", "Regular Stance 4 ~b~Chuut!", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign042"] = {"qpacc@regularstance5", "regularstance5_clip", "Regular Stance 5 ~b~Gun Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign043"] = {"qpacc@regularstance6", "regularstance6_clip", "Regular Stance 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign045"] = {"qpacc@regularstance8", "regularstance8_clip", "Regular Stance 8 ~b~Crossarms", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign046"] = {"qpacc@regularstance9", "regularstance9_clip", "Regular Stance 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign047"] = {"qpacc@regularstance10", "regularstance10_clip", "Regular Stance 10 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign048"] = {"qpacc@regularstance11", "regularstance11_clip", "Regular Stance 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign049"] = {"qpacc@regularstance12", "regularstance12_clip", "Regular Stance 12 ~b~Watch", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign050"] = {"qpacc@regularstance13", "regularstance13_clip", "Regular Stance 13 ~b~Crossarms ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign051"] = {"qpacc@regularstance14", "regularstance14_clip", "Regular Stance 14", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign052"] = {"qpacc@regularstance15", "regularstance15_clip", "Regular Stance 15 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign053"] = {"qpacc@regularstance16", "regularstance16_clip", "Regular Stance 16", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign054"] = {"qpacc@regularstance17", "regularstance17_clip", "Regular Stance 17", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign055"] = {"qpacc@regularstance18", "regularstance18_clip", "Regular Stance 18", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign056"] = {"qpacc@regularstance19", "regularstance19_clip", "Regular Stance 19", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign057"] = {"qpacc@regularstance20", "regularstance20_clip", "Regular Stance 20", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign052"] = {"qpacc@regularstance21", "regularstance21_clip", "Regular Stance 21 ~b~WOO", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign053"] = {"qpacc@regularstance22", "regularstance22_clip", "Regular Stance 22", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign054"] = {"qpacc@regularstance23", "regularstance23_clip", "Regular Stance 23", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign055"] = {"qpacc@regularstance24", "regularstance24_clip", "Regular Stance 24 ~b~Double Fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign056"] = {"qpacc@regularstance25", "regularstance25_clip", "Regular Stance 25", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign057"] = {"qpacc@regularstance26", "regularstance26_clip", "Regular Stance 26", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign058"] = {"qpacc@regularstance27", "regularstance27_clip", "Regular Stance 27", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign059"] = {"qpacc@regularstance28", "regularstance28_clip", "Regular Stance 28", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign060"] = {"qpacc@regularstance29", "regularstance29_clip", "Regular Stance 29", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign061"] = {"qpacc@regularstance30", "regularstance30_clip", "Regular Stance 30 ~b~Double Fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign062"] = {"qpacc@regularstance31", "regularstance31_clip", "Regular Stance 31 ~b~Movin Crips", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign063"] = {"qpacc@regularstance32", "regularstance32_clip", "Regular Stance 32", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign064"] = {"qpacc@regularstance33", "regularstance33_clip", "Regular Stance 33 Money Pose", AnimationOptions =
   {
    Prop = 'bkr_prop_cutter_moneypage',
    PropBone = 64096,
    PropPlacement = {0.0900, 0.0160, -0.0300, 0.2461856, 0.7872477, 0.0023882 },
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign065"] = {"qpacc@regularstance34", "regularstance34_clip", "Regular Stance 34 ~b~Fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign066"] = {"qpacc@regularstance35", "regularstance35_clip", "Regular Stance 35", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign066"] = {"qpacc@regularstance36", "regularstance36_clip", "Regular Stance 36 ~b~Fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign067"] = {"qpacc@regularstance37", "regularstance37_clip", "Regular Stance 37 ~b~ Facepalm", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign069"] = {"qpacc@regularstance39", "regularstance39_clip", "Regular Stance 39", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign070"] = {"qpacc@regularstance40", "regularstance40_clip", "Regular Stance 40 ~b~Crips", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign071"] = {"qpacc@regularstance41", "regularstance41_clip", "Regular Stance 41", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign072"] = {"qpacc@regularstance42", "regularstance42_clip", "Regular Stance 42", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign073"] = {"qpacc@regularstance43", "regularstance43_clip", "Regular Stance 43", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign074"] = {"qpacc@regularstance44", "regularstance44_clip", "Regular Stance 44 ~b~Money Pose", AnimationOptions =
   {
    Prop = 'bkr_prop_money_unsorted_01',
    PropBone = 4090,
    PropPlacement = {0.0000, -0.0390, -0.0290, 2.2304, 58.3771, 31.8549},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign075"] = {"qpacc@regularstance45", "regularstance45_clip", "Regular Stance 45", AnimationOptions =
   {
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign076"] = {"qpacc@regularstance46", "regularstance46_clip", "Regular Stance 46", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign077"] = {"qpacc@regularstance47", "regularstance47_clip", "Regular Stance 47", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign078"] = {"qpacc@regularstance48", "regularstance48_clip", "Regular Stance 48 ~b~Money Pose", AnimationOptions =
   {
    Prop = 'bkr_prop_money_unsorted_01',
    PropBone = 64017,
    PropPlacement = {0.0110, -0.0450, -0.0040, 7.4405, -67.5842, -2.3618},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign079"] = {"qpacc@regularstance49", "regularstance49_clip", "Regular Stance 49", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign080"] = {"qpacc@regularstance50", "regularstance50_clip", "Regular Stance 50", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign081"] = {"qpacc@regularstance51", "regularstance51_clip", "Regular Stance 51", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign082"] = {"qpacc@regularstance52", "regularstance52_clip", "Regular Stance 52 ~b~Gun Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign083"] = {"qpacc@regularstance53", "regularstance53_clip", "Regular Stance 53", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign084"] = {"qpacc@regularstance54", "regularstance54_clip", "Regular Stance 54", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign085"] = {"qpacc@regularstance55", "regularstance55_clip", "Regular Stance 55 ~b~Smoke Pose", AnimationOptions =
   {
    Prop = 'prop_cs_ciggy_01',
    PropBone = 4090,
    PropPlacement = {0.0280, -0.0020, 0.0150, -7.0345092, 67.9037057, -17.6946468 },
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign086"] = {"qpacc@regularstance56", "regularstance56_clip", "Regular Stance 56 ~b~Double Fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign087"] = {"qpacc@regularstance57", "regularstance57_clip", "Regular Stance 57 ~b~ Phone Pose", AnimationOptions =
   {
    Prop = 'prop_amb_phone',
    PropBone = 26611,
    PropPlacement = {0.0450, -0.0280, 0.0010, -3.3698368, 30.0689668, 3.8289125 },
    SecondProp = 'v_res_fa_book01',
    SecondPropBone = 64017,
    SecondPropPlacement = {0.0350, -0.0320, 0.0040, 8.0000, 0.0000, 0.0000},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign089"] = {"qpacc@regularstance58", "regularstance58_clip", "Regular Stance 58 ~b~ Gun Pose & Cup", AnimationOptions =
   {
    Prop = 'prop_plastic_cup_02',
    PropBone = 4089,
    PropPlacement = {0.0410, -0.0120, -0.0150, -170.0000008, 0.00000, -30.000},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign090"] = {"qpacc@regularstance59", "regularstance59_clip", "Regular Stance 59", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign091"] = {"qpacc@regularstance60", "regularstance60_clip", "Regular Stance 60 ~b~Hound", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign092"] = {"qpacc@regularstance61", "regularstance61_clip", "Regular Stance 61", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign093"] = {"qpacc@regularstance62", "regularstance62_clip", "Regular Stance 62 ~b~Gun Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign084"] = {"qpacc@regularstance63", "regularstance63_clip", "Regular Stance 63", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign095"] = {"qpacc@regularstance64", "regularstance64_clip", "Regular Stance 64", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign096"] = {"qpacc@regularstance65", "regularstance65_clip", "Regular Stance 65", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign097"] = {"qpacc@regularstance66", "regularstance66_clip", "Regular Stance 66 ~b~Money Pose", AnimationOptions =
   {
       Prop = 'prop_anim_cash_note_b',
       PropBone = 4089,
       PropPlacement = {0.0480, 0.0580, -0.0150, -4.5620378, 8.0600729, -42.7619593},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign098"] = {"qpacc@regularstance67", "regularstance67_clip", "Regular Stance 67", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign099"] = {"qpacc@regularstance68", "regularstance68_clip", "Regular Stance 68 ~b~Money Pose", AnimationOptions =
   {
    Prop = 'bkr_prop_cutter_moneypage',
    PropBone = 64097,
    PropPlacement = {0.0100, 0.0150, -0.0260, 11.8467003, 96.6172508, 15.8535182},
    SecondProp = 'prop_cs_ciggy_01',
    SecondPropBone = 4090,
    SecondPropPlacement = {0.0720,-0.0390,-0.0270,0.0000,-100.0000,0.0000},
    EmoteLoop = true,
    EmoteMoving = false,
}},
   ["gsign0100"] = {"qpacc@regularstance69", "regularstance69_clip", "Regular Stance 69", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},

   ["gsign195"] = {"94glockymovin@animation", "movin_clip", "Gang Sign 195 ~b~Movin Crips", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign197"] = {"94glockychoowook@animation", "choowook_clip", "Gang Sign 197 ~b~CHOO/WOOK ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign198"] = {"94glockypocket@animation", "pocket_clip", "Gang Sign 198 ~b~Handspocket ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign199"] = {"94glockycrips3@animation", "crips3_clip", "Gang Sign 199 ~b~NLE Choppa", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign200"] = {"pose1@94glocky", "94glockypose1_clip", "Gang Sign 200 ~b~Slime Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign201"] = {"oyogzk@94glocky", "94glockyoyogzk_clip", "Gang Sign 201 ~b~OGzK ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign202"] = {"pose2@94glocky", "94glockypose2_clip", "Gang Sign 202 ~b~Simple Pose ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign203"] = {"94glockydoaogzk@animation", "doaogzk_clip", "Gang Sign 203 ~b~DOA OYK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign204"] = {"pose3@94glocky", "94glockypose3_clip", "Gang Sign 204 ~b~Pose KayKay", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign205"] = {"ygz@94glocky", "ygz_clip", "Gang Sign 205 ~b~YGz ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign206"] = {"pose4@94glocky", "94glockypose4_clip", "Gang Sign 206 ~b~Watch", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign207"] = {"handspocket3@94glocky", "handspocket3_clip", "Gang Sign 207 ~b~Handspocket", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign208"] = {"gunpose1@94glocky", "gunpose1_clip", "Gang Sign 208 ~b~Gun Pose 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign209"] = {"2fuck@94glocky", "2fuck_clip", "Gang Sign 209 ~b~Double Fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign210"] = {"pose8@94glocky", "94glockypose8_clip", "Gang Sign 210 ~b~Fuck & Smoke Props", AnimationOptions =
   {   
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64097,
        PropPlacement = {0.0130, 0.0120, -0.0080, 27.3209, -45.5643, 30.4325},
        EmoteLoop = true,
        EmoteMoving = false, 
   }},
   ["gsign211"] = {"wook@94glocky", "wook_clip", "Gang Sign 211 ~b~WOOK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign212"] = {"wook2@94glocky", "wook2_clip", "Gang Sign 212 ~b~WOOK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign213"] = {"pose9@94glocky", "94glockypose9_clip", "Gang Sign 213 ~b~Lean Cup Props", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 4170,
       PropPlacement = {0.0170,-0.0590,0.0100,0.0000,0.0000,0.0000},
       SecondProp = 'p_watch_04',
       SecondPropBone = 35502,
       SecondPropPlacement = {-0.1800,-0.0010,0.0300,0.0000,0.0000,0.0000},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign214"] = {"gd@94glocky", "gd_clip", "Gang Sign 214 ~b~Gangster Disciple", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign215"] = {"choocripsk@94glocky", "choocripsk_clip", "Gang Sign 215 ~b~CHOO/CK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign216"] = {"41@94glocky", "41_clip", "Gang Sign 216 ~b~41", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign217"] = {"ogzk@94glocky", "ogzk_clip", "Gang Sign 217 ~b~OYK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign218"] = {"gunpose2@94glocky", "gunpose2_clip", "Gang Sign 218 ~b~Gun Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign219"] = {"6wild@94glocky", "6wild_clip", "Gang Sign 219 ~b~6Wild", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign220"] = {"nottiboppin@94glocky", "nottiboppin_clip", "Gang Sign 220 ~b~Notti Boppin", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign221"] = {"pose10@94glocky", "pose10_clip", "Gang Sign 221 ~b~Fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign222"] = {"3ni@94glocky", "3ni_clip", "Gang Sign 222 ~b~3ni", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign223"] = {"3ni2@94glocky", "3ni2_clip", "Gang Sign 223 ~b~3ni", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign224"] = {"mbk@94glocky", "mbk_clip", "Gang Sign 224 ~b~MBFK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign225"] = {"3nik@94glocky", "3nik_clip", "Gang Sign 225 ~b~3ni K", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign226"] = {"movink@94glocky", "movink_clip", "Gang Sign 226 ~b~MovinK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign227"] = {"doak@94glocky", "doak_clip", "Gang Sign 227 ~b~DOAK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign228"] = {"ygzkdoa@94glocky", "ygzkdoa_clip", "Gang Sign 228 ~b~DOA/YGK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign230"] = {"doa@94glocky", "doa_clip", "Gang Sign 230 ~b~MBF/DOA", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign231"] = {"gunpose8kf@94glocky", "gunpose8kf_clip", "Gang Sign 231 ~b~Gun Pose KayKay", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign232"] = {"makkballa@94glocky@kenzoballa", "makkballakenzo_clip", "Gang Sign 232 ~b~MBF Kenzo Balla Props", AnimationOptions =
   {
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 64080,
        PropPlacement = {0.0330,0.0430,0.0400,-80.4744,-71.9308, 7.1861},
        EmoteLoop = true,
        EmoteMoving = false,
   }},
   ["gsign233"] = {"kflockpose@94glocky", "kflockpose_clip", "Gang Sign 233 ~b~KayKay Slime Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign234"] = {"gsc@94glocky", "gsc_clip", "Gang Sign 234 ~b~Grape", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign235"] = {"r30k@94glocky", "r30k_clip", "Gang Sign 235 ~b~R30K", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign236"] = {"gunpose9@94glocky", "gunpose9_clip", "Gang Sign 236 ~b~Gun Pose 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign237"] = {"crips@pose1@94glocky", "crips194glocky_clip", "Gang Sign 237 ~b~Pose C & Smoke", AnimationOptions =
   {    
       Prop = 'prop_cs_ciggy_01',
       PropBone = 4169,
       PropPlacement = {0.0410, -0.0320, 0.0010, 0.0000, -99.0, -11.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign238"] = {"nhck@94glocky", "nhck_clip", "Gang Sign 238 ~b~NHC K", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign239"] = {"ygz@1@94glocky", "ygz1_clip", "Gang Sign 239 ~b~YGz", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign240"] = {"gdk@1@94glocky", "gdk1_clip", "Gang Sign 240 ~b~GDK", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign242"] = {"lbic@1@94glocky", "lbic1_clip", "Gang Sign 242 ~b~InsaneBaby23 LB Crips", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign243"] = {"smm@1@94glocky", "smm1_clip", "Gang Sign 243 ~b~SMM", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign244"] = {"slime@kr@94glocky", "slimekylerich_clip", "Gang Sign 244 ~b~Slime Kyle Rich Pose", AnimationOptions =
   {
    Prop = 'prop_paper_box_05',
    PropBone = 4169,
    PropPlacement = {0.0980,0.0290,-0.0240,-163.6197,-153.2180,40.0483},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign245"] = {"pose@kr41@94glocky", "pose41kr_clip", "Gang Sign 245 ~b~Pose Kyle Rich", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign246"] = {"pose@kayflock1@94glocky", "posekf1_clip", "Gang Sign 246 ~b~KayKay Fuck", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign247"] = {"pose@drilly@94glocky", "posedrilly1_clip", "Gang Sign 247 ~b~Hound 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
      ["gsign248"] = {"smokecup@pose@94glocky", "smokecup1_clip", "Gang Sign 248 ~b~Smoke Cup", AnimationOptions =
      {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0450,0.0030,0.0000,61.9707,-67.7540,-1.0330},
        SecondProp = 'p_amb_coffeecup_01',
        SecondPropBone = 4185,
        SecondPropPlacement = {0.0220,-0.0600,0.0000,0.0000,0.0000,0.0000},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
   ["gsign249"] = {"slime@gunpose@94glocky", "slimegp1_clip", "Gang Sign 249 ~b~Slime Gun Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign250"] = {"ok@2@94glocky", "ok2_clip", "Gang Sign ~b~O's K", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign251"] = {"gdk@2@94glocky", "gdk2_clip", "Gang Sign 251 ~b~GDK2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign252"] = {"posesmoke@1@94glocky", "posesmoke1_clip", "Gang Sign 252 ~b~Pose Smoke Duo", AnimationOptions =
   {    
       Prop = 'prop_cs_ciggy_01',
       PropBone = 64017,
       PropPlacement = {0.0370, -0.0090, 0.0000, 0.0000, 315.0, 0.0000},
       EmoteLoop = true,
       EmoteMoving = false,
       
   }},
   ["gsign253"] = {"smelly@1@94glocky", "smelly1_clip", "Gang Sign 253 ~b~Smelly 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign254"] = {"smelly@2@94glocky", "smelly2_clip", "Gang Sign 254 ~b~Movin 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign255"] = {"mitchel@1@94glocky", "mitchel1_clip", "Gang Sign 255 ~b~Mitchel", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign256"] = {"gunpose@rifle@94glocky", "gunposerifle_clip", "Gang Sign 256 ~b~Gun Pose & Rifle", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign257"] = {"ygzk@1@94glocky", "1ygzk_clip", "Gang Sign 257 ~b~YGK 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
      ["gsign258"] = {"6blockcity@1@94glocky", "6bc1_clip", "Gang Sign 258 ~b~6BC Harlem", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign259"] = {"6blockcity@2@94glocky", "26bc_clip", "Gang Sign 259 ~b~6BC OY Harlem", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign261"] = {"slime@94glocky@slime", "slimslim_clip", "Gang Sign 261 ~b~Slime", AnimationOptions = 
   {
       Prop = 'v_res_investbook01',
       PropBone = 4090,
       PropPlacement = {0.0540,-0.0090,0.0000,-27.9559,-20.4167,41.3180},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign262"] = {"props@pose@1@94glocky", "pp194_clip", "Gang Sign 262 ~b~Cyan Flag & Smoke Props", AnimationOptions =
   {
   Prop = 'vw_prop_casino_art_bottle_01a',
   PropBone = 58868,
   PropPlacement = {0.1400,0.2600,0.0400,0.0000,0.0000,0.0000},
   SecondProp = 'prop_cs_ciggy_01',
   SecondPropBone = 4090,
   SecondPropPlacement = {0.0350,-0.0120,0.0000,76.0858,101.2346,30.4004},
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsign2621"] = {"props@pose@1@94glocky", "pp194_clip", "Gang Sign 262 ~b~Red Flag & Smoke Props", AnimationOptions =
   {
   Prop = 'ex_office_swag_jewelwatch',
   PropBone = 58868,
   PropPlacement = {0.1400,0.2600,0.0400,0.0000,0.0000,0.0000},
   SecondProp = 'prop_cs_ciggy_01',
   SecondPropBone = 4090,
   SecondPropPlacement = {0.0350,-0.0120,0.0000,76.0858,101.2346,30.4004},
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsign2622"] = {"props@pose@1@94glocky", "pp194_clip", "Gang Sign 262 ~b~Blue Flag & Smoke Props", AnimationOptions =
   {
   Prop = 'ng_proc_sodacup_03c',
   PropBone = 58868,
   PropPlacement = {0.1400,0.2600,0.0400,0.0000,0.0000,0.0000},
   SecondProp = 'prop_cs_ciggy_01',
   SecondPropBone = 4090,
   SecondPropPlacement = {0.0350,-0.0120,0.0000,76.0858,101.2346,30.4004},
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsign263"] = {"pose@smokecup@94glocky", "posesmokecup_clip", "Gang Sign 263 ~b~Smoke Cup 2 Props ", AnimationOptions =
   {    
    Prop = 'prop_energy_drink',
    PropBone = 4186,
    PropPlacement = {0.0210,-0.0510,0.0790,0.0000,0.0000,0.0000},
    SecondProp = 'prop_cs_ciggy_01',
    SecondPropBone = 64017,
    SecondPropPlacement = {0.0360,-0.0120,0.0090,32.7324,-57.2675,24.4044},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign264"] = {"props@blunt@1@94glocky", "pb194_clip", "Gang Sign 264 ~b~Smoke Blunt Props (Move)", AnimationOptions =
   {    
       Prop = 'prop_cs_ciggy_01',
       PropBone = 64017,
       PropPlacement = {0.0310,-0.0100,0.0200,0.0000,-100.0000, 0.0000},
       SecondProp = 'p_cs_lighter_01',
       SecondPropBone = 4186,
       SecondPropPlacement = {0.0300,-0.0170,0.0190,168.3079,164.6601, 48.9735391 },
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign2641"] = {"props@blunt@1@94glocky", "pb194_clip", "Gang Sign 264 ~b~Smoke Blunt Props (Fix)", AnimationOptions =
   {    
       Prop = 'prop_cs_ciggy_01',
       PropBone = 64017,
       PropPlacement = {0.0310,-0.0100,0.0200,0.0000,-100.0000, 0.0000},
       SecondProp = 'p_cs_lighter_01',
       SecondPropBone = 4186,
       SecondPropPlacement = {0.0300,-0.0170,0.0190,168.3079,164.6601, 48.9735391 },
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign265"] = {"pose@hands@94glocky", "posehands1_clip", "Gang Sign 265 ~b~Pose Simple", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign266"] = {"oyk@tata@94glocky", "tataoyk_clip", "Gang Sign 266 ~b~Tata Pose OYK", AnimationOptions =
   {    
    Prop = 'bkr_prop_money_unsorted_01',
    PropBone = 58867,
    PropPlacement = {-0.0010,0.0570,-0.0010,-1.3643,-51.0451, -14.0412},
    SecondProp = 'bkr_prop_money_wrapped_01',
    SecondPropBone = 58867,
    SecondPropPlacement = {0.0260,0.0600,-0.0410,-0.7251,-51.0595,-14.8071},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign267"] = {"ygz@4sev@94glocky", "4sevygz_clip", "Gang Sign 267 ~b~YGz 4z", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign268"] = {"gunpose@blunt@94glocky", "gunposeblunt_clip", "Gang Sign 268 ~b~Gun Blunt Props", AnimationOptions =
   {  
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4090,
        PropPlacement = {0.0340, -0.0040, -0.0210, 180.0000, 90.0000, 40.0000},
        EmoteLoop = true,
        EmoteMoving = false,
   }},
    ["gsign269"] = {"th@94glocky", "th_94glocky_clip", "Gang Sign 269 ~b~Woo Lotti ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign270"] = {"mbk@2@94glocky", "mbk2_clip", "Gang Sign 270 ~b~MBF K ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign271"] = {"slatteryboyz@1@94glocky", "sb1_clip", "Gang Sign 271 ~b~Smelly 2 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign272"] = {"m8v3nok@94glocky", "m8v3ok_clip", "Gang Sign 272 ~b~Movin 2 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign273"] = {"slime@kf@94glocky", "slimekf_clip", "Gang Sign 273 ~b~Slime", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign274"] = {"twoshotz@94glocky", "twoshotz_clip", "Gang Sign 274 ~b~9ineowe 1 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign275"] = {"twoshotz@2@94glocky", "twoshotz2_clip", "Gang Sign 275 ~b~9ineowe 2 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign276"] = {"doak@2@94glocky", "doak2_clip", "Gang Sign 276 ~b~DOAK 2 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign277"] = {"oyk@2@94glocky", "oyk2_clip", "Gang Sign 277 ~b~OYK ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign278"] = {"smm@mbf@94glocky", "smm_mbf_clip", "Gang Sign 278 ~b~SMM MBF ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign279"] = {"gsb@1@94glocky", "gsb1_clip", "Gang Sign 279 ~b~Gorilla Stones Bloods ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign280"] = {"slime@kf2@from94", "slimekf2_clip", "Gang Sign 280 ~b~Slime KayKay ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign281"] = {"smmmbfk@from94", "smmmbfk_clip", "Gang Sign 281 ~b~MBF SMM K ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign282"] = {"slime@oyk@from94", "slimeoyk_clip", "Gang Sign 282 Slime OYK ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign283"] = {"gunpose@from94", "gunposefrom94_clip", "Gang Sign 283 ~b~Gun Pose 4 Props ", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 26611,
        PropPlacement = {0.0510, -0.0330, 0.0000, 0.0000, 0.0000, 0.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign284"] = {"o@from94", "ofrom94_clip", "Gang Sign 284 ~b~O's ", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign285"] = {"gunpose4@94glocky", "gunpose4_clip", "Gang Sign 285 ~b~Gun Pose 5 ", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign286"] = {"gunpose5@94glocky", "gunpose5_clip", "Gang Sign 286 ~b~Gun Pose 6 ", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign286"] = {"doa@makkballa@from94", "doamakkballa_clip", "Gang Sign 287 ~b~DOA 2 ", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign291"] = {"bigdoa@from94", "bigdoa_clip", "Gang Sign 291 ~b~DOA 3 ", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign293"] = {"oyk@from94", "oyk_clip", "Gang Sign 293 ~b~OYK 2 ", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign296"] = {"ygz@from94", "ygzfrom94_clip", "Gang Sign 296 ~b~YGz ", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign299"] = {"gunpose@slime@from94", "gunposeslime_clip", "Gang Sign 299 ~b~Gun Pose & Slime 2 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign300"] = {"gunpose@4@from94", "gunpose4_clip", "Gang Sign 300 ~b~Gun Pose 8 ", AnimationOptions =
   {
    Prop = 'prop_amb_phone',
    PropBone = 26611,
    PropPlacement = {0.0500, -0.0520, -0.0100, -20.0000, 0.0000, -30.0000},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign301"] = {"dthanggz@from94", "dthanggz_clip", "Gang Sign 301 ~b~Dthang Gz ", AnimationOptions =
   {
    Prop = 'prop_amb_phone',
    PropBone = 26612,
    PropPlacement = {0.0520, -0.0360, -0.0060, -19.9999, 0.0000, -11.9999},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign302"] = {"chook2@from94", "chook2_clip", "Gang Sign 302 ~b~Hound K ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign303"] = {"movin@from94", "movinfrom94_clip", "Gang Sign 303 ~b~Movin 3 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign305"] = {"4sevkygzk@from94", "4sevkygzk_clip", "Gang Sign 304 ~b~4zK YGK ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign306"] = {"smelly@3@from94", "smelly3_clip", "Gang Sign 305 ~b~Smelly 3 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign307"] = {"nhc@from94", "nhcfrom94_clip", "Gang Sign 306 ~b~NHC ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign308"] = {"gunclip@from94", "gunclip94_clip", "Gang Sign 307 ~b~Gun Pose 9 ", AnimationOptions =
   {    
    Prop = 'w_pi_appistol',
    PropBone = 64097,
    PropPlacement = {0.0100, 0.0280, -0.0200, 3.6164416, 10.6275841, -19.6834981},
    SecondProp = 'w_pi_appistol_mag2',
    SecondPropBone = 64096,
    SecondPropPlacement = {-0.0300, 0.0400, -0.0020, 4.9728141, -7.2560318, 15.5126862 },
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign309"] = {"pillspose@from94", "pillspose_clip", "Gang Sign 308 ~b~Pills Pose Props ", AnimationOptions =
   {    
    Prop = 'ba_prop_club_water_bottle',
    PropBone = 4170,
    PropPlacement = {0.0176, -0.0400, -0.0080, -180.0000, -180.0000, 10.0000},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign310"] = {"backpack@from94", "backpack_clip", "Gang Sign 309 ~b~BackPack Pose Props ", AnimationOptions =
   {    
    Prop = 'vw_prop_vw_backpack_01a',
    PropBone = 58868,
    PropPlacement = {0.4900,0.2100,-0.1700,18.8817,-71.1182, 6.7177},
    SecondProp = 'prop_coffee_cup_trailer',
    SecondPropBone = 26612,
    SecondPropPlacement = {0.2030,-0.0500,-0.1000,-1.1160,-61.5482,22.2421},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign311"] = {"cuppose@from94", "cuppose_clip", "Gang Sign 310 ~b~Cup Pose Props ", AnimationOptions =
   {    
    Prop = 'p_watch_06',
    PropBone = 64097,
    PropPlacement = {0.0390, 0.0550, 0.0250, 6.4836, -1.1054, 25.8912},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign312"] = {"settybpose@from94", "settybpose_clip", "Gang Sign 311 ~b~Smoke Bottle Props ", AnimationOptions =
   { 
   Prop = 'prop_cs_ciggy_01',
   PropBone = 64064,
   PropPlacement = {0.0051,-0.0380,0.0481,0.0000,0.0000, 0.0000},
   SecondProp = 'prop_energy_drink',
   SecondPropBone = 58867,
   SecondPropPlacement = {-0.0080,0.0570,-0.0210,17.4952,28.4812,9.8465},
   EmoteLoop = true,
   EmoteMoving = false,
  }},
  ["gsign313"] = {"doa@k@from94", "doakk_clip", "Gang Sign 312 ~b~DOAK 3 ", AnimationOptions =
  { 
  EmoteLoop = true,
  EmoteMoving = false,
  }},
  ["gsign314"] = {"gunpose@5@from94", "gunpose5_clip", "Gang Sign 313 ~b~Gun Pose 10 Props ", AnimationOptions =
  {    
    Prop = 'w_pi_appistol',
    PropBone = 64096,
    PropPlacement = {0.0321, 0.0100, 0.0030, -4.6293, -11.0096, -24.5947},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign315"] = {"ygz@smoke@from94", "ygzsmoke_clip", "Gang Sign 314 ~b~YGz Smoke Props ", AnimationOptions =
   {    
    Prop = 'prop_cs_ciggy_01',
    PropBone = 4170,
    PropPlacement = {0.0270, -0.0050, 0.0210, -45.6102, -111.1178, 23.2374},
    EmoteLoop = true,
    EmoteMoving = false,
    }},
    ["gsign316"] = {"dthanggz@2@from94", "dthanggz2_clip", "Gang Sign 315 ~b~YGz DThang Props ", AnimationOptions =
    {    
    Prop = 'ba_prop_battle_whiskey_bottle_2_s',
    PropBone = 64081,
    PropPlacement = {-0.0520, 0.0380,-0.0200, -8.8909, -8.8909, 1.4022},
    SecondProp = 'prop_cs_ciggy_01',
    SecondPropBone = 4090,
    SecondPropPlacement = {0.0450,-0.0310,0.0190,136.7808,-133.2191,62.0091},
    EmoteLoop = true,
    EmoteMoving = false,
    }},
    ["gsign317"] = {"bhb@from94", "bhb_clip", "Gang Sign 316 ~b~Hound ", AnimationOptions =
    {    
    EmoteLoop = true,
    EmoteMoving = false,
    }},
    ["gsign323"] = {"dababy@from94", "dababy_clip", "Gang Sign 322 ~b~Dababy Pose ", AnimationOptions =
    {    

        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign324"] = {"smokefuck@from94", "smokefuck_clip", "Gang Sign 323 ~b~Smoke Fuck Props ", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0330,-0.0100,0.0080, -9.4921, -72.3347, 34.9029},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign325"] = {"syrupcup@from94", "syrupcup_clip", "Gang Sign 324 ~b~Syrup Cup Props ", AnimationOptions =
    {    
        Prop = 'prop_cs_whiskey_bot_stop',
        PropBone = 64016,
        PropPlacement = {0.0240, -0.1270,-0.0460, -3.0970, -10.2106, -11.6415},
        SecondProp = 'p_amb_coffeecup_01',
        SecondPropBone = 26611,
        SecondPropPlacement = {0.0240,-0.0620,-0.0070,-19.7197,9.4080,-3.4048},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign326"] = {"hound@from94", "hound_clip", "Gang Sign 325 ~b~Hound 2 ", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 4169,
        PropPlacement = {0.0240,-0.0220,-0.0020, -26.9999, 0.0000, 0.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign327"] = {"5tothesevk@from94", "5tothesevk_clip", "Gang Sign 326 ~b~5z K ", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign328"] = {"graaa@from94", "graaa_clip", "Gang Sign 327 ~b~Hound 3 & Props ", AnimationOptions =
    {    
        Prop = 'prop_energy_drink',
        PropBone = 26613,
        PropPlacement = {0.0270, -0.0490,0.0000, -31.6844, -20.8117, -26.0134},
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4186,
        SecondPropPlacement = {0.0130,-0.0090,0.0150,0.0000,0.0000,-79.9999},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign329"] = {"notti@from94", "notti_clip", "Gang Sign 328 ~b~Notti Pose Props ", AnimationOptions =
    {    
        Prop = 'prop_cs_cashenvelope',
        PropBone = 26612,
        PropPlacement = {0.0180, -0.0630,0.0020, 21.0587, -79.8030, 26.2084},
        SecondProp = 'prop_cs_cashenvelope',
        SecondPropBone = 26612,
        SecondPropPlacement = {-0.0300,-0.1100,0.0100,9.9731,-76.8506,26.6466},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign330"] = {"smm2@from94", "smm2_clip", "Gang Sign 329 ~b~SMM 2 ", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign331"] = {"ygzgunpose@from94", "ygzgunpose@clip", "Gang Sign 330 ~b~YGz Gun Pose  2 ", AnimationOptions =
    {    
        Prop = 'w_pi_appistol',
        PropBone = 4169,
        PropPlacement = {0.0270, -0.0640,0.0140, -7.6768, 2.9894, -6.4092},
        SecondProp = 'w_pi_combatpistol',
        SecondPropBone = 4169,
        SecondPropPlacement = {-0.0130,-0.0270,0.0140,-7.9468,0.9917,-3.1387},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign332"] = {"fooddrink@from94", "fooddrink_clip", "Gang Sign 331 ~b~Food Drink Props ", AnimationOptions =
    { 
    Prop = 'v_res_harddrive',
    PropBone = 26612,
    PropPlacement = {0.0390,-0.0620,-0.0730, -159.4290, 163.3733, 68.6586},
    SecondProp = 'v_res_pestle',
    SecondPropBone = 58867,
    SecondPropPlacement = {0.1300,0.0500,-0.0200,-119.3149,-171.4364,-11.2093},
    EmoteLoop = true,
    EmoteMoving = false,
    }},
    ["gsign333"] = {"ygzk@3@from94", "ygzk3_clip", "Gang Sign 329 ~b~YGK 2 ", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign334"] = {"makkballa@from94", "makkballa_clip", "Gang Sign 330 ~b~MBF 2", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 4169,
        PropPlacement = {0.0310,-0.0070,0.0260, -29.9999, 0.0000, 10.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign335"] = {"trendy@from94", "trendy_clip", "Gang Sign 331 ~b~SMM 3 ", AnimationOptions =
    { 
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4170,
        PropPlacement = {0.0330,-0.0130,0.0150, -28.6668, -93.8271, 13.5870},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign336"] = {"hound2@from94", "hound2_clip", "Gang Sign 332 ~b~Hound 4 ", AnimationOptions =
    {    
        Prop = 'v_res_harddrive',
        PropBone = 26611,
        PropPlacement = {0.0420,-0.0920,-0.1200, -118.0253, 112.2639, 68.3662},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign337"] = {"houndk@from94", "houndk_clip", "Gang Sign 333 ~b~Hound K 2 ", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign338"] = {"houndk2@from94", "houndk2_clip", "Gang Sign 334 ~b~Hound K 3 ", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 4169,
        PropPlacement = {0.0310,-0.0070,0.0260, -29.9999, 0.0000, 10.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign339"] = {"custompose@from94", "custompose_clip", "Gang Sign 335 ~b~Drink Pose Props ", AnimationOptions =
    {    
        Prop = 'prop_energy_drink',
        PropBone = 4138,
        PropPlacement = {0.0200,-0.0480,0.0110, -3.0000, 0.0000, 0.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign340"] = {"bandomoney@from94", "bandomoney_clip", "Gang Sign 336 ~b~Bando Money Pose ", AnimationOptions =
    {    
        Prop = 'prop_anim_cash_note_b',
        PropBone = 18905,
        PropPlacement = {0.1320,0.0590,0.0310, -21.4501, -64.0298, -27.4011},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign341"] = {"dthangmoney@from94", "dthangmoney_clip", "Gang Sign 337 ~b~DThang Money Pose ", AnimationOptions =
    { 
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4186,
        PropPlacement = {0.0310,-0.0470,-0.0020, -69.5285, -85.1123, 15.6198},
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 64113,
        SecondPropPlacement = {0.0220,0.0520,-0.0010,107.9773,80.5700,6.4065},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign342"] = {"showgun@from94", "showgun_clip", "Gang Sign 338 ~b~Show Gun ", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign343"] = {"duopose7@nicocsanim", "duopose7_clip", "Gang Sign 339 ~b~Slime ", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign344"] = {"duopose8@nicocsanim", "duopose8_clip", "Gang Sign 340 ~b~Face", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign345"] = {"duopose9@nicocsanim", "duopose9_clip", "Gang Sign 341 ~b~Phone & Smoke", AnimationOptions = 
    {    
        Prop = 'prop_amb_phone',
        PropBone = 58867,
        PropPlacement = {0.0400,0.0290,0.0000, 176.7299304, -163.8222109, -10.301716 },
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4186,
        SecondPropPlacement = {0.0000,-0.0100,0.0150,15.9899995,0.0000,-70.9999961},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign346"] = {"duopose10@nicocsanim", "duopose10_clip", "Gang Sign 342 ~b~Gun Pose", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign347"] = {"duopose11@nicocsanim", "duopose11_clip", "Gang Sign 343", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign348"] = {"duopose12@nicocsanim", "duopose12_clip", "Gang Sign 344 ~b~Smoke", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64016,
        PropPlacement = {0.0960,-0.0750,0.0000, -6.9325499, 83.0674501, 21.2145097  },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign349"] = {"showdat@bhary", "showdat_clip", "Gang Sign 345 ~b~Show That", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4090,
        PropPlacement = {0.0390,0.0190,-0.0220, -7.3327677, -158.4091822, 13.2704441 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign350"] = {"facepalm@bhary", "facepalm_clip", "Gang Sign 346 ~b~Facepalm", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4089,
        PropPlacement = {0.0690,-0.0180,-0.0050, 100.1510818, -178.2462165, -9.8465523 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign351"] = {"couch@bhary", "couch_clip", "Gang Sign 347 ~b~Sit W Gun", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 64096,
        PropPlacement = {-0.0020,0.0270,-0.0050, -177.7501419, -158.6730351, 22.1605531 },
        SecondProp = 'w_pi_sns_pistol',
        SecondPropBone = 4169,
        SecondPropPlacement = {0.0390, -0.0340, 0.0010, -21.9353525, -7.4185966, 1.9968561 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign352"] = {"drankface@bhary", "drankface_clip", "Gang Sign 348 ~b~Drank Face", AnimationOptions =
    {    
        Prop = 'v_res_harddrive',
        PropBone = 4090,
        PropPlacement = {-0.0100, 0.0270, 0.2100, 37.4313292, -150.361315, -54.6694121},
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0200, 0.0000, -0.0200, 30.0000001, 180.0000, -40.0000019 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign353"] = {"rollin@from94", "rollin_clip", "Gang Sign 349 ~b~Rollin ~r~New", AnimationOptions =
    {    
        Prop = 'vw_prop_vw_backpack_01a',
        PropBone = 4090,
        PropPlacement = {0.5270, -0.1050, 0.0130, -17.0459, -106.5831, -62.8211},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign354"] = {"dthanggz@3@from94", "dthanggz3_clip", "Gang Sign 350 ~b~YGz Dthang ~r~New", AnimationOptions =
    {    
        Prop = 'v_res_harddrive',
        PropBone = 26611,
        PropPlacement = {0.0170, -0.0810, -0.0550, -32.1847, 30.2632, 45.3858056 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign355"] = {"dthanggz@4@from94", "dthanggz4_clip", "Gang Sign 350 ~b~Dthang Money ~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 64016,
        PropPlacement = {0.0700, -0.0530, 0.0470, 106.4081246, -86.9139257, 14.4164295},
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 64016,
        SecondPropPlacement = {0.0380, -0.0220, 0.0000, 67.3136993, 87.4270622, -14.0831107 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign356"] = {"dthanggz@5@from94", "dthanggz5_clip", "Gang Sign 350 ~b~Dthang Money 2~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 64016,
        PropPlacement = {0.0570, -0.0590, 0.0410, 106.4081246, -86.9139257, 14.4164295},
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 64016,
        SecondPropPlacement = {0.0250, -0.0200, 0.0130, 67.3136993, 87.4270622, -14.0831107 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign357"] = {"nasgpgfuck@from94", "nasgpg_clip", "Gang Sign 351 ~b~Fuck Pose ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0400, -0.0500, 0.0400, 17.4952407, 118.4812386, 9.8465523 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign358"] = {"smokestance@from94", "smokestance_clip", "Gang Sign 352 ~b~Smoke Pose ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0380, 0.0280, 0.0310, 4.110867, -147.9458892, 56.0750666},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign359"] = {"dthanggz6@from94", "dthanggz6_clip", "Gang Sign 353 ~b~DThang Money 3 ~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4090,
        PropPlacement = {0.0000, -0.0380, -0.0170, -104.385204, -96.3561214,-45.7930341}, 
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0000, -0.0900, -0.0400, -109.6567906, -108.0964678, -39.960719},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign360"] = {"ot9@from94", "ot9_clip", "Gang Sign 354 ~b~OT9 Alliance ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4090,
        PropPlacement = {0.0280, 0.0040, -0.0170, 105.3398139, 78.3079235, 48.9735391 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign361"] = {"grinder@from94", "grinder_clip", "Gang Sign 355 ~b~Grinder Pose ~r~New", AnimationOptions =
    {    
        Prop = 'ex_office_swag_booze_cigs2',
        PropBone = 64064,
        PropPlacement = {-0.0300, 0.0360, 0.0160, -95.9616729, -58.4004469,-5.6920067 }, 
        SecondProp = 'ex_office_swag_booze_cigs',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0290, -0.0070, -0.0260, -105.3398139, -11.6920765, -48.9735391 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign362"] = {"sitwith2gun@from94", "sitwith2gun_clip", "Gang Sign 356 ~b~Sit With 2 Gun Pose ~r~New", AnimationOptions =
    {    
        Prop = 'w_pi_pistol',
        PropBone = 26611,
        PropPlacement = {0.0700,-0.0200, 0.0100, -0.7168147, 0.0000,3.0000}, 
        SecondProp = 'w_pi_pistol',
        SecondPropBone = 58869,
        SecondPropPlacement = {0.0800, 0.0160, 0.0700, -0.9226431, -4.1048612, -12.9677798},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign363"] = {"ck@from94", "ck_clip", "Gang Sign 357 ~b~Sit Crips K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign364"] = {"balla@from94", "balla_clip", "Gang Sign 358 ~b~Makk Balla ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign365"] = {"fanta@from94", "fanta_clip", "Gang Sign 359 ~b~Fanta Syrup ~r~New", AnimationOptions =
    {    
        Prop = 'ex_office_swag_furcoats2',
        PropBone = 4170,
        PropPlacement = {0.0220,-0.0580, 0.0280, -10.2777536,10.5251825,61.506782 }, 
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4170,
        SecondPropPlacement = {0.0200, -0.0080, -0.0090, 0.0000, 0.0000, -59.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign367"] = {"chilliman@animation", "chilliman_clip", "Regular Stances 360 ~b~ Money Pose ~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 64065,
        PropPlacement = {0.0320, 0.0660, 0.0000, -79.9999997, -90.0000, 0.0000 }, 
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 64113,
        SecondPropPlacement = {0.0400, 0.0200, 0.0000, -90.0000, -92.9999999, -20.0000007},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign368"] = {"downassnigga@animation", "downassnigga_clip", "Regular Stances 361 ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign369"] = {"drizzlin@animation", "drizzlin_clip", "Regular Stances 362 ~b~ Cherry Syrup ~r~New", AnimationOptions =
    {    
        Prop = 'p_watch_04',
        PropBone = 64080,
        PropPlacement = {0.0830, 0.1680, 0.0640, 65.9959021, -86.1338459, -6.0967766 }, 
        SecondProp = 'prop_amb_phone',
        SecondPropBone = 26611,
        SecondPropPlacement = {0.0400, -0.0350, -0.0200, -14.6175514, -5.1172459, -17.8057133},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign370"] = {"imbusysippin@animation", "imbusysippin_clip", "Regular Stances 363 ~b~Cup Pose ~r~New", AnimationOptions =
    {    
        Prop = 'p_watch_06',
        PropBone = 58867,
        PropPlacement = {0.0450, 0.0750, 0.0000, 21.9458874, -15.984012, 3.87516 }, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign371"] = {"lookatmygun@animation", "lookatmygun_clip", "Regular Stances ~b~Gun Pose 364 ~r~New", AnimationOptions =
    {    
        Prop = 'w_pi_sns_pistol',
        PropBone = 64065,
        PropPlacement = {0.0900, 0.0300, 0.0400, 0.0000, -49.9999987, 0.0000 }, 
        SecondProp = 'w_pi_sns_pistol_mag2',
        SecondPropBone = 64065,
        SecondPropPlacement = {0.0200, 0.0300, 0.0200, 179.4187473, 150.9580431, -3.1083054 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign372"] = {"lookatmygunspt2@animation", "lookatmygunspt2_clip", "Regular Stances 365 ~b~Double Gun ~r~New", AnimationOptions =
    {    
        Prop = 'w_pi_ceramic_pistol',
        PropBone = 26611,
        PropPlacement = {0.0700, -0.0500, 0.0000, -4.7730419, 5.0448853, 8.6173279 }, 
        SecondProp = 'w_pi_vintage_pistol',
        SecondPropBone = 58867,
        SecondPropPlacement = {0.0700, 0.0200, 0.0000, 21.3567215, 9.4518568, -6.460671},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign376"] = {"onlyaboutchilli@animation", "onlyaboutchilli_clip", "Regular Stances 366 ~b~Money  ~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4185,
        PropPlacement = {0.0250, -0.0420, 0.0140, -5.7251053, 78.4916069, -29.4987035}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign377"] = {"wockboy@animation", "wockboy_clip", "Regular Stances 367 ~b~Cup ~r~New", AnimationOptions =
    {    
        Prop = 'p_watch_06',
        PropBone = 64064,
        PropPlacement = {0.0300, 0.0600, 0.0000, -3.0000, 0.0000, 0.0000 }, 
        SecondProp = 'p_watch_04',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0400, -0.0200, 0.1600, -1.0000, -180.0000, -30.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign380"] = {"spazzpose3@animation", "spazz_clip", "Regular Stances 368 ~b~Smoke & Cup ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64097,
        PropPlacement = {0.0070, 0.0220, 0.0020, 48.2367014, -103.1678276, -15.1889236 }, 
        SecondProp = 'prop_plastic_cup_02',
        SecondPropBone = 4138,
        SecondPropPlacement = {0.0190, -0.0460, 0.0690, 0.0000, 0.0000, 0.0000  },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign381"] = {"spazzpose4@animation", "spazz_clip", "Regular Stances 369 ~b~Cup & Backpack ~r~New", AnimationOptions =
    {    
        Prop = 'p_watch_06',
        PropBone = 26613,
        PropPlacement = {0.0440, -0.0470, 0.0790, -25.5970058,18.2528474, 56.9076561}, 
        SecondProp = 'vw_prop_vw_backpack_01a',
        SecondPropBone = 64065,
        SecondPropPlacement = {-0.5020, 0.1920, 0.1300, 160.2802535, -80.5919563, -3.4048673  },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign382"] = {"qpacc@regularstance93", "regularstance93_clip", "Regular Stances 370 ~b~Money ~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4090,
        PropPlacement = {-0.0040, -0.0380, 0.0380, -6.2056164, -96.2056164, 14.8687239 }, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign383"] = {"qpacc@regularstance94", "regularstance94_clip", "Regular Stances 371 ~b~Rifle Pose ~r~New", AnimationOptions =
    {    
        Prop = 'w_ar_carbinerifle',
        PropBone = 58867,
        PropPlacement = {-0.0580, 0.1580, -0.2370, -19.295343, -70.704657, -30.4319789}, 
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0710, -0.0370, -0.0310, 3.4511785, -110.2835598, 9.3912858 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign384"] = {"qpacc@regularstance95", "regularstance95_clip", "Regular Stances 372 ~b~Rifle Cup ~r~New", AnimationOptions =
    {    
        Prop = 'p_amb_coffeecup_01',
        PropBone = 64017,
        PropPlacement = {-0.0020, -0.0470, -0.0650, 3.9611968, 7.9807643, 0.556249 }, 
        SecondProp = 'w_ar_carbinerifle',
        SecondPropBone = 26614,
        SecondPropPlacement = {0.0300, -0.0180, 0.1680, -9.723207, -39.7754439, -2.2968618 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign385"] = {"qpacc@regularstance96", "regularstance96_clip", "Regular Stances 373 ~b~Rifle Cup 2 ~r~New", AnimationOptions =
    {    
        Prop = 'p_amb_coffeecup_01',
        PropBone = 64016,
        PropPlacement = {0.0010, -0.0060, -0.0960, 24.3248861,36.3937686,-57.0011521}, 
        SecondProp = 'w_ar_carbinerifle',
        SecondPropBone = 4186,
        SecondPropPlacement = {-0.0100, -0.0300, 0.0600, -10.0000001, 0.0000, 11.9999997},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign386"] = {"obk@from94", "obk_clip", "Gang Sign ~r~Chi 374 ~b~O'Block K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign387"] = {"ballak@from94", "ballak_clip", "Gang Sign 376 ~b~Balla K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign388"] = {"customoyogz@from94", "oyogzcustom_clip", "Gang Sign 377 ~b~OYOGZ ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign389"] = {"jayhound@from94", "jayhound_clip", "Gang Sign 378 ~b~Hound (Jay Hound) ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign390"] = {"jaydohitz@from94", "jaydohitz_clip", "Gang Sign 379 ~b~DoH!tz (Jay Hound) ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign391"] = {"ygzcupsmoke@from94", "ygzcupsmoke_clip", "Gang Sign 380 ~b~YGz Cup Smoke ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64065,
        PropPlacement = {-0.0200, -0.0300, 0.0500, 0.0000 , 0.0000, 0.0000}, 
        SecondProp = 'v_res_harddrive',
        SecondPropBone = 64016,
        SecondPropPlacement = {0.0470, -0.0570, -0.0770, -8.3550282, 8.2786576, 15.9986359},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign391"] = {"sdotgopose@from94", "sdot_clip", "Gang Sign 380 ~b~Pose SDot Go ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign392"] = {"mbmb@from94", "mbmb_clip", "Gang Sign 381 ~b~Makk Balla Cup ~r~New", AnimationOptions =
    {    
        Prop = 'p_watch_06',
        PropBone = 26611,
        PropPlacement = {0.0320, -0.0560, 0.0700, 0.0000 , -10.0000003, 0.0000}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign393"] = {"gelo@slausongirl", "slausongirl_clip", "Gang Sign 382 ~b~Female Pose ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign394"] = {"gelo@redd", "redd_clip", "Gang Sign 383 ~b~Female Fuck Pose ~r~New", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign395"] = {"gelo@rackedupshawty", "rackedup_clip", "Gang Sign 384 ~b~Female Money Pose ~r~New", AnimationOptions =
    { 
    Prop = 'bkr_prop_money_unsorted_01',
    PropBone = 58870,
    PropPlacement = {0.0200, 0.0500, 0.0800, 0.00000, -85.0000, 0.0000}, 
    EmoteLoop = true,
    EmoteMoving = false,
    }},
    ["gsign397"] = {"gelo@nocameras", "nocameras_clip", "Gang Sign 385 ~b~Female Face Fuck Pose ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign399"] = {"snot_grimey@animation", "snot_grimey_clip", "Gang Sign 386 ~b~Pose Cup ~r~New", AnimationOptions =
    {   
        Prop = 'prop_plastic_cup_02',
        PropBone = 26611,
        PropPlacement = {0.0300,-0.0700,-0.0200,-74.6900248,-11.6695648,48.9775869}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign401"] = {"standing_smoking2@animation", "standing_smoking2_clip", "Gang Sign 387 ~b~Smoke Pose ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0340, 0.0000, 0.0100, 90.0000, -59.9999996, 59.9999982 }, 
        SecondProp = 'prop_amb_phone',
        SecondPropBone = 26614,
        SecondPropPlacement = {0.0570, -0.0490, 0.0300, 0.0000, 0.0000, -40.0000019},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign403"] = {"snot_wawg@animation", "snot_wawg_clip", "Gang Sign 388 ~b~WOO ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign415"] = {"rundown@from94", "rundown_clip", "Gang Sign 389  ~b~Rundown Pose ~r~New", AnimationOptions =
    {    
        Prop = 'w_ar_assaultrifle',
        PropBone = 64096,
        PropPlacement = {0.0100, 0.0300, 0.0000, 1.7537835, 10.1510818, -9.8465523}, 
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0400, -0.0100, 0.0000, -11.8371427, 160.9765143, -37.4361423},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign416"] = {"fuckcupsmoke@from94", "fuckcupsmoke_clip", "Gang Sign 390 ~b~Fuck Cup Smoke ~r~New", AnimationOptions =
    {    
        Prop = 'p_amb_coffeecup_01',
        PropBone = 26613,
        PropPlacement = {0.0890, -0.1510, -0.0210,-47.4053252,-77.2705853, -14.2237612}, 
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4170,
        SecondPropPlacement = {0.0100, -0.0040, -0.0100, -71.0000004, 0.0000,-79.9999923},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign417"] = {"femalepose@from94", "femalepose_clip", "Gang Sign 391 ~b~Female Pose ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign419"] = {"pologpose@from94", "pologpose_clip", "Gang Sign 392 ~b~Polo G Pose  ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign420"] = {"posesit@from94", "posesit_clip", "Gang Sign 393 ~b~Pose Sit ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},    
    ["gsign421"] = {"spotemmoneypose@from94", "spotemmoneypose_clip", "Gang Sign 394 ~b~Spotem Money Pose ~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4138,
        PropPlacement = {0.0520, -0.0690, 0.0100, 110.2835598, -86.5488215, -9.3912858}, 
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 4138,
        SecondPropPlacement = {0.0430, -0.0440, 0.0210, -69.3531027, -84.7638107, -14.0760953},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign422"] = {"fucksmokecup@from94", "fsc_clip", "Gang Sign 395 ~b~Pose Smoke Fuck ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4169,
        PropPlacement = {0.0400, -0.0100, -0.0100, -18.747238, -7.0959699, -68.8271678}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign423"] = {"femalepose2@from94", "femalepose2_clip", "Gang Sign 396 ~b~Pose Female 2 ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsign434"] = {"poohpose@dd", "poohpose_clip", "Gang Sign 397 ~b~Pooh Shiesty Pose ~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_cutter_moneypage',
        PropBone = 58869,
        PropPlacement = {0.1380, 0.0550, 0.0130, 12.8959689, -15.9443881, 8.8034293}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign438"] = {"onehands@from94", "onehands_clip", "Gang Sign 398 ~b~One Hands Pocket ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["gsign439"] = {"justslime@from94", "justslime_clip", "Gang Sign 399 ~b~Slime ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign440"] = {"slimegdk@from94", "slimegdk_clip", "Gang Sign 400 ~b~GDK Slime ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign441"] = {"nbafuck@from94", "nbafuck_clip", "Gang Sign 401 ~b~Youngboy Fuck ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign442"] = {"cupandbottle@from94", "cupandbottle_clip", "Gang Sign 402 ~b~Cup & Bottle ~r~New", AnimationOptions =
    {    
        Prop = 'v_res_harddrive',
        PropBone = 4090,
        PropPlacement = {0.0300, -0.0700, -0.2500, -168.8430382, 166.4708958, 48.0412793},
        SecondProp = 'p_watch_06',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0400, -0.0230, 0.0950, -8.9958125, 27.0857648, 6.6471686 },
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign444"] = {"moneyspread@from94", "moneyspread_clip", "Gang Sign 403 ~b~Money Spread ~r~New", AnimationOptions =
    {    
        Prop = 'v_res_ipoddock',
        PropBone = 4090,
        PropPlacement = {-0.1830, 0.0980, -0.2070, 54.8383608, -107.1371147, 8.85103 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign445"] = {"moneyspread2@from94", "moneyspread2_clip", "Gang Sign 404 ~b~Money Spread 2 ~r~New", AnimationOptions =
    {    
        Prop = 'v_res_ipoddock',
        PropBone = 26611,
        PropPlacement = {-0.0050, 0.1600, -0.1740, 41.4285761, -179.1342383, -29.3411091 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign446"] = {"scooterfuck@from94", "scooterfuck_clip", "Gang Sign 405 ~b~Scooter Fuck ~r~New", AnimationOptions =
    {    
        Prop = 'prop_tumbler_01b',
        PropBone = 64113,
        PropPlacement = {0.4540, -0.9820, 0.2000, -90.0000, 0.00000, 20.0000 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign447"] = {"drakopose@from94", "drakopose_clip", "Gang Sign 406 ~b~Drako Pose ~r~New", AnimationOptions =
    {    
        Prop = 'w_ar_assaultrifle_mag2',
        PropBone = 26611,
        PropPlacement = {-0.0280, -0.0380, -0.0060, -24.0000006, 0.0000, 0.0000},
        SecondProp = 'w_ar_assaultrifle',
        SecondPropBone = 26613,
        SecondPropPlacement = {-0.0250, -0.0730, -0.0900, 25.6621914, -45.7382796, 26.180082  },
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign448"] = {"pose94@from94", "pose94_clip", "Gang Sign 407 ~b~From94 Pose ~r~New", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4186,
        PropPlacement = {0.0100, -0.0600, 0.0100, -61.1245223, -74.4640596, 13.3562105 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign449"] = {"backmoney@from94", "backmoney_clip", "Gang Sign 408 ~b~Back Pose Money~r~New", AnimationOptions =
    {    
        Prop = 'prop_anim_cash_note_b',
        PropBone = 64017,
        PropPlacement = {0.0310, -0.0010, 0.0410, 59.6237443, 45.9202947, -4.1967536  },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign450"] = {"oyoy@from94", "oyoy_clip", "Gang Sign 409 ~b~OY ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign451"] = {"drinksmoke@from94", "drinksmoke_clip", "Gang Sign 410 ~b~Drink Smoke ~r~New", AnimationOptions =
    {    
        Prop = 'p_watch_06',
        PropBone = 58870,
        PropPlacement = {0.0360, 0.0620, 0.0800, 8.9663098, -4.938748, -0.7812041},
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4170,
        SecondPropPlacement = {0.0200, -0.0200, 0.0100, -5.1608082, -100.364092, -29.5935632},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign452"] = {"houndkphone@from94", "houndkphone_clip", "Gang Sign 411 ~b~Hound K & Phone ~r~New", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 26611,
        PropPlacement = {0.0400, -0.0450, -0.0020, 1.4205163, 23.9960445, 1.7269448},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign453"] = {"carljohnsongsfcustom1@from94", "carljohnsongsfcustom1_clip", "Gang Sign 412 ~b~8 Treight G ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},

}


DP.White4ro = {


    ["gsignla1"] = {"qpacc@gangsign1", "gangsign1_clip", "Gang Sign 1 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla2"] = {"qpacc@gangsign2", "gangsign2_clip", "Gang Sign 2 LA ~b~NHC K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla3"] = {"qpacc@gangsign3", "gangsign3_clip", "Gang Sign 3 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla4"] = {"qpacc@gangsign4", "gangsign4_clip", "Gang Sign 4 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla5"] = {"qpacc@gangsign5", "gangsign5_clip", "Gang Sign 5 LA ~b~Grape Street ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla6"] = {"qpacc@gangsign6", "gangsign6_clip", "Gang Sign 6 LA ~b~Crips ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla7"] = {"qpacc@gangsign7", "gangsign7_clip", "Gang Sign 7 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla8"] = {"qpacc@gangsign8", "gangsign8_clip", "Gang Sign 8 LA ~b~NHC ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla9"] = {"qpacc@gangsign9", "gangsign9_clip", "Gang Sign 9 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla92"] = {"qpacc@gangsign10", "gangsign10_clip", "Gang Sign 10 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla93"] = {"qpacc@gangsign11", "gangsign11_clip", "Gang Sign 11 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla94"] = {"qpacc@gangsign12", "gangsign12_clip", "Gang Sign 12 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla95"] = {"qpacc@gangsign13", "gangsign13_clip", "Gang Sign 13 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla96"] = {"qpacc@gangsign14", "gangsign14_clip", "Gang Sign 14 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla97"] = {"qpacc@gangsign15", "gangsign15_clip", "Gang Sign 15 LA ~b~Florencia 13 ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla98"] = {"qpacc@gangsign16", "gangsign16_clip", "Gang Sign 16 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla99"] = {"qpacc@gangsign17", "gangsign17_clip", "Gang Sign 17 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla991"] = {"qpacc@gangsign18", "gangsign18_clip", "Gang Sign 18 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla992"] = {"qpacc@gangsign19", "gangsign19_clip", "Gang Sign 19 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla993"] = {"qpacc@gangsign20", "gangsign20_clip", "Gang Sign 20 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla994"] = {"qpacc@gangsign21", "gangsign21_clip", "Gang Sign 21 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla995"] = {"qpacc@gangsign22", "gangsign22_clip", "Gang Sign 22 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla996"] = {"qpacc@gangsign23", "gangsign23_clip", "Gang Sign 23 LA ~b~Blood K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla997"] = {"qpacc@gangsign24", "gangsign24_clip", "Gang Sign 24 LA ~b~Crips ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla998"] = {"qpacc@gangsign32", "gangsign32_clip", "Gang Sign 25 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla999"] = {"qpacc@gangsign26", "gangsign26_clip", "Gang Sign 26 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla9991"] = {"qpacc@gangsign27", "gangsign27_clip", "Gang Sign 27 ~b~NHC LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla9992"] = {"qpacc@gangsign28", "gangsign28_clip", "Gang Sign 28 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla9993"] = {"qpacc@gangsign29", "gangsign29_clip", "Gang Sign 29 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla9994"] = {"qpacc@gangsign30", "gangsign30_clip", "Gang Sign 30 LA ~b~Crips ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla9995"] = {"qpacc@gangsign31", "gangsign31_clip", "Gang Sign 31 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla9996"] = {"qpacc@gangsign32", "gangsign32_clip", "Gang Sign 32 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignla9997"] = {"qpacc@gangsign33", "gangsign33_clip", "Gang Sign 33 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignla9999"] = {"qpacc@gangsign34", "gangsign34_clip", "Gang Sign 34 LA ~b~Crips ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz99991"] = {"qpacc@gangsign35", "gangsign35_clip", "Gang Sign 35 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz99992"] = {"qpacc@gangsign36", "gangsign36_clip", "Gang Sign 36 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz99993"] = {"qpacc@gangsign37", "gangsign37_clip", "Gang Sign 37 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz99994"] = {"qpacc@gangsign38", "gangsign38_clip", "Gang Sign 38 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz99995"] = {"qpacc@gangsign39", "gangsign39_clip", "Gang Sign 39 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz99996"] = {"qpacc@gangsign40", "gangsign40_clip", "Gang Sign 40  ~b~Blood LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz99997"] = {"qpacc@gangsign41", "gangsign41_clip", "Gang Sign 41 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz99998"] = {"qpacc@gangsign42", "gangsign42_clip", "Gang Sign 42 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz99999"] = {"qpacc@gangsign43", "gangsign43_clip", "Gang Sign 43 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz999991"] = {"qpacc@gangsign44", "gangsign44_clip", "Gang Sign 44 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz999992"] = {"qpacc@gangsign45", "gangsign45_clip", "Gang Sign 45 LA ~b~Blood K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz999993"] = {"qpacc@gangsign46", "gangsign46_clip", "Gang Sign 46 LA  ~b~Crips ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz999994"] = {"qpacc@gangsign47", "gangsign47_clip", "Gang Sign 47 LA  ~b~Grape Street K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz999995"] = {"qpacc@gangsign48", "gangsign48_clip", "Gang Sign 48 LA ~b~Grape Street K 2  ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz999996"] = {"qpacc@gangsign49", "gangsign49_clip", "Gang Sign 49 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz999997"] = {"qpacc@gangsign50", "gangsign50_clip", "Gang Sign 50 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz999998"] = {"qpacc@gangsign51", "gangsign51_clip", "Gang Sign 51 LA ~b~Crips K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz999999"] = {"qpacc@gangsign52", "gangsign52_clip", "Gang Sign 52 LA ~b~Crips K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz9999991"] = {"qpacc@gangsign53", "gangsign53_clip", "Gang Sign 53 LA ~b~Florencia K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz9999992"] = {"qpacc@gangsign54", "gangsign54_clip", "Gang Sign 54 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["gsignlaz9999993"] = {"qpacc@gangsign55", "gangsign55_clip", "Gang Sign 55 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz9999994"] = {"qpacc@gangsign56", "gangsign56_clip", "Gang Sign 56 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz9999995"] = {"qpacc@gangsign57", "gangsign57_clip", "Gang Sign 57 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz9999996"] = {"qpacc@gangsign58", "gangsign58_clip", "Gang Sign 58 ~b~Blood LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz9999997"] = {"qpacc@gangsign59", "gangsign59_clip", "Gang Sign 59 ~b~Rollin 40 K LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz9999998"] = {"qpacc@gangsign60", "gangsign60_clip", "Gang Sign 60 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsignlaz9999999"] = {"qpacc@gangsign61", "gangsign61_clip", "Gang Sign 61 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsignlaz99999991"] = {"qpacc@gangsign62", "gangsign62_clip", "Gang Sign 62 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["zgsignla1"] = {"qpacc@gangsign63", "gangsign63_clip", "Gang Sign 63 LA  ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla2"] = {"qpacc@gangsign64", "gangsign64_clip", "Gang Sign 64 LA ~b~NHC ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla3"] = {"qpacc@gangsign65", "gangsign65_clip", "Gang Sign 65 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla4"] = {"qpacc@gangsign66", "gangsign66_clip", "Gang Sign 66 LA ~b~Florencia 13 ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla5"] = {"qpacc@gangsign67", "gangsign67_clip", "Gang Sign 67 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla7"] = {"qpacc@gangsign69", "gangsign69_clip", "Gang Sign 69 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla8"] = {"qpacc@gangsign70", "gangsign70_clip", "Gang Sign 70 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9"] = {"qpacc@gangsign71", "gangsign71_clip", "Gang Sign 71 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla91"] = {"qpacc@gangsign72", "gangsign72_clip", "Gang Sign 72 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla92"] = {"qpacc@gangsign73", "gangsign73_clip", "Gang Sign 73 LA ~b~Hoover K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla93"] = {"qpacc@gangsign74", "gangsign74_clip", "Gang Sign 74 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla94"] = {"qpacc@gangsign75", "gangsign75_clip", "Gang Sign 75 LA ~b~Rollin 30 K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla95"] = {"qpacc@gangsign76", "gangsign76_clip", "Gang Sign 76 LA ~b~Crips K  ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla96"] = {"qpacc@gangsign77", "gangsign77_clip", "Gang Sign 77 LA ~b~Rollin 40 K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla97"] = {"qpacc@gangsign78", "gangsign78_clip", "Gang Sign 78 LA ~b~Hoover K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla98"] = {"qpacc@gangsign79", "gangsign79_clip", "Gang Sign 79 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99"] = {"qpacc@gangsign80", "gangsign80_clip", "Gang Sign 80 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla991"] = {"qpacc@gangsign81", "gangsign81_clip", "Gang Sign 81 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla992"] = {"qpacc@gangsign83", "gangsign83_clip", "Gang Sign 82 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla993"] = {"qpacc@gangsign84", "gangsign84_clip", "Gang Sign 83 ~b~Blood LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla994"] = {"qpacc@gangsign85", "gangsign85_clip", "Gang Sign 84 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla995"] = {"qpacc@gangsign86", "gangsign86_clip", "Gang Sign 85 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla996"] = {"qpacc@gangsign87", "gangsign87_clip", "Gang Sign 87 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla997"] = {"qpacc@gangsign88", "gangsign88_clip", "Gang Sign 88 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla998"] = {"qpacc@gangsign89", "gangsign89_clip", "Gang Sign 89 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999"] = {"qpacc@gangsign90", "gangsign90_clip", "Gang Sign 90 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9991"] = {"qpacc@gangsign91", "gangsign91_clip", "Gang Sign 91 ~b~Blood LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9992"] = {"qpacc@gangsign92", "gangsign92_clip", "Gang Sign 93 ~b~Florencia K LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9993"] = {"qpacc@gangsign93", "gangsign93_clip", "Gang Sign 94 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9994"] = {"qpacc@gangsign94", "gangsign94_clip", "Gang Sign 95 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9995"] = {"qpacc@gangsign95", "gangsign95_clip", "Gang Sign 96 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9996"] = {"qpacc@gangsign96", "gangsign96_clip", "Gang Sign 97 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9997"] = {"qpacc@gangsign97", "gangsign97_clip", "Gang Sign 98 LA ~b~Hoover K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9998"] = {"qpacc@gangsign98", "gangsign98_clip", "Gang Sign 99 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9999"] = {"qpacc@gangsign99", "gangsign99_clip", "Gang Sign 100 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99991"] = {"qpacc@gangsign100", "gangsign100_clip", "Gang Sign 101 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99992"] = {"qpacc@gangsign101", "gangsign101_clip", "Gang Sign 102 LA ~b~MainStreet ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99993"] = {"qpacc@gangsign102", "gangsign102_clip", "Gang Sign 103 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99994"] = {"qpacc@gangsign103", "gangsign103_clip", "Gang Sign 104 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99995"] = {"qpacc@gangsign104", "gangsign104_clip", "Gang Sign 105 LA ~b~Rollin 40 K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99996"] = {"qpacc@gangsign105", "gangsign105_clip", "Gang Sign 106 LA ~b~Rollin 30 K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99997"] = {"qpacc@gangsign107", "gangsign107_clip", "Gang Sign 107 LA ~b~Hoover K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99998"] = {"qpacc@gangsign108", "gangsign108_clip", "Gang Sign 108 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla99999"] = {"qpacc@gangsign109", "gangsign109_clip", "Gang Sign 109 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999991"] = {"qpacc@gangsign126", "gangsign126_clip", "Gang Sign 110 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999992"] = {"qpacc@gangsign111", "gangsign111_clip", "Gang Sign 111 LA ~b~Hoover K  ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999993"] = {"qpacc@gangsign112", "gangsign112_clip", "Gang Sign 112 LA ~b~Rollin 40 K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999994"] = {"qpacc@gangsign113", "gangsign113_clip", "Gang Sign 113 LA  ~b~Hoover K  ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999995"] = {"qpacc@gangsign114", "gangsign114_clip", "Gang Sign 114 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999996"] = {"qpacc@gangsign115", "gangsign115_clip", "Gang Sign 115 LA ~b~NHC K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999997"] = {"qpacc@gangsign116", "gangsign116_clip", "Gang Sign 116 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999998"] = {"qpacc@gangsign117", "gangsign117_clip", "Gang Sign 117 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla999999"] = {"qpacc@gangsign118", "gangsign118_clip", "Gang Sign 118 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9999991"] = {"qpacc@gangsign119", "gangsign119_clip", "Gang Sign 119 LA ~r~New", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9999992"] = {"qpacc@gangsign120", "gangsign120_clip", "Gang Sign 120 LA ~b~NHC K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9999993"] = {"qpacc@gangsign121", "gangsign121_clip", "Gang Sign 121 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9999994"] = {"qpacc@gangsign122", "gangsign122_clip", "Gang Sign 122 LA ~b~Rollin 50 K ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9999995"] = {"qpacc@gangsign123", "gangsign123_clip", "Gang Sign 123 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9999996"] = {"qpacc@gangsign125", "gangsign125_clip", "Gang Sign 124 LA ~b~Blood ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["zgsignla9999997"] = {"qpacc@gangsign127", "gangsign127_clip", "Gang Sign 125 LA ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    
    
    ["gsign404"] = {"chiraq1@from94", "chiraq1_clip", "Chicago Sign 1 ~b~BDK ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign405"] = {"chiraq2@from94", "chiraq2_clip", "Chicago Sign 2 ~b~GDK Smoke ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4090,
        PropPlacement = {0.0220, -0.0180, -0.0100, -113.2467459, 91.9941464,31.41819 }, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign406"] = {"chiraq3@from94", "chiraq3_clip", "Chicago Sign 3 ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign424"] = {"chiraq4@from94", "chiraq4_clip", "Chicago Sign 4 ~b~Mickey Cobra ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign425"] = {"chiraq5@from94", "chiraq5_clip", "Chicago Sign 5 ~b~Latin Eagles ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign426"] = {"chiraq6@from94", "chiraq6_clip", "Chicago Sign 6 ~b~Insane Dragons ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign427"] = {"chiraq7@from94", "chiraq7_clip", "Chicago Sign 7 ~b~Latin Dragons ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign428"] = {"chiraq8_@from94", "chiraq8_clip", "Chicago Sign 8 ~b~Latin Angels ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign429"] = {"chiraq9@from94", "chiraq9_clip", "Chicago Sign 9 ~b~BD's ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign430"] = {"chiraq10@from94", "chiraq10_clip", "Chicago Sign 10 ~b~GD's ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign431"] = {"chiraq11@from94", "chiraq11_clip", "Chicago Sign 11 ~b~GD's 2 ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign435"] = {"chiraq12@from94", "chiraq12_clip", "Chicago Sign 12 ~b~GD's Kup & Smoke ~r~New", AnimationOptions =
    {    
        Prop = 'p_amb_coffeecup_01',
        PropBone = 58869,
        PropPlacement = {0.0360, 0.0570, 0.0110, -4.0342252, -0.99813, -1.9299437},
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 64097,
        SecondPropPlacement = {0.0170, 0.0150, -0.0070, -44.5614522, -44.5614522, 75.8939552},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign443"] = {"chiraq13@from94", "chiraq13_clip", "Chicago Sign 13 ~b~Almighty Vice Lord ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign4334"] = {"oblock@from94", "oblock_clip", "Chicago Sign 14 ~b~O'Block ~r~New", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4138,
        PropPlacement = {-0.0150, 0.0160, 0.0500, -10.7241905 , -63.5087434,-5.4162076 }, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},

}

DP.White5ro = {

    ["gsign407"] = {"grizzlybdk@from94", "grizzlybdk_clip", "Stacking Anim 1 ~b~BDK ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign408"] = {"gunaim@from94", "gunaim_clip", "Stacking Anim 2 ~b~Gun Aim ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign409"] = {"graaaa@from94", "graaaa_clip", "Stacking Anim 3 ~b~Hxxva ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign410"] = {"984msc@from94", "984msc_clip", "Stacking Anim 4 ~b~MainStreet ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign411"] = {"107hxxva@from94", "107hxxva_clip", "Stacking Anim 5 ~b~107 Hoover ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign412"] = {"rollin60@from94", "rollin60_clip", "Stacking Anim 6 ~b~Rollin 60 ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign413"] = {"gunaim2@from94", "gunaim2_clip", "Stacking Anim 7 ~b~Gun Aim 2 ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign414"] = {"chiraqselfie1@from94", "chiraqselfie1_clip", "Stacking Anim 8 ~b~Seflie Chiraq ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign418"] = {"ws99mc@from94", "ws99_clip", "Stacking Anim 9 ~b~99 Mafia Crips ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign432"] = {"chiraqstacking1@from94", "chiraqstacking1_clip", "Stacking Anim 10 ~b~GD's ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign433"] = {"makkstakking@from94", "makkstakking_clip", "Stacking Anim 11 ~b~Makk Balla ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign436"] = {"62brimstacking@from94", "62brimstacking_clip", "Stacking Anim 12 ~b~62 Brim ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign437"] = {"rundownstacking@from94", "rundownstacking_clip", "Stacking Anim 13 ~b~Rundown ~r~New", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 

}


DP.White2do = {
    ["fuckpose"] = {"fuckpose@queensister", "fuckpose_clip", "fuckpose", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["dab"] = { "custom@dab", "dab", "Dab", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = true,
   }},
   ["cantsee"] = { "custom@cant_see", "cant_see", "Can't See", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = true,
   }},
   ["sheesh"] = {"custom@sheeeeesh", "sheeeeesh", "Sheesh", AnimationOptions =
   {
     EmoteMoving = true,
     EmoteDuration = 8000,
   }},
   ["copsearch"] = {"custom@police", "police", "Cop Search", AnimationOptions =
   {
     EmoteMoving = false,
     EmoteDuration = 8000,
   }},
   ["sus"] = {"custom@suspect", "suspect", "Suspect", AnimationOptions =
   {
     EmoteMoving = false,
   }},
   ["cdig"] = {"custom@dig", "dig", "Custom Dig", AnimationOptions =
   {
     EmoteMoving = false,
     EmoteDuration = 8000,
   }},
   ["armswirl"] = {"custom@armswirl", "armswirl", "Arm Swirl", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["drilldance"] = {"div@woowalk@test", "drilldance", "Drill Dance", AnimationOptions =
   {
       EmoteLoop = true
   }},
   ["armwave"] = {"custom@armwave", "armwave", "Arm Wave", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["circlecrunch"] = {"custom@circle_crunch", "circle_crunch", "Circle Crunch", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["circlecrunch"] = {"custom@circle_crunch", "circle_crunch", "Circle Crunch", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["whatidk"] = {"custom@what_idk", "what_idk", "What? Don't Know", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["pickfromground"] = {"custom@pickfromground", "pickfromground", "Pick From Ground", AnimationOptions =
   {
     EmoteLoop = true,
     EmoteMoving = false,
   }},
   ["bellydance"] = {"custom@bellydance", "bellydance", "Belly Dance", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["convulsion"] = {"custom@convulsion", "convulsion", "Convulsion", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose1"] = {"custom@female_pose_1", "female_pose_1", "Pose 1", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose2"] = {"custom@female_pose_2", "female_pose_2", "Pose 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose3"] = {"custom@female_pose_3", "female_pose_3", "Pose 3", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["hiphopslide"] = {"custom@hiphop_slide", "hiphop_slide", "HipHop Slide", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["hiphop1"] = {"custom@hiphop1", "hiphop1", "HipHop 1", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["hiphop2"] = {"custom@hiphop2", "hiphop2", "HipHop 2", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["hiphop3"] = {"custom@hiphop3", "hiphop3", "HipHop 3", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = false,
   }},
   ["hiphopold"] = {"custom@hiphop90s", "hiphop90s", "HipHop Old", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose4"] = {"custom@male_pose_1", "male_pose_1", "Pose 4", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose5"] = {"custom@male_pose_2", "male_pose_2", "Pose 5", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pose6"] = {"custom@male_pose_3", "male_pose_3", "Pose 6", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["pluck"] = {"custom@pluck_fruits", "pluck_fruits", "Pluck Fruits", AnimationOptions =
   {
      EmoteMoving = false,
      EmoteLoop = true,
   }},
   ["waiter"] = {"custom@waiter", "waiter", "Waiter", AnimationOptions =
   {
      EmoteMoving = true,
      EmoteLoop = true,
   }},

   -- Custom Dances: Ultra
   ["breakdance"] = {"export@breakdance", "breakdance", "Break Dance", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["gangnamstyle"] = {"custom@gangnamstyle", "gangnamstyle", "Gangnam Style", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["macarena"] = {"custom@makarena", "makarena", "Macarena", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["maraschino"] = {"custom@maraschino", "maraschino", "Maraschino", AnimationOptions =
   {
      EmoteLoop = true,
   }},
   ["salsa"] = {"custom@salsa", "salsa", "Salsa", AnimationOptions =
   {
      EmoteLoop = true,
   }},

   -- Custom Dances: Divine
   ["ddance1"] = {"divined@dances@new", "ddance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance2"] = {"divined@dances@new", "ddance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance3"] = {"divined@dances@new", "ddance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance4"] = {"divined@dances@new", "ddance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance5"] = {"divined@dances@new", "ddance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance6"] = {"divined@dances@new", "ddance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance7"] = {"divined@dances@new", "ddance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance8"] = {"divined@dances@new", "ddance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance9"] = {"divined@dances@new", "ddance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance10"] = {"divined@dances@new", "ddance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance11"] = {"divined@dances@new", "ddance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance12"] = {"divined@dances@new", "ddance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance13"] = {"divined@dances@new", "ddance13", "Divined Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},

   -- Version Two
   ["divdance1"] = {"divined@dancesv2@new", "divdance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance2"] = {"divined@dancesv2@new", "divdance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance3"] = {"divined@dancesv2@new", "divdance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance4"] = {"divined@dancesv2@new", "divdance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance5"] = {"divined@dancesv2@new", "divdance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance6"] = {"divined@dancesv2@new", "divdance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance7"] = {"divined@dancesv2@new", "divdance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance8"] = {"divined@dancesv2@new", "divdance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance9"] = {"divined@dancesv2@new", "divdance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance10"] = {"divined@dancesv2@new", "divdance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance11"] = {"divined@dancesv2@new", "divdance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance12"] = {"divined@dancesv2@new", "divdance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance13"] = {"divined@dancesv2@new", "divdance13", "Divined Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance14"] = {"divined@dancesv2@new", "divdance14", "Divined Dance 14", AnimationOptions =
   {
      EmoteLoop = true
   }},
   -- Divine Breakdance
   ["divbdance1"] = {"divined@breakdances@new", "divbdance1", "Divined Break Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance2"] = {"divined@breakdances@new", "divbdance2", "Divined Break Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance3"] = {"divined@breakdances@new", "divbdance3", "Divined Break Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance4"] = {"divined@breakdances@new", "divbdance4", "Divined Break Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance5"] = {"divined@breakdances@new", "divbdance5", "Divined Break Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance6"] = {"divined@breakdances@new", "divbdance6", "Divined Break Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance7"] = {"divined@breakdances@new", "divbdance7", "Divined Break Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance8"] = {"divined@breakdances@new", "divbdance8", "Divined Break Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance9"] = {"divined@breakdances@new", "divbdance9", "Divined Break Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance10"] = {"divined@breakdances@new", "divbdance10", "Divined Break Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance11"] = {"divined@breakdances@new", "divbdance11", "Divined Break Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance12"] = {"divined@breakdances@new", "divbdance12", "Divined Break Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance13"] = {"divined@breakdances@new", "divbdance13", "Divined Break Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance14"] = {"divined@breakdances@new", "divbdance14", "Divined Break Dance 14", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance15"] = {"divined@breakdances@new", "divbdance14", "Divined Break Dance 15", AnimationOptions =
   {
      EmoteLoop = true
   }},

   -- Divine Breakdance v3
   ["dbrdance1"] = {"divined@brdancesv2@new", "dbrdance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance2"] = {"divined@brdancesv2@new", "dbrdance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance3"] = {"divined@brdancesv2@new", "dbrdance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance4"] = {"divined@brdancesv2@new", "dbrdance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance5"] = {"divined@brdancesv2@new", "dbrdance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance6"] = {"divined@brdancesv2@new", "dbrdance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance7"] = {"divined@brdancesv2@new", "dbrdance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance8"] = {"divined@brdancesv2@new", "dbrdance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance9"] = {"divined@brdancesv2@new", "dbrdance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance10"] = {"divined@brdancesv2@new", "dbrdance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance11"] = {"divined@brdancesv2@new", "dbrdance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance12"] = {"divined@brdancesv2@new", "dbrdance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},

--- WC SEPARATED 

    ["buscadd1"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Baile Custom D", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_down", "Baile Custom D1", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Baile Custom D2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_left", "Baile Custom D3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd5"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_right", "Baile Custom D4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_left_up", "Baile Custom D5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd7"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_right_up", "Baile Custom D6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd8"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Baile Custom D7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_left_up", "Baile Custom D8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscadd99"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_right_up", "Baile Custom D9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad11"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_left", "Baile Custom A", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad12"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_right", "Baile Custom A1", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad13"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center", "Baile Custom A2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad14"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_left_up", "Baile Custom A3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad15"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_right_up", "Baile Custom A4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad16"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_left", "Baile Custom A5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad17"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_right", "Baile Custom A6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad18"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center_down", "Baile Custom A7", AnimationOptions = ----------------
    {
        EmoteLoop = true,
    }},
    ["buscad19"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_down", "Baile Custom A8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad20"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_down", "Baile Custom A9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad21"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Baile Custom B", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad22"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_left_down", "Baile Custom B1", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad23"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_right_down", "Baile Custom B2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad24"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_left_up", "Baile Custom B3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad25"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_right_up", "Baile Custom B4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad26"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Baile Custom B5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad27"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Baile Custom B6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad28"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_left", "Baile Custom B7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad29"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_right", "Baile Custom B8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad30"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center", "Baile Custom B9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad31"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_center_down", "Baile Custom C", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad32"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_left_up", "Baile Custom C1", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad33"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_right_up", "Baile Custom C2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad34"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_left_down", "Baile Custom C3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["buscad35"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "med_right_down", "Baile Custom C4", AnimationOptions =
    {
        EmoteLoop = true,
    }},

    ["sexo"] = {"rcmpaparazzo_2", "shag_loop_poppy", "Sexo F", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sexo2"] = {"rcmpaparazzo_2", "shag_loop_a", "Sexo M", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["sexo3"] = {"anim@mp_player_intcelebrationfemale@air_shagging", "air_shagging", "Sexo 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},


    -- CHINITOS

    ["dancenew1"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Custom Dance New 1", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew2"] = {"anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_a_blamadon", "Custom Dance New 2", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew3"] = {"anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_d_blamadon", "Custom Dance New 3", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew4"] = {"anim@amb@nightclub@dancers@black_madonna_entourage@", "li_dance_facedj_11_v1_male^1", "Custom Dance New 4", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew5"] = {"anim@amb@nightclub@dancers@black_madonna_entourage@", "hi_dance_facedj_09_v2_male^5", "Custom Dance New 5", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew6"] = {"anim@amb@nightclub@dancers@black_madonna_entourage@", "li_dance_facedj_15_v2_male^2", "Custom Dance New 6", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew7"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "mi_dance_prop_15_v1_male^1", "Custom Dance New 7", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew8"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^1", "Custom Dance New 8", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew9"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^2", "Custom Dance New 9", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew10"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^3", "Custom Dance New 10", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew11"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^4", "Custom Dance New 11", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew12"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^5", "Custom Dance New 12", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew13"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_female^6", "Custom Dance New 13", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew14"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^1", "Custom Dance New 14", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew15"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^2", "Custom Dance New 15", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew16"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^3", "Custom Dance New 16", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew17"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^4", "Custom Dance New 17", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew18"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^5", "Custom Dance New 18", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew19"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_a_dixon", "Custom Dance New 19", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew20"] = {"anim@amb@nightclub@djs@solomun@", "sol_trans_out_to_rt_a_sol", "Custom Dance New 20", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew21"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^1", "Custom Dance New 21", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew22"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^2", "Custom Dance New 22", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew23"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^3", "Custom Dance New 23", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew24"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^4", "Custom Dance New 24", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew25"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^5", "Custom Dance New 25", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew26"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_female^6", "Custom Dance New 26", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew27"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^1", "Custom Dance New 27", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew28"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^2", "Custom Dance New 28", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew29"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^3", "Custom Dance New 29", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew30"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^4", "Custom Dance New 30", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew31"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^5", "Custom Dance New 31", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew32"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^6", "Custom Dance New 32", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew33"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^2", "Custom Dance New 33", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew34"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^3", "Custom Dance New 34", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew35"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^4", "Custom Dance New 35", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew36"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^5", "Custom Dance New 36", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew37"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^6", "Custom Dance New 37", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew38"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^1", "Custom Dance New 38", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew39"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^2", "Custom Dance New 39", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew40"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^3", "Custom Dance New 40", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew41"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^4", "Custom Dance New 41", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew42"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^5", "Custom Dance New 42", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew43"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^6", "Custom Dance New 43", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew44"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^1", "Custom Dance New 44", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew45"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^2", "Custom Dance New 45", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew46"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^3", "Custom Dance New 46", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew47"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^4", "Custom Dance New 47", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew48"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^5", "Custom Dance New 48", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew49"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_female^6", "Custom Dance New 49", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew50"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^1", "Custom Dance New 50", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew51"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^2", "Custom Dance New 51", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew52"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^3", "Custom Dance New 52", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew53"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^4", "Custom Dance New 53", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew54"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^5", "Custom Dance New 54", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew55"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v1_male^6", "Custom Dance New 55", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew56"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^1", "Custom Dance New 56", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew57"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^2", "Custom Dance New 57", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew58"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^3", "Custom Dance New 58", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew59"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^4", "Custom Dance New 59", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew60"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^5", "Custom Dance New 60", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew61"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_female^6", "Custom Dance New 61", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew62"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^1", "Custom Dance New 62", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew63"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^2", "Custom Dance New 63", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew64"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^3", "Custom Dance New 64", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew65"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^4", "Custom Dance New 65", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew66"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^5", "Custom Dance New 66", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew67"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^6", "Custom Dance New 67", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew68"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^1", "Custom Dance New 68", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew69"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^2", "Custom Dance New 69", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew70"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^3", "Custom Dance New 70", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew71"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^4", "Custom Dance New 71", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew72"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^5", "Custom Dance New 72", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew73"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_female^6", "Custom Dance New 73", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew74"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^1", "Custom Dance New 74", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew75"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^2", "Custom Dance New 75", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew76"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^3", "Custom Dance New 76", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew77"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^4", "Custom Dance New 77", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew78"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^5", "Custom Dance New 78", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew79"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v1_male^6", "Custom Dance New 79", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew80"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^1", "Custom Dance New 80", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew81"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^2", "Custom Dance New 81", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew82"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^3", "Custom Dance New 82", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew83"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^4", "Custom Dance New 83", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew84"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^5", "Custom Dance New 84", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew85"] = {"anim@amb@nightclub@dancers@crowddance_facedj@", "mi_dance_facedj_09_v2_female^6", "Custom Dance New 85", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew86"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^1", "Custom Dance New 86", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew87"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^2", "Custom Dance New 87", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew88"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^3", "Custom Dance New 88", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew89"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^4", "Custom Dance New 89", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew90"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^5", "Custom Dance New 90", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew91"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v1_female^6", "Custom Dance New 91", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew92"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", "trans_dance_crowd_li_to_hi_09_v1_male^1", "Custom Dance New 92", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew93"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", "trans_dance_crowd_li_to_hi_09_v1_male^2", "Custom Dance New 93", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew94"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", "trans_dance_crowd_li_to_hi_09_v1_male^3", "Custom Dance New 94", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew95"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", "trans_dance_crowd_li_to_hi_09_v1_male^4", "Custom Dance New 95", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew96"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", "trans_dance_crowd_li_to_hi_09_v1_male^5", "Custom Dance New 96", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew97"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_low_intensity", "trans_dance_crowd_li_to_hi_09_v1_male^6", "Custom Dance New 97", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew98"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_hi_09_v1_male^1", "Custom Dance New 98", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew99"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_hi_09_v1_male^2", "Custom Dance New 99", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew100"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_hi_09_v1_male^3", "Custom Dance New 100", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew101"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_hi_09_v1_male^4", "Custom Dance New 101", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew102"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_hi_09_v1_male^5", "Custom Dance New 102", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dancenew103"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_med_intensity", "trans_dance_crowd_mi_to_hi_09_v1_male^6", "Custom Dance New 103", AnimationOptions =
    {
        EmoteLoop = true,
    }},



    ------- Custom emo ------

    ["nekopiggy"] = {"fos_ep_1_p1-9", "csb_imran_dual-9", "Custom piggy", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},

    ["nekonew"] = {"fos_ep_1_p0-0", "cs_lazlow_dual-0", "Custom new", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    
    ["fort1"] = {"custom@what_idk", "what_idk", "Custom Fort 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort2"] = {"custom@salsa", "salsa", "Custom Fort 2 ~b~Salsa", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort3"] = {"custom@pickfromground", "pickfromground", "Custom Fort 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort4"] = {"custom@maraschino", "maraschino", "Custom Fort 4 ~b~Maraschino", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort5"] = {"custom@makarena", "makarena", "Custom Fort 5 ~b~Makarena", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort6"] = {"custom@gangnamstyle", "gangnamstyle", "Custom Fort 6 ~b~Gangnam Style", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort7"] = {"custom@dig", "dig", "Custom Fort 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort8"] = {"custom@circle_crunch", "circle_crunch", "Custom Fort 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort9"] = {"custom@armwave", "armwave", "Custom Fort 9 ~b~Wave Arms", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["fort10"] = {"custom@armswirl", "armswirl", "Custom Fort 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["fort11"] = {"custom@wanna_see_me", "wanna_see_me", "Custom Fort 11", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
    ["fort12"] = {"custom@rollie", "rollie", "Custom Fort 12", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
    ["fort13"] = {"custom@pullup", "pullup", "Custom Fort 13", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
    ["fort14"] = {"custom@downward_fortnite", "downward_fortnite", "Custom Fort 14", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},
    
    ["fort15"] = {"custom@billybounce", "billybounce", "Custom Fort 15", AnimationOptions =
    {
        EmoteMoving = false,
        EmoteLoop = true,
    }},

    ["nekonew2"] = {"fos_ep_1_p1-0", "cs_lazlow_dual-0", "Custom new2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},

    ["nekonew3"] = {"fos_ep_1_p1-0", "csb_imran_dual-0", "Custom new3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},

    ["nekonew4"] = {"fos_ep_1_p1-1", "cs_lazlow_dual-1", "Custom new4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},

    ["nekonew5"] = {"fos_ep_1_p1-1", "csb_anita_dual-1", "Custom new5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},

    ["nekonew6"] = {"fos_ep_1_p1-1", "csb_imran_dual-1", "Custom new6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},

    ["nekonew7"] = {"fos_ep_1_p5-2", "csb_william_dual-2", "Custom new7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nekonew8"] = {"timetable@trevor@ig_1", "ig_1_therearejustsomemoments_patricia", "Custom new8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nekonew9"] = {"impexp_int_l1-11", "mp_m_waremech_01_dual-11", "Custom new9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nekonew10"] = {"amb@prop_human_seat_computer@male@react_shock", "forward", "Custom new10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekonew11"] = {"amb@prop_human_seat_bar@male@elbows_on_bar@idle_b", "idle_d", "Custom new11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekonew12"] = {"amb@incar@male@security@idle_a", "idle_a", "Custom new12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekopost4"] = {"mpcas_int-2", "s_m_y_casino_01^1_dual-2", "Custom post4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nekohelp"] = {"missheist_agency3aig_19", "ground_call_help", "Custom help", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekosleep3"] = {"missheist_agency3amcs_4b", "crew_dead_crew2", "Custom sleep3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekosleep4"] = {"missheist_jewel", "gassed_npc_customer1", "Custom sleep4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekosleep5"] = {"missheist_jewel", "gassed_npc_customer2", "Custom sleep5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekosleep6"] = {"missheist_jewel", "gassed_npc_customer3", "Custom sleep6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekosleep7"] = {"missheist_jewel", "gassed_npc_customer4", "Custom sleep7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekositpost8"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Custom sitpost8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekocall"] = {"missheistdockssetup1ig_14", "floyd_ok_now_grab_the_container", "Custom Call", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekodrunk4"] = {"missheistpaletopinned", "pinned_against_wall_pro_loop_buddy", "Custom drunk4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekoyoga6"] = {"misslamar1leadinout", "yoga_02_idle_b", "Custom yoga6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekolieabout"] = {"missmic2ig_11", "mic_2_ig_11_a_p_one", "Custom lie about", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekobundle"] = {"missprologueig_2", "idle_on_floor_gaurd", "Custom bundle", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekobundle2"] = {"missprologueig_2", "idle_outside_cuboard_gaurd", "Custom bundle2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nekosleep8"] = {"missprologueig_6", "lying_dead_brad", "Custom sleep8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekosleep9"] = {"missprologueig_6", "lying_dead_player0", "Custom sleep9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekorod"] = {"misstrevor1ig_3", "action_b", "Custom rod", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekocheck2"] = {"misstrevor3", "bike_chat_b_loop_1", "Custom check2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekocheck3"] = {"misstvrram_5", "marines_idle_b", "Custom check3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekonumb"] = {"mp_arrest_paired", "crook_p1_idle", "Custom numb", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["nekonumb2"] = {"mp_cop_miss", "dazed", "Custom numb2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["anekosawatdee"] = {"fam_4_int_alt1-17", "cs_amandatownley_dual-17", "Custom sawatdee", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = true,
    }},
    ["anekosawatdee2"] = {"fos_ep_1_p1-26", "csb_imran_dual-26", "Custom sawatdee2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["incar"] = {"mini@prostitutes@sexnorm_veh", "bj_loop_male", "Sex in Car", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
    }},
    
    ["incar2"] = {"mini@prostitutes@sexnorm_veh", "bj_loop_prostitute", "Sex in Car 2", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["incar3"] = {"mini@prostitutes@sexlow_veh", "low_car_sex_loop_female", "Sex in Car 3", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekosex"] = {"misscarsteal2pimpsex", "pimpsex_hooker", "Custom Sex", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekosex2"] = {"misscarsteal2pimpsex", "pimpsex_pimp", "Custom Sex2", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekosex3"] = {"misscarsteal2pimpsex", "pimpsex_punter", "Custom Sex3", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekosex4"] = {"misscarsteal2pimpsex", "shagloop_hooker", "Custom Sex4", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekosex5"] = {"misscarsteal2pimpsex", "shagloop_pimp", "Custom Sex5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekosex6"] = {"rcmpaparazzo_2", "shag_action_poppy", "Custom Sex6", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekosex7"] = {"rcmpaparazzo_2", "shag_action_a", "Custom Sex5", AnimationOptions =
    {
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["nekogivebirth"] = {"mini@cpr@char_a@cpr_str", "cpr_kol", "Custom Give birth", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekotiedup"] = {"random@burial", "b_burial", "Custom Tied up", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekositchair7"] = {"anim@amb@nightclub@smoking@", "blunt_idle_a", "Custom Sit Chair 7", AnimationOptions =
    {    
        Prop = 'p_cs_joint_02',
        PropBone = 28422,
        PropPlacement = {0.0800003, -0.004999998, -0.035, 175.5002, 311.0003, 232.0},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositchair8"] = {"anim@amb@nightclub@smoking@", "blunt_idle_b", "Custom Sit Chair 8", AnimationOptions =
    {    
        Prop = 'p_cs_joint_02',
        PropBone = 28422,
        PropPlacement = {0.0800003, -0.004999998, -0.035, 175.5002, 311.0003, 232.0},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekodrink2"] = {"friends@frl@ig_1", "drink_lamar", "Custom Drink 2", AnimationOptions =
    {    
        Prop = 'prop_beer_patriot',
        PropBone = 60309,
        PropPlacement = {-0.03499999, -0.165, -0.015, 436.7987, 412.3998, 177.4},
        EmoteLoop = false,
        EmoteMoving = true,
        
    }},

    ["nekomc"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_dlg_tonymctony_laz", "Custom MC", AnimationOptions =
    {    
        Prop = 'p_ing_microphonel_01',
        PropBone = 57005,
        PropPlacement = {0.1249999, 0.03, -0.005000002, 87.10002, 149.8, 200.8},
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},


    ["nekojump1"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_d_player_a", "Custom Jump 1", AnimationOptions =
    {    
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekojump2"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_c_player_a", "Custom Jump 2", AnimationOptions =
    {    
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekojump3"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_b_player_a", "Custom Jump 3", AnimationOptions =
    {    
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekojump4"] = {"anim@arena@celeb@flat@solo@no_props@", "jump_a_player_a", "Custom Jump 4", AnimationOptions =
    {    
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},

    ["nekoleanbar5"] = {"switch@michael@pier", "pier_lean_smoke_idle", "Custom Lean Bar 5", AnimationOptions =
    {   
        Prop = 'prop_cs_ciggy_01',
        PropBone = 58867,
        PropPlacement = {0.0599999, 0.005, -0.015, 40.29999, 78.3, 124.1},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoleanbar6"] = {"switch@michael@pier", "pier_lean_smoke_idle", "Custom Lean Bar 6", AnimationOptions =
    {   
        Prop = 'p_cs_joint_02',
        PropBone = 58867,
        PropPlacement = {0.0599999, 0.005, -0.015, 40.29999, 78.3, 124.1},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoleanbar7"] = {"switch@michael@pier", "pier_lean_smoke_idle", "Custom Lean Bar 7", AnimationOptions =
    {   
        Prop = 'prop_cigar_03',
        PropBone = 58867,
        PropPlacement = {0.06499989, 0.015, -0.01, 0.0, 78.3, 299.6001},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekositmafia"] = {"safe@michael@ig_3", "cigar_idle_b_michael", "Custom Sit Mafia", AnimationOptions =
    {   
        Prop = 'prop_cigar_03',
        PropBone = 58867,
        PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekosmell2"] = {"safe@trevor@ig_8", "ig_8_huff_gas_player", "Custom Smell 2", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekofear"] = {"anim@heists@ornate_bank@hostages@cashier_b@", "flinch_loop_underfire", "Custom Fear", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekowipe"] = {"switch@franklin@cleaning_car", "001946_01_gc_fras_v2_ig_5_base", "Custom Wipe", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},

    ["nekositchair9"] = {"mini@strip_club@wade@", "leadin_loop_idle_a_stripper_a", "Custom Sit Chair 9", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekositmafia2"] = {"mini@strip_club@wade@", "leadin_loop_idle_a_wade", "Custom Sit Mafia 2", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekocheer2"] = {"mini@triathlon", "male_one_handed_a", "Custom Cheer 2", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekocheer3"] = {"mini@triathlon", "male_two_handed_a", "Custom Cheer 3", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekolean6"] = {"missarmenian1leadinoutarm_1_ig_14_leadinout", "leadin_loop", "Custom Lean 6", AnimationOptions =
    {   
        --Prop = 'prop_cigar_03',
        --PropBone = 13700,
        --PropPlacement = {0.03999992, 0.03, 0.015, 0.0, 78.3002, 180},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekodrunk"] = {"missbigscore1leadinoutbs_1_int", "leadin_loop_c_trevor", "Custom Drunk", AnimationOptions =
    {   
        Prop = 'prop_wine_rose',
        PropBone = 58867,
        PropPlacement = {0.02499996, -0.009999998, -0.3599998, 172.9002, 183.6, 155.3},
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekopee2"] = {"missbigscore1switch_trevor_piss", "piss_loop", "Custom Pee 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekolean7"] = {"misscarsteal1car_1_ext_leadin", "base_driver1", "Custom Lean 7", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekopee3"] = {"misscarsteal2peeing", "peeing_loop", "Custom Pee 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekoleanbar8"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "Custom Lean Bar 8", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekodapap"] = {"misscarstealfinalecar_5_ig_3", "leanleft_loop", "Custom Dapap", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekocool"] = {"misschinese1leadinoutchi_1_mcs_4", "chi_1_mcs_4_tao_idle_2", "Custom Cool", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekolean8"] = {"missclothing", "idle_a", "Custom Lean 8", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekolean9"] = {"missclothing", "idle_b", "Custom Lean 9", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekolean10"] = {"missclothing", "idle_c", "Custom Lean 10", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekosadly"] = {"missfam4leadinoutmcs2", "tracy_loop", "Custom Sadly", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoyoga2"] = {"missfam5_yoga", "c5_pose", "Custom Yoga 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoyoga3"] = {"missfam5_yoga", "c6_pose", "Custom Yoga 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoyoga4"] = {"missfam5_yoga", "c7_pose", "Custom Yoga 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekopost"] = {"missfbi4leadinoutfbi_4_int", "agents_idle_a_andreas", "Custom post", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekomonkey"] = {"missfbi5ig_30monkeys", "monkey_a_freakout_loop", "Custom Monkey", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekomonkey2"] = {"missfbi5ig_30monkeys", "monkey_c_freakout_loop", "Custom Monkey 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekocry"] = {"missfinale_a_ig_2", "trevor_death_reaction_pt", "Custom Cry", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoreverence"] = {"missfra2", "lamar_base_idle", "Custom Reverence", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekopost2"] = {"misshair_shop@barbers", "keeper_base", "Custom Post 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["nekopost3"] = {"misshair_shop@hair_dressers", "keeper_idle_a", "Custom Post 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoclamber"] = {"missheist_agency3aig_19", "ground_call_help", "Custom Clamber", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekosleep2"] = {"missheist_jewel", "cop_on_floor", "Custom Sleep 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoyoga5"] = {"misslamar1leadinout", "yoga_01_idle", "Custom Yoga 5", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositchair10"] = {"misslester1aig_3main", "air_guitar_01_b", "Custom Sit Chair 10", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositchair11"] = {"misslester1aig_5intro", "boardroom_intro_f_b", "Custom Sit Chair 11", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositchair12"] = {"misslester1aig_5intro", "boardroom_intro_f_c", "Custom Sit Chair 12", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekodig"] = {"missmic1leadinoutmic_1_mcs_2", "_leadin_trevor", "Custom Dig", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekowashface"] = {"missmic2_washing_face", "michael_washing_face", "Custom Wash Face", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekorepent"] = {"misstrevor1", "threaten_ortega_endloop_ort", "Custom Repent", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositchair13"] = {"misstrevor3", "bike_chat_a_1", "Custom Sit Chair 13", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekocheck"] = {"misstvrram_5", "marines_idle_b", "Custom Check", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekowash"] = {"timetable@floyd@clean_kitchen@idle_a", "idle_a", "Custom Wash", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekowash2"] = {"timetable@floyd@clean_kitchen@base", "base", "Custom Wash 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},

    ["nekositpost"] = {"switch@michael@smoking2", "loop", "Custom Sit Post", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositpost2"] = {"switch@trevor@pushes_bodybuilder", "001426_03_trvs_5_pushes_bodybuilder_idle_bb2", "Custom Sit Post 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositpost3"] = {"timetable@reunited@ig_10", "base_jimmy", "Custom Sit Post 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositpost4"] = {"anim@heists@fleeca_bank@hostages@intro", "intro_loop_ped_a", "Custom Sit Post 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositpost5"] = {"anim@amb@office@pa@male@", "greetng_b_intro", "Custom Sit Post 5", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositmafia3"] = {"anim@amb@office@boss@female@", "idle_d", "Custom Sit Mafia 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositpost6"] = {"timetable@ron@ig_3_p3", "ig_3_p3_base", "Custom Sit Post 6", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekositpost7"] = {"timetable@trevor@smoking_meth@idle_a", "idle_a", "Custom Sit Post 7", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekodrunk2"] = {"timetable@tracy@ig_7@base", "base", "Custom Drunk 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoverydrunk"] = {"timetable@tracy@ig_7@idle_a", "idle_a", "Custom Very Drunk", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekodrunk3"] = {"timetable@tracy@ig_7@idle_a", "idle_b", "Custom Drunk 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoparody"] = {"anim@mp_player_intupperthumb_on_ears", "idle_a", "Custom Parody", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["nekoparody2"] = {"anim@mp_player_intincarthumb_on_earsstd@ps@", "idle_a", "Custom Parody 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["nekoparody3"] = {"anim@mp_player_intincarfreakoutstd@rps@", "idle_a", "Custom Parody 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["nekoparody4"] = {"anim@mp_player_intcelebrationmale@thumb_on_ears", "thumb_on_ears", "Custom Parody 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["nekoparody5"] = {"anim@mp_player_intcelebrationfemale@thumb_on_ears", "thumb_on_ears", "Custom Parody 5", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["nekoshow"] = {"missfbi_s4mop", "lobby_security_fp_player", "Custom Show", AnimationOptions =
    {   
        EmoteLoop = false,
        EmoteMoving = true,
        
    }},
    ["nekopicksnot"] = {"anim@mp_player_intincarnose_pickstd@ps@", "exit", "Custom Pick snot", AnimationOptions =
    {   
        EmoteLoop = false,
        EmoteMoving = true,
        
    }},
    ["nekoparody6"] = {"anim@mp_player_intincardockbodhi@rds@", "idle_a_fp", "Custom Parody 6", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["nekofear2"] = {"anim@heists@prison_heistunfinished_biz@popov_react", "popov_flinch_a", "Custom Fear 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekofear3"] = {"anim@heists@prison_heistunfinished_biz@popov_react", "popov_flinch_b", "Custom Fear 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoheartbroken"] = {"anim@heists@prison_heistig_5_p1_rashkovsky_idle", "idle", "Custom Heart Broken", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekofear4"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_c", "Custom Fear 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekofear5"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_d", "Custom Fear 5", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekoincite"] = {"fos_ep_1_p5-1", "csb_anita_dual-1", "Custom Incite", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = true,
        
    }},
    ["nekomasturbate"] = {"switch@trevor@jerking_off", "trev_jerking_off_exit", "Custom Masturbate", AnimationOptions =
    {   
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["nekomasturbate2"] = {"switch@trevor@jerking_off", "trev_jerking_off_loop", "Custom Masturbate 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekotest87"] = {"switch@trevor@puking_into_fountain", "trev_fountain_puke_loop", "Custom test87", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekotest88"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "Custom test88", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekotest89"] = {"anim@move_hostages@male", "male_idle_to_cower", "Arrestation Police", AnimationOptions =
    {   
        EmoteLoop = false,
        EmoteMoving = false,
        
    }},
    ["nekositmassage"] = {"missheistdocks2aleadinoutlsdh_2a_int", "massage_loop_2_floyd", "Custom Sit Massage", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekomassage"] = {"missheistdocks2aleadinoutlsdh_2a_int", "massage_loop_2_trevor", "Custom Massage", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekomassage2"] = {"missheistdocks2aleadinoutlsdh_2a_int", "massage_loop_floyd", "Custom Massage 2", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekomassage3"] = {"missheistdocks2bleadinoutlsdh_2b_int", "leg_massage_b_floyd", "Custom Massage 3", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    ["nekomassage4"] = {"missheistdocks2bleadinoutlsdh_2b_int", "leg_massage_floyd", "Custom Massage 4", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
        
    }},
    
    
    
    ["nekofoldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Custom Fold Arms 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["nekocrossarms6"] = {"random@shop_gunstore", "_idle", "Custom Crossarms 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    -------------------

    
    --- CHINITOS RAROS

    ["p1"] = {"penguin@head", "penguinhead", "Custom Pose 1", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p2"] = {"penguin@love", "penguinlove", "Custom Pose 2", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p3"] = {"penguin@standpickpocket", "penguin_standpickpocket", "Custom Pose 3", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p4"] = {"penguin@2fingers_up", "penguin_2_fingers_up", "Custom Pose 4", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p5"] = {"penguin@pokcheek", "penguin_pok_cheek", "Custom Pose 5", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p6"] = {"penguin@hold_the_cheek", "penguin_hold_the_cheek", "Custom Pose 6", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["p7"] = {"penguin@pose", "penguin_pose", "Custom Pose 7", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p8"] = {"penguin@pose2", "penguin_pose2", "Custom Pose 8", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["p9"] = {"penguin@pose3", "penguin_pose3", "Custom Pose 9", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["q1"] = {"penguin@pose4", "penguin_pose4", "Custom Pose 10", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["q2"] = {"penguin@pose5", "penguin_pose5", "Custom Pose 11", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["q3"] = {"penguin@pose6", "penguin_pose6", "Custom Pose 12", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["q4"] = {"penguin@pose7", "penguin_pose7", "Custom Pose 13", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["q6"] = {"penguin@pose8", "penguin_pose8", "Custom Pose 14", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["q7"] = {"penguin@pose9", "penguin_pose9", "Custom Pose 15", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["q8"] = {"penguin@pose10", "penguin_pose10", "Custom Pose 16", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["q9"] = {"penguin@dab", "penguin_dab", "Custom Pose 17", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["z1"] = {"penguin@dab1", "penguin_dab1", "Custom Pose 18", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = true,
    }},

    ["zdance1"] = {"anim@amb@nightclub@dancers@club_ambientpeds@med-hi_intensity", "mi-hi_amb_club_10_v1_male^6", "ZNew Dance 1", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance2"] = {"amb@code_human_in_car_mp_actions@dance@bodhi@ds@base", "idle_a_fp", "ZNew Dance 2", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance3"] = {"amb@code_human_in_car_mp_actions@dance@bodhi@rds@base", "idle_b", "ZNew Dance 3", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance4"] = {"amb@code_human_in_car_mp_actions@dance@std@ds@base", "idle_a", "ZNew Dance 4", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_male^6", "ZNew Dance 5", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance6"] = {"anim@amb@nightclub@dancers@crowddance_facedj@low_intesnsity", "li_dance_facedj_09_v1_male^6", "ZNew Dance 6", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance7"] = {"anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", "trans_dance_facedj_hi_to_li_09_v1_male^6", "ZNew Dance 7", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance8"] = {"anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_hi_07_v1_male^6", "ZNew Dance 8", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance9"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_13_v2_male^6", "ZNew Dance 9", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance10"] = {"anim@amb@nightclub@dancers@crowddance_groups_transitions@from_hi_intensity", "trans_dance_crowd_hi_to_li__07_v1_male^6", "ZNew Dance 10", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance11"] = {"anim@amb@nightclub@dancers@crowddance_single_props@hi_intensity", "hi_dance_prop_13_v1_male^6", "ZNew Dance 11", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance12"] = {"anim@amb@nightclub@dancers@crowddance_single_props_transitions@from_med_intensity", "trans_crowd_prop_mi_to_li_11_v1_male^6", "ZNew Dance 12", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance13"] = {"anim@amb@nightclub@dancers@crowddance_groups@low_intensity", "li_dance_crowd_17_v1_male^6", "ZNew Dance 13", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance14"] = {"anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_med_intensity", "trans_dance_facedj_mi_to_li_09_v1_male^6", "ZNew Dance 14", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance15"] = {"timetable@tracy@ig_5@idle_b", "idle_e", "ZNew Dance 15", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance16"] = {"special_ped@mountain_dancer@monologue_1@monologue_1a", "mtn_dnc_if_you_want_to_get_to_heaven", "ZNew Dance 16", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance17"] = {"special_ped@mountain_dancer@monologue_4@monologue_4a", "mnt_dnc_verse", "ZNew Dance 17", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance18"] = {"anim@amb@nightclub@dancers@crowddance_single_props@", "hi_dance_prop_09_v1_male^6", "ZNew Dance 18", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance19"] = {"anim@amb@nightclub@dancers@dixon_entourage@", "mi_dance_facedj_15_v1_male^4", "ZNew Dance 19", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance20"] = {"anim@amb@nightclub@dancers@tale_of_us_entourage@", "mi_dance_prop_13_v2_male^4", "ZNew Dance 20", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance21"] = {"anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco", "ZNew Dance 21", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance22"] = {"anim@mp_player_intcelebrationfemale@raise_the_roof", "raise_the_roof", "ZNew Dance 22", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance23"] = {"anim@mp_player_intcelebrationmale@cats_cradle", "cats_cradle", "ZNew Dance 23", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance24"] = {"anim@mp_player_intupperbanging_tunes", "idle_a", "ZNew Dance 24", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},

    ["zdance25"] = {"anim@amb@nightclub@dancers@crowddance_facedj_transitions@", "trans_dance_facedj_hi_to_mi_11_v1_female^6", "ZNew Dance 25", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance26"] = {"anim@amb@nightclub@dancers@crowddance_facedj_transitions@from_hi_intensity", "trans_dance_facedj_hi_to_li_07_v1_female^6", "ZNew Dance 26", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance27"] = {"anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", "hi_dance_crowd_09_v1_female^6", "ZNew Dance 27", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance28"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_06_base_laz", "ZNew Dance 28", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance29"] = {"amb@code_human_in_car_mp_actions@dance@bodhi@ds@base", "idle_a_fp", "ZNew Dance 29", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance30"] = {"amb@code_human_in_car_mp_actions@dance@bodhi@rds@base", "idle_b", "ZNew Dance 30", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance31"] = {"anim@mp_player_intincardancebodhi@ds@", "idle_a_fp", "ZNew Dance 31", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance32"] = {"anim@mp_player_intincardancebodhi@rds@", "idle_a", "ZNew Dance 32", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance33"] = {"anim@mp_player_intincardancebodhi@rps@", "idle_c", "ZNew Dance 33", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance34"] = {"anim@mp_player_intincardancebodhi@ps@", "idle_a_fp", "ZNew Dance 34", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance35"] = {"special_ped@mountain_dancer@base", "base", "ZNew Dance 35", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance36"] = {"special_ped@mountain_dancer@monologue_1@monologue_1a", "mtn_dnc_if_you_want_to_get_to_heaven", "ZNew Dance 36", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance37"] = {"special_ped@mountain_dancer@monologue_2@monologue_2a", "mnt_dnc_angel", "ZNew Dance 37", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["zdance38"] = {"special_ped@mountain_dancer@monologue_4@monologue_4a", "mnt_dnc_verse", "ZNew Dance 38", AnimationOption =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},

    ["zztwerking3"] = {"divined@drillb2@new", "twerkmocap2", "Twerking #3", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zztwerking2"] = {"divined@drillb2@new", "splitstwerk2", "Twerking #2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zztwerking"] = {"divined@drillb2@new", "twerking", "Twerking #1", AnimationOptions =
    {
        EmoteLoop = true
    }},
     
    ["zdancesolo"] = {"anim@amb@nightclub@dancers@crowddance_facedj_transitions@", "trans_dance_facedj_hi_to_mi_09_v1_male^4", "Dance Solo ~b~ DEADO - V2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["zdancesolo3"] = {"special_ped@mountain_dancer@base", "base", "Dance Solo 3 ~b~ DEADO - V2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["zdancesolo4"] = {"anim@mp_player_intcelebrationfemale@raise_the_roof", "raise_the_roof", "Dance Solo 4 ~b~ DEADO - V2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["zdancepartyf"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^1", "Dance Party Female ~b~ DEADO - V2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["zdancepartyf2"] = {"anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^6", "Dance Party Female 2 ~b~ DEADO - V2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["zdanceparty3"] = {"anim@mp_player_intcelebrationfemale@heart_pumping", "heart_pumping", "Dance Party 3 ~b~ DEADO - V2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},


    ["zdancedisco"] = {"anim@mp_player_intcelebrationfemale@uncle_disco", "uncle_disco", "Dance Disco ~b~ DEADO - V2", AnimationOptions =
    {
       EmoteLoop = true,
    }},
    ["zlaying"] = {"timetable@ron@ig_3_couch", "laying", "Laying ~b~ DEADO - V2", AnimationOptions =  
    {
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["zcrouch"] = {"combat@chg_stance", "crouch", "Crouch ~b~ DEADO - V2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["zcarsleep"] = {"mp_cp_stolen_tut", "dazed", "Slep In Car ~b~ DEADO - V2", AnimationOptions =  
    {  
       EmoteMoving = false,
       EmoteLoop = true,
    }},
    ["zhandsup2"] = {"mp_defend_base", "guard_handsup_loop", "Hands Up 2 ~b~ DEADO - V2", AnimationOptions =  
    {  
    EmoteMoving = false,
     EmoteLoop = true,
    }},
    ["scrolling"] = {"scrollingpose@queensisters", "scrolling_clip", "scrolling", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["selfiekylie"] = {"selfiekilye@queensisters", "kilye_clip", "selfiekylie", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["handkylie"] = {"handkylie@queensisters", "kylie_clip", "handkylie", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sitkylie"] = {"sitkylie@queensisters", "kylie_clip", "SitKylie", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sitpose"] = {"perlenfuchs@sit_pose_peace1", "sit_pose_peace1_clip", "SitPose", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["bball1"] = {"anim@male_basketball_01", "m_basketball_01_clip", "Basket Ball Pose 1 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["standbag"] = {"standbag1@blackqueen", "standbag1_clip", "StandBag", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["standing"] = {"perlenfuchs@standing_wall2", "standing_wall2_clip", "Standing", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["bball2"] = {"anim@male_basketball_02", "m_basketball_02_clip", "Basket Ball Pose 2 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["ballerin"] = {"perlenfuchs@ballerina_1", "ballerina_1_clip", "Ballerin", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    ["bball3"] = {"anim@male_basketball_03", "m_basketball_03_clip", "Basket Ball Pose 3 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    
    ["bball4"] = {"anim@male_basketball_04", "m_basketball_04_clip", "Basket Ball Pose 4 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    
    ["bball5"] = {"anim@male_basketball_05", "m_basketball_05_clip", "Basket Ball Pose 5 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    
    
    ["bball6"] = {"anim@male_basketball_06", "m_basketball_06_clip", "Basket Ball Pose 6 (Smos)", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["sport"] = {"perlenfuchs@sport_2", "sport_2_clip", "Sport", AnimationOptions =
    {
        EmoteLoop = true,
        EmoteMoving = false,
    }},
       ["2head"] = {"2man2head@animation", "2man2head_clip", "~b~ 2 Man 2 Head", AnimationOptions =
       {
        EmoteLoop = true,
        EmoteMoving = false,
       }},
       ["2fucku"] = {"2manfcku@animation", "2manfcku_clip", "~b~ 2 Man Fuck u", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["wall2"] = {"walk2@spider", "walll2_clip", "~b~ Wall2", AnimationOptions =
       {
        EmoteLoop = true,
        EmoteMoving = false,
       }},
       ["walk2"] = {"walk2@spider", "walk2_clip", "~b~ Walk2", AnimationOptions =
       {
        EmoteLoop = true,
        EmoteMoving = false,
       }},
       ["hd"] = {"hatsdown@animation", "hatsdown_clip", "~b~ Hats Down", AnimationOptions =
       {
        EmoteLoop = true,
        EmoteMoving = false,
       }},
       ["od"] = {"offthat@animation", "offthat_clip", "~b~ Off that", AnimationOptions =
       {
        EmoteLoop = true,
        EmoteMoving = false,
       }},
       ["so"] = {"standon@animation", "standon_clip", "~g~ Top Car", AnimationOptions =
       {
        EmoteLoop = true,
        EmoteMoving = false,
       }},
       ["westbaby"] = {"westbaby@animation", "westbaby_clip", "~o~ WestSide", AnimationOptions =
       {
        EmoteLoop = true,
        EmoteMoving = false,
       }},
       ["spider"] = {"spider42@animation", "spider42_clip", "Spider", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["heart"] = {"heart@animation", "heart_clip", "Heart", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["gang"] = {"gang@animation", "gang_clip", "Gang", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["woman2"] = {"perlenfuchs@woman_pose1", "woman_pose1_clip", "Woman2", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["sexyWall2"] = {"perlenfuchs@sexy_wall1", "sexy_wall1_clip", "sexywall2", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["freeStyle"] = {"custom@freestyle_lxcky", "freestyle_clip", "freestyle", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["sexywall"] = {"perlenfuchs@sexy_wall", "sexy_wall_clip", "sexywall", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["holdcap"] = {"perlenfuchs@hold_cap", "hold_cap_clip", "holdcap", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["cantseeyou"] = {"perlenfuchs@cant_see_you_male", "cant_see_you_male_clip", "cantseeyou", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["noface"] = {"noface2@spider", "noface2_clip", "noface", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["bike"] = {"bike3@animation", "bike3_clip", "bike", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["posefuchs"] = {"perlenfuchs@pose3", "pose3_clip", "posefuchs", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["malegun"] = {"perlenfuchs@male_gun", "male_gun_clip", "malegun", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["fuchsmale"] = {"perlenfuchs@male_fxckyou", "male_fxckyou_clip", "fuchsmale", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["lamp"] = {"perlenfuchs@lamp", "lamp_clip", "lamp", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["fucs"] = {"perlenfuchs@fxckyou", "fxckyou_clip", "fucs", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["fuchs2"] = {"perlenfuchs@fxckyou2", "fxckyou2_clip", "fuchs2", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["custom"] = {"pastelblood@animation", "pastelblood_clip", "Custom", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["custom2"] = {"pepitosign4@animation", "pepitosign4_clip", "Custom2", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["custom3"] = {"westsidesign@animation", "westsidesign_clip", "Custom3", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["custom4"] = {"banks@juiceplug", "banks2", "Custom4", AnimationOptions =
       {
       EmoteLoop = true,
       EmoteMoving = false,
       }},
       ["custom5"] = {"banks@animation", "banks1", "Custom5", AnimationOptions =
       {
       EmoteLoop = true,
       EmoteMoving = false,
       }},
       ["custom6"] = {"nocap5@animation", "nocap5_clip", "Custom6", AnimationOptions =
       {
       EmoteLoop = true,
       EmoteMoving = false,
       }},
       ["custom7"] = {"nocap7@animation", "nocap7_clip", "Custom7", AnimationOptions =
       {
       EmoteLoop = true,
       EmoteMoving = false,
       }},
       ["custom8"] = {"duoanim2@animation", "duoanim2_clip", "Custom8", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom9"] = {"217@aim2x@animation", "aim2x_clip", "Custom9", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom10"] = {"mvpsign3@animacion", "mvpsign3_clip", "Custom10", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom11"] = {"cripsgangsign@animation", "cripsgangsign_clip", "Custom11", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom12"] = {"69nine@animation", "69nine_clip", "Custom12", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom13"] = {"chillpose@animation", "chillpose_clip", "Custom13", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom14"] = {"couple1@animation", "couple1_clip", "Custom14", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom15"] = {"couple2@animation", "couple2_clip", "Custom15", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom16"] = {"glock@animation", "dk_clip", "Custom16", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom17"] = {"lean@animation", "dk_clip", "Custom17", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom18"] = {"pastelgangsign2@animation", "pastelgangsign2_clip", "Custom18", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom19"] = {"pastelpistol@animation", "pastelpistol_clip", "Custom19", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom20"] = {"maosnobolso@animation", "maosnobolso_clip", "Custom20", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom21"] = {"paspose@animation", "paspose_clip", "Custom21", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom22"] = {"cigarpose@animation", "cigarpose_clip", "Custom22", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom23"] = {"drunk@animation", "drunk_clip", "Custom23", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom24"] = {"posepis@animation", "posepis_clip", "Custom24", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom25"] = {"instapose2@animation", "instapose2_clip", "Custom25", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom26"] = {"instapose@animation", "instapose_clip", "Custom26", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom27"] = {"gangpose@animation", "gangpose_clip", "Custom27", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom28"] = {"simple@animation", "simple_clip", "Custom28", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom29"] = {"ohgeesy@animation", "ohgeesy_clip", "Custom29", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom30"] = {"pastel3@animation", "pastel3_clip", "Custom30", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom31"] = {"pastelpose1@animation", "pastelpose1_clip", "Custom31", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom32"] = {"pasteldedos2@animation", "pasteldedos2_clip", "Custom32", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom33"] = {"lukitophoto2@animation", "lukitophoto2_clip", "Custom33", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom34"] = {"draco@arves", "draco_clip", "Custom34", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom35"] = {"wristcheck@animation", "wristcheck_clip", "Custom35", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom36"] = {"crossfinger@animation", "crossfinger_clip", "Custom36", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom37"] = {"seat1@animation", "seat1_clip", "Custom37", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom38"] = {"bag@animation", "bag_clip", "Custom38", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom39"] = {"five@nyck", "five_clip", "Custom39", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom40"] = {"capper@nyck", "capper_clip", "Custom40", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom41"] = {"pose@nyck", "pose_clip", "Custom41", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom42"] = {"pose2@nyck", "pose2_clip", "Custom42", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom43"] = {"pose3@nyck", "pose3_clip", "Custom43", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom44"] = {"mafiag@nyck", "mafiag_clip", "Custom44", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom45"] = {"15idk@animation", "15idk_clip", "Custom45", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom46"] = {"bkcr@animation", "bkcr_clip", "Custom46", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom47"] = {"bhw@animation", "bhw_clip", "Custom47", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom48"] = {"99mafia@animation", "99mafia_clip", "Custom48", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom49"] = {"krank@animation", "krank_clip", "Custom49", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom50"] = {"bangin@casual", "girl_clip", "Custom50", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom51"] = {"bangin@casual", "man_clip", "Custom51", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom52"] = {"hood@casual", "girl_clip", "Custom52", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom53"] = {"hood@casual", "male_clip", "Custom53", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom54"] = {"blooh@animation", "blooh_clip", "Custom54", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom55"] = {"famf@animation", "famf_clip", "Custom55", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom56"] = {"fuckb@animation", "fuckb_clip", "Custom56", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom57"] = {"grabber@animation", "grabber_clip", "Custom57", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom58"] = {"mfnapk@animation", "mfnapk_clip", "Custom58", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom59"] = {"neighbour@animation", "neighbour_clip", "Custom59", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom60"] = {"nonapps@animation", "nonapps_clip", "Custom60", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom61"] = {"zuna@animation", "zuna_clip", "Custom61", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom62"] = {"holdhip@animation", "holdhip_clip", "Custom62", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom63"] = {"holdhipb@animation", "holdhipb_clip", "Custom63", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom64"] = {"holdass@animation", "holdass_clip", "Custom64", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom65"] = {"holdassb@animation", "holdassb_clip", "Custom65", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom66"] = {"coupleseat1@animation", "coupleseat1_clip", "Custom66", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom67"] = {"coupleseat1b@animation", "coupleseat1b_clip", "Custom67", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom68"] = {"crshx@fix", "fix", "Custom68", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom69"] = {"crshx2@fix", "fix", "Custom69", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom70"] = {"mymsign1@animacion", "mymsign1_clip", "Custom70", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom71"] = {"mymsign20@animacion", "mymsign20_clip", "Custom71", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom72"] = {"mymsign30@animacion", "mymsign30_clip", "Custom72", AnimationOptions =
       {
           EmoteLoop = false,
       }},
       ["custom73"] = {"chillimannn@animation", "chillimannn_clip", "Custom73", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom74"] = {"eastside@marisfreepack", "eastside", "Custom74", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom75"] = {"duoanim1@animation", "duoanim1_clip", "Custom75", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom76"] = {"hassanblood@animation", "hb_clip", "Custom76 ~b~Blood", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom77"] = {"bloodkiller@marisfreegpack", "bloodkiller", "Custom77", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom78"] = {"mafiacrip@marisfreegsignpack", "mafiacrip", "Custom78", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom79"] = {"cripkiller@marisgfreepack", "cripkiller", "Custom79", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom80"] = {"showback_naybahood@crip", "showback_naybahood", "Custom80", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom81"] = {"187@animation", "187", "Custom81", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom82"] = {"rollin60spose2@animation", "rollin60spose2", "Custom82", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom83"] = {"43_gangster@crip", "43_gangster", "Custom83", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom84"] = {"cripkiler@marisfreegsigns", "cripkiler", "Custom84", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom85"] = {"anim@60sv2", "60sv2_clip", "Custom85", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom86"] = {"anim@sixfingers", "six_clip", "Custom86", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom87"] = {"anim@nhtnh", "nhtnh_clip", "Custom87", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom88"] = {"anim@nayba", "nayba_clip", "Custom88", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom89"] = {"anim@fcktrays", "fcktrays_clip", "Custom89", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom90"] = {"anim@owe", "owe_clip", "Custom90", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom91"] = {"sensual1@casual", "girl_clip", "Custom91", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom92"] = {"sensual1@casual", "man_clip", "Custom92", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom93"] = {"ygzpose@animation", "dream_clip", "Custom93", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom94"] = {"downfingers@dreamdel", "dreamdel_clip", "Custom94", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom95"] = {"woopose@custom_anim", "woo_clip", "Custom95", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom96"] = {"sekposev3@animation", "v3", "Custom96", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom97"] = {"sekpose2v3@animation", "v3", "Custom97", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom98"] = {"sekpose2@animation", "clip", "Custom98", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom99"] = {"doubleo@animation", "doubleo_clip", "Custom99 ~b~ Grapes", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom100"] = {"missionary@casual", "girl_clip", "Custom100", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom101"] = {"missionary@casual", "man_clip", "Custom101", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom102"] = {"leangunanimation", "leangun_clip", "Custom102", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom103"] = {"whiskaspose1@stand", "whiskaspose1_makebywhiskas", "Custom103", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom104"] = {"whiskaspose2@stand", "whiskaspose2_makebywhiskas", "Custom104", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom105"] = {"whiskaspose3@stand", "whiskaspose3_makebywhiskas", "Custom105", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom106"] = {"holdracks@animation", "rackz_clip", "Custom106", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom107"] = {"customdeneme@anim", "customdeneme_clip", "Custom107", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom112"] = {"nhoneanimation", "nhone_clip", "Custom112", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom113"] = {"ceek2animation", "ceek2_clip", "Custom113 ~b~Crips K", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom114"] = {"foek1animation", "foek1_clip", "Custom114 ~b~ Rollin 40 K", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom115"] = {"drillz@headtilt_anim", "headtilt_clip", "Custom115", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom116"] = {"drillz@laydown_anim", "laydown_clip", "Custom116", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom117"] = {"drillz@selfiewall_anim", "selfiewall_clip", "Custom117", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom118"] = {"drillz@leanfemalesit_anim", "leanfemalesit_clip", "Custom119", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom119"] = {"drillz@ruby_anim", "ruby_clip", "Custom119", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom120"] = {"posing1@animation", "posing1_clip", "Custom120", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom121"] = {"posing2@animation", "posing2_clip", "Custom121", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom122"] = {"posing3@animation", "posing3_clip", "Custom122", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom123"] = {"sureno@rabbit1", "rabbit_clip", "Custom123", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom124"] = {"sureno@thrtn", "thrtn_clip", "Custom124", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom125"] = {"ney3@animation", "ney_clip", "Custom125", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom126"] = {"rollz@walkpeace", "walkpeace_clip", "Custom126", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom127"] = {"ney@animation", "ney_clip", "Custom127", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom128"] = {"idleney@animation", "idle_clip", "Custom128", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom129"] = {"leanwoface@animation", "lean_clip", "Custom129", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom130"] = {"esse@drakowall", "drakowall_clip", "Custom130", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom131"] = {"nbn@animation", "nbn_clip", "Custom131", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom132"] = {"wrldmods@trippieredd", "trippieredd", "Custom132", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom133"] = {"lunyx@random001", "random001", "Custom133", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom134"] = {"lunyx@random002", "random002", "Custom134", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom135"] = {"lunyx@random003", "random003", "Custom135", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom136"] = {"leanganglit@animation", "leanganglit_clip", "Custom136", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom137"] = {"shlass@animation", "shlass_clip", "Custom137", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom138"] = {"gangsign1@animation", "gangsign1_clip", "Custom138", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom139"] = {"doublec@animation", "doublec_clip", "Custom139", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom140"] = {"handsup@animation", "handsup_clip", "Custom140", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom141"] = {"holdhands@anim", "holdhands_clip", "Custom141", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom142"] = {"syx@kiss02a", "kiss02a", "Custom142", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom143"] = {"syx@kiss02b", "kiss02b", "Custom143", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom144"] = {"syx@cute01", "cute01", "Custom144", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom145"] = {"syx@cute02", "cute02", "Custom145", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom146"] = {"syx@cute03", "cute03", "Custom146", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom147"] = {"syx@cute04", "cute04", "Custom147", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom148"] = {"syx@cute05", "cute05", "Custom148", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom149"] = {"lunyx@rgmp01", "rgmp01", "Custom149", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom150"] = {"lunyx@rgmp02", "rgmp02", "Custom150", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom151"] = {"lunyx@rgmp03", "rgmp03", "Custom151", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom152"] = {"lunyx@rgmp06", "rgmp06", "Custom152", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom153"] = {"lunyx@rgmp07", "rgmp07", "Custom153", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom154"] = {"gdkanimationanimation", "gdkanimation_clip", "Custom154", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom155"] = {"moneyspread1@animation", "moneyspread1_clip", "Custom155", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom156"] = {"divined@rpack@new", "alchemy", "Custom156", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom157"] = {"divined@rpack@new", "badmood", "Custom157", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["gsign500"] = {"divined@rpack@new", "bunnyhop", "YGz Dance Bunny Hop ", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom159"] = {"divined@rpack@new", "burpee", "Custom159 ~b~Sport", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom160"] = {"divined@rpack@new", "callme", "Custom160", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom161"] = {"divined@rpack@new", "coronet", "Custom161", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom162"] = {"divined@rpack@new", "dcry", "Custom162", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom163"] = {"divined@rpack@new", "hailcab", "Custom163", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom164"] = {"divined@rpack@new", "kepler", "Custom164", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom165"] = {"divined@rpack@new", "mindblown", "Custom165", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom166"] = {"divined@rpack@new", "uproar", "Custom166 ~b~ Fight", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom167"] = {"divined@rpack@new", "yeet", "Custom167", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom168"] = {"rollz@twofingers", "twofingers_clip", "Custom168", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom169"] = {"rollz@leanmiddle", "leanmiddle_clip", "Custom169", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom170"] = {"anim@playboyig", "playboy_clip", "Custom170", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom171"] = {"anim@doublerabbit", "rabbit_clip", "Custom171", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom172"] = {"nhcanimation", "nhc_clip", "Custom172", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom173"] = {"gangisgn1animation", "gangisgn1_clip", "Custom173", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom174"] = {"gangsign2animation", "gangsign2_clip", "Custom174", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom175"] = {"drillz@femalefuckoff_anim", "fuckoff_clip", "Custom175", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom176"] = {"drillz@fucktheopps_anim", "fucktheopps_clip", "Custom176", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom177"] = {"drillz@fuckyou_anim", "fuckyou_clip", "Custom177", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom178"] = {"drillz@oneleg_anim", "oneleg_clip", "Custom178", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom179"] = {"drillz@thebirdfemale_anim", "thebird_clip", "Custom179", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom180"] = {"f13ganganimation", "f13gang_clip", "Custom180", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom181"] = {"cosmocrippah", "crippah_clip", "Custom181", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom182"] = {"anim@sureno", "sureno_clip", "Custom182", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom183"] = {"anim@guttagang", "gutta_clip", "Custom183", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["custom184"] = {"anim@fog_rifle_relaxed", "rifle_relaxed_clip", "Custom184", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom185"] = {"anim@stack_pointman", "pointman_clip", "Custom185", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom186"] = {"anim@stack_two_man", "two_man_clip", "Custom186", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom187"] = {"anim@stack_three_man", "three_man_clip", "Custom187", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom188"] = {"anim@highlow_low_lean", "low_lean_clip", "Custom188", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom189"] = {"anim@highlow_high_lean", "high_lean_clip", "Custom189", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom190"] = {"anim@gang_pistol_westside", "pistol_westside_clip", "Custom190", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom191"] = {"anim@gang_one", "gang_one_clip", "Custom191", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom192"] = {"anim@gang_two", "gang_two_clip", "Custom192", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom193"] = {"anim@model_car_fancy", "car_fancy_clip", "Custom193", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom194"] = {"anim@model_stretched_leg", "stretched_leg_clip", "Custom194", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom195"] = {"anim@car_sitting_fuckyou", "sitting_fuckyou_clip", "Custom195", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom196"] = {"anim@car_sitting_cute", "sitting_cute_clip", "Custom196", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom197"] = {"anim@model_bike", "bike_clip", "Custom197", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom198"] = {"anim@model_bike_two", "bike_two_clip", "Custom198", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom199"] = {"anim@peace_selfie", "peace_clip", "Custom199", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom200"] = {"anim@stance_folded_arms", "folded_arms_clip", "Custom200", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom201"] = {"anim@stance_kneeling_cute", "kneeling_cute_clip", "Custom201", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom202"] = {"anim@sit_cute_window", "cute_window_clip", "Custom202", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom203"] = {"anim@car_cute_sit", "cute_sit_clip", "Custom203", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom204"] = {"anim@selfie_peacesign_cute", "peacesign_cute_clip", "Custom204", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom205"] = {"anim@female_smoke_01", "f_smoke_01_clip", "Custom205", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom206"] = {"anim@female_lean_01", "f_lean_01_clip", "Custom206", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom207"] = {"anim@female_selfie_1st_01", "f_selfie_1st_01_clip", "Custom207", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom208"] = {"anim@female_model_01", "f_model_01_clip", "Custom208", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom209"] = {"anim@female_model_02", "f_model_02_clip", "Custom209", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom210"] = {"anim@female_model_03", "f_model_03_clip", "Custom210", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom211"] = {"anim@selfie_knees_cute", "knees_cute_clip", "Custom211", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom212"] = {"anim@sw_sit_chill", "sit_chill_clip", "Custom212", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom213"] = {"anim@sw_chill_pose", "chill_pose_clip", "Custom213", AnimationOptions =
       {    
        EmoteLoop = true,
        EmoteMoving = false,
       }},
       ["custom214"] = {"anim@stance_handgun", "handgun_clip", "Custom214", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom215"] = {"anim@stance_handgun", "handgun_clip", "Custom215", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["custom216"] = {"anim@shooter_stance", "stance_clip", "Custom216", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom217"] = {"anim@shooter_stance", "stance_clip", "Custom217", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["custom218"] = {"thot_pose", "thot_clip", "Custom218", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom219"] = {"anim@fuck_you_selfie", "fuck_you_selfie_clip", "Custom219", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["custom220"] = {"lunyx@random@v3@pose001", "random@v3@pose001", "Custom220", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom221"] = {"lunyx@random@v3@pose002", "random@v3@pose002", "Custom221", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom222"] = {"lunyx@random@v3@pose003", "random@v3@pose003", "Custom222", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom223"] = {"lunyx@random@v3@pose004", "random@v3@pose004", "Custom223", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom224"] = {"lunyx@random@v3@pose005", "random@v3@pose005", "Custom224", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom225"] = {"lunyx@random@v3@pose006", "random@v3@pose006", "Custom225", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom226"] = {"lunyx@random@v3@pose007", "random@v3@pose007", "Custom226", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       
       ["custom227"] = {"lunyx@random@v3@pose008", "random@v3@pose008", "Custom227", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom228"] = {"lunyx@random@v3@pose009", "random@v3@pose009", "Custom228", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom229"] = {"lunyx@random@v3@pose010", "random@v3@pose010", "Custom229", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom230"] = {"lunyx@random@v3@pose011", "random@v3@pose011", "Custom230", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom231"] = {"lunyx@random@v3@pose012", "random@v3@pose012", "Custom231", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom232"] = {"lunyx@random@v3@pose013", "random@v3@pose013", "Custom232", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom233"] = {"lunyx@random@v3@pose014", "random@v3@pose014", "Custom233", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom234"] = {"lunyx@random@v3@pose015", "random@v3@pose015", "Custom234", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom235"] = {"lunyx@random@v3@pose016", "random@v3@pose016", "Custom235", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom236"] = {"lunyx@random@v3@pose017", "random@v3@pose017", "Custom236", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom237"] = {"lunyx@random@v3@pose018", "random@v3@pose018", "Custom237", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom238"] = {"lunyx@random@v3@pose019", "random@v3@pose019", "Custom238", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom239"] = {"lunyx@random@v3@pose020", "random@v3@pose020", "Custom239", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom240"] = {"testanim@alina", "testanim_clip", "Custom240", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom241"] = {"hoe@anim", "hoe_clip", "Custom241", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom242"] = {"hoe2@anim", "hoe2_clip", "Custom242", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom243"] = {"expertmode@anim", "expertmode_clip", "Custom243", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom244"] = {"pose1@anim", "pose1_clip", "Custom244", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom245"] = {"expertmode2@anim", "expertmode2_clip", "Custom245", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom246"] = {"1foot@anim", "1foot_clip", "Custom246", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom247"] = {"car1@anim", "car1_clip", "Custom247", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom248"] = {"car2@anim", "car2_clip", "Custom248", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom249"] = {"selfie@anim", "selfie_clip", "Custom249", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom250"] = {"selfie2@anim", "selfie2_clip", "Custom250", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom251"] = {"randompose1@anim", "randompose1_clip", "Custom251", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom252"] = {"randompose2@anim", "randompose2_clip", "Custom252", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom253"] = {"stripper1@anim", "stripper1_clip", "Custom253", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom254"] = {"strip2@anim", "strip2_clip", "Custom254", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom255"] = {"pose5@anim", "pose5_clip", "Custom255", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom256"] = {"slavepose@anim", "slavepose_clip", "Custom256", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom257"] = {"gangsign50@animation", "gangsign50_clip", "Custom257", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom258"] = {"stanleylebougla@animation", "stanleylebougla_clip", "Custom258", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom259"] = {"217aim2xanimation", "aim2x_clip", "Custom259", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom260"] = {"dollie_mods@follow_me_001", "follow_me_001", "Custom260", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom261"] = {"dollie_mods@follow_me_002", "follow_me_002", "Custom261", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom262"] = {"tattooshowinn@animation", "tattooshowinn_clip", "Custom262", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom263"] = {"amb@world_human_hang_out_street@male_a@base", "base", "Custom263", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom264"] = {"amb@world_human_hang_out_street@male_a@enter", "enter", "Custom264", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom265"] = {"amb@world_human_hang_out_street@male_a@exit", "exit", "Custom265", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom256"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Custom266", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom267"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_b", "Custom267", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom268"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_c", "Custom268", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom269"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_d", "Custom269", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom270"] = {"amb@world_human_hang_out_street@male_b@base", "base", "Custom270", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom271"] = {"amb@world_human_hang_out_street@male_b@enter", "enter", "Custom271", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom272"] = {"amb@world_human_hang_out_street@male_b@exit", "exit", "Custom272", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom273"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_a", "Custom273", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom274"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Custom274", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom275"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_c", "Custom275", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom276"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_d", "Custom276", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom277"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Custom277", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom278"] = {"amb@world_human_hang_out_street@male_c@enter", "enter", "Custom278", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom279"] = {"amb@world_human_hang_out_street@male_c@exit", "exit", "Custom279", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom280"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_a", "Custom280", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom281"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Custom281", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom282"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_c", "Custom282", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom283"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_d", "Custom283", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom284"] = {"amb@world_human_hang_out_street@female_arm_side@base", "base", "Custom284", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom285"] = {"amb@world_human_hang_out_street@female_arm_side@enter", "enter", "Custom285", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom286"] = {"amb@world_human_hang_out_street@female_arm_side@exit", "exit", "Custom286", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom287"] = {"amb@world_human_hang_out_street@female_arm_side@idle_a", "idle_a", "Custom287", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom288"] = {"amb@world_human_hang_out_street@female_arm_side@idle_a", "idle_b", "Custom288", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom289"] = {"amb@world_human_hang_out_street@female_arm_side@idle_a", "idle_c", "Custom289", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom290"] = {"amb@world_human_hang_out_street@female_arm_side@idle_a", "idle_d", "Custom290", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom291"] = {"amb@world_human_hang_out_street@female_arms_crossed@base", "base", "Custom291", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom292"] = {"amb@world_human_hang_out_street@female_arms_crossed@enter", "enter", "Custom292", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom293"] = {"amb@world_human_hang_out_street@female_arms_crossed@exit", "exit", "Custom293", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom294"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Custom294", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom295"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_b", "Custom295", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom296"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_c", "Custom296", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom297"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_d", "Custom297", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom298"] = {"amb@world_human_hang_out_street@female_hold_arm@base", "base", "Custom298", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom299"] = {"amb@world_human_hang_out_street@female_hold_arm@enter", "enter", "Custom299", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom300"] = {"amb@world_human_hang_out_street@female_hold_arm@exit", "exit", "Custom300", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom301"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Custom301", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom302"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_b", "Custom302", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom303"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_c", "Custom303", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom304"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_d", "Custom304", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom305"] = {"betrex@sunglasses", "glasses", "Custom305", AnimationOptions =
       {
           EmoteLoop = false,
       }},
       ["custom306"] = {"chouko@freeheart", "freeheart", "Custom306", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom307"] = {"chouko@nailpose", "nailpose", "Custom307", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom308"] = {"chid@nyck", "chid_clip", "Custom308", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom309"] = {"move_m@generic_idles@std", "idle_a", "Custom309", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom310"] = {"move_m@generic_idles@std", "idle_b", "Custom310", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom311"] = {"move_m@generic_idles@std", "idle_c", "Custom311", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom312"] = {"move_m@generic_idles@std", "idle_d", "Custom312", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom313"] = {"nhyza1@animation", "nhyza1_clip", "Custom313", AnimationOptions =
       {
           EmoteLoop = false,
       }},
       ["custom314"] = {"qpacc@gangsign1", "gangsign1_clip", "Custom314", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom315"] = {"qpacc@gangsign2", "gangsign2_clip", "Custom315", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom316"] = {"qpacc@gangsign3", "gangsign3_clip", "Custom316", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom317"] = {"qpacc@gangsign4", "gangsign4_clip", "Custom317", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom318"] = {"qpacc@gangsign5", "gangsign5_clip", "Custom318", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom319"] = {"qpacc@gangsign6", "gangsign6_clip", "Custom319", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom320"] = {"qpacc@gangsign7", "gangsign7_clip", "Custom320", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom321"] = {"qpacc@gangsign8", "gangsign8_clip", "Custom321", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom322"] = {"mymsign25@animacion", "mymsign25_clip", "Custom322", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom323"] = {"mymsign67@animacion", "mymsign67_clip", "Custom323", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom324"] = {"cast@sign1@animation", "cast@sign1_clip", "Custom324", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom325"] = {"cast@sign2@animation", "cast@sign2_clip", "Custom325", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom326"] = {"crip@animation", "crip_clip", "Custom326", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom327"] = {"handoverffacefinger@sign@animation", "handoverffacefinger@sign_clip", "Custom327", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom328"] = {"bendover@sign@animation", "bendover@sign_clip", "Custom328", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom329"] = {"whitepower@animation", "whitepower_clip", "Custom329", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom330"] = {"standhand2animation", "standhand2_clip", "Custom330", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom331"] = {"standhand2@animation", "standhand2_clip", "Custom331", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom332"] = {"tidselfie01@animation", "tidselfie01_clip", "Custom332", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom333"] = {"mggyhang1@animation", "mggyhang1_clip", "Custom333", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom334"] = {"mggyhang2@animation", "mggyhang2_clip", "Custom334", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom335"] = {"mggyhang3@animation", "mggyhang3_clip", "Custom335", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom336"] = {"mggypiggypair1@animation", "mggypiggypair1_clip", "Custom336", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom337"] = {"mggypiggypair2@animation", "mggypiggypair2_clip", "Custom337", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom338"] = {"mggyselfie1@animation", "mggyselfie1_clip", "Custom338", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom339"] = {"mggyselfie2@animation", "mggyselfie2_clip", "Custom339", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom340"] = {"mggyselfie4@animation", "mggyselfie4_clip", "Custom340", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom341"] = {"custom@animation", "sitting_clip", "Custom341", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom342"] = {"slave@mchmnk", "slave_clip", "Custom342", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom343"] = {"mistress@mchmnk", "mistress_clip", "Custom343", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom344"] = {"coupleero01fr@mchmnk", "coupleero01fr_clip", "Custom344", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom345"] = {"coupleero01tw@mchmnk", "coupleero01tw_clip", "Custom345", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom346"] = {"waitingfordaddy@mchmnk", "waitingfordaddy_clip", "Custom346", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom347"] = {"tidsitting07@animation", "tidsitting07_clip", "Custom347", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom348"] = {"tidstanding11@animation", "tidstanding11_clip", "Custom348", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom349"] = {"tidstanding14@animation", "tidstanding14_clip", "Custom349", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom350"] = {"tidstanding15@animation", "tidstanding15_clip", "Custom350", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom351"] = {"tidstandingselfie11@animation", "tidstandingselfie11_clip", "Custom351", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom352"] = {"tidstandingselfie12@animation", "tidstandingselfie12_clip", "Custom352", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom353"] = {"christiandior@animation", "christiandior_clip", "Custom353 ~b~Dior Bag", AnimationOptions =
       {
        Prop = 'p_ld_heist_bag_s_2',
        PropBone = 24817,
        PropPlacement = {-0.75, 0.18, -0.016, 180.0, -90.0, 90.0},
        EmoteMoving = false,
        EmoteLoop = true
       }},
       ["custom354"] = {"christiandior2@animation", "christiandior2_clip", "Custom354 ~b~Dior Bag 2", AnimationOptions =
       {
           Prop = "p_ld_heist_bag_s_2",
           PropBone = 57005,
           PropPlacement = {-0.335, -0.345, 0.245, 300.0, 180.0, 30.0},
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["custom355"] = {"christiandior2@animation", "christiandior2_clip", "Custom355 ~b~Dior Bag 3", AnimationOptions =
       {
           Prop = "p_ld_heist_bag_s_2",
           PropBone = 57005,
           PropPlacement = {-0.335, -0.345, 0.245, 300.0, 180.0, 30.0},
           EmoteLoop = true,
           EmoteMoving = false,
       }},
       ["custom356"] = {"longokillaanimation", "longokilla_clip", "Custom356", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom357"] = {"cas2animation", "cas2_clip", "Custom357", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom358"] = {"salutepose@animation", "salutepose_clip", "Custom358", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom359"] = {"sheshanimation", "shesh_clip", "Custom359", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom360"] = {"crouchinganimation", "crouching_clip", "Custom360", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom361"] = {"femalepose6@animation", "femalepose6_clip", "Custom361", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom362"] = {"femalepose5@animation", "femalepose5_clip", "Custom362", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom363"] = {"freeanim1animation", "freeanim1_clip", "Custom363", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom364"] = {"freeanim2animation", "freeanim2_clip", "Custom364", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom365"] = {"mggycas2@animation", "mggycas2_clip", "Custom365", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom366"] = {"mggycas1@animation", "mggycas1_clip", "Custom366", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom367"] = {"mggymirror4@animation", "mggymirror4_clip", "Custom367", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom368"] = {"mggymirror3@animation", "mggymirror3_clip", "Custom368", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom369"] = {"mggymirror2@animation", "mggymirror2_clip", "Custom369", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom370"] = {"mggymirror1@animation", "mggymirror1_clip", "Custom370", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom371"] = {"bfflookback1@animation", "bfflookback1_clip", "Custom371", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom372"] = {"bfflookback2@animation", "bfflookback2_clip", "Custom372", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom373"] = {"bffcasualpose1@animation", "bffcasualpose1_clip", "Custom373", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom374"] = {"bffcasualpose2@animation", "bffcasualpose2_clip", "Custom374", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom375"] = {"bfffun1@animation", "bfffun1_clip", "Custom375", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom376"] = {"bfffun2@animation", "bfffun2_clip", "Custom376", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom377"] = {"bffhandhold1@animation", "bffhandhold1_clip", "Custom377", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom378"] = {"bffhandhold2@animation", "bffhandhold2_clip", "Custom378", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom379"] = {"mggycouplehug1@animation", "mggycouplehug1_clip", "Custom379", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom380"] = {"mggycouplehug2@animation", "mggycouplehug2_clip", "Custom380", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["custom381"] = {"mggycouplehugphone@animation", "mggycouplehugphone_clip", "Custom381", AnimationOptions =
       {
           EmoteLoop = true,
       }},
    
    
    
    
       -- Divine: Trendy
       ["banddance"] = {"divined@tdances@new", "dtdance1", "Band Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["bopdance"] = {"divined@tdances@new", "dtdance2", "Bop", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["bboydance"] = {"divined@tdances@new", "dtdance3", "BBoy Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["capoeiramove"] = {"divined@tdances@new", "dtdance4", "Capoeira Move", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["hiphopdance"] = {"divined@tdances@new", "dtdance5", "Hip Hop Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["hipsterdance"] = {"divined@tdances@new", "dtdance6", "Hipster Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["hippiedance"] = {"divined@tdances@new", "dtdance7", "Hippie Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["hiphoptaunt"] = {"divined@tdances@new", "dtdance8", "Hip Hop Taunt", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["hilowave"] = {"divined@tdances@new", "dtdance9", "Hi Lo Wave", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["squaredance"] = {"divined@tdances@new", "dtdance10", "Square Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["hotdance"] = {"divined@tdances@new", "dtdance11", "Hot Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["hulahula"] = {"divined@tdances@new", "dtdance12", "Hula-Hula", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["dabloop"] = {"divined@tdances@new", "dtdance13", "Dab Loop", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["kingdance"] = {"divined@tdances@new", "dtdance14", "The King's Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["linedance"] = {"divined@tdances@new", "dtdance15", "Dance Line", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["magicman"] = {"divined@tdances@new", "dtdance16", "Magic Man", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["marat"] = {"divined@tdances@new", "dtdance17", "Marat", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["maskoff"] = {"divined@tdances@new", "dtdance18", "Mask Off", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["mellow"] = {"divined@tdances@new", "dtdance19", "Mellow", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["showroomdance"] = {"divined@tdances@new", "dtdance20", "Showroom Dance", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["windmillfloss"] = {"divined@tdances@new", "dtdance21", "Windmill Floss", AnimationOptions =
       {
          EmoteLoop = true,
       }},
       ["woahdance"] = {"divined@tdances@new", "dtdance22", "Woah", AnimationOptions =
       {
          EmoteLoop = true,
       }},
    
       --  Custom Gangsigns
       ["gsign1"] = {"custom@gsign_01", "gsign_01", "Gang Sign 1", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign2"] = {"custom@gsign_02", "gsign_02", "Gang Sign 2", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign3"] = {"custom@gsign_03", "gsign_03", "Gang Sign 3", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign4"] = {"custom@gsign_04", "gsign_04", "Gang Sign 4 ~b~Hound Blood", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign5"] = {"custom@gsign_05", "gsign_05", "Gang Sign 5 ~b~WOO", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign6"] = {"custom@gsign_06", "gsign_06", "Gang Sign 6 ~b~Crips", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign7"] = {"custom@gsign_07", "gsign_07", "Gang Sign 7 ~b~Grapes Crips", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign8"] = {"custom@gsign_08", "gsign_08", "Gang Sign 8 ~b~ Grapes Crips 2", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign9"] = {"custom@gsign_09", "gsign_09", "Gang Sign 9", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign10"] = {"custom@gsign_10", "gsign_10", "Gang Sign 10", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign11"] = {"custom@gsign_11", "gsign_11", "Gang Sign 11", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign12"] = {"custom@gsign_12", "gsign_12", "Gang Sign 12", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign13"] = {"custom@gsign_13", "gsign_13", "Gang Sign 13", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign14"] = {"custom@gsign_14", "gsign_14", "Gang Sign 14", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign15"] = {"custom@mgsign_01", "mgsign_01", "Gang Sign 15", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign16"] = {"custom@mgsign_02", "mgsign_02", "Gang Sign 16", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign17"] = {"custom@mgsign_03", "mgsign_03", "Gang Sign 17", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign18"] = {"custom@mgsign_04", "mgsign_04", "Crip Sign", AnimationOptions =
       {
         EmoteLoop = true,
         EmoteMoving = false,
       }},
       ["gsign19"] = {"custom@gsign_26", "gsign_26", "Gang Sign 19", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["gsign20"] = {"custom@gsign_27", "gsign_27", "Gang Sign 20", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["gsign21"] = {"custom@gsign_28", "gsign_28", "Gang Sign 21", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["gsign22"] = {"custom@gsign_29", "gsign_29", "Gang Sign 22", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["gsign23"] = {"custom@gsign_30", "gsign_30", "Gang Sign 23", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["gsign24"] = {"custom@gsign_31", "gsign_31", "Gang Sign 24", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["gsign25"] = {"custom@gsign_32", "gsign_32", "Gang Sign 25", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["gsign26"] = {"custom@gsign_33", "gsign_33", "Gang Sign 26", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["gsign27"] = {"custom@gsign_34", "gsign_34", "Gang Sign 27", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["gsign28"] = {"custom@gsign_35", "gsign_35", "Gang Sign 28", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["gsign29"] = {"custom@gsign_36", "gsign_36", "Gang Sign 29", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["gsign30"] = {"custom@gsign_37", "gsign_37", "Gang Sign 30", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       
       ["fsign"] = {"custom@fsign_1", "fsign_1", "Female Sign 1", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = false,
       }},
       ["cane"] = {"missheistdocksprep1hold_cellphone", "static", "Cane", AnimationOptions =
       {
           Prop = "prop_cs_walking_stick",
           PropBone = 57005,
           PropPlacement = {0.15, 0.05, -0.03, 0.0, 266.0, 180.0},
           EmoteLoop = true,
           EmoteMoving = true,
       }},
    
       -- Custom Animations: Josh
       ["jdrill"] = {"anim@amb@nightclub_island@dancers@crowddance_single_props@", "mi_dance_prop_13_v1_male^3", "Drill · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdrill2"] = {"anim@amb@nightclub_island@dancers@crowddance_groups@groupd@", "mi_dance_crowd_13_v2_male^1", "Drill · Male 2", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdrill3"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_17_v2_male^4", "Drill · Male 3", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdrill4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "mi_dance_facedj_15_v2_male^4", "Drill · Male 4", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdrill5"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_15_v2_male^5", "Drill · Male 5", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdrill6"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj@", "hi_dance_facedj_hu_17_male^5", "Drill · Male 6", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdrill7"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_up", "Drill · Solo 1", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdrill8"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "med_center", "Drill · Solo 2", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdrill9"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_right_down", "Drill · Solo 3", AnimationOptions =
       {
          EmoteLoop = true
       }}, 
       ["jdrill10"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_center", "Drill · Solo 4", AnimationOptions =
       {
          EmoteLoop = true
       }}, 
       ["jdrill11"] = {"anim@amb@nightclub@mini@dance@dance_solo@shuffle@", "high_left_down", "Drill · Solo 5", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jmonkey1"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center", "Monkey Dance", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jmonkeyd2"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "high_center_down", "Monkey Dance 2", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jmonkeyd3"] = {"anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@", "med_center_down", "Monkey Dance 3", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jrightdown"] = {"anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@", "med_right_down", "Boxing Dance Solo", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jlowdance"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "low_center", "Low Dance · Female ", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jlowdance2"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "high_center", "Low Dance · Female", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jhiphop"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_d@", "ped_a_dance_idle", "Hip Hop Dance", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jhiphop2"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_b@", "ped_a_dance_idle", "Hip Hop Dance 2", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jhiphop3"] = {"anim@amb@nightclub@mini@dance@dance_paired@dance_a@", "ped_a_dance_idle", "Hip Hop Dance 3", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jpbox"] = {"mp_am_hold_up", "purchase_beerbox_shopkeeper", "Purchase Box", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jch"] = {"amb@code_human_police_investigate@idle_b", "idle_f", "Cop Search", AnimationOptions =
       {
           EmoteMoving = false,
           EmoteDuration = 7000,
       }},
       ["jgangsign5"] = {"anim@mp_player_intupperdock", "idle_a", "Gang Sign", AnimationOptions =
       {
           EmoteMoving = true,
           EmoteDuration = 2500,
       }},
       ["jcheckwatch"] = {"amb@code_human_wander_idles_fat@male@idle_a", "idle_a_wristwatch", "Check Watch · Male", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jpicking"] = {"amb@prop_human_movie_bulb@idle_a", "idle_a", "Picking", AnimationOptions =
       {
           EmoteMoving = true,
           EmoteDuration = 2500,
       }},
       ["jgangaim"] = {"combat@aim_variations@1h@gang", "aim_variation_b", "Gang Aim", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jshowboobs"] = {"mini@strip_club@backroom@", "stripper_b_backroom_idle_b", "Show Boobs", AnimationOptions =
       {
           EmoteMoving = false,
           EmoteDuration = 6000,
       }},
       ["jcleanleg"] = {"mini@strip_club@backroom@", "stripper_c_leadin_backroom_idle_a", "Clean Legs", AnimationOptions =
       {
           EmoteMoving = false,
           EmoteDuration = 6000,
       }},
       ["jshowboobs2"] = {"mini@strip_club@idles@stripper", "stripper_idle_05", "Show Boobs 2", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 6000,
       }},
       ["jlockcar"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Lock Car", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteDuration = 2500,
       }},
       ["jselfie5"] = {"cellphone@self", "selfie", "Selfie 3", AnimationOptions =
       {
          EmoteMoving = false,
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteLoop = true
       }},
       ["jselfiewc"] = {"cellphone@self@franklin@", "west_coast", "Selfie West Coast", AnimationOptions =
       {
          EmoteMoving = false,
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteLoop = true
       }},
       ["jselfie3"] = {"cellphone@self@michael@", "finger_point", "Selfie Finger", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jselfie4"] = {"cellphone@self@franklin@", "chest_bump", "Selfie Chest Bump", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jselfie1"] = {"cellphone@self@trevor@", "throat_slit", "Selfie", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jselfie2"] = {"cellphone@self@trevor@", "proud_finger", "Selfie2", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jkhaby"] = {"missarmenian3@simeon_tauntsidle_b", "areyounotman", "Khaby · Special", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jdepressed"] = {"oddjobs@bailbond_hobodepressed", "base", "Depressed", AnimationOptions =
       {
          EmoteMoving = true,
       }},
       ["jcarsign"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base", "idle_a", "Gang Sign · Car", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteDuration = 2500,
       }},
       ["jcarsign2"] = {"amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base", "idle_a", "Gang Signs 2 · Car", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteDuration = 2500,
       }},
       ["jcarlowrider"] = {"anim@veh@lowrider@low@front_ds@arm@base", "sit", "Lowrider Style · Car", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jcarlowrider2"] = {"anim@veh@lowrider@std@ds@arm@music@mexicanidle_a", "idle", "Lowrider Mexican Style · Car", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jleaningwallback"] = {"anim@amb@casino@peds@", "amb_world_human_leaning_male_wall_back_mobile_idle_a", "Leaning Wall Back · Male", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jreactiona"] = {"random@shop_robbery_reactions@", "absolutely", "Reaction Absolutely", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactanger"] = {"random@shop_robbery_reactions@", "anger_a", "Reaction Anger", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactwhy"] = {"random@shop_robbery_reactions@", "is_this_it", "Reaction Why", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactscrew"] = {"random@shop_robbery_reactions@", "screw_you", "Reaction Screw You", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactshock"] = {"random@shop_robbery_reactions@", "shock", "Reaction Shock", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactgoodc"] = {"missclothing", "good_choice_storeclerk", "Reaction Good Choice", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jtrynewc"] = {"clothingtie", "try_tie_neutral_c", "Try New Clothes", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jtrynewc2"] = {"clothingtie", "try_tie_neutral_d", "Try New Clothes 2", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreacteasy"] = {"gestures@m@car@std@casual@ds", "gesture_easy_now", "Reaction Easy Now", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactıwill"] = {"gestures@m@car@std@casual@ds", "gesture_i_will", "Reaction I will", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactnoway"] = {"gestures@m@car@std@casual@ds", "gesture_no_way", "Reaction No Way", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactbye"] = {"gestures@f@standing@casual", "gesture_bye_hard", "Reaction Bye Hard", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreacthello"] = {"gestures@f@standing@casual", "gesture_hello", "Reaction Hello", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jlookatplayer"] = {"friends@frl@ig_1", "look_lamar", "Look At Player", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactgreat"] = {"mp_cp_welcome_tutgreet", "greet", "Great", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jfakepunch"] = {"missarmenian2", "fake_punch_walk_by_lamar", "Fake Punch", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jreactdamn"] = {"missheist_jewel", "damn", "Reaction Damn", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jimtellingyou"] = {"missheist_jewel", "im_telling_you", "I'm telling you", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jreactno"] = {"missheist_jewel", "despair", "Reaction No", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jdontkillme"] = {"missheist_jewel", "manageress_kneel_loop", "Dont Kill Me", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jbangbang"] = {"anim@mp_player_intcelebrationfemale@bang_bang", "bang_bang", "Bang Bang", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jtryshirtn"] = {"clothingshirt", "try_shirt_negative_a", "Try Shirt Negative", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jtryshirtp"] = {"clothingshirt", "try_shirt_positive_a", "Try Shirt Positive", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jtryshoes"] = {"clothingshoes", "try_shoes_positive_d", "Try Shoes", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jtryshoes2"] = {"clothingshoes", "try_shoes_positive_c", "Try Shoes 2", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["joverhere"] = {"friends@fra@ig_1", "over_here_idle_a", "Over Here", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jwashingface"] = {"missmic2_washing_face", "michael_washing_face", "Washing Face", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jlastday"] = {"misstrevor1", "ortega_outro_loop_ort", "Last Day", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jtryg"] = {"mp_clothing@female@glasses", "try_glasses_positive_a", "Try Glasses · Female", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jpickup"] = {"pickup_object", "pickup_low", "Pick Up", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jstretchl"] = {"switch@franklin@bed", "stretch_long", "Stretch Long", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jhos"] = {"amb@world_human_hang_out_street@male_a@idle_a", "idle_a", "Hang Out Street · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jhos2"] = {"amb@world_human_hang_out_street@male_c@base", "base", "Hang Out Street 2 · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jguardaim"] = {"guard_reactions", "1hand_aiming_cycle", "Guard Aim", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jgready"] = {"switch@franklin@getting_ready", "002334_02_fras_v2_11_getting_dressed_exit", "Getting Ready", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jlao"] = {"move_clown@p_m_two_idles@", "fidget_look_at_outfit", "Look At Outfits", AnimationOptions =
       {
           EmoteMoving = false,
           EmoteDuration = 6000,
       }},
       ["jtoilet"] = {"switch@trevor@on_toilet", "trev_on_toilet_loop", "Have A Shit", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jtoilet2"] = {"timetable@trevor@on_the_toilet", "trevonlav_struggleloop", "Have A Shit 2", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jcovermale2"] = {"amb@code_human_cower@male@base", "base", "Cover · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jvalet"] = {"anim@amb@world_human_valet@normal@base@", "base_a_m_y_vinewood_01", "Valet", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jvalet2"] = {"anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", "Valet 2", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jsunbathem"] = {"amb@world_human_sunbathe@male@back@idle_a", "idle_c", "Sunbathe · Male", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jsunbathem2"] = {"amb@world_human_sunbathe@male@front@base", "base", "Sunbathe 2 · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jleancar"] = {"anim@scripted@carmeet@tun_meet_ig2_race@", "base", "Lean Car", AnimationOptions =
       {
          EmoteLoop = true,
          EmoteMoving = true,
       }},
       ["jcheckout"] = {"anim@amb@carmeet@checkout_car@male_a@idles", "idle_b", "Check Out · Female", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jcheckout2"] = {"anim@amb@carmeet@checkout_car@male_c@idles", "idle_a", "Check Out 2 · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jcheckout"] = {"anim@amb@carmeet@checkout_car@female_d@base", "base", "Check Out 3 · Female", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jreadmessages"] = {"anim@amb@carmeet@take_photos@male_a@base", "base", "Read Messages · Male", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jreadmessages2"] = {"anim@amb@carmeet@take_photos@female_b@base", "base", "Read Messages 2 · Female", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jlistenmusic"] = {"anim@amb@carmeet@listen_music@male_a@trans", "a_trans_d", "Listen Music", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jogger"] = {"move_f@jogger", "idle", "Jogger · Female", AnimationOptions =
       {
          EmoteDuration = 2500,
          EmoteMoving = true,
       }},
       ["jogger2"] = {"move_m@jogger", "idle", "Jogger · Male", AnimationOptions =
       {
          EmoteDuration = 2500,
          EmoteMoving = true,
       }},
       ["jwtf"] = {"mini@triathlon", "wot_the_fuck", "Wot The Fuck", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jucdt"] = {"mini@triathlon", "u_cant_do_that", "U Cant Do That", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jwarmup"] = {"mini@triathlon", "ig_2_gen_warmup_01", "Warmup", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jwarmup2"] = {"mini@triathlon", "ig_2_gen_warmup_02", "Warmup 2", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jwarmup3"] = {"mini@triathlon", "jog_idle_f", "Warmup 3", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jwarmup4"] = {"mini@triathlon", "jog_idle_e", "Warmup 4", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jhmassage"] = {"missheistfbi3b_ig8_2", "cpr_loop_paramedic", "Heart Massage", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jpassout"] = {"missheistfbi3b_ig8_2", "cower_loop_victim", "Pass Out", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jddealer"] = {"amb@world_human_drug_dealer_hard@male@base", "base", "Drug Dealer · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jswatch"] = {"amb@world_human_strip_watch_stand@male_c@idle_a", "idle_b", "Watch Strip · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jcheckw"] = {"amb@world_human_bum_wash@male@high@base", "base", "Check Water", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jwaitt"] = {"oddjobs@taxi@", "idle_a", "Wait Taxi", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jnoway"] = {"oddjobs@towingpleadingbase", "base", "No Way", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jtsomething"] = {"oddjobs@bailbond_hobohang_out_street_c", "idle_c", "Tell Something", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jlfh"] = {"oddjobs@assassinate@old_lady", "looking_for_help", "Looking For Help", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jmstretch"] = {"oddjobs@assassinate@multi@", "idle_a", "Muscle Stretch", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jdj"] = {"anim@mp_player_intcelebrationmale@dj", "dj", "DJ", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdj2"] = {"anim@scripted@nightclub@dj@dj_moodm@", "moodm_cdj_left_a_12", "DJ 2", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdj3"] = {"anim@amb@nightclub@djs@switch@dixn_djset_switchover@", "dix_end_bg_female1", "DJ 3", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdj4"] = {"anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity", "trans_dance_facedj_li_to_mi_11_v1_male^3", "DJ 4", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jlmic"] = {"anim@veh@lowrider@std@ds@arm@music@hiphopidle_a", "idle", "Listen Music In Car", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteDuration = 2500,
       }},
       ["jgotc"] = {"random@getawaydriver@thugs", "base_a", "Get Off The Car", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
       ["jvsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "Very Sad", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jdgrave"] = {"anim@amb@drug_field_workers@rake@male_a@base", "base", "Digging Grave", AnimationOptions =
       {
          Prop = 'prop_tool_shovel006',
          PropBone = 28422,
          PropPlacement = {0.0, 0.1, -0.6, 0.0, 0.0, 180.0},
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jbow3"] = {"missheistdockssetup1ig_10@base", "talk_pipe_base_worker1", "Bend Over Wait", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 2500,
       }},
       ["jweeding"] = {"anim@amb@drug_field_workers@weeding@male_a@base", "base", "Weeding · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jlookplan"] = {"missheist_agency2aig_4", "look_plan_c_worker2", "Look Plan", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteDuration = 5000,
       }},
       ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@base", "base", "Gang Drink", AnimationOptions =
       {
          Prop = 'prop_cs_beer_bot_40oz_03',
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jgangdrink"] = {"amb@world_human_drinking_fat@beer@male@idle_a", "idle_b", "Gang Drink 2", AnimationOptions =
       {
          Prop = 'prop_cs_beer_bot_40oz_03',
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jmleaning"] = {"amb@world_human_leaning@male@wall@back@mobile@base", "base", "Mobile Leaning · Male", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = false,
          EmoteLoop = true
       }},
       ["jthanks"] = {"random@arrests", "thanks_male_05", "Thanks", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jtextingmale"] = {"amb@world_human_stand_mobile_fat@male@text@base", "base", "Texting · Male", AnimationOptions =
       {
          Prop = "prop_npc_phone_02",
          PropBone = 28422,
          PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jffb"] = {"timetable@trevor@skull_loving_bear", "skull_loving_bear", "F*ck From Behind", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jsitchair7"] = {"timetable@reunited@ig_10", "isthisthebest_jimmy", "Sit Chair 7", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jsitchair8"] = {"timetable@michael@on_sofabase", "sit_sofa_base", "Sit Chair 8", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jsitchair9"] = {"timetable@trevor@smoking_meth@base", "base", "Sit Chair 9", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jsitchair10"] = {"timetable@tracy@ig_7@base", "base", "Sit Chair 10", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jstandingt"] = {"amb@world_human_bum_standing@twitchy@base", "base", "Standing Twitchy", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jstandingfit"] = {"amb@world_human_jog_standing@male@fitbase", "base", "Standing Fit", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jstandingm"] = {"anim@amb@casino@hangout@ped_male@stand@03b@base", "base", "Standing · Male", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jstandingf"] = {"anim@amb@casino@hangout@ped_female@stand@02a@base", "base", "Standing · Female", AnimationOptions =
       {
          EmoteLoop = true
       }},
       ["jgabgtaunt"] = {"switch@franklin@gang_taunt_p1", "gang_taunt_loop_lamar", "Gang Taunt", AnimationOptions =
       {
          EmoteMoving = true,
          EmoteLoop = true
       }},
       ["jdj5"] = {"mini@strip_club@idles@dj@base", "base", "DJ 5" , AnimationOptions = {
          EmoteMoving = false,
          EmoteLoop = true
       }},
       -- Other
       ["renegade"] = {"custom@renegade", "renegade", "Renegade", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
       ["savage"] = {"custom@savage", "savage", "Savage", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
       ["sayso"] = {"custom@sayso", "sayso", "Say So", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
       ["tslide"] = {"custom@toosie_slide", "toosie_slide", "Tootsie Slide", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
       
       ["defaultdance"] = {"custom@dancemoves", "dancemoves", "Default Dance", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
       
       ["discodance"] = {"custom@disco_dance", "disco_dance", "Disco Dance", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
       
       ["electroshuffle"] = {"custom@electroshuffle_original", "electroshuffle_original", "Electro Shuffle", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
       
       ["electroshuffle2"] = {"custom@electroshuffle", "electroshuffle", "Electro Shuffle 2", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
    
       ["hitit"] = {"custom@hitit", "hitit", "Hit It", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
    
       ["floss"] = {"custom@floss", "floss", "Floss", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
    
       ["orangejustice"] = {"custom@orangejustice", "orangejustice", "Orange Justice", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
    
       ["takel"] = {"custom@take_l", "take_l", "Take the L", AnimationOptions =
       {
          EmoteMoving = false,
          EmoteLoop = true,
       }},
    
       ["dancef2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Dance F2", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancef3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance F3", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancef4"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Dance F4", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancef5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Dance F5", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Dance F6", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Dance Slow 2", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Dance Slow 3", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Dance Slow 4", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dance"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Dance", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dance2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Dance 2", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dance3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Dance 3", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dance4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Dance 4", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Upper", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Dance Upper 2", AnimationOptions =
       {
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Dance Shy", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Dance Shy 2", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Dance Slow", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancesilly9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Dance Silly 9", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dance6"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Dance 6", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dance7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Dance 7", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dance8"] = {"missfbi3_sniping", "dance_m_default", "Dance 8", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Dance Silly", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Dance Silly 2", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Dance Silly 3", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Dance Silly 4", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Dance Silly 5", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Dance Silly 6", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dance9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Dance 9", AnimationOptions =
       {
           EmoteLoop = true,
       }},
       ["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Dance Silly 8", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Dance Silly 7", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["dance5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Dance 5", AnimationOptions =
       {
           EmoteLoop = true
       }},
       ["danceglowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Dance Glowsticks", AnimationOptions =
       {
           Prop = 'ba_prop_battle_glowstick_01',
           PropBone = 28422,
           PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
           SecondProp = 'ba_prop_battle_glowstick_01',
           SecondPropBone = 60309,
           SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["danceglowstick2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Dance Glowsticks 2", AnimationOptions =
       {
           Prop = 'ba_prop_battle_glowstick_01',
           PropBone = 28422,
           PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
           SecondProp = 'ba_prop_battle_glowstick_01',
           SecondPropBone = 60309,
           SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
           EmoteLoop = true,
       }},
       ["danceglowstick3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Dance Glowsticks 3", AnimationOptions =
       {
           Prop = 'ba_prop_battle_glowstick_01',
           PropBone = 28422,
           PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
           SecondProp = 'ba_prop_battle_glowstick_01',
           SecondPropBone = 60309,
           SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
           EmoteLoop = true,
       }},
       ["dancehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Dance Horse", AnimationOptions =
       {
           Prop = "ba_prop_battle_hobby_horse",
           PropBone = 28422,
           PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
           EmoteLoop = true,
           EmoteMoving = true,
       }},
       ["dancehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Dance Horse 2", AnimationOptions =
       {
           Prop = "ba_prop_battle_hobby_horse",
           PropBone = 28422,
           PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
           EmoteLoop = true,
       }},
       ["dancehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Dance Horse 3", AnimationOptions =
       {
           Prop = "ba_prop_battle_hobby_horse",
           PropBone = 28422,
           PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
           EmoteLoop = true,
       }},
}


-- Remove emotes if needed
if Config.AdultEmotesDisabled then
    for _, array in ipairs({
        "Shared",
        "Dances",
        "AnimalEmotes",
        "Emotes",
        "PropEmotes",
        "White2do",
        "White3ro",
    }) do
        for emoteName, emoteData in pairs(DP[array]) do
            if emoteData.AdultAnimation then
                DP[array][emoteName] = nil
            end
        end
    end
end
