local QRCore = exports['qr-core']:GetCoreObject()

local clothingData = {
    currentHat = "",
    currentShirt = "",
    currentPants = "",
    currentBoots = "",
    currentCoats = "",
    currentClosedCoats = "",
    currentGlove = "",
    currentVest = "",
    currentPonchos = "",
    currentSleeve = "",
    currentFoldPants = ""
}

local ComponentsMale = {}
local ComponentsFemale = {}
local playerSkin = {}

local wearableState = {
    bandana = -1829635046, -- equip bandana
    sleeves = -1539589426, -- sleeves
    under = -2081918609, --set component to be under other example corset under pants boots under pants
    openCollarRolledSleeve = `open_collar_rolled_sleeve`,
    pomade = `POMADE`,
    base = `base`, -- resets to default
}

--enable just to debug
--[[ AddEventHandler('onClientResourceStart', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
      return
    end

    QRCore.Functions.TriggerCallback('addz_qr_clothing:server_getPlayerSkin', function(result)
        local playerPed = PlayerPedId()

        if IsPedMale(playerPed) then
            local bodyComponents = exports['qr-appearance']:GetBodyComponents()
            ComponentsMale = bodyComponents[1]
        else
            local bodyComponents = exports['qr-appearance']:GetBodyComponents()
            ComponentsFemale= bodyComponents[1]
        end
        playerSkin = json.decode(result.skin)
    end)

  end) ]]

RegisterNetEvent('QRCore:Client:OnPlayerLoaded')
AddEventHandler('QRCore:Client:OnPlayerLoaded', function()

    Wait(2000)
    QRCore.Functions.TriggerCallback('addz_qr_clothing:server_getPlayerSkin', function(result)
        local playerPed = PlayerPedId()

        if IsPedMale(playerPed) then
            local bodyComponents = exports['qr-appearance']:GetBodyComponents()
            ComponentsMale = bodyComponents[1]
        else
            local bodyComponents = exports['qr-appearance']:GetBodyComponents()
            ComponentsFemale= bodyComponents[1]
        end
        playerSkin = json.decode(result.skin)
    end)
end)

