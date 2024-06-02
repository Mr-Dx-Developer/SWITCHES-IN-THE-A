Config = {}

-- 'auto_detect' for auto detect framework
-- 'esx' for ESX
-- 'qb' for QB
Config.Framework = 'auto_detect'

-- Used export method
-- If you have getObject problem change this option to false
Config.MethodExport = true

-- This is name for your framework
-- If you use a custom clothing name, place it in clothing name
Config.NameListResource = {
   -- ['esx'] = 'es_extended',
    ['qb'] = 'qb-core',
    ['clothing'] = 'illenium-appearance'
}

-- Type menu
-- 'framework' - Menu of your framework
-- 'ox_lib' - Open menu ox_lib
Config.Menu = 'ox_lib'

-- 0 - auto detect clothing
-- 1 - esx_skin or qb-clothing(official version)
-- 2 - fivem-appearance or illenium-appearance
-- 3 - qb-clothing (modded version)
-- 4 - ak47_qb_clothing
Config.Clothing = 2

-- Your triggers names 
Config.ListEvent = {
    ['esx'] = {
        ['esx'] = 'esx:getSharedObject',
        ['bill'] = 'esx_billing:sendBill',
        ['society'] = 'esx_society:openBossMenu'
    },

    ['qb'] = {
     --   ['qb-bossmenu'] =  'qb-bossmenu:server:openMenu',
        ['qb-management'] = 'qb-bossmenu:client:OpenMenu'
    }
}

-- ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║
--╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║
-- ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

-- Type
-- 1 - Onlyjob - This option you must have a job like any other job 
-- 2 - Multijob - This option is created by me with this option you can have a job and use the nails menu
-- 3 - Store - It does not need any work and the player can change the nails at the specified coordinates.
-- Name - The job name
Config.Job = {
    Type = 1,
    Name = 'nail'
}

-- These coordinates only work if Config.Job.Type is equal to 3 else ignore this coordinates
Config.Coords = {
    vector3(218.93, -1546.04, 29.29),
    vector3(215.83, -1548.23, 29.29),
}

-- Open key menu default F6
Config.KeyOpenMenu = 167

-- Menu position only esx
Config.MenuPos = 'bottom-right'

-- Time animation in miliseconds
Config.Animation = {
    Dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
    Anim = 'machinic_loop_mechandplayer',
    TimeAnimation = 3000 
}

-- This option is only allowed for esx so qbus will always be true
-- if true it only enters the function once if the player is close to the marker
-- if it is false it will enter the function every millisecond if the player is close to the marker
-- This option is optional to modify only if you have problems with the marker
Config.PassiveHelpNotify = false

-- true The player could nail himself when there are no players nearby and also nail nearby players
-- false The player can only nail nearby players
Config.SelfNailMenu = true

-- only if you use Config.Job.Type as 3 this will be the money that will be charged to the player
Config.StorePayment = 250

-- Here you can add more nails to the menu
Config.Nails = {
    ['esx'] = {
        Type = 'bags',
    },
    ['qb'] = {
        Type = 'bag',
    },
    ComponentId = 5,    --not touch
    Numbers = {
        {id = 52, max = 9},
        {id = 53, max = 9},
        {id = 54, max = 9},
        {id = 55, max = 9},
        {id = 56, max = 9},
        {id = 57, max = 9},
        {id = 58, max = 9},
    },
}

Config.Groups = {
    ['esx'] = {                                                                         
        'superadmin',
        'admin'
    },
    ['qb'] = {
        'god',
        'admin'
    }
}

--██╗      ██████╗  ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
--██║     ██╔═══██╗██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
--██║     ██║   ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
--██║     ██║   ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
--███████╗╚██████╔╝╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
--╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝                                                                   

-- Draw marker types
Config.DrawMarker = {
    DrawDistance = 10.0,
    type = 20,
    size = {0.5,0.5,0.5},
    rgb = {46,129,183}
}

-- Blips
Config.Blip = {
    Enable = true,
    Coords = vector3(219.92, -1543.41, 29.29),
    Options = {
        Sprite = 621,
        Color = 8,
        Scale = 0.8,
        Display = 4
    }
}

-- Options bossMenu
-- WashMoney true or false only esx 
Config.BossMenu = {
    Enable = true,
    WashMoney = false,
    Coords = {
        vector3(225.72, -1544.73, 29.29)
    }
}

