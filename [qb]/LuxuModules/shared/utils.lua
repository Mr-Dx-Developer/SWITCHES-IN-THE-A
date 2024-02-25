local utils = {}

function utils:Trim(value)
      if not value then return nil end
      return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

function utils:UUID()
      return exports["LuxuModules"]:GenUUID()
end

function utils:randomChar()
      return exports["LuxuModules"]:randomChar()
end

function utils:CustomPlate() -- Create Custom Vehicle Plate
      local function rN()    -- random Number
            return math.random(0, 9)
      end

      local function rS() -- random Letter
            return self:randomChar()
      end

      -- Plates have a maximum of 8 characters
      local plate = ("%s%s%s%s%s%s%s%s"):format(rS(), rS(), rS(), rN(), rN(), rN(), rN(), rN()) -- 3 Letters, 5 Numbers
      return plate:upper()
end

---@param date number
function utils:FormatDate(date)
      return exports["LuxuModules"]:FormatDate(date)
end

---@param resource string
---@return boolean
function utils:IsResourceRunning(resource)
      return GetResourceState(resource) == "started"
end

return utils
