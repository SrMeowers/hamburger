getgenv().autoSummer = {
    regMin = 3,
    huntMin = 40,
    fpsBoost = false,
    unRender = false,

    autoFlags = "Coins Flag",
    autoFruit = true,
    autoUltimate = true,
    autoPotion = true,
    potionCFG = {
        ["Damage"] = true,
        ["Lucky"] = true,
        ["Coins"] = true,
        ["Diamonds"] = false,
        ["Treasure Hunter"] = false,
    }
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6d198711c95f588617ed621f6ccd5866.lua"))()
