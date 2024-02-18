local function Hunting()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-13", snippet = "Hunting" },
            message = 'A' .. playerData.sex .. ' is hunting in the area.',
            flashes = false,
            image = nil, -- IMAGE URL SEE DOCS TO GET MORE INFORMATION... https://docs.quasar-store.com
            blip = {
                sprite = 626,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Hunting Call",
                time = (3 * 60 * 1000), -- 3 minutes
            }
        }
    )
end

exports('Hunting', Hunting)

local function VendingDrugs()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-15", snippet = "Vending Drugs" },
            message = 'A' .. playerData.sex .. ' is vending drugs in the area.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 303,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Drug Vending Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Suspicious Activity',
                    icon = 'fas fa-pills',
                }
            }
        }
    )
end

exports('VendingDrugs', VendingDrugs)

local function VehicleShooting()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-16", snippet = "Vehicle Shooting" },
            message = 'A' .. playerData.sex .. ' is shooting from a vehicle.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 313,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Vehicle Shooting Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Drive-by shooting',
                    icon = 'fas fa-car',
                }
            }
        }
    )
end
exports('VehicleShooting', VehicleShooting)

local function Shooting()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-17", snippet = "Shooting" },
            message = 'A' .. playerData.sex .. ' is shooting.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 313,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Shooting Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Gunfire Reported',
                    icon = 'fas fa-bullseye',
                }
            }
        }
    )
end
exports('Shooting', Shooting)

-- OfficerDown
local function OfficerDown()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-18", snippet = "Officer Down" },
            message = 'An officer is down in the area.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 487,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Officer Down Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Officer in distress',
                    icon = 'fas fa-shield-alt',
                }
            }
        }
    )
end
exports('OfficerDown', OfficerDown)


-- SpeedingVehicle
local function SpeedingVehicle()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-20", snippet = "Speeding Vehicle" },
            message = 'A' ..
                playerData.sex .. ' is speeding in a ' .. (playerData.vehicle_label or 'Unknown') .. ' vehicle.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 523,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Speeding Vehicle Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Speeding Detected',
                    icon = 'fas fa-tachometer-alt',
                }
            }
        }
    )
end
exports('SpeedingVehicle', SpeedingVehicle)

-- Fight
local function Fight()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-21", snippet = "Fight" },
            message = 'A' .. playerData.sex .. ' is involved in a fight.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 160,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Fight Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Fight in Progress',
                    icon = 'fas fa-fist-raised',
                }
            }
        }
    )
end
exports('Fight', Fight)

-- InjuriedPerson
local function InjuriedPerson()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-22", snippet = "Injured Person" },
            message = 'An injured person is found in the area.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 153,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Injured Person Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Medical Assistance Required',
                    icon = 'fas fa-medkit',
                }
            }
        }
    )
end
exports('InjuriedPerson', InjuriedPerson)

-- DeceasedPerson
local function DeceasedPerson()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-23", snippet = "Deceased Person" },
            message = 'A deceased person is found in the area.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 153,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Deceased Person Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Deceased Person Found',
                    icon = 'fas fa-skull-crossbones',
                }
            }
        }
    )
end
exports('DeceasedPerson', DeceasedPerson)

-- StoreRobbery
local function StoreRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-24", snippet = "Store Robbery" },
            message = 'A robbery is happening at a store near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 52,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Store Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Store Robbery',
                    icon = 'fas fa-store',
                }
            }
        }
    )
end
exports('StoreRobbery', StoreRobbery)

-- FleecaBankRobbery
local function FleecaBankRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-25", snippet = "Fleeca Bank Robbery" },
            message = 'A robbery is happening at Fleeca Bank near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 108,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Fleeca Bank Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Fleeca Bank Robbery',
                    icon = 'fas fa-university',
                }
            }
        }
    )
end
exports('FleecaBankRobbery', FleecaBankRobbery)

-- PaletoBankRobbery
local function PaletoBankRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-26", snippet = "Paleto Bank Robbery" },
            message = 'A robbery is happening at Paleto Bank near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 108,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Paleto Bank Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Paleto Bank Robbery',
                    icon = 'fas fa-university',
                }
            }
        }
    )
