

local timeSettings = "months" -- days or months
function CalculateTime(now, months)
    if timeSettings == "days" then
        local date = now + months * 24 * 60 * 60
        return date
    elseif timeSettings == "months" then
        local date = now + months * 30 * 24 * 60 * 60
        return date
    end
end