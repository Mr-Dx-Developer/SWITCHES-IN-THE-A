if Config.SkinScript ~= 'esx_skin' then
     return
end

function putClothes(backpack)
     ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local clothes = {
               male = { ['bags_1'] = backpack.cloth['male'].bag['item'], ['bags_2'] = backpack.cloth['male'].bag['texture'] },
               female = { ['bags_1'] = backpack.cloth['female'].bag['item'], ['bags_2'] = backpack.cloth['male'].bag['texture'] },
          }

          if skin.sex == 0 then
               TriggerEvent('skinchanger:loadClothes', skin, clothes.male)
          elseif skin.sex == 1 then
               TriggerEvent('skinchanger:loadClothes', skin, clothes.female)
          end
     end)
end

function RemoveClothes()
     local cloth = {
          male = { ['bags_1'] = 0 },
          female = { ['bags_1'] = 0 },
     }
     ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          if skin.sex == 0 then
               TriggerEvent('skinchanger:loadClothes', skin, cloth.male)
          elseif skin.sex == 1 then
               TriggerEvent('skinchanger:loadClothes', skin, cloth.female)
          end
     end)
end