end
exports('PaletoBankRobbery', PaletoBankRobbery)

-- PacificBankRobbery
local function PacificBankRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-27", snippet = "Pacific Bank Robbery" },
            message = 'A robbery is happening at Pacific Bank near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 108,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Pacific Bank Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Pacific Bank Robbery',
                    icon = 'fas fa-university',
                }
            }
        }
    )
end
exports('PacificBankRobbery', PacificBankRobbery)

-- PrisonBreak
local function PrisonBreak()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-28", snippet = "Prison Break" },
            message = 'A prison break is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 285,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Prison Break Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Prison Break',
                    icon = 'fas fa-jail',
                }
            }
        }
    )
end
exports('PrisonBreak', PrisonBreak)

-- VangelicoRobbery
local function VangelicoRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-29", snippet = "Vangelico Robbery" },
            message = 'A robbery is happening at Vangelico Jewelry Store near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 617,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Vangelico Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Vangelico Robbery',
                    icon = 'fas fa-gem',
                }
            }
        }
    )
end
exports('VangelicoRobbery', VangelicoRobbery)

-- HouseRobbery
local function HouseRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-30", snippet = "House Robbery" },
            message = 'A house robbery is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 40,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "House Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'House Robbery',
                    icon = 'fas fa-home',
                }
            }
        }
    )
end
exports('HouseRobbery', HouseRobbery)

-- DrugSale
local function DrugSale()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-31", snippet = "Drug Sale" },
            message = 'A' .. playerData.sex .. ' is selling drugs near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 403,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Drug Sale Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Drug Sale',
                    icon = 'fas fa-cannabis',
                }
            }
        }
    )
end
exports('DrugSale', DrugSale)

-- ArtGalleryRobbery
local function ArtGalleryRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-32", snippet = "Art Gallery Robbery" },
            message = 'A robbery is happening at the Art Gallery near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 120,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Art Gallery Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Art Gallery Robbery',
                    icon = 'fas fa-palette',
                }
            }
        }
    )
end
exports('ArtGalleryRobbery', ArtGalleryRobbery)

-- HumaneRobery
local function HumaneRobery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-33", snippet = "Humane Labs Robbery" },
            message = 'A robbery is happening at Humane Labs near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 318,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Humane Labs Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Humane Labs Robbery',
                    icon = 'fas fa-flask',
                }
            }
        }
    )
end
exports('HumaneRobery', HumaneRobery)

-- TrainRobbery
local function TrainRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-34", snippet = "Train Robbery" },
            message = 'A train robbery is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 477,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Train Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Train Robbery',
                    icon = 'fas fa-train',
                }
            }
        }
    )
end
exports('TrainRobbery', TrainRobbery)

-- VanRobbery
local function VanRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-35", snippet = "Van Robbery" },
            message = 'A van robbery is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 67,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Van Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Van Robbery',
                    icon = 'fas fa-truck',
                }
            }
        }
    )
end
exports('VanRobbery', VanRobbery)

-- UndergroundRobbery
local function UndergroundRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-36", snippet = "Underground Robbery" },
            message = 'An underground robbery is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 78,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Underground Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Underground Robbery',
                    icon = 'fas fa-tunnel',
                }
            }
        }
    )
end
exports('UndergroundRobbery', UndergroundRobbery)

-- DrugBoatRobbery
local function DrugBoatRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-37", snippet = "Drug Boat Robbery" },
            message = 'A drug boat robbery is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 404,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Drug Boat Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Drug Boat Robbery',
                    icon = 'fas fa-ship',
                }
            }
        }
    )
end
exports('DrugBoatRobbery', DrugBoatRobbery)

-- UnionRobbery
local function UnionRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-38", snippet = "Union Depository Robbery" },
            message = 'A Union Depository robbery is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 108,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Union Depository Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Union Depository Robbery',
                    icon = 'fas fa-university',
                }
            }
        }
    )
end
exports('UnionRobbery', UnionRobbery)

