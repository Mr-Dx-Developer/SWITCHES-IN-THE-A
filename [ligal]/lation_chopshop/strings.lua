Strings = {}

-- Notifications
Strings.Notify = {
    started = 'Thanks for letting me know - I\'ll be in touch with you soon',
    assigned = 'You are already assigned a job - try again later',
    noPolice = 'There is not enough police in the city',
    lockSuccess = 'You successfully picked the lock',
    missingItem = 'You\'re missing the required tool to do this',
    torchBroke = 'You\'re torch broke',
    lugWrenchBroke = 'You\'re lug wrench broke',
    lockpickBroke = 'You\'re lockpick broke',
    notFinished = 'You have not chopped all parts yet',
    lackRequirements = 'You do not meet the requirements for this yet',
    lostSignal = 'The signal has been lost',
    cancelled = 'You\'ve successfully cancelled your assignment'
}

-- Phone messages
Strings.Phone = {
    job = {
        title = 'Vehicle Request',
        subject = 'Vehicle Request',
        sender = 'carwhisperer@autosales.com',
        name = 'Car Whisperer',
        content = 'Hey man! I got a job for you. I need you to find a ',
        content2 = ' for me. I\'ve updated your GPS with the last known area it was seen at.'
    }
}

-- Alert dialogs
Strings.AlertDialog = {
    docs = { -- If Config.Documentation is enabled, these are the tips/learn more options in the menu
        intro = { header = '**About Me**', content = '**Who am I?**  \n Name\'s Eddie. Around here, they call me the Car Whisperer. I\'ve got eyes and ears everywhere, keeping track of what rides are where. When the high rollers get bored of their fancy wheels, or someone "forgets" their car in the wrong part of town, that\'s where we come in. Whether it\'s dismantling them for parts or selling them off to a new owner, I\'m your man. So, if you\'ve got the guts and the skills, I\'ve got the jobs that\'ll make us both a pretty penny.  \n  \n **How do I start?**  \n We all gotta start somewhere. I need a few more runners to help me knock out some of the more mundane jobs. Once I know I can trust you, maybe I will send you out on some of my higher-end jobs. I get clients calling in all the time about specific requests they want, but these jobs are tougher. We\'ll get there. For now, just Request a Job to let me know you\'re available and I\'ll shoot you a message when I need you!  \n  \n **What is Reputation?**  \n Reputation is earned by completing a job - any job. Whether thats chopping a vehicle down into parts or selling it to some physco. Some vehicles reward more reputation than others. As your reputation increases, so will your job offers.' },
        mastery = { header = '**About the Mastery system**', content = '**What is Mastery?**  \n Mastery is where you can spend "Mastery Points" you\'ve earned to increase your skills and abilities related to vehicle chopping however you wish!  \n  \n **How do I earn points?**  \n Earning points is simple. For every 1,000 reputation you earn, you are automatically rewarded 1 Mastery Point to spend however you see fit.  \n  \n **How do the benefits work?**  \n Once you\'ve unlocked something, you have that benefit permanently. All benefits stack too! For example if you unlock two levels, one for +5% and one for +10%, you are earning a +15% total bonus!' },
        stats = { header = '**About Statistics**', content = 'The statistics section is a collection of data of everything you\'ve done. It keeps track of how many cars you\'ve chopped, how many parts you\'ve received and how much money you made in total over your entire vehicle chopping career. Let\'s pump these rookie numbers up!' },
        buttons = { confirm = 'Got it!', cancel = 'Cancel' }
    },
    job = { header = '**Vehicle Request**', content = 'Hey, it\'s me! I need you to get a ', content2 = ' for me. I have the general location it was last seen at. I\'ll update your GPS with the info!', confirm = 'Let\'s Go' },
    contracts = {
        confirm = { header = '**Are you sure?**', content = 'Before we go any further I just want to confirm you want to take this job.. once started there\'s no going back. You want to continue?', labels = { cancel = 'Nevermind', confirm = 'Let\'s Go' } },
        started = { header = '**Good Luck**', content = 'We put a tracker on this ', content2 = ' some time ago. I\'ll send the location it pings to your GPS. Pay attention to the color of the pings.. the signal strength isn\'t great and you may lose it after some time. Stay safe!', }
    },
    cancel = { header = '**Already Assigned**', content = 'You\'ve already been assigned a job to complete for me. *Do you want to cancel it?*', centered = true, cancel = true }
}

