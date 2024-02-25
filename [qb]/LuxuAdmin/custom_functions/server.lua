RegisterNetEvent('LuxuAdmin:ExampleCustomButton2', function(data)
      local src = source
      local target_player_src = data
      if not HasPermission(src, "luxuadmin.custombutton2", true) then return end
      -- Do whatever you want here
end)
