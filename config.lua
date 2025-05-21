Config = {}

Config.Debug = false

------------------------------------------------------------------------------------------------------
-- success and item
------------------------------------------------------------------------------------------------------
Config.SellTime = 5000
Config.commandProcessFish = 'processfish'
Config.DoMiniGame = true
Config.DoMiniGameKeys = {'w', 'a', 's', 'd'}

Config.propFish = `s_inv_fishrainbowtrout01x_ms`
Config.propFishfilet = `p_redfishfilet01xa`

Config.propKnife = `w_melee_knife06`
Config.requerimentFishing = 'weapon_melee_knife' -- 'weapon_melee_knife_jawbone'
Config.breakKnife = true
Config.randomBreakKnife = 5 -- 1-100%

---------------------------------
-- fish meat amount
---------------------------------
Config.FishAmount = {
    Small  = 1,
    Medium = 2,
    Large  = 3,
}

Config.itemReward     = 'raw_fish'
Config.itemRewardFail = 'trapbait'

---------------------------------
-- webhook
---------------------------------
Config.WebhookName = 'rex-fishmonger'
Config.WebhookTitle = 'Fishmonger'
Config.WebhookColour = 'default'