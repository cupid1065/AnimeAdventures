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
    tabButton.Font = Enum.Font.Gotham
    tabButton.TextSize = 16
    tabButton.TextStrokeTransparency = 0.8
    tabButton.Parent = tabFrame
    return tabButton
end

local tab1Button = createTabButton("Tab 1", UDim2.new(0, 0, 0, 0))
local tab2Button = createTabButton("Tab 2", UDim2.new(0, 100, 0, 0))
local tab3Button = createTabButton("Tab 3", UDim2.new(0, 200, 0, 0))

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -70)
contentFrame.Position = UDim2.new(0, 0, 0, 70)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = frame

-- Tab Content
local tab1Content = Instance.new("TextLabel")
tab1Content.Size = UDim2.new(1, 0, 1, 0)
tab1Content.BackgroundTransparency = 1
tab1Content.Text = "This is Tab 1"
tab1Content.TextColor3 = Color3.fromRGB(255, 255, 255)
tab1Content.Font = Enum.Font.Gotham
tab1Content.TextSize = 18
tab1Content.TextStrokeTransparency = 0.8
tab1Content.Parent = contentFrame

local tab2Content = tab1Content:Clone()
tab2Content.Text = "This is Tab 2"
tab2Content.Parent = contentFrame
tab2Content.Visible = false

local tab3Content = tab1Content:Clone()
tab3Content.Text = "This is Tab 3"
tab3Content.Parent = contentFrame
tab3Content.Visible = false

-- Switch Tabs
local function switchTab(tabNumber)
    if tabNumber == 1 then
        tab1Content.Visible = true
        tab2Content.Visible = false
        tab3Content.Visible = false
    elseif tabNumber == 2 then
        tab1Content.Visible = false
        tab2Content.Visible = true
        tab3Content.Visible = false
    elseif tabNumber == 3 then
        tab1Content.Visible = false
        tab2Content.Visible = false
        tab3Content.Visible = true
    end
end

tab1Button.MouseButton1Click:Connect(function()
    switchTab(1)
end)

tab2Button.MouseButton1Click:Connect(function()
    switchTab(2)
end)

tab3Button.MouseButton1Click:Connect(function()
    switchTab(3)
end)
