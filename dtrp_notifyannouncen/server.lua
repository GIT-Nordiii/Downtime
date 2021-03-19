ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent("es:addGroupCommand", "playv", "admin", function(source, args)
    local argString = table.concat(args, " ")
    if argString ~= nil then
        TriggerClientEvent('grv_notifyannounce:display', -1, 'Administrative Nachricht', argString, 6000, false)
    end
end, true)