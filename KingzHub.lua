-- KingzHub by cupid1065

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- GUI Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KingzHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 370, 0, 270)
frame.Position = UDim2.new(0.5, -185, 0.5, -135)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.AnchorPoint = Vector2.new(0.5, 0.5)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "KingzHub - Trait & Code Bypass"
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local instructions = Instance.new("TextLabel", frame)
instructions.Size = UDim2.new(1, -20, 0, 80)
instructions.Position = UDim2.new(0, 10, 0, 40)
instructions.Text = "1. Enable Rollback\n2. Spin Traits\n3. Keep Rollback ON while clicking Rejoin if bad\n4. Disable Rollback if good"
instructions.BackgroundTransparency = 1
instructions.TextColor3 = Color3.fromRGB(255, 255, 255)
instructions.Font = Enum.Font.Gotham
instructions.TextSize = 14
instructions.TextYAlignment = Enum.TextYAlignment.Top

-- Rollback Button
local rollbackBtn = Instance.new("TextButton", frame)
rollbackBtn.Text = "Enable Rollback"
rollbackBtn.Size = UDim2.new(0.45, 0, 0, 30)
rollbackBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
rollbackBtn.Font = Enum.Font.GothamBold
rollbackBtn.TextSize = 16
rollbackBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
rollbackBtn.TextColor3 = Color3.new(1,1,1)
rollbackBtn.BorderSizePixel = 0

-- Rejoin Button
local rejoinBtn = Instance.new("TextButton", frame)
rejoinBtn.Text = "Rejoin Server"
rejoinBtn.Size = UDim2.new(0.45, 0, 0, 30)
rejoinBtn.Position = UDim2.new(0.5, 0, 0.6, 0)
rejoinBtn.Font = Enum.Font.GothamBold
rejoinBtn.TextSize = 16
rejoinBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
rejoinBtn.TextColor3 = Color3.new(1,1,1)
rejoinBtn.BorderSizePixel = 0

-- Fake Reroll Count
local rerollLabel = Instance.new("TextLabel", frame)
rerollLabel.Text = "Change Trait Rerolls (Client-Sided Only):"
rerollLabel.Size = UDim2.new(1, -20, 0, 20)
rerollLabel.Position = UDim2.new(0, 10, 0.75, 0)
rerollLabel.BackgroundTransparency = 1
rerollLabel.TextColor3 = Color3.new(1,1,1)
rerollLabel.Font = Enum.Font.Gotham
rerollLabel.TextSize = 13
rerollLabel.TextXAlignment = Enum.TextXAlignment.Left

local rerollBox = Instance.new("TextBox", frame)
rerollBox.PlaceholderText = "Enter reroll count"
rerollBox.Size = UDim2.new(0.9, 0, 0, 30)
rerollBox.Position = UDim2.new(0.05, 0, 0.83, 0)
rerollBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
rerollBox.TextColor3 = Color3.new(1,1,1)
rerollBox.Font = Enum.Font.Gotham
rerollBox.TextSize = 14

-- Simulated Reroll Display
local fakeDisplay = Instance.new("TextLabel", frame)
fakeDisplay.Text = "Fake Rerolls: 0"
fakeDisplay.Size = UDim2.new(1, -20, 0, 20)
fakeDisplay.Position = UDim2.new(0, 10, 0.93, 0)
fakeDisplay.BackgroundTransparency = 1
fakeDisplay.TextColor3 = Color3.new(1, 1, 1)
fakeDisplay.Font = Enum.Font.Gotham
fakeDisplay.TextSize = 14
fakeDisplay.TextXAlignment = Enum.TextXAlignment.Left

-- Rollback Logic
local rollbackEnabled = false

rollbackBtn.MouseButton1Click:Connect(function()
	rollbackEnabled = not rollbackEnabled
	if rollbackEnabled then
		rollbackBtn.Text = "Disable Rollback"
		rollbackBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 100)
		print("Rollback ENABLED (simulated save)")
	else
		rollbackBtn.Text = "Enable Rollback"
		rollbackBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
		print("Rollback DISABLED")
	end
end)

rejoinBtn.MouseButton1Click:Connect(function()
	if rollbackEnabled then
		TeleportService:Teleport(game.PlaceId, player)
	else
		warn("Enable rollback before rejoining.")
	end
end)

-- Visual Reroll Count Changer
rerollBox.FocusLost:Connect(function()
	local count = tonumber(rerollBox.Text)
	if count then
		fakeDisplay.Text = "Fake Rerolls: " .. count
	else
		fakeDisplay.Text = "Fake Rerolls: 0"
	end
end)

-- Auto Code Level Bypass
pcall(function()
	local oldLevel = player.PlayerGui:WaitForChild("Hud"):FindFirstChild("Level")
	if oldLevel then
		oldLevel.Text = "999"
	end
end)

print("KingzHub Loaded Successfully.")

