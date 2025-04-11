local Framework = nil

if GetResourceState("es_extended") == "started" then
    Framework = "es_extended"
elseif GetResourceState("qb-core") == "started" then
    Framework = "qb-core"
end

local price = Config.Price

function removeColorCodes(text)
    return text:gsub("~[a-zA-Z0-9]~", "")
end

Citizen.CreateThread(function()
    while true do
        for _, playerid in pairs(GetPlayers()) do
            local xPlayer = nil
            if Framework == "es_extended" then
                xPlayer = exports["es_extended"]:getSharedObject().GetPlayerFromId(playerid)
            elseif Framework == "qb-core" then
                xPlayer = exports["qb-core"]:GetCoreObject().Functions.GetPlayer(playerid)
            end

            if xPlayer then
                local totalPrice = 0

                for _, itemToCheck in ipairs(Config.ItemsToCheck) do
                    local itemCount = 0
                    if Framework == "es_extended" then
                        local item = xPlayer.getInventoryItem(itemToCheck.name)
                        if item then itemCount = item.count end
                    elseif Framework == "qb-core" then
                        local item = xPlayer.Functions.GetItemByName(itemToCheck.name)
                        if item then itemCount = item.amount end
                    end

                    if itemCount >= itemToCheck.minimumCount then
                        totalPrice = totalPrice + price
                    end
                end

                if totalPrice > 0 then
                    if Framework == "es_extended" then
                        xPlayer.removeAccountMoney('bank', totalPrice)
                    elseif Framework == "qb-core" then
                        xPlayer.Functions.RemoveMoney('bank', totalPrice)
                    end

                    local notificationText = Translation[Config.Locale]['text'] .. totalPrice .. Translation[Config.Locale]['text_2']

                    if Config.Notify == "sc_notify" then
                        notificationText = removeColorCodes(notificationText)
                        TriggerClientEvent('sc_notify:notify', playerid, {
                            title = Translation[Config.Locale]['pay_text'],
                            description = notificationText,
                            duration = 5000,
                            icon = 'mobile-screen-button'
                        })
                    elseif Config.Notify == "standard" then
                        if Framework == "es_extended" then
                            TriggerClientEvent('scphonetax:sendtax', playerid, 'CHAR_CHAT_CALL', notificationText, Translation[Config.Locale]['handy'], Translation[Config.Locale]['pay_text'])
                        elseif Framework == "qb-core" then
                            TriggerClientEvent('QBCore:Notify', playerid, removeColorCodes(notificationText), 'success')
                        end
                    end
                end
            end
        end
        Citizen.Wait(Config.Time * 60000)
    end
end)



