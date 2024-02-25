KonfigCL = {}

KonfigCL.InfFuel = false
KonfigCL.FuelDrainTime = 1000 --every seccond to drain fuel from amount
KonfigCL.FuelDrainAmount = -0.1 -- drain
KonfigCL.HackMinigame = true -- set to false to disable datacrack

KonfigCL.PrinterPrintTime = 100 -- every 0.1 secconds add from amount
KonfigCL.PrinterProgressAddPerTick = 1.0 -- every 0.1 secconds add 1.0

KonfigCL.CloneTime = 100
KonfigCL.CloneProgressAddPerTick = 1.0


KonfigCL.UseNHForGen = false -- does not remove nh from the shops so if you want that removed just disable those shops and make or get a shop and add the required items
function TogglePower() -- if KonfigCL.UseNHForGen is false then this will work
    TriggerEvent("k_fraud2:turnOnItem", 1)-- you can add any context menu you want as long as its using this trigger in it
    --[[ EXAMPLE OF A CONTEXT MENU
        local genMenu = {
            {
                header = KonfigL.MenuGen,
                context = KonfigL.FuelMenu..""..currentFuel,
                isMenuHeader = true,
            },
            {
                header = KonfigL.TurnOnMenu,
                event = "k_fraud2:turnOnItem",
                args = {1}
            },
        }
        OpenMenu(genMenu)
    ]]
end




---Keybinds
KonfigCL.Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 191,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


--Movement
KonfigCL.IncreaseDist = 15 -- Scrollwheel Up
KonfigCL.DecreaseDist = 16 -- Scrollwheel Down

KonfigCL.HeightUp = 172 -- Arrow Up
KonfigCL.HeightDown = 173 -- Arrow Down

KonfigCL.HeadingRight = 175
KonfigCL.HeadingLeft = 174

KonfigCL.MovementDone = KonfigCL.Keys["E"]
----------

--Global
KonfigCL.PickupItem = KonfigCL.Keys["H"]
KonfigCL.ControlDist = KonfigCL.Keys["G"]
--------

--Gen
KonfigCL.StartFueling = KonfigCL.Keys["E"]
KonfigCL.OpenGenStats = KonfigCL.Keys["E"]
--

--Laptop
KonfigCL.StartPrinting = KonfigCL.Keys["E"]
KonfigCL.StartCloning = KonfigCL.Keys["ENTER"]
--

--Printer
KonfigCL.InstertSlip = KonfigCL.Keys["ENTER"]
KonfigCL.TakeSlip = KonfigCL.Keys["E"]
--

--Skimmer
KonfigCL.InsertBlank = KonfigCL.Keys["E"]
KonfigCL.InsertBlank = KonfigCL.Keys["E"]



function Notify(message)
    TriggerEvent('esx:showNotification', message)
end



