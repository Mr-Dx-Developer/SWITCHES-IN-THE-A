---@param WARNING: Do NOT rename this resource or it will not start!!
---  __    __  __       __  __       __  __    __         ______    ______   _______   ______  _______  ________   ______  -----
--  |  \  |  \|  \     /  \|  \     /  \|  \  |  \       /      \  /      \ |       \ |      \|       \|        \ /      \  ----
--  | $$  | $$| $$\   /  $$| $$\   /  $$| $$  | $$      |  $$$$$$\|  $$$$$$\| $$$$$$$\ \$$$$$$| $$$$$$$\\$$$$$$$$|  $$$$$$\  ---
---  \$$\/  $$| $$$\ /  $$$| $$$\ /  $$$ \$$\/  $$      | $$___\$$| $$   \$$| $$__| $$  | $$  | $$__/ $$  | $$   | $$___\$$  ---
----  >$$  $$ | $$$$\  $$$$| $$$$\  $$$$  >$$  $$        \$$    \ | $$      | $$    $$  | $$  | $$    $$  | $$    \$$    \  ----
---  /  $$$$\ | $$\$$ $$ $$| $$\$$ $$ $$ /  $$$$\        _\$$$$$$\| $$   __ | $$$$$$$\  | $$  | $$$$$$$   | $$    _\$$$$$$\  ---
--  |  $$ \$$\| $$ \$$$| $$| $$ \$$$| $$|  $$ \$$\      |  \__| $$| $$__/  \| $$  | $$ _| $$_ | $$        | $$   |  \__| $$  ---
--  | $$  | $$| $$  \$ | $$| $$  \$ | $$| $$  | $$       \$$    $$ \$$    $$| $$  | $$|   $$ \| $$        | $$    \$$    $$ ----
---  \$$   \$$ \$$      \$$ \$$      \$$ \$$   \$$        \$$$$$$   \$$$$$$  \$$   \$$ \$$$$$$ \$$         \$$     \$$$$$$ -----

--- BE SURE TO THOROUGHLY GO THROUGH AND CONFIGURE EACH SECTION TO YOUR SERVER SPECIFIC SETTINGS

Locales = Locales or {}
Config = Config or {}


