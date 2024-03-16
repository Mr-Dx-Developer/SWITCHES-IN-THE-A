local Translations = {
    error = {
        ["canceled"]                    = "Canceled..",
        ["someone_recently_did_this"]   = "Someone recently did this..",
        ["cannot_do_this_right_now"]    = "Cannot do this right now..",
        ["you_cannot_do_this"]          = "You cannot do this..",
        ["you_dont_have_enough_money"]  = "You dont have enough money..",
        ["no_package"]  = "You're are not holding a package..",
        ["no_packages"]  = "You dont have any weed packages to deliver",
        ["no_green"]  = "You don\'t have enough green mate",
        ["stay_near"]  = "Stay nearby for a bit while I package this",
        ["sign_out"]  = "You've signed off..",
        ["no_refund"]  = "No Refunds!",
    },
    success = {
        ["collect_package"]                        = "You can collect the package now",
        ["send_email_right_now"]                 = "I will send you an e-mail right now..",
        ["there_u_go"]                           = "There you go!",
    },
    mailstart = {
        ["sender"]                      = "Unknown",
        ["subject"]                     = "Selling Weed 101",
        ["message"]                     = "Client's locations will be periodically marked on your GPS, head to them, hand in a processed weed package and another one will be marked. Continue doing this until there is no more clients or till you run out of packages to deliver, after a while all GPS locations etc. will be removed and you'll have to start a new.",
    },
    target = {
        ["weedboss"]                      = "Sign In",
        ["package_goods"]                  = "Package Goods",
        ["collect_goods"]                  = "Collect Package",
        ["deliver_package"]                     = "Deliver Package",
        ["sign_out_target"]              = "Sign Out",
        ["sign_out_target2"]              = "Sign Out",
    },
    progress = {
        ["weighing_package"]                      = "Weighing Package..",
        ["counting_bills"]                  = "Counting Bills..",
        ["preparing_run"]                  = "Preparing Run..",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
