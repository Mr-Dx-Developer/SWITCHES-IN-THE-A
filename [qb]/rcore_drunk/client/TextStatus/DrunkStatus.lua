LastDrunkLabel = nil

function GetDrunkLevelFor3DText()
    if IsDrunkBlocked() then
        return nil
    end

    if GetPlayerDrunkPercentage() >= Config.MaximumDrunkPercentage then
        return "passed_out"
    elseif GetPlayerDrunkPercentage() >= 60.0 then
        return "drunk_high"
    elseif GetPlayerDrunkPercentage() >= 30.0 then
        return "drunk_med"
    elseif GetPlayerDrunkPercentage() >= 5.0 then
        return "drunk_low"
    end
    return nil
end