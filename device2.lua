task.wait(10)
script_key = "nhQqKQFPCgWXPyePFwvWEzgciclDxYYB";
getgenv().LoadSettings = [[{"Inventory":{"Potions":{"Level":9,"Potion":["Coins","Lucky","The Cocktail","Huge","Damage"],"Use":true},"RandomEvents":{"Event":"","Use":false},"Spawnables":{"Item":"","Use":false},"GiftBags":{"Gifts":[],"Use":false},"Fruits":{"Use":true,"Fruit":["Watermelon","Candycane","Apple","Rainbow","Pineapple","Orange","Banana"]},"Flags":{"Flag":"Coins Flag","Use":true}},"Farming":{"Flags":{"Flag":"Shiny Flag","Use":false},"ZoneMovement":false,"UseTNT":false,"Zone":"0 - Best Unlocked","Start":true,"Ultimate":true,"MovementMode":"Teleporting","PetsPerBreakable":3},"UIScale":0.9,"Optimization":{"HatchAnim":true,"Teleports":true,"Drops":true,"Breakables":false,"SkipSpin":true,"Wheels":true,"Merchants":true,"PetSpeed":true,"Machines":true,"Items":true,"Scripts":true,"Confetti":true,"Pets":true,"Startup":{"Instance":"","autoJoin":false},"World":false},"Machines":{"Golden":false,"Rainbow":false,"Method":"All Available Pets","Fuse":false},"World":{"Instances":{"Millionaire":{"Run":false,"MaxPercent":80,"MaxRoom":20}},"AutoWorld":false,"CollectRelics":false,"BuyUpgrades":false},"LoadSettings":true,"Hatching":{"Egg":"0 - Best Unlocked","MailUser":"Enter your Username.","Webhook":"Enter your Webhook Url.","Amount":0,"Start":true,"HugeNotif":false,"MailStart":false}}]]
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/23521cea1cff5c0e428954401f395af3.lua"))()
task.wait(3)
if not game:IsLoaded() then game.Loaded:Wait() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer.Character
repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage.Library

local Webhook = "https://discord.com/api/webhooks/1259359059551977483/P-XqQtNQ0Zh84_pLuL0Yg2y988vC_Oy6ZP7ZDxcXTPeikp-4QEvlawVSuu9blPQIqAlR"

task.wait(15)

for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

local Senv = {
    Save = getsenv(game.ReplicatedStorage.Library:FindFirstChild("Save", true)),
}

local Upvalues = {
    Save = getupvalue(Senv.Save.Update, 1),
}

local Player = game.Players.LocalPlayer

local Inventory = {
    Pets = {}
}
function make_inventory()
    local Current_Inv = Upvalues.Save[Player].Inventory.Pet

    for i,v in Current_Inv do
        if v._am then
            Inventory.Pets[i] = v._am
        elseif Inventory.Pets[i] then
             Inventory.Pets[i] += 1
        else
            Inventory.Pets[i] = 1
        end
    end
end
make_inventory()

function get_inventory()
    local Current_Inv = Upvalues.Save[Player].Inventory.Pet
    local Sorted_Inv = {}

    for i,v in Current_Inv do
        if v._am then
            Sorted_Inv[i] = v._am
        elseif Sorted_Inv[i] then
             Sorted_Inv[i] += 1
        else
            Sorted_Inv[i] = 1
        end
    end
    return Sorted_Inv
end

function check_inventory()
    local Current_Inv = get_inventory()
    local New_Pets = {}

    for i,v in Current_Inv do
        if not Inventory.Pets[i] then
            local current_invetory = Upvalues.Save[Player].Inventory.Pet
            local Name = (current_invetory[i].sh == true and "Shiny " or "")..(current_invetory[i].pt == 1 and "Golden " or current_invetory[i].pt == 2 and "Rainbow " or "")..Upvalues.Save[Player].Inventory.Pet[i].id
            New_Pets[Name] = Upvalues.Save[Player].Inventory.Pet[i].id
        end
    end

    return New_Pets
end

function SendWebhookLog(Table, WebhookUrl)
    local Body = game:GetService("HttpService"):JSONEncode(Table)
    local req = request or http.request
    if req ~= nil then
        local Result = req({
            Url = WebhookUrl, 
            Method = "POST",
            Headers = {
                ['Content-Type'] = "application/json"
            },
            Body = Body;
        })

        return Result
    end
end

while task.wait(5) do
    for i,v in check_inventory() do
        if string.find(i, "Huge") then
            local image_id = nil

            for _,Pet in game:GetService("ReplicatedStorage").__DIRECTORY.Pets:GetDescendants() do
                if Pet.Name == v then
                    if string.find(i, "Golden ") then
                        image_id = string.gsub(require(Pet).goldenThumbnail, "%D", "")
                    else
                        image_id = string.gsub(require(Pet).thumbnail, "%D", "")
                    end
                end
            end
            SendWebhookLog({
                content = "",
                embeds = {
                    {
                        ["title"] = "Obtained a ".. i,
                        ["color"] = 16771840,
                        ["thumbnail"] = {
                            ["url"] = "https://biggamesapi.io/image/"..image_id
                        }
                    }
                }
            }, Webhook) -- Privat Server
            make_inventory()
        end
    end
end
