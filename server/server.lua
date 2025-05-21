local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

----------------------------------------------
-- command process fish for raw_fish
----------------------------------------------
RSGCore.Commands.Add(Config.commandProcessFish, locale('sv_lang_10'), {}, false, function(source)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local hasFish = false
    if Player.PlayerData.items ~= nil then
        for _, item in pairs(Player.PlayerData.items) do
            if item and item.name and string.match(item.name, "^a_c_fish") then
                hasFish = true
                break
            end
        end
    end

    if hasFish then
        TriggerClientEvent('hdrp-fistmeat:client:playerprocessfish', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_6'),
            description = locale('sv_lang_7'), -- Mensaje como "No tienes peces"
            type = 'error'
        })
    end
end, 'user')

----------------------------------------------------
-- break items
----------------------------------------------------
RegisterServerEvent('hdrp-fistmeat:server:breakknife')
AddEventHandler('hdrp-fistmeat:server:breakknife', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.Functions.RemoveItem(Config.requerimentFishing, 1) then
        TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[Config.requerimentFishing], "add")
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_1'), description = locale('sv_lang_2'), type = 'success' })
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), description = locale('sv_lang_4'), type = 'error' })
        if Config.Debug then  print(locale('sv_lang_5')) end
    end
end)

----------------------------------------------------
-- fail preparing / revice fish filet bad
----------------------------------------------------
RegisterServerEvent('hdrp-fistmeat:server:processfailfish')
AddEventHandler('hdrp-fistmeat:server:processfailfish', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local raw_fish = 0
    local hasfish  = false
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == 'a_c_fishbluegil_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbluegil_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbullheadcat_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbullheadcat_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchainpickerel_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchainpickerel_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishperch_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishperch_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishredfinpickerel_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishredfinpickerel_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrockbass_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrockbass_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbluegil_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbluegil_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbullheadcat_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbullheadcat_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchainpickerel_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchainpickerel_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlargemouthbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlargemouthbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishperch_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishperch_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrainbowtrout_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrainbowtrout_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishredfinpickerel_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishredfinpickerel_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrockbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrockbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_ml' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_ml', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsmallmouthbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsmallmouthbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchannelcatfish_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchannelcatfish_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchannelcatfish_01_xl' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchannelcatfish_01_xl', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlakesturgeon_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlakesturgeon_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlargemouthbass_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlargemouthbass_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlongnosegar_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlongnosegar_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishmuskie_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishmuskie_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishnorthernpike_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishnorthernpike_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrainbowtrout_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrainbowtrout_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsmallmouthbass_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsmallmouthbass_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                end
            end
        end
        if hasfish then
            Player.Functions.AddItem(Config.itemRewardFail, raw_fish)
            TriggerClientEvent('rNotify:ShowAdvancedRightNotification', src, raw_fish .." x "..RSGCore.Shared.Items['trapbait'].label, "generic_textures" , "tick" , "COLOR_PURE_WHITE", 4000)
            hasfish = false
        else
            TriggerClientEvent('ox_lib:notify', source, {title = locale('sv_lang_6'), description = locale('sv_lang_7'), type = 'error' })
        end
    end
    TriggerClientEvent('ox_lib:notify', source, {title = locale('sv_lang_8'), description = locale('sv_lang_9'), type = 'Success' })
end)

----------------------------------------------
-- process fish for raw_fish
----------------------------------------------
RegisterServerEvent('hdrp-fistmeat:server:processfish')
AddEventHandler('hdrp-fistmeat:server:processfish', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local raw_fish = 0
    local hasfish  = false

    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Player.PlayerData.items[k].name == 'a_c_fishbluegil_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbluegil_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbullheadcat_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbullheadcat_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchainpickerel_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchainpickerel_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishperch_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishperch_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishredfinpickerel_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishredfinpickerel_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrockbass_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrockbass_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbluegil_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbluegil_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbullheadcat_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbullheadcat_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchainpickerel_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchainpickerel_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlargemouthbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlargemouthbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishperch_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishperch_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrainbowtrout_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrainbowtrout_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishredfinpickerel_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishredfinpickerel_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrockbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrockbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_ml' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_ml', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsmallmouthbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsmallmouthbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchannelcatfish_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchannelcatfish_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchannelcatfish_01_xl' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchannelcatfish_01_xl', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlakesturgeon_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlakesturgeon_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlargemouthbass_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlargemouthbass_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlongnosegar_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlongnosegar_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishmuskie_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishmuskie_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishnorthernpike_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishnorthernpike_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrainbowtrout_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrainbowtrout_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsmallmouthbass_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsmallmouthbass_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                end
            end
        end
        if hasfish then
            Player.Functions.AddItem(Config.itemReward, raw_fish)
            TriggerClientEvent('rNotify:ShowAdvancedRightNotification', src, raw_fish .. " x "..RSGCore.Shared.Items[Config.itemReward].label, "generic_textures" , "tick" , "COLOR_PURE_WHITE", 4000)
            Player.Functions.AddItem(Config.itemRewardFail, raw_fish)
            TriggerClientEvent('rNotify:ShowAdvancedRightNotification', src, raw_fish .." x "..RSGCore.Shared.Items[Config.itemRewardFail].label, "generic_textures" , "tick" , "COLOR_PURE_WHITE", 4000)

            local Discordmsg = ''.. raw_fish .. " x "..RSGCore.Shared.Items[Config.itemReward].label .. ' and ' ..RSGCore.Shared.Items[Config.itemRewardFail].label
            TriggerEvent('rsg-log:server:CreateLog', Config.WebhookName, Config.WebhookTitle, Config.WebhookColour, Discordmsg, false)
            hasfish = false
        else
            TriggerClientEvent('ox_lib:notify', source, {title = locale('sv_lang_8'), description = locale('sv_lang_9'), type = 'error' })
        end
    end
end)