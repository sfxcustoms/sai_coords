local IsDead = false

AddEventHandler('esx:onPlayerDeath', function(data)
    IsDead = true
end)

AddEventHandler('esx:onPlayerSpawn', function(spawn)
    IsDead = false
end)

RegisterNetEvent('sai_coords:CoordsMenu')
AddEventHandler('sai_coords:CoordsMenu', function()
    local PlayerPed = PlayerPedId()
    local PlayerCoords = GetEntityCoords(PlayerPed)
    local PlayerHeading = GetEntityHeading(PlayerPed)
    
    local CoordsXYZ1 = PlayerCoords.x .. ', ' .. PlayerCoords.y .. ', ' .. PlayerCoords.z
    local CoordsXYZ2 = 'x = ' .. PlayerCoords.x .. ', y = ' .. PlayerCoords.y .. ', z = ' .. PlayerCoords.z
    
    local Vector2 = 'vec2(' .. PlayerCoords.x .. ', ' .. PlayerCoords.y .. ')'
    local Vector3 = 'vec3(' .. PlayerCoords.x .. ', ' .. PlayerCoords.y .. ', ' .. PlayerCoords.z .. ')'
    local Vector4 = 'vec4(' .. PlayerCoords.x .. ', ' .. PlayerCoords.y .. ', ' .. PlayerCoords.z .. ', ' .. PlayerHeading .. ')'
    
    if not IsDead then
        local Coords = lib.inputDialog('SFX Customs Originals', {
            {type = 'select', icon = 'location-dot', options = {
                {value = CoordsXYZ1, label = '0.0, 0.0, 0.0'},
                {value = CoordsXYZ2, label = 'x = 0.0, y = 0.0, z = 0.0'},
                
                {value = Vector2, label = 'vec2(0.0, 0.0)'},
                {value = Vector3, label = 'vec3(0.0, 0.0, 0.0)'},
                {value = Vector4, label = 'vec4(0.0, 0.0, 0.0, 0.0)'},
                {value = PlayerHeading, label = 'heading(0.0)'},
            }},
        })
        
        if not Coords then return end
        lib.setClipboard(Coords)
    end
end)