RegisterNetEvent('addz_qr_clothing:client_OnOffClothing', function(clothingName)

    local playerPed = PlayerPedId()
    if clothingName == "hat" then
        if clothingData.currentHat == "" then
            clothingData.currentHat = exports['qr-clothes']:GetClothesCurrentComponentHash("hats")
            local isWearHat = IsPedUsingComponent(playerPed, Config.ClothingCategory.Hat)
            if isWearHat then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.Hat)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentHat, false, true)
            clothingData.currentHat = ""
        end
    elseif clothingName == "shirt" then
        if clothingData.currentShirt == "" then
            clothingData.currentShirt = exports['qr-clothes']:GetClothesCurrentComponentHash("shirts_full")
            local isWearShirt = IsPedUsingComponent(playerPed, Config.ClothingCategory.Shirt)
            if isWearShirt then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.Shirt)
                Wait(10)
                LoadUpperBody(playerPed, playerSkin)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentShirt, false, true)
            clothingData.currentShirt = ""
        end
    elseif clothingName == "pants" then

        --need to remove boot as well to avoid blank lower body
        if clothingData.currentBoots == "" then
            clothingData.currentBoots = exports['qr-clothes']:GetClothesCurrentComponentHash("boots")
            local isWearBoots = IsPedUsingComponent(playerPed, Config.ClothingCategory.Boots)
            if isWearBoots then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.Boots)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentBoots, false, true)
            clothingData.currentBoots = ""
        end

        if clothingData.currentPants == "" then
            clothingData.currentPants = exports['qr-clothes']:GetClothesCurrentComponentHash("pants")
            local isWearPants = IsPedUsingComponent(playerPed, Config.ClothingCategory.Pants)
            if isWearPants then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.Pants)
                Wait(10)
                LoadLowerBody(playerPed, playerSkin)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentPants, false, true)
            clothingData.currentPants = ""
        end
    elseif clothingName == "boots" then
        if clothingData.currentBoots == "" then
            clothingData.currentBoots = exports['qr-clothes']:GetClothesCurrentComponentHash("boots")
            local isWearBoots = IsPedUsingComponent(playerPed, Config.ClothingCategory.Boots)
            if isWearBoots then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.Boots)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentBoots, false, true)
            clothingData.currentBoots = ""
        end
    elseif clothingName == "coats" then
        if clothingData.currentCoats == "" then
            clothingData.currentCoats = exports['qr-clothes']:GetClothesCurrentComponentHash("coats")
            local isWearCoats = IsPedUsingComponent(playerPed, Config.ClothingCategory.Coats)
            if isWearCoats then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.Coats)
                Wait(10)
                LoadUpperBody(playerPed, playerSkin)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentCoats, false, true)
            clothingData.currentCoats = ""
        end
    elseif clothingName == "closedcoats" then
        if clothingData.currentClosedCoats == "" then
            clothingData.currentClosedCoats = exports['qr-clothes']:GetClothesCurrentComponentHash("coats_closed")
            local isWearClosedCoats = IsPedUsingComponent(playerPed, Config.ClothingCategory.ClosedCoats)
            if isWearClosedCoats then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.ClosedCoats)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentClosedCoats, false, true)
            clothingData.currentClosedCoats = ""
        end
    elseif clothingName == "glove" then
        if clothingData.currentGlove == "" then
            clothingData.currentGlove = exports['qr-clothes']:GetClothesCurrentComponentHash("gloves")
            local isWearGloves = IsPedUsingComponent(playerPed, Config.ClothingCategory.Gloves)
            if isWearGloves then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.Gloves)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentGlove, false, true)
            clothingData.currentGlove = ""
        end
    elseif clothingName == "ponchos" then
        if clothingData.currentPonchos == "" then
            clothingData.currentPonchos = exports['qr-clothes']:GetClothesCurrentComponentHash("ponchos")
            local isWearPonchos = IsPedUsingComponent(playerPed, Config.ClothingCategory.Ponchos)
            if isWearPonchos then
                RemoveItemFromPedByCategory(playerPed, Config.ClothingCategory.Ponchos)
            end
        else
            NativeSetPedComponentEnabled(playerPed, clothingData.currentPonchos, false, true)
            clothingData.currentPonchos = ""
        end
    elseif clothingName == "sleeve" then

        if clothingData.currentSleeve == "" then
            clothingData.currentSleeve = exports['qr-clothes']:GetClothesCurrentComponentHash("shirts_full")
            UpdateWearableState(playerPed, clothingData.currentSleeve, wearableState.sleeves, 0, true , 1)
        else
            UpdateWearableState(playerPed, clothingData.currentSleeve, wearableState.base, 0, true , 1)
            clothingData.currentSleeve = ""
        end

--[[     elseif clothingName == "foldpants" then
        if clothingData.currentFoldPants == "" then
            clothingData.currentFoldPants = exports['qr-clothes']:GetClothesCurrentComponentHash("pants")
            --UpdateWearableState(playerPed, clothingData.currentFoldPants, -2081918609, 0, true , 1)
            UpdateWearableState(playerPed, clothingData.currentFoldPants, wearableState.sleeves, 0, true , 1)
        else
            UpdateWearableState(playerPed, clothingData.currentFoldPants, wearableState.base, 0, true , 1)
            clothingData.currentFoldPants = ""
        end ]]
    end

end)

-- For trigger from radial menu

RegisterNetEvent('addz_qr_clothing:client_OnOffHat', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "hat")

end)

RegisterNetEvent('addz_qr_clothing:client_OnOffShirt', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "shirt")

end)


RegisterNetEvent('addz_qr_clothing:client_OnOffPants', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "pants")

end)


RegisterNetEvent('addz_qr_clothing:client_OnOffBoots', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "boots")

end)


RegisterNetEvent('addz_qr_clothing:client_OnOffCoats', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "coats")

end)

RegisterNetEvent('addz_qr_clothing:client_OnOffClosedCoats', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "closedcoats")

end)

RegisterNetEvent('addz_qr_clothing:client_OnOffGlove', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "glove")

end)

