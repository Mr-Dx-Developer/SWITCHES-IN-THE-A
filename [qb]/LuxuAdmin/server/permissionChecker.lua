---@param notify? boolean
function HasPermission(src, ace_perm, notify)
      if #Config.IdentifiersAlwaysAllowed > 0 then
            for _, license in ipairs(Config.IdentifiersAlwaysAllowed) do
                  for _, identifier in ipairs(GetPlayerIdentifiers(src)) do
                        if license == identifier then return true end
                  end
            end
      end
      local hasAcePerm = IsPlayerAceAllowed(src, ace_perm)
      if notify and not hasAcePerm then
            Notify(src, Locale('General', "NotAllowedToUse"), 'error', 3000)
      end
      return hasAcePerm
end
