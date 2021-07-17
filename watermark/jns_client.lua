ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:SharedObject1212', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end

    ESX.TriggerServerCallback('getPlayers', function(playerCount)
        while not NetworkIsSessionActive() do
            Citizen.Wait(0)
            print("Waiting")
        end
        print(playerCount)
        SendNUIMessage({action = "setPlayerId", id = GetPlayerServerId(PlayerId())})
        SendNUIMessage({action = "setPlayerCount", count = playerCount})
    end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
TriggerServerEvent("getPlayers:check")
end)



RegisterNetEvent('getPlayers:done')
AddEventHandler('getPlayers:done', function(playerCount)
    print(playerCount)
    SendNUIMessage({action = "setPlayerId", id = GetPlayerServerId(PlayerId())})
    SendNUIMessage({action = "setPlayerCount", count = playerCount})
end)


Citizen.CreateThread(function()
    while true do
        SendNUIMessage({action = "setPlayerCount", count = #GetActivePlayers()}) 
    Wait(600)
    end
end)
Citizen.CreateThread(function()
    while true do
        SendNUIMessage({action = "setPlayerId", id = GetPlayerServerId(PlayerId())}) 
    Wait(6000)
    end
end)