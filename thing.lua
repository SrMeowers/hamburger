getgenv().config = {
    timer = 5,
    boothSniper = {
        autoSnipe = true,
        snipeItem = {
            {
                Class = "Misc",
                Name = "Secret Key",
                Price = 55000
            },
        }
    },
    sellPrice = 60000000,
    discordId = "344158553176539138",
    gui = true,
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/SpeeQskriptz/luuns/main/autokey.lua"))()
