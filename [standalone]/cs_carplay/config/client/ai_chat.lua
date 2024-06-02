
--- In Built AI Chat System ---

CodeStudio.AI_Chat = {
    [1] = {
        Questions = { 
            'hello', 
            'hi', 
            'welcome', 
            'hey there', 
            'greetings' 
        },
        Answer = 'Hello! How can I assist you today?',
    },
    [2] = {
        Questions = {       --You can Add Multiple Questions
            'What is the Discord for this server?',
            'Discord for this server',
            'What is the server Discord?',
        },
        Answer = 'The Discord for this server is CodeStudio',
    },
    [3] = {
        Questions = {
            'What is the Server Name?',
            'Server Name',
            'What is Server',
        },
        Answer = 'The Server is CodeStudio',
    },
    [4] = {
        Questions = {
            'Open Map',
            'Show Map',
            'Display Map',
        },
        Answer = 'Ok',
        CloseUI = true,
        action = function(entity)
            openMap()  -- You can put your event/function/command anything that you want to execute here
        end
    },
    [5] = {
        Questions = {
            'Open All Doors',
            'Open All Car Doors',
            'Unlock All Doors',
        },
        Answer = 'Ok Opened All Doors',
        CloseUI = true,
        action = function(entity)
            vehicleDoor('all')
        end
    },
    [6] = {
        Questions = {
            'Close All Doors',
            'Close All Car Doors',
            'Lock All Doors',
        },
        Answer = 'Ok Closed All Doors',
        CloseUI = true,
        action = function(entity)
            vehicleDoor('closeall')
        end
    },
    [7] = {
        Questions = {
            'Open Hood',
            'Open Car Hood',
        },
        Answer = 'Ok Hood is now open',
        action = function(entity)
            vehicleDoor(4)
        end
    },
    [8] = {
        Questions = {
            'Close Hood',
            'Close Car Hood',
        },
        Answer = 'Ok Hood is now closed',
        action = function(entity)
            vehicleDoor(4)
        end
    },
    [9] = {
        Questions = {
            'Open Trunk',
            'Open Car Trunk',
        },
        Answer = 'Ok Trunk is now open',
        action = function(entity)
            vehicleDoor(5)
        end
    },
    [10] = {
        Questions = {
            'Close Trunk',
            'Close Car Trunk',
        },
        Answer = 'Ok Trunk is now closed',
        action = function(entity)
            vehicleDoor(5)
        end
    },
    [11] = {
        Questions = {
            'Engine Off',
            'Turn Off Engine',
            'Switch Off Engine',
        },
        Answer = 'Ok Engine is now off',
        action = function(entity)
            vehicleDoor('engineOff')
        end
    },
    [12] = {
        Questions = {
            'Engine On',
            'Turn On Engine',
            'Switch On Engine',
        },
        Answer = 'Ok Engine is now on',
        action = function(entity)
            vehicleDoor('engineOn')
        end
    },
    [13] = {
        Questions = {
            'Car Name',
            'Vehicle Name',
            'What is my car name?',
        },
        Answer = 'Your Vehicle Name is: ' .. GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
    },
    [14] = {
        Questions = {
            'Play Music',
            'Play this Music',
            'Can you play this',
        },
        Answer = 'Ok Playing',
        MusicURL = true             --MusicURL = true: If this question contains music url it will play that
    },
}
