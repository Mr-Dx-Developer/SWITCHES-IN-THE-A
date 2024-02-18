
function DeleteEntityHelper(entity)
    local nTimeout = 0
    while not NetworkHasControlOfEntity(entity) and nTimeout < 100 do
        nTimeout = nTimeout + 1
        NetworkRequestControlOfEntity(entity)
        SetEntityAsMissionEntity(entity, true, true)
        DeleteEntity(entity)
        DeleteObject(entity)
        DeleteVehicle(entity)
        Citizen.Wait(50)
    end
    SetEntityAsMissionEntity(entity, true, true)
    DeleteEntity(entity)
    DeleteObject(entity)
    DeleteVehicle(entity)
end