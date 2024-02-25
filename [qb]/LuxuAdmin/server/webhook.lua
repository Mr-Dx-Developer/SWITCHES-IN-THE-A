local defaultWebhook = GetConvar("DiscordWebhook")

-- Rate limiter configuration
local maxRequests = 2
local timeWindow = 1 -- 1 seconds
local requestCounter = 0
local lastResetTimestamp = os.time()

function SendWebhook(data)
      local message = data.message
      local webhook = data.webhook or defaultWebhook
      if not message then
            return
      end

      -- Rate limiter logic
      local currentTime = os.time()
      if currentTime - lastResetTimestamp > timeWindow then
            requestCounter = 0
            lastResetTimestamp = currentTime
      end

      if requestCounter >= maxRequests then
            -- print("Too many webhook requests, ignoring this message.")
            return
      end

      requestCounter = requestCounter + 1

      local content = "**LuxuAdmin 👁️**" .. "\n" .. message

      -- POST request
      local httpData = {
            url     = webhook,
            method  = "POST",
            headers = {
                  ["Content-Type"] = "application/json"
            },
            data    = json.encode({
                  username   = "Luxu",
                  content    = content,
                  avatar_url = ""
            }),
            timeout = 5000,
            verify  = false
      }

      PerformHttpRequest(httpData.url, function(errorCode, responseBody, headers)
            if errorCode == 200 or errorCode == 204 then
                  -- All good
            else
                  print(("Error sending webhook (%s)"):format(errorCode))
            end
      end, httpData.method, httpData.data, httpData.headers)
end
