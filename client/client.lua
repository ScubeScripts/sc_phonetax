ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('scphonetax:sendtax')
AddEventHandler('scphonetax:sendtax', function(icon, msg, title, subtitle)

    showPictureNotification(icon, msg, title, subtitle)

end)

function showPictureNotification(icon, msg, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg);
    SetNotificationMessage(icon, icon, true, 1, title, subtitle);
    DrawNotification(false, true);
end