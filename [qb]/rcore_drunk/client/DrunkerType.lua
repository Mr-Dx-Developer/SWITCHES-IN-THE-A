local DrunkerType = 0

function SetDrunkerType(type)
    DrunkerType = type
end

function GetDrunkerType()
    return DrunkerType
end

function IsPlayerAtDrunkerType(type)
    return DrunkerType == type
end

function IsPlayerAboveDrunkerType(type)
    return DrunkerType >= type
end

function IsPlayerBelowDrunkerType(type)
    return DrunkerType <= type
end