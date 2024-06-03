local types = {
      'success', --[[ 🟢 ]]
      'error', --[[ 🔴 ]]
      'info', --[[ 🔵 ]]
      'warning', --[[ 🟡 ]]
}
function NotifyLA(msg, type, duration, sound)
      SendNUIMessage({ action = "ShowNotify", data = { msg = msg, type = type, delay = duration, sound = sound } })
end

RegisterNetEvent('LuxuAdmin:Client:ExportsNotifications', NotifyLA)

exports('Notify', NotifyLA)
