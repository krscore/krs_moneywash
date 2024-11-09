local startWashing = false
local timeWashing = false
local currentWashAmount = 0

local function getTimeWashing()
    timeWashing = true
    Wait(cfg.waitRewashing)
    timeWashing = false
end

local function createBlip(coords, sprite, name)
    if not coords or not sprite or not name then return end
    
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, sprite)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(blip)
    return blip
end

local function startWashingMoney()
    if startWashing then
        lib.notify({ title = locale('title_notify'), description = locale('description_start_wash'), type = locale('error_notify')}) return end
    if timeWashing then
        lib.notify({title = locale('title_notify'), description = locale('description_time_wash'), type = locale('error_notify') }) return end

    local input = lib.inputDialog(locale('title_menu_dialog'), {
        {type = 'number', label = locale('label_dialog'), min = 1, description = locale('description_dialog'), icon = cfg.iconDialog}
    })

    if not input then return end

    currentWashAmount = tonumber(input[1])

    TriggerServerEvent('krs_moneywash:washAmount', currentWashAmount)
end

RegisterNetEvent('krs_moneywash:startWashing', function(amount)
    local playerPed = cache.ped
    startWashing = true
    lib.notify({title = locale('title_notify'), description = locale('description_start_washing'), type = locale('inform_notify')})
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_AA_SMOKE")
    if lib.progressCircle({
        duration = cfg.washDuration,
        position = cfg.positionProgress,
        label = locale('label_progress'),
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
            combat = true
        },
    }) then
        lib.notify({title = locale('title_notify'), description = locale('description_finish_wash'), type = locale('inform_notify')})
    end
    startWashing = false
    ClearPedTasksImmediately(playerPed)
    getTimeWashing()
end)

for _, v in pairs(cfg.positionWashing) do
    if v.active then 
        createBlip(v.coords, v.sprite, v.name)
    end
    lib.zones.sphere({
        coords = v.coords,
        size = vec3(1.6, 1.4, 3.2),
        rotation = 346.25,
        debug = false,
        onExit = function()
            lib.hideTextUI()  
        end,
        onEnter = function()
            lib.showTextUI(locale('enter_textui')) 
        end,
        inside = function(self)
            DrawMarker(0, self.coords.x, self.coords.y, self.coords.z, 
            0.0, 0.0, 0.0, 
            0.0, 0.0, 0.0, 
            0.5, 0.5, 0.5, 
            255, 255, 255, 255,
            false, true, 2, false, nil, nil, false)
            if IsControlJustReleased(0, 38) then 
                startWashingMoney()
            end
        end
    })
end


