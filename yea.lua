task.wait(10)
getgenv().RngEvent = {
    Selected_RngEgg = "First",
    Rolling_Enabled = true,
    Rolling_Delay = 0.1,
    Visible_Rolling = false, -- Visible Rolling is Slower by ~1s; but you can see it :P

    Selected_Upgrades = {"RNGHugeLuck", "RNGEggLuck", "RNGHatchSpeed", "RNGBonusLuck"},
    AutoUpgrades_Enabled = false,
    AutoMerchant_Enabled = true,
    Lucky_Dice_Enabled = true,
    Lucky_Dice_Config = {
        ["Lucky Dice"] = {Craft = false, Use = true, Only_Use_If_Not_Active = true, Only_Use_If_Rolls_Ends_In = nil},
        ["Lucky Dice II"] = {Craft = true, Use = true, Only_Use_If_Not_Active = true, Only_Use_If_Rolls_Ends_In = nil},
        ["Mega Lucky Dice"] = {Craft = true, Use = false, Only_Use_If_Not_Active = false, Only_Use_If_Rolls_Ends_In = nil},
        ["Mega Lucky Dice II"] = {Craft = true, Use = true, Only_Use_If_Not_Active = true, Only_Use_If_Rolls_Ends_In = 9},
    },

    Webhook_Url = "https://discord.com/api/webhooks/1098232710805344256/qSm2aj2ZZTJd60-S8ZG_iwxZOOtk-kaOqTOr7PkN-zb3u9Dotw6Vz_c1h-JTVTuTLFoh",
    Discord_UserID = "344158553176539138",
    Huge_Mail_User = "",
    Huge_Mail_Enabled = false, -- Warning; using auto has a 1% chance to donate to devs!!

    fps_boost = true, -- erm makes game shtuff invisible
    fps_boost2 = true, -- erm disables game scripts so will break some in-game functionality like inventory Gui etc
    gui_stats_enabled = true,
    print_all_info = false, -- Will Print All Egg & Upgrade Names; for future updates (mainly for kw devs) :P
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/661ba97429a1d20f02880d1e9eeced08.lua"))()
