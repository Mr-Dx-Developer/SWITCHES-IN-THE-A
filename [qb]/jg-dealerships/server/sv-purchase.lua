Framework.Server.CreateCallback("jg-dealerships:server:purchase-vehicle", function(src, cb, purchaseType, society, societyType, model, amount, paymentMethod, dealership, financed, financeData, sellerPlayerId)
  local dealershipData = Config.DealershipLocations[dealership]
  if financed == 1 and not dealershipData.enableFinance then
    return cb({ error = true })
  end

  local player = Framework.Server.GetPlayerIdentifier(src)
  local paymentType, paid, owed = "full", amount, 0

  local sellerPlayer, sellerPlayerName = nil, nil
  if sellerPlayerId then
    sellerPlayer = Framework.Server.GetPlayerIdentifier(sellerPlayerId)
    sellerPlayerName = Framework.Server.GetPlayerInfo(sellerPlayerId)
    sellerPlayerName = sellerPlayerName and sellerPlayerName.name or nil
  end
  
  local plate = Framework.Server.VehicleGeneratePlate()
  if not plate then
    Framework.Server.Notify(src, "COULD_NOT_GENERATE_PLATE", "error")
    return cb({ error = true })
  end
  
  local vehicle = MySQL.single.await("SELECT * FROM dealership_stock WHERE vehicle = ? AND dealership = ?", {model, dealership})
  if not vehicle then return cb({ error = true }) end
  
  local vehicleStock = vehicle.stock

  if financed == 1 then
    local playerFinancedVehicles = MySQL.single.await("SELECT COUNT(*) as total FROM " .. Framework.VehiclesTable .. " WHERE financed = 1 AND " .. Framework.PlayerId .. " = ?", {player})
    if playerFinancedVehicles.total >= (Config.MaxFinancedVehiclesPerPlayer or 999999) then
      Framework.Server.Notify(src, "TOO_MANY_FINANCED_VEHICLES", "error")
      return cb({ error = true })
    end

    paymentType = "finance"
    owed = financeData.total - financeData.paid
  end

  if paymentMethod ~= "bank" and paymentMethod ~= "cash" and paymentMethod ~= "societyFund" then
    Framework.Server.Notify(src, "INVALID_PAYMENT_METHOD", "error")
    return cb({ error = true })
  end

  -- Check stock level
  if dealershipData.type == "owned" and vehicleStock < 1 then
    Framework.Server.Notify(src, Locale.errorVehicleOutOfStock, "error")
    return cb({ error = true })
  end

  -- Remove money
  if purchaseType == "society" and paymentMethod == "societyFund" then
    Framework.Server.RemoveFromSocietyFund(society, societyType, amount)
  else
    Framework.Server.PlayerRemoveMoney(src, amount, paymentMethod)
  end

  if dealershipData.type == "owned" then
    MySQL.update.await("UPDATE dealership_stock SET stock = stock - 1 WHERE vehicle = ? AND dealership = ?", {model, dealership})
    MySQL.update.await("UPDATE dealership_data SET balance = balance + ? WHERE name = ?", {amount, dealership})
  end
  MySQL.insert.await("INSERT INTO dealership_sales (dealership, vehicle, plate, player, seller, purchase_type, paid, owed) VALUES(?, ?, ?, ?, ?, ?, ?, ?)", {dealership, model, plate, player, sellerPlayer, paymentType, paid, owed})

  -- Save vehicle to garage
  Framework.Server.SaveVehicleToGarage(src, purchaseType, society, societyType, model, plate, financed, financeData)

  -- Send webhook
  Functions.SendWebhook(src, Webhooks.Purchase, "New Vehicle Purchase", "success", {
    { key = "Vehicle", value = model },
    { key = "Plate", value = plate },
    { key = "Financed", value = (financed == 1 and "Yes" or "No") },
    { key = "Amount Paid", value = amount },
    { key = "Payment method", value = paymentMethod },
    { key = "Dealership", value = dealership },
    { key = "Seller Name", value = sellerPlayerName or "-" }
  })

  Framework.Server.Notify(src, Locale.purchaseSuccess, "success")
  cb({ ok = true, plate = plate })
end)

RegisterNetEvent("jg-dealerships:server:update-purchased-vehicle-props", function(plate, props)
  local src = source
  local identifier = Framework.Server.GetPlayerIdentifier(src)

  local vehicle = MySQL.single.await("SELECT * FROM " .. Framework.VehiclesTable .. " WHERE plate = ? AND " .. Framework.PlayerId .. " = ?", {plate, identifier})
  if not vehicle then return false end
  if vehicle[Framework.VehProps] ~= nil and vehicle[Framework.VehProps] ~= "" and vehicle[Framework.VehProps] ~= false then
    print("Error: Could not update props because they already exist!")
    return false
  end

  MySQL.update.await("UPDATE " .. Framework.VehiclesTable .. " SET " .. Framework.VehProps .. " = ? WHERE plate = ?", {json.encode(props), plate})
end)