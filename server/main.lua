RegisterCommand('c', function(source, args, raw)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() ~= 'user' then
        xPlayer.triggerEvent('sai_coords:CoordsMenu')
    end
end)