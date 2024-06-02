---------------------------------------------------------------------------------------------
-------------------PLEASE CHECK OUR VIDEO TO KNOW HOW OUR SCRIPT WORKS-----------------------
---               Here's the config file, here you can define :                            --
---                            - the language of the script                                --
---                            - the key used to accept or refuse to take a baby in hand   --
---							   - the time in second to answer to accept to take a baby     --
---							   - the targetting system used                                --
---							   - if you use the whitelist sytem or not                     --
---							   - Id allowed if the whitelist system is enabled             --
---            https://patamods.gitbook.io/patamods-documentation/scripts/baby-script      --
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------




Trad = {}
Lang = "EN"

AcceptKey = 38                  --INPUT_PICKUP    E   38         check : https://docs.fivem.net/docs/game-references/controls/#controls
RefuseKey = 47                  --INPUT_DETONATE  G   47         to get the control number that you want
DropKey =     49                -- F 

AnswerTimeout = 10              --second max for answering when give baby

-- Targetting = "ox_target"     -- put ox_target if you are using ox target or qb_target if you are using qb target
Targetting = "qb_target"

UseWhitelistSystem = true      -- If you want to use the built in whitelist system, go to config/server/server.lua if you want to add your own whitelist system

WhitelistId = {                 -- Put here the ID of the player that you want to be able to use the script, only one ID is necessary per player
	"fivem:7207701", --bloody
	"fivem:10609279",--vroy
	"fivem:12775132",--quis
	"fivem:13805337",--marzb
	"fivem:10813044",--hailey
	"license:license:1387c9bde6ce689543a62984d9f6504421b445b2",--celeb
}