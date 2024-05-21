function isElectric(model)
    local table = {
        [`surge`],
        [`voltic`],
        [`voltic2`],
        [`raiden`],
        [`cyclone`],
        [`tezeract`],
        [`neon`],
        [`omnisegt`],
        [`iwagen`],
        [`caddy`],
        [`caddy2`],
        [`caddy3`],
        [`airtug`],
        [`rcbandito`],
        [`imorgon`],
        [`dilettante`],
        [`khamelion`],
        [`wheelchair`],
    }
    if table[model] ~= nil then
        return true
    else
        return false
    end
end

function updateVehicleHUD(dist, veh, plate, model, DistAdd, seat)
    if DoesEntityExist(veh) then
        local headlights = {}
        headlights[1], headlights[2], headlights[3] = GetVehicleLightsState(veh)
        local custom, r, g, b = GetVehicleXenonLightsCustomColor(veh)
        local ur, ug, ub = GetVehicleNeonLightsColour(veh)
        local engHealth = GetVehicleEngineHealth(veh)
        local bodHealth = GetVehicleBodyHealth(veh)
        local axleHealth = Config.Repairs.ExtraDamages and VehicleStatus[plate].axle * 10 or 0
        local batteryHealth = Config.Repairs.ExtraDamages and VehicleStatus[plate].battery * 10 or 0
        local oilHealth = Config.Repairs.ExtraDamages and VehicleStatus[plate].oil * 10 or 0
        local sparkHealth = Config.Repairs.ExtraDamages and VehicleStatus[plate].spark * 10 or 0
        local fuelHealth = Config.Repairs.ExtraDamages and VehicleStatus[plate].fuel * 10 or 0
        local tyreHealth = false
        local doorsOpen = false
        local passenger = (seat ~= -1) and not (seat ~= 1 and Config.Odometer.ShowPassengersAllIcons)
        for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do if IsVehicleTyreBurst(veh, v, 0) == 1 or IsVehicleTyreBurst(veh, v, 1) == 1 then tyreHealth = true break end end
        for _, v in pairs({0, 1, 2, 3}) do if GetVehicleDoorAngleRatio(veh, v) > 0.0 then doorsOpen = true break end end
        local table = {
            ["engine"] = {
                level = engHealth,
                text = (Config.System.Debug or Config.Odometer.odoCustomisation.showHealthValues) and math.floor(engHealth /10) or nil,
                visible = not passenger and Config.Odometer.OdoIconsToShow["engine"] and (Config.Odometer.OdoAlwaysShowIcons or engHealth < Config.Odometer.OdoShowLimit * 10),
            },
            ["body"] = {
                level = bodHealth,
                text = (Config.System.Debug or Config.Odometer.odoCustomisation.showHealthValues) and math.floor(bodHealth /10) or nil,
                visible = not passenger and Config.Odometer.OdoIconsToShow["body"] and (Config.Odometer.OdoAlwaysShowIcons or bodHealth < Config.Odometer.OdoShowLimit * 10)
            },
            ["axle"] = {
                level = axleHealth,
                text = (Config.System.Debug or Config.Odometer.odoCustomisation.showHealthValues) and math.floor(axleHealth/10) or nil,
                visible = not passenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["axle"] and (Config.Odometer.OdoAlwaysShowIcons or axleHealth < Config.Odometer.OdoShowLimit),
                col = currentEffect["axleEffect"] and 'rgba(255, 102, 0, 1.0)' or nil,
            },
            ["battery"] = {
                level = batteryHealth,
                text = (Config.System.Debug or Config.Odometer.odoCustomisation.showHealthValues) and math.floor(batteryHealth/10) or nil,
                visible = not passenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["battery"] and (Config.Odometer.OdoAlwaysShowIcons or batteryHealth < Config.Odometer.OdoShowLimit),
                col = currentEffect["batteryEffect"] and 'rgba(255, 102, 0, 1.0)' or nil,
            },
            ["oil"] = {
                level = oilHealth,
                text = (Config.System.Debug or Config.Odometer.odoCustomisation.showHealthValues) and math.floor(oilHealth/10) or nil,
                visible = not passenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["oil"] and (Config.Odometer.OdoAlwaysShowIcons or oilHealth < Config.Odometer.OdoShowLimit),
                col = currentEffect["oilEffect"] and 'rgba(255, 102, 0, 1.0)' or nil,
            },
            ["spark"] = {
                level = sparkHealth,
                text = (Config.System.Debug or Config.Odometer.odoCustomisation.showHealthValues) and math.floor(sparkHealth/10) or nil,
                visible = not passenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["spark"] and (Config.Odometer.OdoAlwaysShowIcons or sparkHealth < Config.Odometer.OdoShowLimit),
                col = currentEffect["sparkEffect"] and 'rgba(255, 102, 0, 1.0)' or nil,
            },
            ["fuel"] = {
                level = fuelHealth,
                text = (Config.System.Debug or Config.Odometer.odoCustomisation.showHealthValues) and math.floor(fuelHealth/10) or nil,
                visible = not passenger and Config.Repairs.ExtraDamages and Config.Odometer.OdoIconsToShow["fuel"] and (Config.Odometer.OdoAlwaysShowIcons or fuelHealth < Config.Odometer.OdoShowLimit),
                col = currentEffect["fuelEffect"] and 'rgba(255, 102, 0, 1.0)' or nil,
            },
            ["nos"] = {
                level = VehicleNitrous[plate] and (VehicleNitrous[plate].level * 10) or 0,
                visible = Config.Odometer.OdoIconsToShow["nos"] and not passenger and (VehicleNitrous[plate] and not Config.Overrides.disableNos and not purgemode) or false,
                text = boostLevel,
            },
            ["purge"] = {
                visible = Config.Odometer.OdoIconsToShow["nos"] and not passenger and(VehicleNitrous[plate] and not Config.Overrides.disableNos and purgemode) or false,
                col = nosColour and nosColour[plate] and 'rgba('..nosColour[plate][1]..', '..nosColour[plate][2]..', '..nosColour[plate][3]..', 1.0)' or nil,
                text = purgeCool,
            },
            ["headlight"] = {
                visible = not passenger and Config.Odometer.OdoIconsToShow["headlight"] and (headlights[2] == 1) or false,
                toggle = (headlights[3] == 1) or false,
                col = custom and 'rgba('..r..', '..g..', '..b..', 1.0)' or nil,
            },
            ["seatbelt"] = {
                visible = Config.Harness.HarnessControl and not isBike(model) and Config.Odometer.OdoIconsToShow["seatbelt"] and VehicleStatus[plate] and VehicleStatus[plate].harness == 0 and (not Config.Odometer.SeatbeltHideWhenBuckled or not seatBeltOn()) or false,
                seatbeltToggle = Config.Harness.HarnessControl and seatBeltOn()
            },
            ["harness"] = {
                visible = (Config.Harness.HarnessControl and not isBike(model) and Config.Odometer.OdoIconsToShow["harness"] and VehicleStatus[plate] and VehicleStatus[plate].harness == 1 and (not Config.Odometer.HarnessHideWhenBuckled or not HasHarness())) or false,
                harnessToggle = Config.Harness.HarnessControl and HasHarness()
            },
            ["underglow"] = {
                visible = not passenger and (Config.Odometer.OdoIconsToShow["underglow"] and not isBike(model) and VehicleStatus[plate] and VehicleStatus[plate].underglow == 1) or false,
                lights = { left = IsVehicleNeonLightEnabled(veh, 0), right = IsVehicleNeonLightEnabled(veh, 1), front = IsVehicleNeonLightEnabled(veh, 2), back = IsVehicleNeonLightEnabled(veh, 3), },
                col = 'rgba('..ur..', '..ug..', '..ub..', 1.0)'
            },
            ["manual"] = {
                visible = not passenger and (not isBike(model) and Config.Odometer.OdoIconsToShow["manual"] and VehicleStatus[plate] and VehicleStatus[plate].manual == 1) or false,
            },
            ["doors"] = {
                visible = not passenger and (not isBike(model) and Config.Odometer.OdoIconsToShow["doors"] and doorsOpen ~= false) or false,
            },
            ["wheel"] = {
                visible = not passenger and Config.Odometer.OdoIconsToShow["wheel"] and tyreHealth or false,
            },
            ["antilag"] = {
                visible = not passenger and ( VehicleStatus[plate] and VehicleStatus[plate].antiLag == 1) or false,
            },
            ["lowfuel"] = {
                visible = not isElectric(model) and not passenger and (Config.Odometer.OdoIconsToShow["lowfuel"] and (GetVehicleFuelLevel(veh) < 20)) or false,
            },
        }

        local odo = Config.Odometer.odoCustomisation

        local boxShadow = odo.backgroundShadow..' rgba('..odo.backgroundShadowColor[1]..', '..odo.backgroundShadowColor[2]..', '..odo.backgroundShadowColor[3]..', '..odo.backgroundShadowTransparency..')'..", "..odo.backgroundInnerShadow..' rgba('..odo.backgroundInnerShadowColor[1]..', '..odo.backgroundInnerShadowColor[2]..', '..odo.backgroundInnerShadowColor[3]..', '..odo.backgroundInnerShadowTransparency..')'

        local inlayTextSize = odo.inlayTextSize
        local inlayTextPosition = odo.inlayTextPosition
        local inlayTextColor = 'rgba('..odo.inlayTextColor[1]..', '..odo.inlayTextColor[2]..', '..odo.inlayTextColor[3]..')'
        local inlayTextGlow = odo.inlayTextGlow

        local iconBoxShadow = odo.iconBoxShadow
        local iconBoxShadowStyle = odo.iconBoxShadowStyle
        local iconBoxShadowCorners = odo.iconBoxShadowCorners

        local borderColor = 'rgba('..odo.backgroundBorderColor[1]..', '..odo.backgroundBorderColor[2]..', '..odo.backgroundBorderColor[3]..', '..odo.backgroundBorderTransparency..')'
        local borderWidth = odo.backgroundBorderWidth

        local mileageText = not passenger and ((type(dist) ~= "string")) and string.format("%06d", math.floor((dist or 0) + (DistAdd or 0))) or ''

        local mileagetextFont = odo.font

        local mileagetextSize = odo.mileagetextSize
        local mileagetextColor = 'rgba('..odo.mileagetextColor[1]..', '..odo.mileagetextColor[2]..", "..odo.mileagetextColor[3]..")"
        local mileagetextGlow = odo.mileagetextGlow..' rgba('..odo.mileagetextGlowColor[1]..', '..odo.mileagetextGlowColor[2]..", "..odo.mileagetextGlowColor[3]..", "..odo.mileagetextGlowTransparency..")"

        for k, v in pairsByKeys(table) do
            SendNUIMessage({
                updateHUD = true,
                canvasId = k..'Canvas',
                health = v.level,
                nitrousBoost = k == "nos" and NitrousActivated or nil,
                isVisible = v.visible,
                inlayText = v.text,
                headlightToggle = v.toggle,
                headlightColor = v.col,
                seatbeltToggle = v.seatbeltToggle,
                harnessToggle = v.harnessToggle,
                underLights = v.lights,
                underCol = v.col,
                damageColor = v.col,
                --Background stuff
                cornerRadius = odo.backgroundcornerRadius,
                borderColor = borderColor,
                borderWidth = borderWidth,
                positionPercent = odo.screenPosition,
                bgColor = 'rgba('..odo.backgroundColor[1]..', '..odo.backgroundColor[2]..', '..odo.backgroundColor[3]..', '..odo.backgroundColorTransparency..')',
                boxShadow = boxShadow,
                --Icon Stuff
                iconGlow = odo.iconGlow,
                iconColorMax = 'rgba('..odo.iconColorMax[1]..', '..odo.iconColorMax[2]..", "..odo.iconColorMax[3]..", 1.0)",
                iconColorMin = 'rgba('..odo.iconColorMin[1]..', '..odo.iconColorMin[2]..", "..odo.iconColorMin[3]..", 1.0)",
                size = odo.iconSize,
                iconBoxShadow = iconBoxShadow,
                iconBoxShadowStyle = iconBoxShadowStyle,
                iconBoxShadowCorners = iconBoxShadowCorners,
                inlayTextSize = inlayTextSize,
                inlayTextPosition = inlayTextPosition,
                inlayTextColor = inlayTextColor,
                inlayTextGlow = inlayTextGlow,
                -- MilageStuff
                showMilage = Config.Odometer.OdoIconsToShow["mileage"] == true,
                mileageText = mileageText,
                font = mileagetextFont,
                mileagetextSize = mileagetextSize,
                mileagetextColor = mileagetextColor,
                mileagetextGlow = mileagetextGlow
            })
        end
    else
        ExecuteCommand("hideHUD")
    end
