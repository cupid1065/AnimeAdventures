-- KingzHub Final UI (Keyless)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Main GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KingzHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.5, -250, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Not pure black
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.Text = "🇰 🇮 🇳 🇬 🇿 🇭 🇺 🇧"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 24
title.Font = Enum.Font.GothamBlack
title.TextStrokeTransparency = 0.8
title.Parent = frame

-- FPS Label
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Text = "FPS Cap:"
fpsLabel.Size = UDim2.new(0, 100, 0, 25)
fpsLabel.Position = UDim2.new(0, 20, 0, 60)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.Font = Enum.Font.Gotham
fpsLabel.TextSize = 16
fpsLabel.Parent = frame

-- FPS Input
local fpsInput = Instance.new("TextBox")
fpsInput.Size = UDim2.new(0, 80, 0, 25)
fpsInput.Position = UDim2.new(0, 130, 0, 60)
fpsInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
fpsInput.TextColor3 = Color3.new(1, 1, 1)
fpsInput.Font = Enum.Font.GothamBold
fpsInput.TextSize = 14
fpsInput.Text = "60"
fpsInput.ClearTextOnFocus = false
fpsInput.Parent = frame

fpsInput.FocusLost:Connect(function()
	local cap = tonumber(fpsInput.Text)
	if cap then
		setfpscap(cap)
	end
end)

-- Reroll Toggle
local rerollLabel = Instance.new("TextLabel")
rerollLabel.Text = "Trait Reroll:"
rerollLabel.Size = UDim2.new(0, 120, 0, 25)
rerollLabel.Position = UDim2.new(0, 20, 0, 100)
rerollLabel.BackgroundTransparency = 1
rerollLabel.TextColor3 = Color3.new(1, 1, 1)
rerollLabel.Font = Enum.Font.Gotham
rerollLabel.TextSize = 16
rerollLabel.Parent = frame

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 80, 0, 25)
toggle.Position = UDim2.new(0, 130, 0, 100)
toggle.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
toggle.Text = "OFF"
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 14
toggle.Parent = frame

local enabled = false
toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	toggle.Text = enabled and "ON" or "OFF"
	toggle.BackgroundColor3 = enabled and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(100, 0, 0)
end)

-- Visual Style Input
local visualLabel = Instance.new("TextLabel")
visualLabel.Text = "Visual Style:"
visualLabel.Size = UDim2.new(0, 120, 0, 25)
visualLabel.Position = UDim2.new(0, 20, 0, 140)
visualLabel.BackgroundTransparency = 1
visualLabel.TextColor3 = Color3.new(1, 1, 1)
visualLabel.Font = Enum.Font.Gotham
visualLabel.TextSize = 16
visualLabel.Parent = frame

local visualInput = Instance.new("TextBox")
visualInput.Size = UDim2.new(0, 120, 0, 25)
visualInput.Position = UDim2.new(0, 130, 0, 140)
visualInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
visualInput.TextColor3 = Color3.new(1, 1, 1)
visualInput.Font = Enum.Font.GothamBold
visualInput.TextSize = 14
visualInput.Text = "normal"
visualInput.ClearTextOnFocus = false
visualInput.Parent = frame

-- Game Detected
local gameLabel = Instance.new("TextLabel")
gameLabel.Size = UDim2.new(1, -10, 0, 25)
gameLabel.Position = UDim2.new(0, 5, 1, -30)
gameLabel.TextColor3 = Color3.new(1, 1, 1)
gameLabel.BackgroundTransparency = 1
gameLabel.TextXAlignment = Enum.TextXAlignment.Right
gameLabel.TextSize = 14
gameLabel.Font = Enum.Font.Gotham
gameLabel.Parent = frame

-- Game Detection
local placeId = game.PlaceId
if placeId == 117965110267191 then
	gameLabel.Text = "Game: Anime Adventures"
elseif placeId == 18668065416 then
	gameLabel.Text = "Game: Blue Lock Rivals"
else
	gameLabel.Text = "Game: Unknown"
end