RegisterNetEvent('addz_qr_clothing:client_OnOffPonchos', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "ponchos")

end)

RegisterNetEvent('addz_qr_clothing:client_OnOffSleeve', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "sleeve")

end)


----------
--Commands
----------
RegisterCommand('sleeve', function()

    TriggerEvent('addz_qr_clothing:client_OnOffSleeve')

end)

--[[ RegisterCommand('foldpants', function()

    TriggerEvent('addz_qr_clothing:client_OnOffClothing', "foldpants")

end) ]]

RegisterCommand('hat', function()

    TriggerEvent('addz_qr_clothing:client_OnOffHat')

end)

RegisterCommand('shirt',function()

    TriggerEvent('addz_qr_clothing:client_OnOffShirt')

end)

RegisterCommand('pants',function()

    TriggerEvent('addz_qr_clothing:client_OnOffPants')

end)

RegisterCommand('boots',function()

    TriggerEvent('addz_qr_clothing:client_OnOffBoots')

end)

RegisterCommand('coats',function()

    TriggerEvent('addz_qr_clothing:client_OnOffCoats')

end)

RegisterCommand('glove',function()

    TriggerEvent('addz_qr_clothing:client_OnOffGlove')

end)

RegisterCommand('closedcoats',function()

    TriggerEvent('addz_qr_clothing:client_OnOffClosedCoats')

end)

RegisterCommand('ponchos',function()

    TriggerEvent('addz_qr_clothing:client_OnOffPonchos')

end)
------------
---function
------------

function UpdateWearableState(ped, clothHash, wearableHash, p3, p4 , p5)

    --Citizen.InvokeNative(0x66B957AAC2EAAEAB, ped, Core.Functions.GetClothesCurrentComponentHash("boots"), -2081918609, p3, p4, p5)
    Citizen.InvokeNative(0x66B957AAC2EAAEAB, ped, clothHash, wearableHash, p3, p4, p5)
    NativeUpdatePedVariation(ped)
end
function RemoveItemFromPedByCategory(ped, clothCategory)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, clothCategory, true, true, true)
end
function IsPedUsingComponent(ped, clothCategory)
    return Citizen.InvokeNative(0xFB4891BD7578CDC1, ped, clothCategory)
end

function NativeSetPedComponentEnabled(ped, componentHash, immediately, isMp)
    local categoryHash = NativeGetPedComponentCategory(not IsPedMale(ped), componentHash)

    NativeFixMeshIssues(ped, categoryHash)

    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, componentHash, immediately, isMp, true)
    NativeUpdatePedVariation(ped)
end

function NativeGetPedComponentCategory(isFemale, componentHash)
    return Citizen.InvokeNative(0x5FF9A878C3D115B8, componentHash, isFemale, true)
end


function NativeFixMeshIssues(ped, categoryHash)
    Citizen.InvokeNative(0x59BD177A1A48600A, ped, categoryHash)
end

function NativeHasPedComponentLoaded(ped)
    return Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ped)
end

function NativeUpdatePedVariation(ped)
    Citizen.InvokeNative(0x704C908E9C405136, ped)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false)
    while not NativeHasPedComponentLoaded(ped) do
        Wait(1)
    end
end

