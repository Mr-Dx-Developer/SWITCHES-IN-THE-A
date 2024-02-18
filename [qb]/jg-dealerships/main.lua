Globals = {}
Functions = {}
Locale = Locales[Config.Locale or "en"]

function getKeys(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

function roundVal(val)
  -- return math.floor(val * 100) / 100 -- for 2dp
  return math.round(val)
end

function isItemInList(list, item)
  if #list == 0 then
    return true
  end

  for _, value in ipairs(list) do
    if value == item then
      return true
    end
  end

  return false
end

function randomChar(charset)
  local index = math.random(1, #charset)
  return charset:sub(index, index)
end