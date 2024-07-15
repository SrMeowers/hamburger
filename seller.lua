getgenv().Config = {
    ItemsToSell = {
        {Class = "Pet", Item = "Huge Punksky", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Punksky", Version = 2, Rap = -8},
        {Class = "Pet", Item = "Huge Punksky", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Avenging Griffin", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Avenging Griffin", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Avenging Griffin", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Koi Fish", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Koi Fish", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Koi Fish", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Zebra", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Zebra", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Zebra", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Bison", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Bison", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Bison", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Kangaroo", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Kangaroo", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Kangaroo", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Evil Imp", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Evil Imp", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Evil Imp", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Devil Agony", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Devil Agony", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Devil Agony", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Robber Pug", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Robber Pug", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Robber Pug", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Giraffe", Version = 1, Rap = -8},
        {Class = "Pet", Item = "Huge Giraffe", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Giraffe", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge UV Kitsune", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge UV Kitsune", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge UV Kitsune", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge UV Cat", Version = 1, Rap = -8},
        {Class = "Pet", Item = "Huge UV Cat", Version = 2, Rap = -8},
        {Class = "Pet", Item = "Huge UV Cat", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Red Panda", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Red Panda", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Red Panda", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Elephant", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Elephant", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Elephant", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Crocodile", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Crocodile", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Crocodile", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Rave Jaguar", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Rave Jaguar", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Rave Jaguar", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Fluffy Cat", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Fluffy Cat", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Fluffy Cat", Version = nil, Rap = -5},
        {Class = "Pet", Item = "Huge Bee", Version = 1, Rap = -5},
        {Class = "Pet", Item = "Huge Bee", Version = 2, Rap = -5},
        {Class = "Pet", Item = "Huge Bee", Version = nil, Rap = -5},
    
    },
        ClassToSell = {
        },
        ExcludeSell = {
            {Class = "Pet", Item = "Blueberry Cow"},
        },
        Terminal = {
            Class = "Misc", --[ ITEM CLASS ]
            Item = "Secret Key", --[ ITEM ID ]    
            Version = nil, --[ nil | 1 | 2 ]
            Shiny = nil, --[ nil | true ]
            Tier = nil, --[ Enchants | Potions ]
        },
        ServerHop_Method = "Terminal", -- [ Terminal | Normal ]
        PlayersUnder = 15, -- Server hop if players in server is under
        ServerHop_Time = 200
    }
    
    
    repeat task.wait() until game:IsLoaded()
    repeat task.wait() until game:GetService("Players").LocalPlayer
    repeat task.wait() until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("__INTRO")
    
    if game.PlaceId ~= 15588442388 and game.PlaceId ~= 15502339080 then
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Travel to Trading Plaza"):InvokeServer()
    end
    
    local Players = game:GetService('Players')
    local HttpService = game:GetService("HttpService")
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local HRP = LocalPlayer.Character.HumanoidRootPart
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local BoothSpawns = game.workspace.TradingPlaza.BoothSpawns:FindFirstChildWhichIsA("Model")
    local osclock = os.clock()
    
    --[[ GETRAP ]] local function GetRAP(Type, Item) local stackKey = HttpService:JSONEncode({id = Item.id, pt = Item.pt, sh = Item.sh, tn = Item.tn}) local rap = require(ReplicatedStorage.Library).DevRAPCmds.Get({ Class = {Name = Type}, IsA = function(hmm) return hmm == Type end, GetId = function() return Item.id end, StackKey = function() return stackKey end }) or 0 return rap end
    --[[ ANTIAFK ]] game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false; game.Players.LocalPlayer.Idled:connect(function() game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame) task.wait(1) game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame) end)
    
    function Percentile(value, percentage)
        local multiplier = 1 + percentage / 100
        return value * multiplier
    end
    
    function ServerHop()
        if Config.ServerHop_Method == "Normal" then
            local JobIDs = {}
            repeat
                task.wait(0.1)
                local API = HttpService:JSONDecode(
                    game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100" .. (ServerPages and "&cursor=" .. ServerPages or ""))
                )
                for _, v in ipairs(API["data"]) do
                    if v["id"] ~= game.JobId and v["playing"] ~= v["maxPlayers"] then
                        table.insert(JobIDs, v["id"])
                    end
                end
                ServerPages = API.nextPageCursor
            until #JobIDs >= 100
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, JobIDs[math.random(1, #JobIDs)])
        else
            local Terminal = Config.Terminal
            while task.wait(1) do
                pcall(function()
                    local args = {
                        [1] = Terminal.Class,
                        [2] = HttpService:JSONEncode({id = Terminal.Item, pt = Terminal.Version, sh = Terminal.Shiny, tn = Terminal.Tier}),
                        [4] = true
                    }
                    TerminalQuery = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TradingTerminal_Search"):InvokeServer(unpack(args))
                    game:GetService("TeleportService"):TeleportToPlaceInstance(TerminalQuery.place_id, TerminalQuery.job_id, LocalPlayer)
                end)
            end
        end
    end
    
    local function CheckPlayers()
        local CurrentPlayers = #Players:GetPlayers()
        if CurrentPlayers < Config.PlayersUnder then
            repeat print("Players Under " .. Config.PlayersUnder .. " | ServerHopping") ServerHop() task.wait(1) until not HRP
        end
    end
    
    CheckPlayers()
    
    Players.PlayerRemoving:Connect(function(player)
        CheckPlayers()
    end)
    
    -- Claim Booth 
    for _, Booth in ipairs(game.workspace.__THINGS.Booths:GetChildren()) do
        if Booth:IsA("Model") and Booth.Info.BoothBottom.Frame.Top.Text == LocalPlayer.DisplayName .. "'s Booth!" then HaveBooth = true
            HRP.CFrame = Booth.Table.CFrame * CFrame.new(5, 0, 0)
            break
        end
    end
    if not HaveBooth then
        HRP.CFrame = BoothSpawns.Table.CFrame * CFrame.new(5, 0, 0)
        ReplicatedStorage.Network.Booths_ClaimBooth:InvokeServer(tostring(BoothSpawns:GetAttribute("ID")))
    end
    
    -- Get Items To Do (Custom Goes First Class Last)
    local ItemsToProcess = {}
    for _, ItemToSell in ipairs(Config.ItemsToSell) do
        for uid, Item in pairs(require(ReplicatedStorage.Library.Client.Save).Get()["Inventory"][ItemToSell.Class]) do
            if Item.id == ItemToSell.Item and Item.pt == ItemToSell.Version and Item.sh == ItemToSell.Shiny and Item.tn == ItemToSell.Tier then
                local Rap = math.floor(GetRAP(ItemToSell.Class, {id = Item.id, pt = Item.pt, sh = Item.sh, tn = Item.tn}))
                table.insert(ItemsToProcess, {
                    uid = uid,
                    Item = Item,
                    Rap = Rap,
                    Class = ItemToSell.Class,
                    RapPercentile = ItemToSell.Rap,
                    CustomPrice = ItemToSell.Price
                })
            end
        end
    end
    for _, ClassSell in ipairs(Config.ClassToSell) do
        for uid, Item in pairs(require(ReplicatedStorage.Library.Client.Save).Get()["Inventory"][ClassSell.Class]) do
            local Rap = math.floor(GetRAP(ClassSell.Class, {id = Item.id, pt = Item.pt, sh = Item.sh, tn = Item.tn}))
            if Rap >= ClassSell.MinRap or 1 then
                table.insert(ItemsToProcess, {uid = uid, Item = Item, Rap = Rap, Class = ClassSell.Class, RapPercentile = ClassSell.Rap})
            end
        end
    end
    table.sort(ItemsToProcess, function(a, b) return a.Rap > b.Rap end)
    
    
    for _, Data in ipairs(ItemsToProcess) do
        local uid = Data.uid
        local Item = Data.Item
        local Rap = Data.Rap
        local Class = Data.Class
        local RapPercentile = Data.RapPercentile
        local CustomPrice = Data.CustomPrice or math.floor(Percentile(Rap, RapPercentile)) 
        local Amount = Item._am or 1
        if Amount > 5000 then Amount = 5000 end
        local ExcludeSell = false
        for _, ExcludedItem in ipairs(Config.ExcludeSell) do
            if ExcludedItem.Class == Class and ExcludedItem.Item == Item.id then
                ExcludeSell = true
                break
            end
        end
        if not ExcludeSell then
            pcall(function()
                repeat
                a, e = game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Booths_CreateListing"):InvokeServer(uid, CustomPrice, Amount) task.wait(0.5)
                until a or e == "You don't have enough of that item!"
                if a then
                    print("Listing created for item:", Item.id, "with price:", CustomPrice)
                end
            end)
        end
        task.wait(1)
    end
    
    while task.wait(1) do
        if math.floor(os.clock() - osclock) >= Config.ServerHop_Time then
            ServerHop()
        end
    end