end

RegisterCommand("showodohud", function()
    SendNUIMessage({ showHUD = true })
    if Config.Odometer.showSpeedometer then
        SendNUIMessage({ showSpeed = true })
    end
end, false)

RegisterCommand("hideodohud", function()
    SendNUIMessage({ hideHUD = true  })
    if Config.Odometer.showSpeedometer then
        SendNUIMessage({ hideSpeed = true })
    end
end, false)

function updateSpeedometer(vehicle, model)
    if Config.Odometer.showSpeedometer then
        if vehicle ~= 0 then -- Check if the player is in a vehicle
            local doorsOpen = false
            for _, v in pairs({0, 1, 2, 3}) do if GetVehicleDoorAngleRatio(veh, v) > 0.0 then doorsOpen = true break end end
            local speed = GetEntitySpeed(vehicle) * (Config.System.distkph and 3.6 or 2.236936)
            local rpm = GetVehicleCurrentRpm(vehicle)
            local gear = GetVehicleCurrentGear(vehicle)
            local maxSpeed = math.ceil(math.floor(GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel") - (Config.System.distkph and -40 or 20)) / 10) * 10
            local cus = Config.Odometer.speedCustomisation
            local plane = IsThisModelAPlane(model) or IsThisModelAHeli(model)
            SendNUIMessage({
                updateSpeedometer = true,
                speed = speed > math.floor(maxSpeed*0.95) and math.random(math.floor((maxSpeed*0.95)), maxSpeed) or speed,
                maxSpeed = maxSpeed, -- Fetch max speed from handling
                rpm = plane and math.ceil(GetEntityCoords(vehicle).z * 0.5) or (rpm > 0.95 and math.random(95, 100) / 100 or rpm),
                gear = gear ~= 0 and gear or "R",
                maxGear = GetVehicleHighGear(vehicle),
                fuel = not isElectric(model) and GetVehicleFuelLevel(vehicle) or 100,

                SpeedLocation = cus.SpeedLocation,
                SpeedSize = cus.SpeedSize,
                BorderWidth = cus.BorderWidth,
                BorderCol = 'rgba('..cus.BorderCol[1]..', '..cus.BorderCol[2]..', '..cus.BorderCol[3]..', '..cus.BorderTrans..')',
                BorderTrans = cus.BorderTrans,
                BorderStyle = cus.BorderStyle,

                BackgroundCol = 'rgba('..cus.BackgroundCol[1]..', '..cus.BackgroundCol[2]..', '..cus.BackgroundCol[3]..', '..cus.BackgroundTrans..')',
                BackgroundShadow = cus.BackgroundShadow,
                BackgroundShadowColor = 'rgba('..cus.BackgroundShadowColor[1]..', '..cus.BackgroundShadowColor[2]..', '..cus.BackgroundShadowColor[3]..', '..cus.BackgroundShadowTrans..')',

                TextColour = cus.TextColour,
                TextSize = cus.TextSize,
                font = cus.font,
                ColourHigh = cus.ColourHigh,

                isPlane = plane,
                isElectric = isElectric(model),
                showFuelMeter = cus.showFuelMeter,
                showRpmMeter = cus.showRpmMeter,

                ShowDigitalSpeed = cus.ShowDigitalSpeed,
                digitalSpeedLoc = cus.digitalSpeedLoc,
                digitalSpeedSize = cus.digitalSpeedSize,

                MarkerColour = 'rgba('..cus.MarkerColour[1]..', '..cus.MarkerColour[2]..', '..cus.MarkerColour[3]..', '..cus.MarkerTrans..')',
                MarkerColourHigh = 'rgba('..cus.MarkerColourHigh[1]..', '..cus.MarkerColourHigh[2]..', '..cus.MarkerColourHigh[3]..', '..cus.MarkerTrans..')',

                NeedleType = cus.NeedleType,

                SpeedNeedleLength = cus.SpeedNeedleLength,
                SpeedNeedleWidth = cus.SpeedNeedleWidth,
                SpeedNeedleCol = 'rgba('..cus.SpeedNeedleCol[1]..', '..cus.SpeedNeedleCol[2]..', '..cus.SpeedNeedleCol[3]..', '..cus.SpeedNeedleTrans..')',
                SpeedNeedleShadow = cus.SpeedNeedleShadow,
                SpeedNeedleShadowCol = 'rgba('..cus.SpeedNeedleShadowCol[1]..', '..cus.SpeedNeedleShadowCol[2]..', '..cus.SpeedNeedleShadowCol[3]..', '..cus.SpeedNeedleShadowTrans..')',

                rpmMeterLocation = cus.rpmMeterLocation,
                rpmMeterSize = cus.rpmMeterSize,
                rpmNeedleLength = cus.rpmNeedleLength,
                rpmNeedleWidth = cus.rpmNeedleWidth,
                rpmNeedleCol = 'rgba('..cus.rpmNeedleCol[1]..', '..cus.rpmNeedleCol[2]..', '..cus.rpmNeedleCol[3]..', '..cus.rpmNeedleTrans..')',
                rpmNeedleShadow = cus.rpmNeedleShadow,
                rpmNeedleShadowCol = 'rgba('..cus.rpmNeedleShadowCol[1]..', '..cus.rpmNeedleShadowCol[2]..', '..cus.rpmNeedleShadowCol[3]..', '..cus.rpmNeedleShadowTrans..')',

                fuelMeterLocation = cus.fuelMeterLocation,
                fuelMeterSize = cus.fuelMeterSize,
                fuelNeedleLength = cus.fuelNeedleLength,
                fuelNeedleWidth = cus.fuelNeedleWidth,
                fuelNeedleCol = 'rgba('..cus.fuelNeedleCol[1]..', '..cus.fuelNeedleCol[2]..', '..cus.fuelNeedleCol[3]..', '..cus.fuelNeedleTrans..')',
                fuelNeedleShadow = cus.fuelNeedleShadow,
                fuelNeedleShadowCol = 'rgba('..cus.fuelNeedleShadowCol[1]..', '..cus.fuelNeedleShadowCol[2]..', '..cus.fuelNeedleShadowCol[3]..', '..cus.rpmNeedleShadowTrans..')',

                highlights = { speed = cus.SpeedHighlight, high = cus.HighSpeedHighlight },
            })
        end
    end
end