-- Context menus
Strings.Menu = {
    main = {
        title = 'What do you want?',
        rep = {
            title = 'Reputation',
            desc = 'You currently have ',
            desc2 = ' reputation',
            icon = 'chart-simple',
            color = ''
        },
        mastery = {
            title = 'Mastery',
            desc = 'You currently have ',
            desc2 = ' points',
            icon = 'folder-tree',
            color = ''
        },
        request = {
            title = 'Request a Job',
            desc = 'Mark yourself available for a job',
            icon = 'bell',
            color = ''
        },
        clients = {
            title = 'Client Requests',
            desc = 'Complete specific jobs for higher rewards',
            icon = 'hand',
            color = ''
        },
        stats = {
            title = 'Your Statistics',
            desc = 'View your current statistics',
            icon = 'chart-pie',
            color = ''
        },
        about = {
            title = 'Learn More',
            desc = 'About who I am and what I do here',
            icon = 'circle-question',
            color = '#72a8ec'
        }
    },
    mastery = {
        title = 'Mastery',
        about = {
            title = 'Learn More',
            desc = 'About the Mastery system',
            icon = 'circle-question',
            color = '#72a8ec'
        },
        unlocks = {
            lockTitle = 'Unlock Level ',
            unlockTitle = 'Unlocked Level ',
            lockIcon = 'lock',
            lockColor = '',
            unlockIcon = 'lock-open',
            unlockColor = ''
        }
        -- Most of the mastery menu is built from config.lua
    },
    clients = {
        title = 'Client Requests',
        request = {
            title = 'Requesting a ',
            desc = 'I have a client looking for a ',
            desc2 = '. They are willing to pay anywhere from $',
            desc3 = ' to $',
            desc4 = ' for the vehicle.',
            icon = 'fas fa-sack-dollar',
            color = ''
        },
        eliminate = {
            title = 'Eliminate a ',
            desc = 'I have a client that is looking to get a ',
            desc2 = ' chopped up - never to be seen again. Be careful, not sure what this vehicle is involved with.',
            icon = 'fas fa-hammer',
            color = ''
        }
    },
    stats = {
        title = 'Your Statistics',
        vehicles = {
            title = 'Vehicles Chopped',
            desc = 'You\'ve chopped a total of ',
            desc2 = ' vehicles',
            icon = 'car',
            color = ''
        },
        parts = {
            title = 'Parts Earned',
            desc = 'You\'ve earned a total of ',
            desc2 = ' parts',
            icon = 'screwdriver-wrench',
            color = ''
        },
        money = {
            title = 'Money Earned',
            desc = 'You\'ve earned a total of $',
            icon = 'sack-dollar',
            color = ''
        },
        about = {
            title = 'Learn More',
            desc = 'About the statistics section',
            icon = 'circle-question',
            color = '#72a8ec'
        }
    },
    toolShop = {
        title = 'Chop Shop',
        desc = 'Purchase a ',
        desc2 = ' for $'
    },
    swapShop = {
        title = 'Swap Shop',
        desc = 'Swap x',
        desc2 = ' auto parts for x'
    }
}

