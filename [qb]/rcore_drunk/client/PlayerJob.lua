PlayerData = {}

--- @param job string
--- @param GradeArray table
--- will return true/False if player is in this grade.
function IsPlayerAtJob(job, GradeArray)
    if Config.FrameworkType.Active == FrameworkType.CUSTOM then
        print("This function doesnt work on standalone!")
        return false
    end
    if PlayerData == nil or PlayerData.job == nil then
        print("ERROR! The player data has not been loaded! Please check if you have custom events for set/update/getshared object!")
        return false
    end

    if type(job) == "table" then
        if GradeArray == nil then
            return job[PlayerData.job.name]
        else
            if type(GradeArray) == "table" then
                return job[PlayerData.job.name] and GradeArray[PlayerData.job.grade_name]
            else
                return job[PlayerData.job.name] and PlayerData.job.grade_name == GradeArray
            end
        end
    end

    if GradeArray == nil then
        return PlayerData.job.name == job
    end

    if type(GradeArray) == "string" then
        return PlayerData.job.name == job and PlayerData.job.grade_name == GradeArray
    end

    return PlayerData.job.name == job and GradeArray[PlayerData.job.grade_name]
end

if Config.FrameworkType.Active == FrameworkType.ESX then

    CreateThread(function()
        local ESX = GetSharedObject()
        if ESX and ESX.IsPlayerLoaded() then
            PlayerData = ESX.GetPlayerData()
        end
    end)

    RegisterNetEvent(Config.ExtendedEvents.PlayerLoaded, function(data)
        PlayerData = data
    end)

    RegisterNetEvent(Config.ExtendedEvents.SetJob, function(data)
        PlayerData.job = data
    end)
end

if Config.FrameworkType.Active == FrameworkType.QBCORE then
    QBCore = GetSharedObject()
    function UpdatePlayerDataForQBCore()
        local pData = QBCore.Functions.GetPlayerData()

        local jobLabel = "none"
        local jobName = "none"
        local gradeName = "none"
        local grade = 0

        local grade_label = "none"
        local grade_salary = 0

        if pData.job then
            jobName = pData.job.name or "none"
            jobLabel = pData.job.label or "none"

            -- I am not sure if I should check if its nil or not so I will just make sure so it wont break anything.
            if pData.job.grade then
                local gradeData = pData.job.grade
                gradeName = gradeData.name

                if gradeData.level then
                    grade = gradeData.level
                end

                if gradeData.grade_label then
                    grade_label = gradeData.grade_label or "none"
                end

                if gradeData.grade_salary then
                    grade_salary = gradeData.grade_salary or 0
                end
            end
        end

        PlayerData = {
            job = {
                id = -1,
                name = jobName,
                label = jobLabel,

                grade_name = gradeName,
                grade_label = grade_label,
                grade_salary = grade_salary,
                grade = grade,

                skin_male = {},
                skin_female = {},
            }
        }
    end

    CreateThread(function()
        if QBCore and QBCore.Functions.GetPlayerData() then
            UpdatePlayerDataForQBCore()
        end
    end)

    RegisterNetEvent(Config.QBCoreEvents.OnPlayerLoaded, function()
        UpdatePlayerDataForQBCore()
    end)

    RegisterNetEvent(Config.QBCoreEvents.OnJobUpdate, function()
        UpdatePlayerDataForQBCore()
    end)
end