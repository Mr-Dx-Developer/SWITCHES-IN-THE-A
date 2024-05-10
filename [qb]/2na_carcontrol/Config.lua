Config = {}

Config.MenuKey = 'Y'

-- Enable mileage system
Config.EnableMileageSystem = true

-- In how many milliseconds should the mileage system be run // Decrementing this value will increase the rise of mileage in every car
Config.MileageUpdateInterval = 1500

-- Script will never count the mileage of cars with these plates
Config.IgnoredPlates = {
    "ADMIN",
    "ADMINCAR"
}