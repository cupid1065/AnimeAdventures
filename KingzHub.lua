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
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.Text = "KingzHub"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 24
title.Font = Enum.Font.SourceSans
title.TextStrokeTransparency = 0.8
title.Parent = frame

-- Create Tabs
local tabFrame = Instance.new("Frame")
tabFrame.Name = "TabFrame"
tabFrame.Size = UDim2.new(0, 500, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 40)
tabFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabFrame.BorderSizePixel = 0
tabFrame.Parent = frame

-- Tab Buttons
local function createTabButton(text, position)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, 100, 0, 30)
    tabButton.Position = position
    tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tabButton.Text = text
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Font = Enum.Font.SourceSans
    tabButton.TextSize = 16
    tabButton.TextStrokeTransparency = 0.8
    tabButton.Parent = tabFrame
    return tabButton
end

local miscButton = createTabButton("Misc", UDim2.new(0, 0, 0, 0))
local mainButton = createTabButton("Main", UDim2.new(0, 100, 0, 0))
local settingsButton = createTabButton("Settings", UDim2.new(0, 200, 0, 0))

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -70)
contentFrame.Position = UDim2.new(0, 0, 0, 70)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = frame

-- Main Content
local mainContent = Instance.new("TextLabel")
mainContent.Size = UDim2.new(1, 0, 1, 0)
mainContent.BackgroundTransparency = 1
mainContent.Text = "This is the Main section."
mainContent.TextColor3 = Color3.fromRGB(255, 255, 255)
mainContent.Font = Enum.Font.SourceSans
mainContent.TextSize = 18
mainContent.TextStrokeTransparency = 0.8
mainContent.Parent = contentFrame

-- Misc Content
local miscContent = mainContent:Clone()
miscContent.Text = "This is the Misc section."
miscContent.Parent = contentFrame
miscContent.Visible = false

-- Settings Content
local settingsContent = mainContent:Clone()
settingsContent.Text = "This is the Settings section."
settingsContent.Parent = contentFrame
settingsContent.Visible = false

-- Rollback and Rejoin (Example Functions for Blue Lock Rivals and Anime Adventures)
local function rollbackAnimeAdv()
    print("Rollback triggered for Anime Adventures!")
    -- Add rollback code for Anime Adventures here
end

local function rollbackBlueLockRivals()
    print("Rollback triggered for Blue Lock Rivals!")
    -- Add rollback code for Blue Lock Rivals here
end

-- Button for Rollback (Example for Main Section)
local rollbackButton = Instance.new("TextButton")
rollbackButton.Size = UDim2.new(0, 200, 0, 30)
rollbackButton.Position = UDim2.new(0, 150, 0, 100)
rollbackButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
rollbackButton.Text = "Rollback"
rollbackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rollbackButton.Font = Enum.Font.SourceSans
rollbackButton.TextSize = 18
rollbackButton.Parent = mainContent

rollbackButton.MouseButton1Click:Connect(function()
    if game.PlaceId == 117965110267191 then
        rollbackAnimeAdv()
    elseif game.PlaceId == 18668065416 then
        rollbackBlueLockRivals()
    end
end)

-- Switch Tabs
local function switchTab(tabName)
    if tabName == "Main" then
        mainContent.Visible = true
        miscContent.Visible = false
        settingsContent.Visible = false
    elseif tabName == "Misc" then
        mainContent.Visible = false
        miscContent.Visible = true
        settingsContent.Visible = false
    elseif tabName == "Settings" then
        mainContent.Visible = false
        miscContent.Visible = false
        settingsContent.Visible = true
    end
end

miscButton.MouseButton1Click:Connect(function()
    switchTab("Misc")
end)

mainButton.MouseButton1Click:Connect(function()
    switchTab("Main")
end)

settingsButton.MouseButton1Click:Connect(function()
    switchTab("Settings")
end)