-- YachtHeist
local function YachtHeist()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-39", snippet = "Yacht Heist" },
            message = 'A yacht heist is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 455,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Yacht Heist Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Yacht Heist',
                    icon = 'fas fa-ship',
                }
            }
        }
    )
end
exports('YachtHeist', YachtHeist)

-- CarBoosting
local function CarBoosting()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-40", snippet = "Car Boosting" },
            message = 'A' .. playerData.sex .. ' is boosting cars in the area near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 225,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Car Boosting Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Car Boosting',
                    icon = 'fas fa-car',
                }
            }
        }
    )
end
exports('CarBoosting', CarBoosting)

-- CarJacking
local function CarJacking()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-41", snippet = "Car Jacking" },
            message = 'A' .. playerData.sex .. ' is jacking cars in the area near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 403,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Car Jacking Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Car Jacking',
                    icon = 'fas fa-car-crash',
                }
            }
        }
    )
end
exports('CarJacking', CarJacking)

-- VehicleTheft
local function VehicleTheft()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-42", snippet = "Vehicle Theft" },
            message = 'A' .. playerData.sex .. ' has stolen a vehicle near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 490,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Vehicle Theft Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Vehicle Theft',
                    icon = 'fas fa-car-side',
                }
            }
        }
    )
end
exports('VehicleTheft', VehicleTheft)

-- SuspiciousActivity
local function SuspiciousActivity()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-43", snippet = "Suspicious Activity" },
            message = 'Suspicious activity detected near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 361,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Suspicious Activity Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Suspicious Activity',
                    icon = 'fas fa-user-secret',
                }
            }
        }
    )
end
exports('SuspiciousActivity', SuspiciousActivity)


-- IllegalRacing
local function IllegalRacing()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-44", snippet = "Illegal Racing" },
            message = 'Illegal racing detected near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 540,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Illegal Racing Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Illegal Racing',
                    icon = 'fas fa-flag-checkered',
                }
            }
        }
    )
end
exports('IllegalRacing', IllegalRacing)

-- Kidnapping
local function Kidnapping()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-45", snippet = "Kidnapping" },
            message = 'A kidnapping is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 365,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Kidnapping Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Kidnapping',
                    icon = 'fas fa-user-lock',
                }
            }
        }
    )
end
exports('Kidnapping', Kidnapping)

-- CyberAttack
local function CyberAttack()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-46", snippet = "Cyber Attack" },
            message = 'A cyber attack is detected near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 632,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Cyber Attack Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Cyber Attack',
                    icon = 'fas fa-laptop-code',
                }
            }
        }
    )
end
exports('CyberAttack', CyberAttack)

-- IllegalFishing
local function IllegalFishing()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-47", snippet = "Illegal Fishing" },
            message = 'Illegal fishing is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 317,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Illegal Fishing Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Illegal Fishing',
                    icon = 'fas fa-fish',
                }
            }
        }
    )
end
exports('IllegalFishing', IllegalFishing)

-- ArmsDeal
local function ArmsDeal()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-48", snippet = "Arms Deal" },
            message = 'An arms deal is happening near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 150,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Arms Deal Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Arms Deal',
                    icon = 'fas fa-hand-holding-usd',
                }
            }
        }
    )
end
exports('ArmsDeal', ArmsDeal)

local function SignRobbery()
    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    TriggerServerEvent("qs-dispatch:server:CreateDispatchCall",
        {
            job = "police",
            callLocation = playerData.coords,
            callCode = { code = "10-49", snippet = "Sign Robbery" },
            message = 'A' .. playerData.sex .. ' is stealing signs in the area near ' .. playerData.street_1 .. '.',
            flashes = false,
            image = nil,
            blip = {
                sprite = 487,
                scale = 1.5,
                colour = 1,
                flashes = false,
                text = "Sign Robbery Call",
                time = (3 * 60 * 1000),
            },
            otherData = {
                {
                    text = 'Sign Robbery',
                    icon = 'fas fa-sign',
                }
            }
        }
    )
end

exports('SignRobbery', SignRobbery)