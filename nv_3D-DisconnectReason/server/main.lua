AddEventHandler('playerDropped', function(reason)
    local source = source
    local sourcePed = GetPlayerPed(source)
    local pedCoords = GetEntityCoords(sourcePed)
    local playerName = GetPlayerName(source)

    local searched = false

    for k, v in pairs(Config.Reasons) do
        if string.find(reason, k) and not searched then
            searched = true
            TriggerClientEvent('nv_Disconnect:sendPlayerDropped', -1, { src = source, name = playerName, razon = v, coords = pedCoords})
        end
    end

    if not searched then
        TriggerClientEvent('nv_Disconnect:sendPlayerDropped', -1, { src = source, name = playerName, razon = reason, coords = pedCoords})
    end
end)

--[[
    DEVELOPED BY Geloteee#2901
]]