--██╗      █████╗ ███╗   ██╗ ██████╗ ██╗   ██╗ █████╗  ██████╗ ███████╗███████╗
--██║     ██╔══██╗████╗  ██║██╔════╝ ██║   ██║██╔══██╗██╔════╝ ██╔════╝██╔════╝
--██║     ███████║██╔██╗ ██║██║  ███╗██║   ██║███████║██║  ███╗█████╗  ███████╗
--██║     ██╔══██║██║╚██╗██║██║   ██║██║   ██║██╔══██║██║   ██║██╔══╝  ╚════██║
--███████╗██║  ██║██║ ╚████║╚██████╔╝╚██████╔╝██║  ██║╚██████╔╝███████╗███████║
--╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝                                                                  
Config.Language = 'en'
Config.Languages = {
	['en'] = {
        ['TITLE_BLIP'] = 'Nails shop',
        ['PRESS_TO_OPEN'] = 'Press E to open boss menu',
        ['PRESS_TO_OPEN_NAIL'] = 'Press E to change nails',
        ['NAILS'] = 'Nails',
        ['AMOUNT_INVALID'] = 'Amount invalid',
        ['AMOUNT_BILL'] = 'Amount bill',
        ['NOT_PLAYER_NEARBY'] = 'Not player near',
        ['NAILS_MENU'] = 'Nails menu',
        ['BILLING'] = 'Billing',
        ['SEND_BILL'] = 'Send bill',
        ['NAILS_ACTIONS'] = 'Nails actions',
        ['OPEN_MENU_WAIT'] = 'Loading Menu..',
        ['WRITE_NAME_JOB'] = 'Write the name of the job',
        ['WRITE_GRADE_JOB'] = 'Write the grade of the job',
        ['WRITE_ID_PLAYER'] = 'Write the player id',
        ['PLAYER_NOT_JOB'] = 'The player does not have a %s job',
        ['PLAYER_REMOVE_JOB'] = 'The player %s was removed %s',
        ['PLAYER_ALREADY_GRADE'] = 'The player already has that grade',
        ['PLAYER_ADD_GRADE'] = 'The player %s was modified from %s job to grade %s',
        ['PLAYER_ADD_JOB'] = 'The player %s was added from %s job to grade %s',
        ['STORE_NOT_MONEY'] = 'You need $%s money to change your nails',
        ['STORE_PAY'] = 'You have paid $%s for the change of your nails',
        ['LANG_UI'] = {
            ['NAIL'] = 'Nail',
            ['DIVISER'] = '/',
            ['NAIL_COLOR'] = 'Colour',
            ['BUTTON_SUCCESS'] = 'Success'
        }
    },

	['es'] = {
        ['TITLE_BLIP'] = 'Tienda de uñas',
        ['PRESS_TO_OPEN'] = 'Presiona E para abrir el menu de boss',
        ['PRESS_TO_OPEN_NAIL'] = 'Presiona E para cambiar tus uñas',
        ['NAILS'] = 'Uñas',
        ['AMOUNT_INVALID'] = 'Cantidad invalida',
        ['AMOUNT_BILL'] = 'Precio de la factura',
        ['NOT_PLAYER_NEARBY'] = 'No hay jugadores cerca',
        ['NAILS_MENU'] = 'Menu de uñas',
        ['BILLING'] = 'Facturas',
        ['SEND_BILL'] = 'Enviar factura',
        ['NAILS_ACTIONS'] = 'Acciones',
        ['OPEN_MENU_WAIT'] = 'Cargando el menu..',
        ['WRITE_NAME_JOB'] = 'Escribe el nombre del trabajo',
        ['WRITE_GRADE_JOB'] = 'Escribe el grado del trabajo',
        ['WRITE_ID_PLAYER'] = 'Escribe el id del jugador',
        ['PLAYER_NOT_JOB'] = 'El jugador no tiene el trabajo de %s',
        ['PLAYER_REMOVE_JOB'] = 'El jugador %s fue removido de %s',
        ['PLAYER_ALREADY_GRADE'] = 'El jugador ya tiene ese grado',
        ['PLAYER_ADD_GRADE'] = 'El jugador %s fue modificado de %s al grado %s',
        ['PLAYER_ADD_JOB'] = 'El jugador %s fue agregado como %s grado %s',
        ['STORE_NOT_MONEY'] = 'Necesitas $%s de dinero para cambiarse las uñas',
        ['STORE_PAY'] = 'Has pagado $%s por el cambio de tus nails',
        ['LANG_UI'] = {
            ['NAIL'] = 'Uña',
            ['DIVISER'] = '/',
            ['NAIL_COLOR'] = 'Color',
            ['BUTTON_SUCCESS'] = 'Confirmar'
        }
    }
}
