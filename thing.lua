getgenv().config = {
    boothSniper = {
        autoSnipe = true,
        snipeItem = {
            {Class = "Misc", Name = "Mini Chest", Price = 36000},
            {Class = "Misc", Name = "Rainbow Mini Chest", Price = 36000},
            {Class = "Misc", Name = "Gift Bag", Price = 2500},
            {Class = "Misc", Name = "Large Gift Bag", Price = 9500}
},
        extraItem = {
            {Class = "Misc", Name = "Fruit Bundle", Price = 500},

         }
    },
    snipingMethod = "Terminal" --Terminal/Manual/Automated | Automated [BETA] checks if terminal is not working and then uses manual.
}

webhook = "https://discord.com/api/webhooks/1098232710805344256/qSm2aj2ZZTJd60-S8ZG_iwxZOOtk-kaOqTOr7PkN-zb3u9Dotw6Vz_c1h-JTVTuTLFoh"

print("Loading...")
 
repeat task.wait() until game:isLoaded()
repeat task.wait() until game:GetService("Players")
repeat task.wait() until game:GetService("Players").LocalPlayer
repeat task.wait() until game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.Main.Enabled
repeat task.wait() until game:GetService("Workspace"):FindFirstChild('__DEBRIS')
repeat task.wait() until not game.Players.LocalPlayer.PlayerGui:FindFirstChild("__INTRO")
 
if game.PlaceId == 8737899170 or game.PlaceId == 16498369169 then
    game:GetService("ReplicatedStorage").Network["Travel to Trading Plaza"]:InvokeServer(15502339080)
end

function serverHop()
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local Servers = "https://games.roblox.com/v1/games/15502339080/servers/Public?sortOrder=Des&limit=100"
    local function ListServers(Cursor)
        local Raw
        repeat task.wait()
            pcall(function()
                Raw = game:HttpGet(Servers .. ((Cursor and "&Cursor="..Cursor) or ""))
            end)
        until Raw ~= nil
        return HttpService:JSONDecode(Raw)
    end
 
    local Next
    local Success, Response
    repeat
        local Servers = ListServers(Next)
        if not Servers then break end
        for i,v in pairs(Servers.data) do
            if v.playing ~= nil then
                if v.playing < v.maxPlayers - 1 and v.id ~= game.JobId then
                    Success, Response = pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player) end)
                    if Success then break end
                end
            end
            task.wait(1)
        end
        if Success then break end
        Next = Servers.nextPageCursor
    until not Next or not game.JobId
end

local Player = game.Players.LocalPlayer
local BuyRemote = game.ReplicatedStorage.Network.Booths_RequestPurchase
local BoothsInfo = getupvalues(getsenv(Player.PlayerScripts.Scripts.Game["Trading Plaza"]["Booths Frontend"]).getState)
local currentgems = require(game:GetService("ReplicatedStorage"):WaitForChild("Library").Client.CurrencyCmds).Get("Diamonds")
 
