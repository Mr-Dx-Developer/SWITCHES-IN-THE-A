JobsData = {

    --[[
        If the player's job is in more than one list, all of them will appear and you can select them,
        This can also be used for medical among other jobs, just remember to set jai to false
    ]] --

    --[[
        DONT PLACE JAIL TIME < 1 ONLY PUT 0 OR >= 1
    ]]

    --[[
        THE FINE IN THE PENAL CODES ITS A REFERENCE TO THE PLAYER THE FINE IS NOT AUTOMATLY SEND TO THE PLAYER...
    ]]

    [0] = {
        title = 'Penal Code of San Andreas',
        desc =
        'The Penal Code of San Andreas is the primary set of laws governing the state of San Andreas. The Penal Code is a collection of laws passed by the San Andreas State Legislature and signed into law by the Governor of San Andreas. The Penal Code is organized by subject matter under an expandable three-factor chapter heading system. The Penal Code is maintained by the San Andreas Department of Justice.',
        jobs = {
            'police',
            'sheriff',
            'fbi'
        },
        --[[
            if the fine total its 0 the player will not receive a fine
        ]] --
        PenalCode = {
            {
                title = 'Theft',
                desc = 'Taking property without consent, with intent to keep.',
                fine = 300,
                jailTime = 1, -- minutes
            },
            {
                title = 'Assault',
                desc = 'Intentionally causing harm t o another person.',
                fine = 400,
                jailTime = 10, -- minutes
            },
            {
                title = 'Vandalism',
                desc = 'Damaging property without permission.',
                fine = 250,
                jailTime = 7, -- minutes
            },
            {
                title = 'Fraud',
                desc = 'Deceptive practices to gain value through false representation.',
                fine = 500,
                jailTime = 12, -- minutes
            },
            {
                title = 'Trespassing',
                desc = 'Entering a property without authorization.',
                fine = 150,
                jailTime = 5, -- minutes
            },
            {
                title = 'Disturbing Peace',
                desc = 'Engaging in behavior that disrupts public peace.',
                fine = 200,
                jailTime = 8, -- minutes
            },
            {
                title = 'Public Intoxication',
                desc = 'Being visibly drunk or intoxicated in a public place.',
                fine = 180,
                jailTime = 6, -- minutes
            },
            {
                title = 'Reckless Driving',
                desc = 'Operating a vehicle in a manner that endangers others.',
                fine = 350,
                jailTime = 10, -- minutes
            },
            {
                title = 'Shoplifting',
                desc = 'Stealing merchandise from a store.',
                fine = 120,
                jailTime = 5, -- minutes
            },
            {
                title = 'Disorderly Conduct',
                desc = 'Behaving in a disruptive or disorderly manner in public.',
                fine = 160,
                jailTime = 6, -- minutes
            },
        }
    },
    [1] = {
        title = 'EMS Department of San Andreas',
        desc = 'The list of services that the EMS Department of San Andreas provides to the citizens of San Andreas.',
        jobs = {
            'ambulance',
            'police'
        },
        --[[
            if the fine total its 0 the player will not receive a fine
        ]] --
        PenalCode = {
            {
                title = 'Injured',
                desc = 'Injured in an accident or other incident.',
                fine = 300,
                jailTime = 0, -- minutes
            },
            {
                title = 'Sick',
                desc = 'Sick or ill.',
                fine = 400,
                jailTime = 0, -- minutes
            },
            {
                title = 'Unconscious',
                desc = 'Unconscious or unresponsive.',
                fine = 250,
                jailTime = 0, -- minutes
            },
            {
                title = 'Dead',
                desc = 'Dead or deceased.',
                fine = 500,
                jailTime = 0, -- minutes
            },
            {
                title = 'Other',
                desc = 'Other.',
                fine = 150,
                jailTime = 0, -- minutes
            },
        }
    }
}
