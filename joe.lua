require(game:GetService("ReplicatedStorage").Library.Client.Network)
local Fire, Invoke = Network.Fire, Network.Invoke

local old = hookfunction(getupvalue(Fire, 1), function(...)
  return true
end)