CinematicModeOn = false
CinematicHeight = 0.2

function CinematicShow(bool)

    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    CinematicModeOn = bool
    if bool then
        for i = CinematicHeight, 0, -1.0 do
            Wait(10)
            w = i
        end
        HideHud()
    else
        for i = 0, CinematicHeight, 1.0 do
            Wait(10)
            w = i
        end
        ShowHud()
        if IsPedInAnyVehicle(PlayerPed) then
            DisplayRadar(true)
        else
            if Config.ShowMapWhileWalking then
                Wait(200)
                DisplayRadar(true)    
            end
        end
    end
    if w > 0 then
        CreateThread(function()
            local minimap = RequestScaleformMovie("minimap")
            if not HasScaleformMovieLoaded(minimap) then
                RequestScaleformMovie(minimap)
                while not HasScaleformMovieLoaded(minimap) do
                    Wait(1)
                end
            end
            while w > 0 do
                Wait(0)
                BlackBars()
                DisplayRadar(0)
            end
        
        end)
    end
end

function BlackBars()
    DrawRect(0.0, 0.0, 2.0, w, 0, 0, 0, 255)
    DrawRect(0.0, 1.0, 2.0, w, 0, 0, 0, 255)
end