getgenv().AutoClanWar = {
    AutoTap = true,
    FPSBooster = true,
    AutoFruit = true,
    AutoUltimate = true,

    AutoFlag = false,
    FlagType = "Hasty", -- Exotic, Shiny, Rainbow, Fortune, Diamonds, Hasty, Coins, Magnet (CASE SENSETIVE)

    AutoPotion = true,
    PotionLevel = 8,
    Potions = { -- CASE SENSITIVE
        "Damage",
        "Coins",
        "Lucky",
        "The Cocktail" -- will automatically account for no level
    },
}

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d28c9bb97737ea6426e01edc40836fea.lua"))()

task.wait(3)
getgenv().Id = "344158553176539138"
getgenv().Url = "https://discord.com/api/webhooks/1093856436439748709/LfxwDGwXTmGStdU8UgkyJIkIcTXoiWrcmiPjcx5K0UtsoVlNdMNQV6W2WagAsyYE2zRb"

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ed88cda2afec54cf573c9c1498fad353.lua"))()
