--[[ Create Custom Buttons Here ]]
Custom_buttons = {
      --     { name = 'Example Button', event = 'LuxuAdmin:ExampleCustomButton',  category = 'players' },
      --  { name = 'Example Button', event = 'LuxuAdmin:ExampleCustomButton2', category = 'master' },
}


--[[ Create Custom Events Here ]]
--[[ 'players' event ]]
--[[ Method 1 ]]
RegisterNUICallback('LuxuAdmin:ExampleCustomButton', function(data, cb)
      local target_server_id = data
      -- Check if the player has permission to use this button
      if not CheckPerm('luxuadmin.custombutton') then
            cb(false)
            return
      end

      print(string.format('Example function, Target Player Server ID: %s', target_server_id))
      cb(true)
end)


--[[  Method 2 - Check Permission Server Side]]
RegisterNUICallback('LuxuAdmin:ExampleCustomButton', function(data, cb)
      TriggerServerEvent('LuxuAdmin:SERVER:ExampleCustomButton2', data)
      cb(true)
end)



--[[ 'master' event ]]
RegisterNUICallback('LuxuAdmin:ExampleCustomButton2', function(_, cb)
      -- do something
end)


RegisterNUICallback('StoreAllVehiclesInGarage', function(data, cb)
      TriggerServerEvent('LuxuAdmin:Server:StoreAllVehiclesInGarage')
      cb(true)
end)
