TwoNaShared = {}
TwoNaShared.Functions = {}

TwoNaShared.Functions.Trim = function(str)
   return (str:gsub("^%s*(.-)%s*$", "%1"))
end

TwoNaShared.Functions.Capitalize = function(str) 
   return string.upper(str:sub(1,1)) .. str:sub(2)
end

TwoNaShared.Functions.Includes = function(arr, target)
   local includes = false
    
   for _, v in ipairs(arr) do 
      if v == target then 
         includes = true
      end
   end

   return includes
end

TwoNaShared.Functions.GetFramework = function(framework) 
   if TwoNaShared.Types.Framework[framework:upper()] then 
      return TwoNaShared.Types.Framework[framework:upper()]
   elseif TwoNaShared.Types.FrameworkAlias[framework:lower()] then
      return TwoNaShared.Types.FrameworkAlias[framework:lower()]
   else
      return nil
   end
end 

TwoNaShared.Functions.GetDatabase = function(database) 
   if TwoNaShared.Types.Database[database:upper()] then 
      return TwoNaShared.Types.Database[database:upper()]
   else
      return nil
   end
end 

TwoNaShared.Functions.Log = function(str) 
   print("^4[2na_core]^7: " .. TwoNaShared.Functions.Trim(str))
end