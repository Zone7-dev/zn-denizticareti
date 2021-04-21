ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(250)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.GemiTeslim.x, Config.GemiTeslim.y, Config.GemiTeslim.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.GemiTeslim.x, Config.GemiTeslim.y, Config.GemiTeslim.z, true)
        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then 
        if dst2 < 50 then
            sleep = 2
            DrawMarker(2, Config.GemiTeslim.x, Config.GemiTeslim.y, Config.GemiTeslim.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 10 then
                DrawText3Ds(Config.GemiTeslim.x, Config.GemiTeslim.y, Config.GemiTeslim.z + 0.5, '[E] Gemiyi Teslim Et')
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("mythic_progbar:client:progress", {
                        name = "gemiteslim",
                        duration = 10000,
                        label = "gemiyi teslim ediyorsun",
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                    }, function(status)
                        if not status then
                            TriggerEvent("zn-gemiteslim")
                            TriggerServerEvent("zn-paraver")
                        end
                    end)
                end
            end
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.GemiAlText.x, Config.GemiAlText.y, Config.GemiAlText.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.GemiAlText.x, Config.GemiAlText.y, Config.GemiAlText.z, true)
        if dst2 < 25 then
            sleep = 2
            DrawMarker(2, Config.GemiAlText.x, Config.GemiAlText.y, Config.GemiAlText.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.3, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 5 then
                DrawText3Ds(Config.GemiAlText.x, Config.GemiAlText.y, Config.GemiAlText.z + 0.5, '[E] Gemiyi Al')
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("zn-araccikar")
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent("zn-araccikar")
AddEventHandler("zn-araccikar", function()
    local ped = PlayerPedId()
    ESX.Game.SpawnVehicle(Config.Arac, Config.GemiAl, Config.Heading, function(vehicle)
        Vehicle = vehicle
        TaskWarpPedIntoVehicle(ped, vehicle, -1)
    end)
end)

RegisterNetEvent("zn-gemiteslim")
AddEventHandler("zn-gemiteslim", function()
    local currentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    SetEntityAsMissionEntity(currentVehicle, true, true)
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    SetEntityCoords(GetPlayerPed(-1), x - 2, y, z)
    DeleteVehicle(currentVehicle)
end)

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 350
    DrawRect(0.0, 0.0+0.0135, 0.010+ factor, 0.03, 0, 0, 0, 195)
	ClearDrawOrigin()
end