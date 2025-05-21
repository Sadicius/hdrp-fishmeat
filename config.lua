Config = {}

Config.Debug = true

------------------------------------------------------------------------------------------------------
-- settings
------------------------------------------------------------------------------------------------------
Config.SellTime = 10000
Config.commandProcessFish = 'processfish'
Config.requerimentFishing = 'weapon_melee_knife' -- 'weapon_melee_knife_jawbone' -- tools require

-- mini game
Config.DoMiniGame = true
Config.levelSkillGameFirst = 'easy'
Config.levelSkillGameSecond = 'easy'
Config.levelSkillGameThree = 'easy' -- 'easy, 'medium', 'hard'
Config.skillPressKeys = {'e'}-- {'w', 'a', 's', 'd'}
Config.breakIngredient = true -- if necesary DoMiniGame in true 
Config.randomBreakIng = 25 -- 1-100%

-- breaks
Config.breakKnife = true -- break tool item 
Config.randomBreakKnife = 5 -- 1-100%

-- fish meat amount
Config.FishAmount = {
    Small  = 1,
    Medium = 2,
    Large  = 3,
}

-- items
Config.itemRewardFail = 'trapbait'
Config.itemReward     = 'raw_fish'

-- models
Config.propKnife = `w_melee_knife06`
Config.propFish = `s_inv_fishrainbowtrout01x_ms`
Config.propFishfilet = `p_redfishfilet01xa`

---------------------------------
-- webhook
---------------------------------
Config.WebhookName = 'rex-fishmonger'
Config.WebhookTitle = 'Fishmonger'
Config.WebhookColour = 'default'