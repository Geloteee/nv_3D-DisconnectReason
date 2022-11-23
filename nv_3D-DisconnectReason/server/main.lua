local P_TABLE = {}

Citizen.CreateThread(function()
    while true do
        for k, v in pairs(GetPlayers()) do
            local source = tonumber(v)
            local coords = GetEntityCoords(GetPlayerPed(source))
            if coords ~= nil then
                P_TABLE[source] = GetEntityCoords(GetPlayerPed(source))
            end
        end
        Citizen.Wait(3000)
    end
end)

RegisterNetEvent('playerDropped')
AddEventHandler('playerDropped', function (reason)
    if P_TABLE[source] then
        TriggerClientEvent('nv_Disconnect:sendPlayerDropped', -1, { src = source, name = GetPlayerName(source), razon = reason, coords = P_TABLE[source]})
    end
end)

--[[
    DEVELOPED BY Geloteee#2901
]]