-- DO NOT TOUCH THIS FILE IF YOU DON'T KNOW WHAT YOU'RE DOING!

-- Credits - https://forum.cfx.re/t/allow-drawgizmo-to-be-used-outside-of-fxdk/5091845/8


local lastDebugEnt = 0
editorModeIsActive = false
local gizmoToggle = false
finalGizmoCoords = vector3(0, 0, 0)
finalGizmoRotation = vector3(0, 0, 0)
finalGizmoHeading = 0

local function makeEntityMatrix(entity)
    local f, r, u, a = GetEntityMatrix(entity)
    local view = DataView.ArrayBuffer(60)

    view:SetFloat32(0, r[1])
        :SetFloat32(4, r[2])
        :SetFloat32(8, r[3])
        :SetFloat32(12, 0)
        :SetFloat32(16, f[1])
        :SetFloat32(20, f[2])
        :SetFloat32(24, f[3])
        :SetFloat32(28, 0)
        :SetFloat32(32, u[1])
        :SetFloat32(36, u[2])
        :SetFloat32(40, u[3])
        :SetFloat32(44, 0)
        :SetFloat32(48, a[1])
        :SetFloat32(52, a[2])
        :SetFloat32(56, a[3])
        :SetFloat32(60, 1)

    return view
end

local function applyEntityMatrix(entity, view)
    SetEntityMatrix(entity,
        view:GetFloat32(16), view:GetFloat32(20), view:GetFloat32(24),
        view:GetFloat32(0), view:GetFloat32(4), view:GetFloat32(8),
        view:GetFloat32(32), view:GetFloat32(36), view:GetFloat32(40),
        view:GetFloat32(48), view:GetFloat32(52), view:GetFloat32(56)
    )
end

local function clearEntityDraw(entity)
    if DoesEntityExist(entity) then SetEntityDrawOutline(entity, false) end
end

local function handleEditorMode()

    local hitEntDebug = lastDebugEnt or 0
    
    if not editorModeIsActive then
        if lastDebugEnt ~= 0 then
            clearEntityDraw(lastDebugEnt)
            lastDebugEnt = 0
        end

        return
    end

    local isPressed = IsDisabledControlPressed(0, 24)
    local wasReleased = IsDisabledControlJustReleased(0, 24)

    if wasReleased then
        clearEntityDraw(lastDebugEnt)
        lastDebugEnt = 0
    end

    if hitEntDebug == 0 and lastDebugEnt == 0 then return end

    local matrixBuffer = makeEntityMatrix(hitEntDebug)
    local changed = Citizen.InvokeNative(0xEB2EDCA2, matrixBuffer:Buffer(), 'Editor1', Citizen.ReturnResultAnyway())

    if changed then
        applyEntityMatrix(hitEntDebug, matrixBuffer)
    end

    if hitEntDebug then
        SetEntityDrawOutline(hitEntDebug, true)
    end

    if hitEntDebug ~= lastDebugEnt then
        if lastDebugEnt then clearEntityDraw(lastDebugEnt) end

        lastDebugEnt = hitEntDebug
    end

    finalGizmoCoords = GetEntityCoords(lastDebugEnt)
    finalGizmoRotation = GetEntityRotation(lastDebugEnt)
    finalGizmoHeading = GetEntityHeading(lastDebugEnt)
end

function GizmoToggle(ent)
    lastDebugEnt = ent
    editorModeIsActive = not editorModeIsActive

    if editorModeIsActive then
        EnterCursorMode()
        StartGizmoThread()
        gizmoToggle = not gizmoToggle
    else
        PlaceObject(finalGizmoCoords, finalGizmoRotation, finalGizmoHeading)
        LeaveCursorMode()
    end
end

function StartGizmoThread()
    CreateThread(function()
        while lastDebugEnt do
            Wait(0)
    
            if editorModeIsActive then
                DisableControlAction(0, 24, true) -- lmb
                DisableControlAction(0, 25, true) -- rmb
                DisableControlAction(0, 140, true) -- r
                DisablePlayerFiring(GetPlayerServerId(PlayerId()), false)
            end
    
            if gizmoToggle then
                DisableControlAction(0, 245, true) -- t
            end
            local success, err = pcall(handleEditorMode)
            if not success then
                print(err)
                editorModeIsActive = false
                LeaveCursorMode()
            end
    
            if IsControlJustPressed(0, 38) then
                if lastDebugEnt then
                    GizmoToggle()
                end
            end
        end
    end)
    
end

RegisterCommand("gizmoToggleSelection", function()
    if lastDebugEnt or gizmoToggle then
        gizmoToggle = not gizmoToggle;
    end
end, false)
