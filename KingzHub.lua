-- KingzHub (Keyless Version)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Create Main ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "KingzHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui

-- Center Function
local function centerGui(guiElement)
	local screenSize = gui.AbsoluteSize
	local guiSize = guiElement.AbsoluteSize
	guiElement.Position = UDim2.new(0.5, -guiSize.X.Offset/2, 0.5, -guiSize.Y.Offset/2)
end

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 500, 0, 350)
frame.Position = UDim2.new(0.5, -250, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Center the GUI
centerGui(frame)

-- Drag Functionality
local dragBar = Instance.new("TextLabel")
dragBar.Text = "🇰 🇮 🇳 🇬 🇿 🇭 🇺 🇧"
dragBar.Size = UDim2.new(1, 0, 0, 35)
dragBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
dragBar.TextColor3 = Color3.fromRGB(255, 255, 255)
dragBar.Font = Enum.Font.GothamBlack
dragBar.TextSize = 20
dragBar.Parent = frame
dragBar.Active = true
dragBar.Draggable = true

-- FPS Cap Input
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Text = "FPS Cap:"
fpsLabel.Font = Enum.Font.Gotham
fpsLabel.TextSize = 16
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.Size = UDim2.new(0, 100, 0, 25)
fpsLabel.Position = UDim2.new(0, 10, 0, 50)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Parent = frame

local fpsInput = Instance.new("TextBox")
fpsInput.Size = UDim2.new(0, 100, 0, 25)
fpsInput.Position = UDim2.new(0, 110, 0, 50)
fpsInput.Text = "60"
fpsInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
fpsInput.TextColor3 = Color3.new(1, 1, 1)
fpsInput.Font = Enum.Font.GothamBold
fpsInput.TextSize = 14
fpsInput.ClearTextOnFocus = false
fpsInput.Parent = frame

fpsInput.FocusLost:Connect(function()
	local fps = tonumber(fpsInput.Text)
	if fps then
		setfpscap(fps)
	end
end)

-- Trait Reroll Toggle
local rerollLabel = Instance.new("TextLabel")
rerollLabel.Text = "Trait Reroll Enabled:"
rerollLabel.Font = Enum.Font.Gotham
rerollLabel.TextSize = 16
rerollLabel.TextColor3 = Color3.new(1, 1, 1)
rerollLabel.Size = UDim2.new(0, 180, 0, 25)
rerollLabel.Position = UDim2.new(0, 10, 0, 90)
rerollLabel.BackgroundTransparency = 1
rerollLabel.Parent = frame

local rerollToggle = Instance.new("TextButton")
rerollToggle.Text = "OFF"
rerollToggle.Size = UDim2.new(0, 50, 0, 25)
rerollToggle.Position = UDim2.new(0, 200, 0, 90)
rerollToggle.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
rerollToggle.TextColor3 = Color3.new(1, 1, 1)
rerollToggle.Font = Enum.Font.GothamBold
rerollToggle.TextSize = 14
rerollToggle.Parent = frame

local rerollEnabled = false
rerollToggle.MouseButton1Click:Connect(function()
	rerollEnabled = not rerollEnabled
	rerollToggle.Text = rerollEnabled and "ON" or "OFF"
	rerollToggle.BackgroundColor3 = rerollEnabled and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
end)

-- Visual Style Input
local visualLabel = Instance.new("TextLabel")
visualLabel.Text = "Visual Style:"
visualLabel.Font = Enum.Font.Gotham
visualLabel.TextSize = 16
visualLabel.TextColor3 = Color3.new(1, 1, 1)
visualLabel.Size = UDim2.new(0, 120, 0, 25)
visualLabel.Position = UDim2.new(0, 10, 0, 130)
visualLabel.BackgroundTransparency = 1
visualLabel.Parent = frame

local visualInput = Instance.new("TextBox")
visualInput.Size = UDim2.new(0, 120, 0, 25)
visualInput.Position = UDim2.new(0, 130, 0, 130)
visualInput.Text = "normal"
visualInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
visualInput.TextColor3 = Color3.new(1, 1, 1)
visualInput.Font = Enum.Font.GothamBold
visualInput.TextSize = 14
visualInput.ClearTextOnFocus = false
visualInput.Parent = frame

-- Detected Game Label
local gameLabel = Instance.new("TextLabel")
gameLabel.Text = "Detecting Game..."
gameLabel.Font = Enum.Font.Gotham
gameLabel.TextSize = 14
gameLabel.TextColor3 = Color3.new(1, 1, 1)
gameLabel.Size = UDim2.new(1, -10, 0, 25)
gameLabel.Position = UDim2.new(0, 5, 1, -30)
gameLabel.BackgroundTransparency = 1
gameLabel.TextXAlignment = Enum.TextXAlignment.Right
gameLabel.Parent = frame

-- Game Detection Logic
local placeId = game.PlaceId
if placeId == 117965110267191 then
	gameLabel.Text = "Game Detected: Anime Adventures"
elseif placeId == 18668065416 then
	gameLabel.Text = "Game Detected: Blue Lock Rivals"
else
	gameLabel.Text = "Game Not Detected"
end

-- More features can be added below here
