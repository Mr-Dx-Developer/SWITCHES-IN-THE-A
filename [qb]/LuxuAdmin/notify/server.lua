local types = {
      'success', --[[ 🟢 ]]
      'error', --[[ 🔴 ]]
      'info', --[[ 🔵 ]]
      'warning', --[[ 🟡 ]]
}

local function NotifyLA(src, msg, type, duration, sound)
      TriggerClientEvent("LuxuAdmin:Client:ExportsNotifications", src, msg, type, duration, sound)
end


exports('Notify', NotifyLA)
