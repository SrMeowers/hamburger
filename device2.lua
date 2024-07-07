task.wait(10)
script_key="rHTMKpaNmIPhpkXzgSqlRXhIyvESgiLx";
-- Please Read FAQ channel for more info! Make sure you understand these parameters
-- If not sure ask info in channel
_G.GPROGRESS_MODE = "Hybrid"
_G.GRANK_TO = 1
_G.GZONE_TO = 9999 -- ONLY increase above 99 to go to world2, only when 100% sure, there is no way back for the "best zone" quests etc. 
_G.GMAX_EGG_SLOTS = 25
_G.GMAX_EQUIP_SLOTS = 40
_G.GHOLD_GIFTS = false
_G.GHOLD_BUNDLES = false
_G.GMAX_ZONE_UPGRADE_COST = 20000
_G.GIGNORE_SLEDRACE = false
_G.GDO_LUCKY_TILES = true
_G.GPOTIONS = {"Damage","Coins"}
_G.GPOTIONS_MAX_TIER = 5
_G.GENCHANTS = {"Tap Power", "Coins", "Treasure Hunter", "Strong Pets", "Criticals"}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/34915da4ad87a5028e1fd64efbe3543f.lua"))()

task.wait(3)
getgenv().Id = "344158553176539138"
getgenv().Url = "https://discord.com/api/webhooks/1259359059551977483/P-XqQtNQ0Zh84_pLuL0Yg2y988vC_Oy6ZP7ZDxcXTPeikp-4QEvlawVSuu9blPQIqAlR"

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ed88cda2afec54cf573c9c1498fad353.lua"))()
