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

TwoNaShared.Functions.GetFramework = function() 
   local availableFramework = nil

   for k,v in ipairs(TwoNaShared.Types.Frameworks) do 
      if GetResourceState(v.ResourceName) == "starting" or GetResourceState(v.ResourceName) == "started" then 
         availableFramework = v
      end
   end

   if not availableFramework then 
      TwoNaShared.Functions.Log("^1Could not find a supported framework! Please ensure that framework script name did not got change.^7")
   end

   return availableFramework
end 

TwoNaShared.Functions.GetDatabase = function() 
   local availableDatabase = nil

   for k,v in ipairs(TwoNaShared.Types.Databases) do 
      if GetResourceState(v.ResourceName) == "starting" or GetResourceState(v.ResourceName) == "started" then 
         availableDatabase = v
      end
   end

   if not availableDatabase then 
      TwoNaShared.Functions.Log("^1Could not find a supported database! Please ensure that database script name did not got change.^7")
   end

   return availableDatabase
end 

TwoNaShared.Functions.Log = function(str) 
   print("^4[2na_core]^7: " .. TwoNaShared.Functions.Trim(str))
end