local Translations = {
    error = {
        ["canceled"]                    = "Canceled..",
        ["someone_recently_did_this"]   = "Someone recently did this..",
        ["cannot_do_this_right_now"]    = "Cannot do this right now..",
        ["does_not_speak"]   = "He does not have anything to give..",
        ["you_cannot_do_this"]          = "You cannot do this..",
        ["you_dont_have_enough_money"]  = "You dont have enough money..",
        ["no_package"]  = "You're are not holding a package..",
        ["no_oxy"]  = "You don't have any oxy..",
        ["occupied_routes"]  = "All Routes are currently occupied, try again later..",
    },
    success = {
        ["you_have_arrived"]              = "You have arrived at the marked location, wait for customers..",
        ["location_marked"]     = "Drive to the Location marked on your GPS..",
        ["suppliers_position"]                        = "The suppliers position has been marked on your GPS..",
        ["send_email_right_now"]                 = "I will send you an e-mail right now..",
        ["start_run"]                 = "You've signed in, get yourself a vehicle..",
    },
    mailstart = {
        ["sender"]                      = "Unknown",
        ["subject"]                     = "Special Delievery",
        ["message"]                     = "Thanks for helping me out, you will be awarded generously! Find yourself a vehicle so you can get to the supplier. Make sure to get there on time and start selling alone, otherwise you will end up spooking the customers!",
    },
    mailfinish = {
        ["sender"]                      = "Unknown",
        ["subject"]                     = "Special Delievery",
        ["message"]                     = "You have done me a great favour! Come back to me when you're ready for more!",
    },
    target = {
        ["oxyboss"]                      = "Sign In",
        ["oxysupplier"]                  = "Grab Package",
        ["handoff_package"]              = "Handoff Package",
    },
    progress = {
        ["talking_to_boss"]                  = "Talking to Boss..",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
