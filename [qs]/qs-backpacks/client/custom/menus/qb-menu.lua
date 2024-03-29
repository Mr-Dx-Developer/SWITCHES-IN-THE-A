if Config.Menu ~= 'qb-menu' then
     return
end

function CreateBackpack(ID)
     local inputData = exports['qb-input']:ShowInput({
          header = Lang('CREATE_PASSWORD') .. ' Min ' .. Config.PasswordLength.min .. ' Max ' .. Config.PasswordLength.max,
          inputs = {
               {
                    type = 'password',
                    isRequired = true,
                    name = 'pass',     -- name of the input should be unique otherwise it might override
                    type = 'password', -- type of the input
                    text = Lang('INTRODUCE_PASSWORD_2'),
               },
          }
     })

     if inputData then
          if not inputData.pass then return end
          local length = string.len(inputData.pass)
          if length <= 0 then
               SendTextMessage(Lang('BAD_PASSWORD'), 'error')
               return
          end
          if length < Config.PasswordLength.min then
               SendTextMessage(Lang('MORE_PASSWORD'), 'error')
               return
          end
          if length > Config.PasswordLength.max then
               SendTextMessage(Lang('LESS_PASSWORD'), 'error')
               return
          end

          SendTextMessage(Lang('ADDED_PASSWORD'), 'success')
          TriggerServerEvent('backpacks:server:add_password', { ID = ID, password = inputData.pass })
     end
end

function CheckMeta(backpack_metadata)
     if backpack_metadata.locked then
          local inputData = exports['qb-input']:ShowInput({
               header = Lang('INTRODUCE_PASSWORD'),
               inputs = {
                    {
                         type = 'password',
                         isRequired = true,
                         name = 'pass',
                         text = Lang('INTRODUCE_PASSWORD')
                    },
               }
          })
          if inputData then
               if not inputData.pass then
                    SendTextMessage(Lang('BAD_PASSWORD'), 'error')
                    return
               end
               backpack_metadata.trypassword = inputData.pass
               OpenBackpack(backpack_metadata)
          end
     else
          OpenBackpack(backpack_metadata)
     end
end
