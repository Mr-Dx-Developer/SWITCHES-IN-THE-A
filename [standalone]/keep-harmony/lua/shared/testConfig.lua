local event_test = false
TestTarget = 1

-- Client-side tests
ClientTests = {
    Menu = {
        active = false,
        options = {}
    },
    Progressbar = {
        active = false,
        options = {
            name = 'test',
            duration = 1,
            success = function()
                print('success')
            end,
            cancel = function()
                print('failed')
            end
        }
    },
    Input = {
        active = false,
    },
    Event = {
        active = event_test,
    },
    Target = {
        active = false,
        distance = 5.0,
        target_icon = 'fas fa-box',
        options = {
            {
                icon = "fas fa-box",
                label = "Open Container",
                action = function()
                end
            },
            {
                icon = "fas fa-box",
                label = "Change Password",
                action = function()
                end
            },
            {
                icon = "fas fa-box",
                label = "Transfer Ownership",
                action = function()
                end
            },
        },
        sphere_coords = vector4(2940.68, 4625.33, 48.72, 332.87)
    }
}

-- Server-side tests
ServerTests = {
    Item = {
        active = false,
        options = {
            item_name = 'backpack1',
            -- make sure inventory has an empty slot
            slot = 1,
            metadata = {
                test = 'test_value'
            }
        }
    },
    -- stash test is not fully functional
    Stash = {
        active = false,
        options = {
            prefix = 'text_',
            id = 'test_id'
        }
    },
    Discord = {
        active = false,
        options = {
            has_roles = {
                'Dev',
                968231731444465664
            },
            webhook_only = true,
            -- to test webhook make sure you've entered the defualt webhook
            -- or it won't work
        }
    },
    Chance = {
        -- this is a heavy task
        -- it will stress the server only test it on local server
        -- or when nobdy is playing on the main server
        -- or lower counts by large margin
        active = false,
        options = {
            count = 10000,
            AliasSampler = {
                samples = { 1, 2, 3, 4 },
                expected = { 0.1, 0.2, 0.3, 0.4 }
            },
            -- interface test
            individual = {
                samples = {
                    {
                        chance = 10,
                    },
                    {
                        chance = 20,
                    },
                    {
                        chance = 30,
                    },
                    {
                        chance = 40,
                    }
                },
                expected = {
                    [10] = 0.1,
                    [20] = 0.2,
                    [30] = 0.3,
                    [40] = 0.4,
                }
            },
            all = {
                samples = {
                    {
                        chance = 10,
                    },
                    {
                        chance = 20,
                    },
                    {
                        chance = 30,
                    },
                    {
                        chance = 40,
                    },
                    {
                        chance = 100,
                    }
                },
                expected = {
                    [10] = 0.1,
                    [20] = 0.2,
                    [30] = 0.3,
                    [40] = 0.4,
                    [100] = 1,
                }
            }
        }
    },
    Command = {
        active = false,
        options = {
            name = 'test',
            help = 'something random',
            arg = { { name = '3453', help = '34534' } },
            require = false,
            callback = function(source, args, raw)
                print('source', source)
                HarmonyShared.pt(args)
            end
        }
    },
    Event = {
        active = event_test,
    }
}
