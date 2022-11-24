AddEventHandler('playerDropped', function(reason)
    local source = source
    local sourcePed = GetPlayerPed(source)
    local pedCoords = GetEntityCoords(sourcePed)
    local playerName = GetPlayerName(source)

    TriggerClientEvent('nv_Disconnect:sendPlayerDropped', -1, { src = source, name = playerName, razon = reason, coords = pedCoords})
end)

--[[
    DEVELOPED BY Geloteee#2901
]]