Config = {

    VersionCheck = true, -- Enable or Disable Version Checks.                                                                                                                                                                                                                                                                                            

    Language = "en", -- Currently only available in english but can be adapted to other languages. Use the "en.lua" as a template.

    Core = "qb", -- "qb" or "esx"
    CoreObject = 'qb-core', -- supports the latest "qb-core" or "es_extended" 

    Debug = false, -- enables console prints for prop spawn and database saves.

    Target = 'qb-target', -- "qb-target", "ox_target", or "qtarget". You may edit cooking targets in in cl_targets.lua
    Distance = 2.0, -- Target Distance from Appliance

    Inventory = 'qs', 
    -- "ox" for ox_inventory, 
    -- "qb" for qb-inventory, or QB based Inventories, including QB version of Quasar Inventory.
    -- "esx" for esx based inventories.
    -- "qs" if using the ESX version of Quasar Inventory.

    -- REPLACE LINK BELOW WITH YOUR IMAGES FOLDER LINK.
    Images = "qs-inventory/html/images/", 
    -- Examples:
    -- "xmmx_letscookplus/html/images/ingredients/", -- uses the images in the html folder of the script
    -- "ox_inventory/web/images/", -- Ox Inventory Images Location
    -- "qb-inventory/html/images/", -- QB Inventory Images Location
    -- "qs-inventory/html/images/", -- QS Inventory Images Location
    
    Menu = 'ox', -- Menu System, "qb" for qb-menu or "ox" for ox_lib context menu.
    Input = 'qb', -- "qb" for qb-input, or "ox" for ox_lib input.
    Utils = 'qb', -- "ox" for ox_lib progress circle, or "qb" for default progressbar included with QBCore.    
    Notify = 'qb', -- "ox" for ox_lib notifications or "qb" for QBCore notifications.
    Position = 'top', -- If using ox_lib for Notifications only! 'top', 'top-right', 'top-left', 'bottom', 'bottom-right', 'bottom-left', 'center-right' or 'center-left'



    --[[PropObjects: Add or remove targetable prop hash/model numbers for menus here. ]]
    Stoves      = { 366814469, 458266265, 260566774, -718917135, 134970185, -1781967271 }, 
    Microwaves  = { 356462018, 1490269418 },
    Juicers     = { 1859812803, -1599176945, -1444496707, 1877774432, 469594741 },
    Coffees     = { -170500011, 1173831889, 1653123003, 1862437453, 4124467285 },
    Grills      = { 286252949, 519797612, 1903501406, -770250239, -231635166, 2122005082 },
    Toasters    = { 1055533654, 1697216212, -1505729971 },
    Fryers      = { -512779781, 260566774, -718917135, 3782187515 },
    Griddles    = { 2050228397 },
    Processors  = { -1415058956, 2879908340 },
    Printers    = { -78931017 },
    Still       = { -274348208 },
    HoboStoves  = { 690464963 },
    
    -- The props which are placed by player and saved to database.
    StoveProp       = 'prop_cooker_03',
    GrillProp       = 'prop_bbq_1',
    PartyboxProp    = 'sf_prop_sf_speaker_stand_01a', 
    HoboProp        = 'prop_hobo_stove_01', 
    MicrowaveProp   = 'prop_micro_01', 
    JuicerProp      = 'prop_kitch_juicer', 
    CoffeeProp      = 'prop_coffee_mac_02', 
    GriddleProp     = 'prop_griddle_01', 
    ProcessorProp   = 'prop_foodprocess_01', 
    ToasterProp     = 'prop_toaster_02', 
    FryerProp       = 'prop_copper_pan', 
    TableProp       = 'prop_ff_counter_03', 
    ChairProp       = 'apa_mp_h_stn_chairarm_26', 
    TentProp        = 'prop_gazebo_03', 
    StillProp       = 'prop_still', 
    PrinterProp     = 'prop_printer_02',

    -- These props are not saved to databse.
    WeaponBench     = `gr_prop_gr_bench_01b`, -- Can Change
    AttachmentBench = `gr_prop_gr_bench_02b`, -- Can Change
    AmmoBench       = `gr_prop_gr_bench_02a`, -- Can Change



    --[[ Animations: Edit/Set different AnimDict and Animations here when using an object, placing or removing a prop, and opening grocery bags. 
    --- Change to any scenario you want. Scenarios found here: https://wiki.rage.mp/index.php?title=Scenarios ]]
    StoveAnimDict = "amb@prop_human_bbq@male@base",         StoveAnim = "base",
    MicroAnimDict = "amb@prop_human_bbq@male@base",         MicroAnim = "base",
    JuicerAnimDict = "mini@strip_club@drink@one",           JucierAnim = "one_bartender",    
    BrewAnimDict = "mini@strip_club@drink@one",             BrewAnim = "one_bartender",
    GrillAnimDict = "amb@prop_human_bbq@male@base",         GrillAnim = "base",    
    ToastAnimDict = "mp_ped_interaction",                   ToastAnim = "handshake_guy_a",    
    FryerAnimDict = "amb@prop_human_bbq@male@base",         FryerAnim = "base",     
    GridAnimDict = "amb@prop_human_bbq@male@base",          GridAnim = "base",    
    ProcAnimDict = "mini@strip_club@drink@one",             ProcAnim = "one_bartender",
    StillAnimDict = "random@shop_tattoo",                   StillAnim = "_idle_a",
    HoboAnimDict = "random@shop_tattoo",                    HoboAnim = "_idle_a",
    PropPlaceDict = "mp_arresting",                         PropPlaceAnim = "a_uncuff",     
    PropRemoveDict = "timetable@floyd@clean_kitchen@base",  PropRemoveAnim = "base",
    BagAnimDict = "mp_arresting",                           BagAnim = "a_uncuff",

    -- Weapon Crafting:
    PlaceBenchAnimDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",   PlaceBenchAnim = "machinic_loop_mechandplayer",
    RemoveBenchAnimDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",  RemoveBenchAnim = "machinic_loop_mechandplayer",
    CraftAnimDict = "mini@repair",                                     CraftAnim = "fixing_a_ped",

    

    --[[ Timers: when completing a task such as grilling, jucing, etc. ]]
    StoveTimer = 5000,
    GrillTimer = 5000,
    MicroTimer = 5000,
    JuicerTimer = 5000,
    BrewTimer = 5000,
    GriddleTimer = 5000,
    ProcTimer = 5000,
    ToastTimer = 5000,
    FryerTimer = 5000,
    StillTimer = 5000,
    HoboTimer = 8000,
    WeaponTimer = 5000, -- Weapons Crafting Progress Time
    AttachmentTimer = 5000, --Attachments Crafting Progress Time
    AmmuntionTimer = 5000, -- Ammunition Crafting Progress Time

     

    -- MiniGame: PS-UI found here: https://github.com/Project-Sloth/ps-ui
    -- Configure your own minigames in xmmx_letscookplus/client/editable2.lua
    UseMinigame = false, -- Enable or Disable MiniGame Option for Crafting Consumables.
    FireFailure = true, -- 2 out of 4 random chance the player will be set on fire if Minigame failure. (no longer kills you but reduces health)

    --[[ Moonshining Crafting Minigame: ]]
    UseShineMinigame = false, -- Enable or Disable MiniGame Option for Crafting Moonshine.
    ShineExplodeFailure = true, -- 2 out of 4 random chance the still will explode if Minigame failure.

    --[[ Weapon Crafting Minigame: ]]
    UseCraftMinigame = true, -- Enable or Disable the use of Minigame when Crafting Weapons.
    CraftFailure = true, -- 1 out of 3 chance the table is deleted if Minigame is Failed.
    
    --[[ Optional: PS-DISPATCH or Configure your Police Alert in xmmx/letscookplus/client/cl_editable.lua (For Moonshine Crafting Only, Police Alerts). ]]
    MoonshineDispatch = true,
    WeapCraftDispatch = true,


    -- [[ Crafting: If using the Weapons, Ammo, and Attachment Crafting System, enable this to give a random item when consuming food and drinks. ]]
    ItemsCraft = false, -- Gives a random item from CraftItems below when a player consumes foods crafted from the ingredients.
    CraftAmts = math.random(1, 2),    
    CraftingItems = { --[[ Items used to craft weapons, attachments, and ammo.  ]]
        'lcglassjar', 
        'lcaluminum', 
        'lcsteelcan', 
        'lcstyrofoam', 
    },                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
}

if Config.Core == 'esx' then 
    ESX = exports[Config.CoreObject]:getSharedObject()
elseif Config.Core == 'qb' then 
    QBCore = exports[Config.CoreObject]:GetCoreObject()
end



