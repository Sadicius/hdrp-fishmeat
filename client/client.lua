local RSGCore = exports['rsg-core']:GetCoreObject()
local spawnProps = {}
lib.locale()

------------------------------------------------------------------------------------------------------
-- bascic
------------------------------------------------------------------------------------------------------
-- block player
local function FreezePlayer()
    FreezeEntityPosition(cache.ped, true)
    SetEntityInvincible(cache.ped, true)
    SetCurrentPedWeapon(cache.ped, "WEAPON_UNARMED", true)
    SetBlockingOfNonTemporaryEvents(cache.ped, true)
    SetPedCanRagdoll(cache.ped, false)
end

local function UnfreezePlayer()
    FreezeEntityPosition(cache.ped, false)
    SetEntityInvincible(cache.ped, false)
    SetCurrentPedWeapon(cache.ped, "WEAPON_UNARMED", false)
    SetBlockingOfNonTemporaryEvents(cache.ped, false)
    SetPedCanRagdoll(cache.ped, true)
end

local function cleanProps(prop)
    if not prop then return end
    for i, props in ipairs(spawnProps) do
        for key, entity in pairs(props) do
            if entity == prop and DoesEntityExist(prop) then
                SetEntityAsMissionEntity(prop, true, true)
                SetEntityAsNoLongerNeeded(prop)
                DeleteEntity(prop)
                props[key] = nil
            end
        end
    end
end

local function attachPropToBone(model, boneName, pos, rot)
    local coords = GetEntityCoords(cache.ped)
    local bone = GetEntityBoneIndexByName(cache.ped, boneName)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end
    local prop = CreateObject(model, coords.x, coords.y, coords.z, true, true, true)
    if not DoesEntityExist(prop) then return nil end

    SetModelAsNoLongerNeeded(model)
    SetEntityAsMissionEntity(prop, true, true)
    AttachEntityToEntity(prop, cache.ped, bone, pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, true, false, true, false, 0, true)

    return prop
end

local function breakRequerimentItem(knife)
    local numberGenerator = math.random(1, 100)
    if numberGenerator <= Config.randomBreakKnife then
        if knife and DoesEntityExist(knife) then cleanProps(knife) end
        UnfreezePlayer()
        LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory 
        TriggerServerEvent('hdrp-fistmeat:server:breakknife')
        lib.notify({ title = locale('cl_lang_3'), description = locale('cl_lang_4'), type = 'error' })
    end
end

------------------------------------------------------------------------------------------------------
-- option 1
-- progress in props
------------------------------------------------------------------------------------------------------
RegisterNetEvent('hdrp-fishmeat:client:processfish', function()
    -- requeriment item
    local hasItem = RSGCore.Functions.HasItem(Config.requerimentFishing, 1)
    if not hasItem then lib.notify({ title = locale('cl_lang_1'), description = locale('cl_lang_2'), type = 'error' }) return end

    LocalPlayer.state:set("inv_busy", true, true) -- lock inventory
    FreezePlayer()

    local time = Config.SellTime
    if lib.progressBar({
        duration = time*0.7,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disableControl = true,
        anim = {
            dict = 'amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_a',
            clip = 'idle_c',
            flag = 1
        },
        prop = {
            -- first
            {
                model = `w_melee_knife06`,
                bone = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger00"),
                pos = vector3(0.07, -0.00, 0.02),
                rot = vector3(75.0, 270.0, 120.0)
            },
            {
                model = `p_redfishfilet01xa`,
                bone = GetEntityBoneIndexByName(cache.ped, "SKEL_L_Finger00"),
                pos = vector3(0.27, -0.00, -0.04),
                rot = vector3(-80.0, 90.0, 30.0)
            },
        },
        disable = {
            move = true,
            mouse = true,
        },
        label = locale('cl_lang_5'), -- 'Preparing '..title..' '..category
    }) then
        if Config.Debug then print('check first progress') end
        if Config.breakKnife then breakRequerimentItem(nil) return end         -- break requeriment item
        if Config.DoMiniGame then
            local success = lib.skillCheck({{areaSize = 50, speedMultiplier = 0.5}}, Config.DoMiniGameKeys)
            if not success then
                UnfreezePlayer()
                LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory
                TriggerServerEvent('hdrp-fishmeat:server:processfailfish')
                SetPedToRagdoll(cache.ped, 1000, 1000, 0, 0, 0, 0)
                lib.notify({ title = locale('cl_lang_7'), description = locale('cl_lang_8'), type = 'error' })
                return
            end
        end
    end

    if lib.progressBar({
        duration = time*0.3,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disableControl = true,
        anim = {
            dict = 'amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_a',
            clip = 'idle_c',
            flag = 1
        },
        prop = {
            -- second
            {
                model = `w_melee_knife06`,
                bone = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger00"),
                pos = vector3(0.07, -0.00, 0.025),
                rot = vector3(90.0, 165.0, 105.0)
            },
            {
                model = `p_redfishfilet01xa`,
                bone = GetEntityBoneIndexByName(cache.ped, "SKEL_L_Finger00"),
                pos = vector3(0.10, 0.01, -0.03),
                rot = vector3(-30.0, 80.0, 90.0)
            }
        },

        disable = {
            move = true,
            mouse = true,
        },
        label = locale('cl_lang_5'), -- 'Preparing '..title..' '..category
    }) then
        TriggerServerEvent('hdrp-fishmeat:server:processfish')
    end

    UnfreezePlayer()
    LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory
end)