-- Targets
Strings.Target = {
    start = {
        label = 'Talk to Eddie',
        icon = 'fas fa-comment',
        color = '',
        dist = 2
    },
    lockpick = {
        label = 'Break in',
        icon = 'fas fa-lock',
        color = '',
        dist = 1.25
    },
    toolShop = {
        label = 'Open shop',
        icon = 'fas fa-shopping-basket',
        color = '',
        dist = 2
    },
    swapShop = {
        label = 'Swap parts',
        icon = 'fas fa-repeat',
        color = '',
        dist = 2
    },
    sell = {
        label = 'Make deal',
        icon = 'fas fa-sack-dollar',
        color = '',
        dist = 2
    },
    vehicle = {
        -- Hood
        hoodLabel = 'Remove hood',
        hoodIcon = 'fas fa-car',
        hoodColor = '',
        hoodDist = 2,
        -- Front driver door
        fddLabel = 'Remove driver door',
        fddIcon = 'fas fa-car',
        fddColor = '',
        fddDist = 1,
        -- Front passenger door
        fpdLabel = 'Remove passenger door',
        fpdIcon = 'fas fa-car',
        fpdColor = '',
        fpdDist = 1,
        -- Rear driver door
        rddLabel = 'Remove rear driver door',
        rddIcon = 'fas fa-car',
        rddColor = '',
        rddDist = 1,
        -- Rear passenger door
        rpdLabel = 'Remove rear passenger door',
        rpdIcon = 'fas fa-car',
        rpdColor = '',
        rpdDist = 1,
        -- Trunk
        trunkLabel = 'Remove trunk',
        trunkIcon = 'fas fa-car',
        trunkColor = '',
        trunkDist = 1,
        -- Front left tire
        fltLabel = 'Remove front left tire',
        fltIcon = 'fas fa-car',
        fltColor = '',
        fltDist = 1,
        -- Front right tire
        frtLabel = 'Remove front right tire',
        frtIcon = 'fas fa-car',
        frtColor = '',
        frtDist = 1,
        -- Rear left tire
        rltLabel = 'Remove rear left tire',
        rltIcon = 'fas fa-car',
        rltColor = '',
        rltDist = 1,
        -- Rear right tire
        rrtLabel = 'Remove rear right tire',
        rrtIcon = 'fas fa-car',
        rrtColor = '',
        rrtDist = 1,
        -- Frame
        frameLabel = 'Scrap frame',
        frameIcon = 'fas fa-car',
        frameColor = '',
        frameDist = 2
    }
}

Strings.InputDialog = {
    toolShop = {
        label = 'Quantity',
        desc = 'How many do you want to purchase?',
        icon = 'hashtag'
    },
    swapShop = {
        label = 'Quantity',
        desc = 'How many do you want to purchase?',
        icon = 'hashtag'
    }
}

Strings.Logs = {
    colors = {
        green = 65280,
        red = 16711680,
        yellow = 16776960,
    },
    titles = {
        requestJobStarted = '▶️ Mission Started',
        vehicleLockpicked = '🔓 Unlocked Vehicle',
        partChopped = '⚒️ Part Chopped',
        frameScrapped = '🚘 Frame Scrapped',
        brokeTool = '❌ Tool Broke',
        boughtTool = '🛒 Purchased Tool',
        swappedParts = '♻️ Parts Swapped',
        contractStarted = '📜 Contract Started',
        soldVehicle = '💰 Sold Vehicle'
    },
    messages = {
        playerName = '**Player Name**: ',
        playerID = '\n **Player ID**: ',
        playerIdent = '\n **Identifier**: ',
        message = '\n **Message**: ',
        requestJobStarted = 'Succesfully started a Request a Job mission - vehicle assigned is: ',
        vehicleLockpicked = 'Succesfully lockpicked vehicle: ',
        partChopped = 'Succesfully removed a ',
        frameScrapped = 'Succesfully completed the chop job for vehicle: ',
        brokeTool = 'Broke tool: ',
        boughtTool = 'Succesfully purchased a ',
        boughtTool2 = ' for $',
        swappedParts = 'Succesfully swapped x',
        swappedParts2 = ' for x',
        contractStarted = 'Succesfully started a contract mission for a ',
        soldVehicle = 'Succesfully sold a ',
        soldVehicle2 = ' for $'
    }
}