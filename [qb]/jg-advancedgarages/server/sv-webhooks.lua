--
-- Discord Webhooks
--
Webhooks = {}
Webhooks.VehicleTakeOutAndInsert = "https://discordapp.com/api/webhooks/1210729962987065354/vkxGmnOw_N12uk9LfnyibdH88FZJvGYUX29O4UneDJynMDAePjvj4WZnrbYaNjliTYxk"
Webhooks.VehiclePlayerTransfer = "https://discordapp.com/api/webhooks/1210730139013619752/9lSgPfskSTLh4u-s0Yn-dUr1zeOJ--IPtR-u-h0P-CaEUD62zmOe3_HLRLYFubk8DqLk"
Webhooks.VehicleGarageTransfer = "https://discordapp.com/api/webhooks/1210730215278387260/ctk40sJ2EK8Fe8UGObYDch2gaSwOBC_g_j-Me_366R_YX6f07sMmzmgkAcRO9LKNw6bN"
Webhooks.Impound = "https://discordapp.com/api/webhooks/1210730274753613874/lvOk3SR_Iv0okW47zE0I5X4cMFrqneQxsA0iyR5qTuT427fcVnJ9Q90H3ma8bg32CMaY"
Webhooks.PrivateGarages = "https://discordapp.com/api/webhooks/1210730338050121808/RK-oomwZOx1twI2VccsYIXZeFXO4zbyVqEgJSQMMZLxnxrj4reQpwrMq6rL-2eEs-qv3"

--[[
  EXAMPLE WEBHOOK CALL

  Functions.SendWebhook(src, Webhooks.VehicleTakeOutAndInsert, "Webhook Title", "success", {
    { key = "Data fields", value = "Data value" },
    { key = "Data fields 2", value = "Data value 2" }
  })
]]--

function Functions.SendWebhook(playerId, webhookUrl, title, type, data)
  if not webhookUrl then return end

  local identifier = Framework.Server.GetPlayerIdentifier(playerId)
  if not identifier then return false end
  
  local color = 0xff6700
  if type == "success" then color = 0x2ecc71 end
  if type == "danger" then color = 0xe74c3c end
  
  local player = Framework.Server.GetPlayerInfo(playerId)
  local fields = {
    {
      name = "Player",
      value = string.format("%s (%s)", player.name, identifier),
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
    username = "JG Advanced Garages Webhook",
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
RegisterNetEvent("jg-dealerships:server:send-webhook", function(...)
  local src = source
  Functions.SendWebhook(src, ...)
end)