--------------
-- option 2
-- progress out props
--------------
local function playProgressBar(duration, label)
    return lib.progressBar({
        duration = duration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disableControl = true,
        anim = {
            dict = 'amb_rest_lean@world_human_lean@table@sharpen_knife@male_a@idle_a',
            clip = 'idle_c',
            flag = 1
        },
        disable = { move = true, mouse = true },
        label = label
    })
end

RegisterNetEvent('hdrp-fishmeat:client:playerprocessfish', function()
    LocalPlayer.state:set("inv_busy", true, true) -- lock inventory
    FreezePlayer()
    -- FIRST PART
    local knife = attachPropToBone(Config.propKnife, "SKEL_R_Finger00", vector3(0.07, 0.00, 0.02), vector3(75.0, 270.0, 120.0))
    local fish  = attachPropToBone(Config.propFish, "SKEL_L_Finger00", vector3(0.27, 0.00, -0.04), vector3(-80.0, 90.0, 30.0))
    if knife and fish then table.insert(spawnProps, {knife = knife, fish = fish}) end

    local time = Config.SellTime
    if playProgressBar(time*0.7, locale('cl_lang_5')) then
        cleanProps(fish)
        if Config.breakKnife then breakRequerimentItem(knife) return end         -- break requeriment item
        if Config.DoMiniGame then
            local success = lib.skillCheck({{areaSize = 50, speedMultiplier = 0.5}}, Config.DoMiniGameKeys)
            if not success then
                cleanProps(knife)
                UnfreezePlayer()
                LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory 
                TriggerServerEvent('hdrp-fishmeat:server:processfailfish')
                SetPedToRagdoll(cache.ped, 1000, 1000, 0, 0, 0, 0)
                lib.notify({ title = locale('cl_lang_15'), description = locale('cl_lang_16'), type = 'error' })
                return
            end
        end
    end

    -- SECOND PART
    local filet = attachPropToBone(Config.propFishfilet, "SKEL_L_Finger00", vector3(0.10, 0.01, -0.03), vector3(-30.0, 80.0, 90.0))
    if filet then table.insert(spawnProps, {filet = filet}) end

    if knife and DoesEntityExist(knife) then
        AttachEntityToEntity(knife, cache.ped, GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger00"), 0.07, 0.00, 0.025, 90.0, 165.0, 105.0, true, false, true, false, 0, true)
    end

    Wait(100)
    if playProgressBar(time*0.3, locale('cl_lang_5')) then
        cleanProps(knife)
        cleanProps(filet)
        TriggerServerEvent('hdrp-fishmeat:server:processfish')
    end

    UnfreezePlayer()
    LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for _, props in pairs(spawnProps) do
        for _, entity in pairs(props) do
            if entity and DoesEntityExist(entity) then
                SetEntityAsMissionEntity(entity, true, true)
                SetEntityAsNoLongerNeeded(entity)
                DeleteEntity(entity)
            end
        end
    end
    spawnProps = {}
    UnfreezePlayer()
    LocalPlayer.state:set("inv_busy", false, true)
end)