default = {
    xyz={x = -1377.514282266, y = -2852.64941406, z = 13.9448}, -- At airport
    text={
        content="Test",
        rgb={255 , 255, 255},
        textOutline=true,
        scaleMultiplier=1,
        font=0
    },
    perspectiveScale=4,
    radius=5000,
    timeout=5000
}

function Draw3DTextPermanent(params)
    if params == nil then params=default end
    if params.xyz == nil then params.xyz=default.xyz end
    if params.text.rgb == nil then params.text.rgb=default.text.rgb end
    if params.text.textOutline == nil then params.text.textOutline=default.text.textOutline end
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            -- Checks distance between player and the coords 
            if Vdist2(GetEntityCoords(PlayerPedId(), false), params.xyz.x,params.xyz.y,params.xyz.z) < (params.radius or default.radius) then
                local onScreen, _x, _y = World3dToScreen2d(params.xyz.x,params.xyz.y,params.xyz.z)
                local p = GetGameplayCamCoords()
                local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, params.xyz.x,params.xyz.y,params.xyz.z, 1)
                local scale = (1 / distance) * (params.perspectiveScale or default.perspectiveScale)
                local fov = (1 / GetGameplayCamFov()) * 75
                local scale = scale * fov * (params.text.scaleMultiplier or default.text.scaleMultiplier)
                if onScreen then
                    SetTextScale(0.0, scale)
                    SetTextFont(params.text.font or default.text.font)
                    SetTextProportional(true)
                    SetTextColour(params.text.rgb[1], params.text.rgb[2], params.text.rgb[3], 255)
                    --SetTextDropshadow(0, 0, 0, 0, 255)
                    --SetTextEdge(2, 0, 0, 0, 150)
                    if (params.text.textOutline) == true then SetTextOutline() end;
                    SetTextEntry("STRING")
                    SetTextCentre(true)
                    AddTextComponentString(params.text.content or default.text.content)
                    DrawText(_x,_y)
                end
            end
        end
    end)
end

function Draw3DText(params)
    if params == nil then params=default end
    if params.xyz == nil then params.xyz=default.xyz end
    if params.text.rgb == nil then params.text.rgb=default.text.rgb end
    if params.text.textOutline == nil then params.text.textOutline=default.text.textOutline end
    Citizen.CreateThread(function()
          -- Checks distance between player and the coords 
            if Vdist2(GetEntityCoords(PlayerPedId(), false), params.xyz.x,params.xyz.y,params.xyz.z) < (params.radius or default.radius) then
                local onScreen, _x, _y = World3dToScreen2d(params.xyz.x,params.xyz.y,params.xyz.z)
                local p = GetGameplayCamCoords()
                local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, params.xyz.x,params.xyz.y,params.xyz.z, 1)
                local scale = (1 / distance) * (params.perspectiveScale or default.perspectiveScale)
                local fov = (1 / GetGameplayCamFov()) * 75
                local scale = scale * fov
                if onScreen then
                    SetTextScale(tonumber(params.text.scaleMultiplier*0.0), tonumber(0.35 * (params.text.scaleMultiplier or default.text.scaleMultiplier)))
                    SetTextFont(params.text.font or default.text.font)
                    SetTextProportional(true)
                    SetTextColour(params.text.rgb[1], params.text.rgb[2], params.text.rgb[3], 255)
                    --SetTextDropshadow(0, 0, 0, 0, 255)
                    --SetTextEdge(2, 0, 0, 0, 150)
                    if (params.text.textOutline) == true then SetTextOutline() end;
                    SetTextEntry("STRING")
                    SetTextCentre(true)
                    AddTextComponentString(params.text.content or default.text.content)
                    DrawText(_x,_y)
                end
        end
    end)
end

function Draw3DTextTimeout(params)
    timeoutState = true
    if params == nil then params=default end
    if params.xyz == nil then params.xyz=default.xyz end
    if params.text.rgb == nil then params.text.rgb=default.text.rgb end
    if params.text.textOutline == nil then params.text.textOutline=default.text.textOutline end
    if params.timeout == nil then params.timeout=default.timeout end
    Citizen.CreateThread(function()
        Wait(params.timeout)
        -- waits until after the timeout is done to close it
		timeoutState = false
	end)
    Citizen.CreateThread(function()
        -- checks if the timeout is true
        while timeoutState do 
            Citizen.Wait(0)
          -- Checks distance between player and the coords 
            if Vdist2(GetEntityCoords(PlayerPedId(), false), params.xyz.x,params.xyz.y,params.xyz.z) < (params.radius or default.radius) then
                local onScreen, _x, _y = World3dToScreen2d(params.xyz.x,params.xyz.y,params.xyz.z)
                local p = GetGameplayCamCoords()
                local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, params.xyz.x,params.xyz.y,params.xyz.z, 1)
                local scale = (1 / distance) * (params.perspectiveScale or default.perspectiveScale)
                local fov = (1 / GetGameplayCamFov()) * 75
                local scale = scale * fov
                if onScreen then
                    SetTextScale(tonumber(params.text.scaleMultiplier*0.0), tonumber(0.35 * (params.text.scaleMultiplier or default.text.scaleMultiplier)))
                    SetTextFont(params.text.font or default.text.font)
                    SetTextProportional(true)
                    SetTextColour(params.text.rgb[1], params.text.rgb[2], params.text.rgb[3], 255)
                    --SetTextDropshadow(0, 0, 0, 0, 255)
                    --SetTextEdge(2, 0, 0, 0, 150)
                    if (params.text.textOutline) == true then SetTextOutline() end;
                    SetTextEntry("STRING")
                    SetTextCentre(true)
                    AddTextComponentString(params.text.content or default.text.content)
                    DrawText(_x,_y)
                end
            end
        end
    end)
end

function CreateWait(source, name, reason, coords)
    Draw3DTextTimeout({
        xyz=coords,
        timeout=60000,
        text={
            content= Config.Translation(source, name, reason),
            rgb = {255 , 255, 255},
            textOutline=true,
            scaleMultiplier=1,
            font=0
        },
        perspectiveScale=4,
        radius=5000,
    })
end

RegisterNetEvent('nv_Disconnect:sendPlayerDropped')
AddEventHandler('nv_Disconnect:sendPlayerDropped', function(data)
    CreateWait(data.src, data.name, data.razon, data.coords)
end)

--[[
    DEVELOPED BY Geloteee#2901
]]