local printColor = {
   error =  '^1[error]^7',
   warn =   '^3[warning]^7',
   info =   '^2[info]^7',
   debug =  '^6[debug]^7',
}

function Debug(msg, level)
    if not um.debug then return end
    level = level or 'info'
    print("^5[um-spawn-debug] - " .. printColor[level] .. ' ' .. msg)
end

function Dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. Dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end