repeat task.wait() until game:IsLoaded()
    
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

local RepStor = game:GetService("ReplicatedStorage")
local Network = RepStor.Network
local inventoryKey = "Inventory"
local saveMod = require(RepStor.Library.Client.Save)
local saveFile = saveMod.Get(game.Players.LocalPlayer)

local giftBagOpen = Network:WaitForChild("GiftBag_Open")  

while task.wait() do
        local itemsToOpen = {}  
        
        for _, item in pairs(saveFile[inventoryKey].Misc) do
            if item.id == "Mini Chest" or item.id == "Large Gift Bag" or item.id == "Gift Bag" or item.id == "Bundle O' Fruit" or item.id == "Seed Bag" then
                local num = item._am or 0
                if num > 0 then
                    itemsToOpen[item.id] = num 
                end
            end
        end
        
        
        for itemId, num in pairs(itemsToOpen) do
            task.spawn(function()
                for _ = 1, num do
                    giftBagOpen:InvokeServer(itemId)
                end
            end)
        end
    end
