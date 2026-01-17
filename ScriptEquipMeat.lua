local ServerStorage = game:GetService("ServerStorage")
local taw = script.Parent

local meat1 = "meet1"
local plant = "plant"

local prompt = Instance.new("ProximityPrompt")
prompt.Parent = taw
prompt.ActionText = "วาง"
prompt.ObjectText = "หม้อ"
prompt.HoldDuration = 0.5

local nofood = nil
prompt.Triggered:Connect(function(player)
	if nofood ~= nil then
		local cooked = ServerStorage.FindFirstChild(plant)
		if cooked then
			local toolcooked = cooked:Clone()
			toolcooked.Parent = player.Backpack
			
			local human = player.Character:FindFirstChild("Humanoid")
			if human then human:EquipTool(cooked) end
			
			nofood:Destroy()
			nofood = nil
			prompt.ActionText = "ว่าง"
		end
		return
	end
	
	local meat1 = player.Character:FindFirstChild(meat1)
	if meat1 then
		local handle = meat1:FindFirstChild("Handle")
		if handle then
			local OnStove = handle:Clone()
			OnStove.Parent = workspace
			OnStove.CFrame = taw.CFrame * CFrame.new(0, 0.5, 0)
			OnStove.Anchored = true
			OnStove.CanCollide = false
			
			meat1:Destroy()
			nofood = OnStove
			prompt.Enabled = false
			task.wait(5)
			if nofood then nofood.Destroy() end
			local cooked1 = ServerStorage:FindFirstChild(plant)
			if cooked1 then
				local cookedPart = cooked1:Clone()
				cookedPart.Parent = workspace
				cookedPart.CFrame = taw.CFrame * CFrame.new(0, 0.5, 0)
				cookedPart.Anchored = true
				cookedPart.CanCollide = false
				
				nofood = cookedPart
			end
			prompt.Enabled = true
			prompt.ActionText = "หยิบ"
		end
	end
end)
