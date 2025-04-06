-- KingzHub Final UI (Keyless)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Main GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KingzHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = game.CoreGui

-- Key System Frame
local keyFrame = Instance.new("Frame")
keyFrame.Name = "KeyFrame"
keyFrame.Size = UDim2.new(0, 300, 0, 150)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
keyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyFrame.BorderSizePixel = 0
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.Parent = gui

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 200, 0, 50)
keyBox.Position = UDim2.new(0.5, -100, 0.5, -25)
keyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextSize = 20
keyBox.PlaceholderText = "Enter Key"
keyBox.Parent = keyFrame

local keyButton = Instance.new("TextButton")
keyButton.Size = UDim2.new(0, 100, 0, 50)
keyButton.Position = UDim2.new(0.5, -50, 0.5, 35)
keyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
keyButton.Text = "Submit"
keyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
keyButton.TextSize = 20
keyButton.Parent = keyFrame

keyButton.MouseButton1Click:Connect(function()
    if keyBox.Text == "king" then
        keyFrame.Visible = false
        -- Show the main GUI
        frame.Visible = true
    else
        keyBox.Text = "Invalid Key"
    end
end)

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.5, -250, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark gray background
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Active = true
frame.Draggable = true
frame.Parent = gui
frame.Visible = false

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.Text = "KingzHub"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 24
title.Font = Enum.Font.SourceSans
title.TextStrokeTransparency = 0.8
title.TextXAlignment = Enum.TextXAlignment.Center
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
mainContent.TextXAlignment = Enum.TextXAlignment.Center
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

-- Modernize GUI
local function modernizeGui()
    -- Example modernizations: rounded corners, drop shadows, etc.
    local function addUICorner(instance, radius)
        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, radius)
        uiCorner.Parent = instance
    end

    local function addUIStroke(instance, color, thickness)
        local uiStroke = Instance.new("UIStroke")
        uiStroke.Color = color
        uiStroke.Thickness = thickness
        uiStroke.Parent = instance
    end

    local function addUIPadding(instance, padding)
        local uiPadding = Instance.new("UIPadding")
        uiPadding.PaddingTop = UDim.new(0, padding)
        uiPadding.PaddingBottom = UDim.new(0, padding)
        uiPadding.PaddingLeft = UDim.new(0, padding)
        uiPadding.PaddingRight = UDim.new(0, padding)
        uiPadding.Parent = instance
    end

    -- Apply modernizations
    addUICorner(frame, 10)
    addUICorner(tabFrame, 10)
    addUICorner(contentFrame, 10)
    addUICorner(keyFrame, 10)
    addUICorner(keyBox, 10)
    addUICorner(keyButton, 10)
    addUICorner(rollbackButton, 10)

    addUIStroke(frame, Color3.fromRGB(255, 255, 255), 2)
    addUIStroke(tabFrame, Color3.fromRGB(255, 255, 255), 2)
    addUIStroke(contentFrame, Color3.fromRGB(255, 255, 255), 2)
    addUIStroke(keyFrame, Color3.fromRGB(255, 255, 255), 2)
    addUIStroke(keyBox, Color3.fromRGB(255, 255, 255), 2)
    addUIStroke(keyButton, Color3.fromRGB(255, 255, 255), 2)
    addUIStroke(rollbackButton, Color3.fromRGB(255, 255, 255), 2)

    addUIPadding(frame, 10)
    addUIPadding(tabFrame, 5)
    addUIPadding(contentFrame, 10)
    addUIPadding(keyFrame, 10)
    addUIPadding(keyBox, 5)
    addUIPadding(keyButton, 5)
    addUIPadding(rollbackButton, 5)
end

modernizeGui()
