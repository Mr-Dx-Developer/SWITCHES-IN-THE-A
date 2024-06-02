-- This doesn't require any edit, to change default inventory go to sh_integrations.lua
-- This doesn't require any edit, to change default inventory go to sh_integrations.lua

Citizen.CreateThread(function()
    if(INVENTORY_TO_USE ~= "ox_inventory") then return end

    if(not IsDuplicityVersion()) then
        RegisterNetEvent("jobs_creator:stash:openStash", function(markerId)
            local stashId = "job_stash_" .. markerId

            exports[EXTERNAL_SCRIPTS_NAMES["ox_inventory"]]:openInventory('stash', stashId)
        end)

        RegisterNetEvent("jobs_creator:safe:openSafe", function(markerId)
            local safeId = "job_stash_" .. markerId

            exports[EXTERNAL_SCRIPTS_NAMES["ox_inventory"]]:openInventory('stash', safeId)
        end)

        RegisterNetEvent("jobs_creator:armory:openArmory", function(markerId)
            local armoryId = "job_stash_" .. markerId

            exports[EXTERNAL_SCRIPTS_NAMES["ox_inventory"]]:openInventory('stash', armoryId)
        end)

        RegisterNetEvent("jobs_creator:framework:ready", function() 
            -- Disables the default script search (otherwise there would be 2 searches)
            exports["jobs_creator"]:disableScriptEvent("jobs_creator:actions:search:searchPlayer")
        end)
        
        -- From OX inventory functions
        local function canOpenTarget(ped)
            return IsPedFatallyInjured(ped)
            or IsEntityPlayingAnim(ped, 'dead', 'dead_a', 3)
            or GetPedConfigFlag(ped, 120, true)
            or IsEntityPlayingAnim(ped, 'mp_arresting', 'idle', 3)
            or IsEntityPlayingAnim(ped, 'missminuteman_1ig_2', 'handsup_base', 3)
            or IsEntityPlayingAnim(ped, 'missminuteman_1ig_2', 'handsup_enter', 3)
            or IsEntityPlayingAnim(ped, 'random@mugging3', 'handsup_standing_base', 3)
        end
        
        RegisterNetEvent("jobs_creator:actions:search:searchPlayer", function(targetServerId)
            local ped = GetPlayerPed(targetServerId)

            if(canOpenTarget(ped)) then
                exports[EXTERNAL_SCRIPTS_NAMES["ox_inventory"]]:openInventory('player', targetServerId)
            else
                notifyClient(getLocalizedText("actions:the_player_must_be_handcuffed"))
            end
        end)
    else
        -- Stash data
        local stash = {
            slots = 50,
            weight = 100000,
        }

        local function registerStashes()
            MySQL.Async.fetchAll('SELECT id, label FROM jobs_data WHERE type="stash" OR type="safe" OR type="armory"' , {}, function(results)
                for i=1, #results do
                    local currentMarker = results[i]
                    
                    local stashId = currentMarker.id

                    exports[EXTERNAL_SCRIPTS_NAMES["ox_inventory"]]:RegisterStash("job_stash_" .. currentMarker.id, currentMarker.label, stash.slots, stash.weight)
                end

                print("^2" .. #results .. " OX stashes registered^7")
            end)
        end

        Citizen.CreateThread(registerStashes)
        RegisterNetEvent(Utils.eventsPrefix .. ":refreshMarkers", registerStashes)
    end
end)