function LoadUpperBody(target, data)
    local output = GetSkinColorFromBodySize(tonumber(data.body_size), tonumber(data.skin_tone))
    if IsPedMale(target) then
        if tonumber(data.skin_tone) == 1 then
            torso = ComponentsMale["BODIES_UPPER"][output]
        elseif tonumber(data.skin_tone) == 2 then
            torso = ComponentsMale["BODIES_UPPER"][output]
        elseif tonumber(data.skin_tone) == 3 then
            torso = ComponentsMale.BODIES_UPPER[output]
            --print(' LoadUpperBody ' .. json.encode(ComponentsMale))
        elseif tonumber(data.skin_tone) == 4 then
            torso = ComponentsMale["BODIES_UPPER"][output]
           
        elseif tonumber(data.skin_tone) == 5 then
            torso = ComponentsMale["BODIES_UPPER"][output]
           
        elseif tonumber(data.skin_tone) == 6 then
            torso = ComponentsMale["BODIES_UPPER"][output]
          
        else
            torso = ComponentsMale["BODIES_UPPER"][output]
          
        end

    else
        if tonumber(data.skin_tone) == 1 then
            torso = ComponentsFemale["BODIES_UPPER"][output]
         
        elseif tonumber(data.skin_tone) == 2 then
            torso = ComponentsFemale["BODIES_UPPER"][output]
        
        elseif tonumber(data.skin_tone) == 3 then
            torso = ComponentsFemale["BODIES_UPPER"][output]
        
        elseif tonumber(data.skin_tone) == 4 then
            torso = ComponentsFemale["BODIES_UPPER"][output]
        
        elseif tonumber(data.skin_tone) == 5 then
            torso = ComponentsFemale["BODIES_UPPER"][output]
        
        elseif tonumber(data.skin_tone) == 6 then
            torso = ComponentsFemale["BODIES_UPPER"][output]
        
        else
            torso = ComponentsFemale["BODIES_UPPER"][output]
        end

    end
    NativeSetPedComponentEnabled(target, tonumber(torso), false, true)
end

function LoadLowerBody(target, data)

    local output = GetSkinColorFromBodySize(tonumber(data.body_size), tonumber(data.skin_tone))

    if IsPedMale(target) then
        if tonumber(data.skin_tone) == 1 then
            legs = ComponentsMale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 2 then
            legs = ComponentsMale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 3 then
            legs = ComponentsMale['BODIES_LOWER'][output]
        elseif tonumber(data.skin_tone) == 4 then
            legs = ComponentsMale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 5 then
            legs = ComponentsMale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 6 then
            legs = ComponentsMale["BODIES_LOWER"][output]
        else
            legs = ComponentsMale["BODIES_LOWER"][output]
        end

    else
        if tonumber(data.skin_tone) == 1 then
            legs = ComponentsFemale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 2 then
            legs = ComponentsFemale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 3 then
            legs = ComponentsFemale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 4 then
            legs = ComponentsFemale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 5 then
            legs = ComponentsFemale["BODIES_LOWER"][output]
        elseif tonumber(data.skin_tone) == 6 then
            legs = ComponentsFemale["BODIES_LOWER"][output]
        else
            legs = ComponentsFemale["BODIES_LOWER"][output]

        end

    end
    NativeSetPedComponentEnabled(target, tonumber(legs), false, true)
end

function GetSkinColorFromBodySize(body, color)
    if body == 1 then
        if color == 1 then
            return 7
        elseif color == 2 then
            return 10
        elseif color == 3 then
            return 9
        elseif color == 4 then
            return 11
        elseif color == 5 then
            return 8
        elseif color == 6 then
            return 12
        end
    elseif body == 2 then
        if color == 1 then
            return 1
        elseif color == 2 then
            return 4
        elseif color == 3 then
            return 3
        elseif color == 4 then
            return 5
        elseif color == 5 then
            return 2
        elseif color == 6 then
            return 6
        end
    elseif body == 3 then
        if color == 1 then
            return 13
        elseif color == 2 then
            return 16
        elseif color == 3 then
            return 15
        elseif color == 4 then
            return 17
        elseif color == 5 then
            return 14
        elseif color == 6 then
            return 18
        end
    elseif body == 4 then
        if color == 1 then
            return 19
        elseif color == 2 then
            return 22
        elseif color == 3 then
            return 21
        elseif color == 4 then
            return 23
        elseif color == 5 then
            return 20
        elseif color == 6 then
            return 24
        end
    elseif body == 5 then
        if color == 1 then
            return 25
        elseif color == 2 then
            return 28
        elseif color == 3 then
            return 27
        elseif color == 4 then
            return 29
        elseif color == 5 then
            return 26
        elseif color == 6 then
            return 30
        end
    else
        if color == 1 then
            return 13
        elseif color == 2 then
            return 16
        elseif color == 3 then
            return 15
        elseif color == 4 then
            return 17
        elseif color == 5 then
            return 14
        elseif color == 6 then
            return 18
        end
    end

end