Config = {}

Config.TypeIdentifier = 'license' -- By default in license, can be: 'steam', 'license', 'discord', 'ip', 'xbl', 'live'

Config.Identifiers = {
    'a045ed84bc7b147ab67442c4be4c70a4bb7d0ad5', -- License Example
    '8601d9b7e1fab1f7008d9ca44176ceddd04353bc'
}

Config.WebHook = "" -- Discord WebHook

Config.Notification = function(type)
    if type == 'entered' then
        TriggerEvent('esx:showNotification', '¡You entered Safe Zone!') -- Your enter notification
    elseif type == 'exited' then
        TriggerEvent('esx:showNotification', '¡You exited Safe Zone!') -- Your enter notification
    end
end



--[[---------------------------------------------------------------------------------------
                                               ,----,                               ,----, 
                                         ,/   .`|                             ,/   .`| 
      ,----,      ,---,                ,`   .'  :   ,---,. ,--,     ,--,    ,`   .'  : 
    .'   .' \   .'  .' `\            ;    ;     / ,'  .' | |'. \   / .`|  ;    ;     / 
  ,----,'    |,---.'     \         .'___,/    ,',---.'   | ; \ `\ /' / ;.'___,/    ,'  
  |    :  .  ;|   |  .`\  |        |    :     | |   |   .' `. \  /  / .'|    :     |   
  ;    |.'  / :   : |  '  |        ;    |.';  ; :   :  |-,  \  \/  / ./ ;    |.';  ;   
  `----'/  ;  |   ' '  ;  :        `----'  |  | :   |  ;/|   \  \.'  /  `----'  |  |   
    /  ;  /   '   | ;  .  |            '   :  ; |   :   .'    \  ;  ;       '   :  ;   
   ;  /  /-,  |   | :  |  '            |   |  ' |   |  |-,   / \  \  \      |   |  '   
  /  /  /.`|  '   : | /  ;             '   :  | '   :  ;/|  ;  /\  \  \     '   :  |   
./__;      :  |   | '` ,/              ;   |.'  |   |    \./__;  \  ;  \    ;   |.'    
|   :    .'   ;   :  .'                '---'    |   :   .'|   : / \  \  ;   '---'      
;   | .'      |   ,.'                           |   | ,'  ;   |/   \  ' |              
`---'         '---'                             `----'    `---'     `--`               
]]---------------------------------------------------------------------------------------


Config.Draw2DText = false -- Put this to true if you want a 2D static text in your screen displaying the safe zone

Config.Text = function()
    local text, font, centre, x, y, scale, r, g, b, a = '~r~[~g~SAFE ZONE~r~]', 1, 1, 0.5, 0.95, 0.6, 255, 255, 255, 255
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end