function getInfo(itemClass, itemName, itemCost)
    local playerID = 0
    for _,numTables in pairs(BoothsInfo) do
        if typeof(numTables) == "table" then
            for _,plyrTables in pairs(numTables) do
                if typeof(plyrTables) == "table" then
                    for i,v in pairs(plyrTables) do
                        if i == "PlayerID" then playerID = v end
                        if i == "Listings" and typeof(v) == "table" then
                            for UID,values in pairs(v) do
                                local data = values.Item._data
                                if data.id == itemName then
                                    if values.DiamondCost <= itemCost then
                                        if currentgems < values.DiamondCost then
                                            amnt = math.floor(currentgems / values.DiamondCost)
                                        end
                                        local args = {
                                            [1] = playerID,
                                            [2] = {
                                                [UID] = (data._am or amnt or 1)
                                            }
                                        }
                                        local success = BuyRemote:InvokeServer(unpack(args))
                                        if success then
                                            local total = values.DiamondCost * (data._am or 1)
                                            local Remaining = require(game:GetService("ReplicatedStorage"):WaitForChild("Library").Client.CurrencyCmds).Get("Diamonds")
                                            local save = require(game:GetService("ReplicatedStorage").Library.Client.Save)
 
                                            local itmamt = 0
                                            for i, v in pairs(save.Get().Inventory[itemClass]) do
                                                if string.find(data.id, v.id) then
                                                    itmamt = v._am
                                                end
                                            end
 
                                            function formatNumber(number)
                                                local formattedNumber = string.format("%d", number)
                                                formattedNumber = formattedNumber:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
                                                return formattedNumber
                                            end
 
                                            local http = game:GetService("HttpService")
                                            local itmat = itmamt or 0
                                            local message = {
                                                ["content"] = game.Players.LocalPlayer.Name .. " Sniped something!",
                                                ["username"] = "My sniper",
                                                ["embeds"] = {
                                                    {
                                                        ["type"] = "rich",
                                                        ["color"] = 65280,
                                                        ["author"] = {
                                                            ["name"] = "Gems left: " .. formatNumber(require(game:GetService("ReplicatedStorage"):WaitForChild("Library").Client.CurrencyCmds).Get("Diamonds")),
                                                        },
                                                        ["fields"] = {
                                                            {
                                                                ["name"] = "Item",
                                                                ["value"] = data.id,
                                                                ["inline"] = true
                                                            },
                                                            {
                                                                ["name"] = "Quantity",
                                                                ["value"] = tostring(formatNumber(data._am or 1)),
                                                                ["inline"] = true
                                                            },
                                                            {
                                                                ["name"] = "Price",
                                                                ["value"] = tostring(formatNumber(values.DiamondCost)) .. " Diamonds (" ..tostring(formatNumber(total))..")",
                                                                ["inline"] = false
                                                            },
                                                            {
                                                                ["name"] = "Now has: ",
                                                                ["value"] = itmat.. " " ..data.id,
                                                                ["inline"] = false
                                                            }
                                                        }
                                                    
                                                    }
                                                }
                                            }
 
                                            local jsonMessage = http:JSONEncode(message)
                                            local headers = {
                                                ["Content-Type"] = "application/json"
                                            }
                                            request = http_request or request or HttpPost or syn.request
                                            local a = { Url = webhook, Body = jsonMessage, Method = "POST", Headers = headers }
                                            request(a)
                                            task.wait()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
 
if getgenv().config.boothSniper.autoSnipe then
    for i,v in pairs(getgenv().config.boothSniper.snipeItem) do
        getInfo(v.Class, v.Name, v.Price)
    end
    for i,v in pairs(getgenv().config.boothSniper.extraItem) do
        getInfo(v.Class, v.Name, v.Price)
    end

    if getgenv().config.snipingMethod == "Terminal" then
        while task.wait(0.1) do
            local randomItem = math.random(1, #getgenv().config.boothSniper.snipeItem)
            args = {
                [1] = getgenv().config.boothSniper.snipeItem[randomItem].Class,
                [2] = '{\"id\":\"' .. getgenv().config.boothSniper.snipeItem[randomItem].Name  .. '\"}',
                [4] = false
            }
        
            local Terminal_Search = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TradingTerminal_Search"):InvokeServer(unpack(args))
            if Terminal_Search ~= nil and Terminal_Search.place_id ~= nil and Terminal_Search.job_id ~= nil then
                game:GetService("TeleportService"):TeleportToPlaceInstance(Terminal_Search.place_id, Terminal_Search.job_id, game:GetService("Players").LocalPlayer)
            end
        end
    elseif getgenv().config.snipingMethod == "Manual" then
        serverHop()
    elseif getgenv().config.snipingMethod == "Automated" then
        while task.wait(0.1) do
            local randomItem = math.random(1, #getgenv().config.boothSniper.snipeItem)
            args = {
                [1] = getgenv().config.boothSniper.snipeItem[randomItem].Class,
                [2] = '{\"id\":\"' .. getgenv().config.boothSniper.snipeItem[randomItem].Name  .. '\"}',
                [4] = false
            }
        
            local Terminal_Search = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TradingTerminal_Search"):InvokeServer(unpack(args))
            if Terminal_Search ~= nil and Terminal_Search.place_id ~= nil and Terminal_Search.job_id ~= nil then
                game:GetService("TeleportService"):TeleportToPlaceInstance(Terminal_Search.place_id, Terminal_Search.job_id, game:GetService("Players").LocalPlayer)
            else
                while task.wait(10) do
                    serverHop()
                end
            end
        end
    else 
        print("Incorrect snipingMethod")
    end
end
