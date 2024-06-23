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
