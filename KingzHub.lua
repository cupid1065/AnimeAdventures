-- KingzHub by cupid1065

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

-- GUI Container
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KingzHub"

-- Toggle Button
local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 80, 0, 30)
toggleBtn.Position = UDim2.new(0, 20, 0.5, -15)
toggleBtn.Text = "Toggle"
toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 16
toggleBtn.BorderSizePixel = 0
toggleBtn.ZIndex = 5

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 320)
frame.Position = UDim2.new(0.5, -200, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Visible = true

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "KingzHub - Anime Adventures"
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

-- Sections Tabs
local tabs = {
	Main = Instance.new("TextButton"),
	Summon = Instance.new("TextButton")
}

local currentTab = "Main"

for i, tab in pairs(tabs) do
	local btn = tab
	btn.Parent = frame
	btn.Size = UDim2.new(0, 100, 0, 30)
	btn.Position = UDim2.new(0, 10 + (i == "Summon" and 110 or 0), 0, 40)
	btn.Text = i == "Main" and "Main" or "Summon Reroll"
	btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
end

-- Containers
local sections = {
	Main = Instance.new("Frame", frame),
	Summon = Instance.new("Frame", frame)
}

for name, section in pairs(sections) do
	section.Size = UDim2.new(1, -20, 1, -80)
	section.Position = UDim2.new(0, 10, 0, 80)
	section.BackgroundTransparency = 1
	section.Visible = name == "Main"
end

-- Tabs Logic
for name, tab in pairs(tabs) do
	tab.MouseButton1Click:Connect(function()
		for i, sec in pairs(sections) do
			sec.Visible = false
		end
		sections[name].Visible = true
	end)
end

-- =====================
-- ▶ MAIN SECTION
-- =====================

local main = sections.Main

local instructions = Instance.new("TextLabel", main)
instructions.Size = UDim2.new(1, 0, 0, 80)
instructions.Text = "1. Enable Rollback\n2. Spin Traits\n3. Keep Rollback ON while clicking Rejoin\n4. Disable Rollback if happy"
instructions.BackgroundTransparency = 1
instructions.TextColor3 = Color3.fromRGB(255, 255, 255)
instructions.Font = Enum.Font.Gotham
instructions.TextSize = 14
instructions.TextYAlignment = Enum.TextYAlignment.Top

-- Rollback + Rejoin
local rollbackBtn = Instance.new("TextButton", main)
rollbackBtn.Text = "Enable Rollback"
rollbackBtn.Size = UDim2.new(0.45, 0, 0, 30)
rollbackBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
rollbackBtn.Font = Enum.Font.GothamBold
rollbackBtn.TextSize = 16
rollbackBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
rollbackBtn.TextColor3 = Color3.new(1,1,1)

local rejoinBtn = Instance.new("TextButton", main)
rejoinBtn.Text = "Rejoin Server"
rejoinBtn.Size = UDim2.new(0.45, 0, 0, 30)
rejoinBtn.Position = UDim2.new(0.5, 0, 0.35, 0)
rejoinBtn.Font = Enum.Font.GothamBold
rejoinBtn.TextSize = 16
rejoinBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
rejoinBtn.TextColor3 = Color3.new(1,1,1)

-- Trait Visual Reroll Count
local rerollLabel = Instance.new("TextLabel", main)
rerollLabel.Text = "Change Trait Rerolls (Client-Sided Only):"
rerollLabel.Size = UDim2.new(1, 0, 0, 20)
rerollLabel.Position = UDim2.new(0, 0, 0.55, 0)
rerollLabel.BackgroundTransparency = 1
rerollLabel.TextColor3 = Color3.new(1,1,1)
rerollLabel.Font = Enum.Font.Gotham
rerollLabel.TextSize = 13

local rerollBox = Instance.new("TextBox", main)
rerollBox.PlaceholderText = "Enter reroll count"
rerollBox.Size = UDim2.new(0.9, 0, 0, 30)
rerollBox.Position = UDim2.new(0.05, 0, 0.62, 0)
rerollBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
rerollBox.TextColor3 = Color3.new(1,1,1)
rerollBox.Font = Enum.Font.Gotham
rerollBox.TextSize = 14

local fakeDisplay = Instance.new("TextLabel", main)
fakeDisplay.Text = "Fake Rerolls: 0"
fakeDisplay.Size = UDim2.new(1, 0, 0, 20)
fakeDisplay.Position = UDim2.new(0, 0, 0.8, 0)
fakeDisplay.BackgroundTransparency = 1
fakeDisplay.TextColor3 = Color3.new(1, 1, 1)
fakeDisplay.Font = Enum.Font.Gotham
fakeDisplay.TextSize = 14

-- Rollback Logic
local rollbackEnabled = false

rollbackBtn.MouseButton1Click:Connect(function()
	rollbackEnabled = not rollbackEnabled
	if rollbackEnabled then
		rollbackBtn.Text = "Disable Rollback"
		rollbackBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 100)
	else
		rollbackBtn.Text = "Enable Rollback"
		rollbackBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
	end
end)

rejoinBtn.MouseButton1Click:Connect(function()
	if rollbackEnabled then
		TeleportService:Teleport(game.PlaceId, player)
	else
		warn("Enable rollback before rejoining.")
	end
end)

rerollBox.FocusLost:Connect(function()
	local count = tonumber(rerollBox.Text)
	fakeDisplay.Text = "Fake Rerolls: " .. (count or 0)
end)

-- =====================
-- ▶ SUMMON SECTION
-- =====================

local summon = sections.Summon

local comingSoon = Instance.new("TextLabel", summon)
comingSoon.Text = "Summon reroll tools coming soon..."
comingSoon.Size = UDim2.new(1, 0, 1, 0)
comingSoon.BackgroundTransparency = 1
comingSoon.TextColor3 = Color3.new(1,1,1)
comingSoon.Font = Enum.Font.Gotham
comingSoon.TextSize = 16

-- =====================
-- ▶ Code Level Bypass
-- =====================
pcall(function()
	local hud = player.PlayerGui:WaitForChild("Hud", 5)
	if hud and hud:FindFirstChild("Level") then
		hud.Level.Text = "999"
	end
end)

-- Toggle Button Logic
toggleBtn.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

print("✅ KingzHub Loaded Successfully!")
