if type(Config) ~= 'table' then
      Config = {}
end

Config.Locale = 'en' -- Language of the bot | Locales folder

--[[  Delay for refreshing players cache | Will bypass if player joins or leaves or refresh button is pressed ]]
Config.PlayerCacheDelay = 5 * 60 * 1000 -- milliseconds

--[[  Delay for refreshing database cache | default 20 minutes ]]
Config.DatabaseCacheDelay = 20 * 60 * 1000 -- milliseconds

--[[  Date format ]]
Config.DateLocale = {
      locale = 'en-US', --[[ Locale| Find yours: https://github.com/unicode-cldr/cldr-core/blob/master/availableLocales.json ]]
      options = {
            weekday = "long",
            year = "numeric",
            month = "long",
            day = "numeric",
            hour = "numeric",
            minute = "numeric",
      } --[[ Delete options you dont want, https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat#options ]]
}

Config.OneReportPerPlayer = true -- If set to true, players can only have one report active at a time

Config.BanOptions = {
      hardware_ban = true,
      identifiers = {
            license = true,
            license2 = true,
            discord = true,
            live = true,
            xbl = true,
            fivem = true,
            steam = true,
            ip = false, -- You might need to disable this if you are using a proxy
      }
}


Config.Commands = {
      ["AdminMenu"] = {
            name = 'luxuadmin',
            key = 'F9',
      },
      ["Report"] = {
            name = 'report',
            key = true,
      },
      ["Noclip"] = {
            name = 'luxunoclip',
            key = 'INSERT',
      },
      ["TPM"] = {
            name = 'luxutpm',
            key = 'DELETE',
      },
      ["Vector3"] = {
            name = 'vector3',
            key = false,
      },
      ["Vector4"] = {
            name = false,
            key = false,
      },
      ['AdminClothing'] = {
            name = 'adminclothing',
      }
}

Config.Menus = {
      ['Reports'] = {
            enabled = true,
      },
      ['Banned'] = {
            enabled = true,
      },
      ['Resources'] = {
            enabled = true,
      },
      ['Blips'] = {
            enabled = true,
      }
}

Config.DiscordLogs = {
      enabled = true,
      bypass = { 'license:232432424', "discord:424242424", } -- users that will not be logged
}

Config.ox_logger = {
      enabled = false,
      events = { -- Event Names 👇
            dutyToggle = "dutyToggled",
            adminLog = "adminLog",
      }
}

Config.TextFont = 4                           -- GTA Font Type, change this if you have missing characters | SetTextFont()

Config.DisableNotifyLogs = false              -- If set to true will no longer print notifications in console.

Config.WarningStrikes = 3                     -- How many warnings until ban
Config.WarningBanTimeout = 24                 -- How many hours the warning ban should be
Config.WarnBanReason = "Max warnings reached" -- Reason for the warning ban

--[[ Notification Position - Interface only ]]
Config.NotifyX = 'end' -- start | center | end
Config.NotifyY = 'top' -- top | middle | bottom


--[[ PERMISSIONS ]]
Config.IdentifiersAlwaysAllowed = {
       "license:a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5",  --- Dx
       "license:8601d9b7e1fab1f7008d9ca44176ceddd04353bc",  -- rico

       "discord:1144911208303034440",  -- Vroy
       "discord:981738978015313930", -- Dex
       "discord:662207311665954826",  -- Ace
       "discord:1012094569321615401", -- Jack
       "discord:1051260760992522320", -- Shawnii
       "discord:1110069724143951923", -- Stormii
       "discord:862938214935166976",  --Migo
       "discord:1050220609029808310", -- Jaylonn
       "discord:351963343554215937", -- kirk
       "discord:1160021293895270400", -- Parker
       "discord:388849132741328907", --Retro
       "discord:911714985523171358", -- sensi
       "discord:933914762197213265",--Bloody
       
       "discord:1144911208303034440", -- 
       "discord:606994374106152961" -- 
      
      } -- Identifiers that can always use the panel with ALL permissions (license,fivem,discord)

-- All the ace groups in your server

Config.TeleportEffect = {
      enable = true, -- Set to false to disable teleport effect
      effectLibrary = "scr_rcbarry1",
      effectName = "scr_alien_teleport",
      delay = 5000
}

Config.AdminClothing = {
      enable = false,
      props = {
            [0] = {
                  enabled = false, -- If set to false, the prop will not be changed
                  label = "Face",
                  male = {
                        drawableID = 0, -- Clothing
                        textureID = 0,  -- Color / Texture
                        paletteId = 0,  -- No Idea lol, just goes from 0 to 3
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [1] = {
                  enabled = true,
                  label = "Mask",
                  male = {
                        drawableID = 18,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [2] = {
                  enabled = false,
                  label = "Hair",
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [3] = {
                  enabled = true,
                  label = "Torso", -- Hands ?
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [4] = {
                  enabled = true,
                  label = "Legs",
                  male = {
                        drawableID = 77,
                        textureID = 9,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [5] = {
                  enabled = false,
                  label = "Hands",
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [6] = {
                  enabled = true,
                  label = "Shoes",
                  male = {
                        drawableID = 24,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [7] = {
                  enabled = false,
                  label = "Accessory",
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [8] = {
                  enabled = true,
                  label = "Undershirt",
                  male = {
                        drawableID = 18,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [9] = {
                  enabled = true,
                  label = "Task",
                  male = {
                        drawableID = 2,
                        textureID = 1,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [10] = {
                  enabled = true,
                  label = "Badge",
                  male = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },
            [11] = {
                  enabled = true,
                  label = "Torso 2", -- Jackets ?
                  male = {
                        drawableID = 50,
                        textureID = 0,
                        paletteId = 0,
                  },
                  female = {
                        drawableID = 0,
                        textureID = 0,
                        paletteId = 0,
                  }
            },

      },
      accessories = {
            ['helmet'] = {
                  enabled = false,
                  propIndex = 0,
                  textureIndex = 0,
            },
            ['hats'] = {
                  enabled     = true,
                  componentId = 0, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },
            ['glasses'] = {
                  enabled     = true,
                  componentId = 1, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },
            ['ears'] = {
                  enabled     = true,
                  componentId = 2, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },
            ['watches'] = {
                  enabled     = true,
                  componentId = 6, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },
            ['bracelets'] = {
                  enabled     = true,
                  componentId = 7, -- Don't Change this ❌
                  drawableId  = 0,
                  textureId   = 0,
                  attach      = true,
            },

      }
}
