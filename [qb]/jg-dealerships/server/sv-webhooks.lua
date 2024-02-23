--
-- Discord Webhooks
--
Webhooks = {}
Webhooks.TestDrive = "https://discordapp.com/api/webhooks/1210730520976040077/1UcPzdiCQP-ei6W9aqHhIK9R_rw7wnkSAV8b7TT81bsCJgOzfxu8CVCi4idnxvEvqwrh"
Webhooks.Purchase = "https://discordapp.com/api/webhooks/1210730592774266951/Jz9aiw2et-uaZUQ2aAo7rUJzLmXrOpi60v3cLmdGwC5nNyehAYFr62g0SgjI7KdXwB7V"
Webhooks.Finance = "https://discordapp.com/api/webhooks/1210730650483556504/_tOQd6PVm8FevU4ijdaSUqqtSs_eYA9IkCnr8tq6MxFsHHo5hOd4kYE3j9BTNKl6Kofv"
Webhooks.Dealership = "https://discordapp.com/api/webhooks/1210730712496341062/JFLaAMipfRL7TVEHlkZSnTMahFywhTP3-bo5lDXAm4ucoT8Ce5H6GD9iR8XyMj1Upx3S"
Webhooks.Admin = "https://discordapp.com/api/webhooks/1210730773896765480/pNpiMjQi9EZTSTQUFPRo9qj4ay_9UrwJ-PitzmofnE1Mnd9qayqwAEdWWAmm4ygL7z3c"

--[[
  EXAMPLE WEBHOOK CALL

  Functions.SendWebhook(src, Webhooks.Admin, "Webhook Title", "success", {
    { key = "Data fields", value = "Data value" },
    { key = "Data fields 2", value = "Data value 2" }
  })
]]--

function Functions.SendWebhook(playerId, webhookUrl, title, type, data)
  if not webhookUrl then return end

  local player = Framework.Server.GetPlayerInfo(playerId)
  if not player then return false end

  local color = 0xff6700
  if type == "success" then color = 0x2ecc71 end
  if type == "danger" then color = 0xe74c3c end

  local fields = {
    {
      name = "Player",
      value = string.format("%s (id: %s)", player.name, tostring(playerId)),
      inline = false
    }
  }
  for _, row in pairs(data) do
    fields[#fields + 1] = {
      name = row.key,
      value = tostring(row.value),
      inline = true
    }
  end

  local body = {
    username = "JG Dealerships Webhook",
    avatar_url = "https://forum.cfx.re/user_avatar/forum.cfx.re/jgscripts/288/3621910_2.png",
    content = "",
    embeds = {
      {
        type = "rich",
        title = title,
        description = "",
        color = color,
        fields = fields
      }
    }
  }

  PerformHttpRequest(
    webhookUrl,
    function(err, text, header) end,
    "POST",
    json.encode(body),
    {["Content-Type"] = "application/json"}
  )
end

-- For sending from client files...
RegisterNetEvent("jg-dealerships:server:send-webhook", function(event, ...)
  local src = source
  Functions.SendWebhook(src, Webhooks[event], ...)
end)
