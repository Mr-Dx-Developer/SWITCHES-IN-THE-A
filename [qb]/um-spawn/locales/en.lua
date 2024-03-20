if um.lang ~= 'en' then return end

Lang = {}

Lang.UI = {
    main = {
        spawn = 'SPAWN',
        last = {
            first = 'Last',
            second = 'Location',
            words = 'Remember, it doesn\'t matter where you were born, the important thing is to succeed'
        },
        my = 'My',
        back = 'Back'
    },
    menu = {
        map = 'Map',
        apart = {
            title = 'Apartments',
            desc = 'Here you can see and manage your apartments'
        },
        house = {
            title = 'Houses',
            desc = 'Here you can see and manage your houses'
        },
        bookmarks = {
            title = 'Bookmarks',
            desc = 'Here you can see and manage your bookmarks'
        },
        cinematic = 'Cinematic'
    },
    rent = {
        title = 'Select Apartments',
        button = 'Rent an apartment room'
    },
}

Lang.Bookmark = {
    input = {
        title = 'Add Location',
        first = {
            name = 'Location Name',
            desc = 'Name your special location'
        },
        second = {
            name = 'Location Image (URL)',
            desc = 'Insert a picture link here | only (discord or imgur)'
        },
    },
    dialog = {
        header = 'Bookmarks payout',
        content = 'Do you agree to pay %s$ to add this location to your bookmarks?'
    },
    error = {
        title = 'Bookmarks',
        link = 'Only discord or imgur link',
        money = 'You don\'t have enough money'
    }
}