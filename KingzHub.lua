-- KingzHub Script (Keyless Version)

-- UI Library and Functions
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local inputBox = Instance.new("TextBox")
local fpsCapInput = Instance.new("TextBox")
local styleInput = Instance.new("TextBox")
local toggleButton = Instance.new("TextButton")
local traitRerollToggle = Instance.new("TextButton")
local visualStyleButton = Instance.new("TextButton")
local loadingScreen = Instance.new("Frame")
local loadingText = Instance.new("TextLabel")

gui.Name = "KingzHub"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame Setup (Modern Style)
mainFrame.Name = "MainFrame"
mainFrame.Parent = gui
mainFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28) -- Dark background for modern look
mainFrame.Size = UDim2.new(0, 500, 0, 350)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Title Setup
titleLabel.Name = "Title"
titleLabel.Parent = mainFrame
titleLabel.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "KingzHub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
titleLabel.TextSize = 30
titleLabel.TextAlignment = Enum.TextAlignment.Center
titleLabel.Font = Enum.Font.GothamBold

-- Draggable Feature
mainFrame.Active = true
mainFrame.Draggable = true

-- Keyless UI Input Setup (For FPS Cap and Visual Style Change)
fpsCapInput.Name = "FpsCapInput"
fpsCapInput.Parent = mainFrame
fpsCapInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)  -- Darker input box
fpsCapInput.Size = UDim2.new(0, 200, 0, 40)
fpsCapInput.Position = UDim2.new(0.5, -100, 0.3, 0)
fpsCapInput.PlaceholderText = "Enter FPS Cap"
fpsCapInput.TextSize = 20
fpsCapInput.Font = Enum.Font.Gotham
fpsCapInput.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text

-- Visual Style Input Box
styleInput.Name = "StyleInput"
styleInput.Parent = mainFrame
styleInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)  -- Darker input box
styleInput.Size = UDim2.new(0, 200, 0, 40)
styleInput.Position = UDim2.new(0.5, -100, 0.4, 0)
styleInput.PlaceholderText = "Enter Visual Style"
styleInput.TextSize = 20
styleInput.Font = Enum.Font.Gotham
styleInput.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text

-- Toggle Button (For enabling/disabling features)
toggleButton.Name = "ToggleButton"
toggleButton.Parent = mainFrame
toggleButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)  -- Green button
toggleButton.Size = UDim2.new(0, 200, 0, 40)
toggleButton.Position = UDim2.new(0.5, -100, 0.5, 0)
toggleButton.Text = "Enable Features"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
toggleButton.TextSize = 20
toggleButton.Font = Enum.Font.Gotham

-- Trait Reroll Toggle
traitRerollToggle.Name = "TraitRerollToggle"
traitRerollToggle.Parent = mainFrame
traitRerollToggle.BackgroundColor3 = Color3.fromRGB(76, 175, 80)  -- Green button
traitRerollToggle.Size = UDim2.new(0, 200, 0, 40)
traitRerollToggle.Position = UDim2.new(0.5, -100, 0.6, 0)
traitRerollToggle.Text = "Enable Trait Reroll"
traitRerollToggle.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
traitRerollToggle.TextSize = 20
traitRerollToggle.Font = Enum.Font.Gotham

-- Visual Style Button
visualStyleButton.Name = "VisualStyleButton"
visualStyleButton.Parent = mainFrame
visualStyleButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)  -- Green button
visualStyleButton.Size = UDim2.new(0, 200, 0, 40)
visualStyleButton.Position = UDim2.new(0.5, -100, 0.7, 0)
visualStyleButton.Text = "Change Visuals"
visualStyleButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
visualStyleButton.TextSize = 20
visualStyleButton.Font = Enum.Font.Gotham

-- Loading Screen Setup
loadingScreen.Name = "LoadingScreen"
loadingScreen.Parent = gui
loadingScreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingScreen.Size = UDim2.new(1, 0, 1, 0)
loadingScreen.Visible = true

loadingText.Name = "LoadingText"
loadingText.Parent = loadingScreen
loadingText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingText.Size = UDim2.new(1, 0, 0, 50)
loadingText.Position = UDim2.new(0, 0, 0.5, -25)
loadingText.Text = "Loading..."
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
loadingText.TextSize = 30
loadingText.TextAlignment = Enum.TextAlignment.Center
loadingText.Font = Enum.Font.Gotham

-- Functions to Update UI Elements
toggleButton.MouseButton1Click:Connect(function()
    print("Features Enabled")
    -- Add specific feature logic here, like activating reroll
end)

traitRerollToggle.MouseButton1Click:Connect(function()
    print("Trait Reroll Enabled")
    -- Add trait reroll functionality here
end)

visualStyleButton.MouseButton1Click:Connect(function()
    local visualStyle = styleInput.Text
    print("Changing Visuals to: " .. visualStyle)
    -- Apply visuals based on input (Spin, Flow, Lucky, Normal, Money styles)
end)

fpsCapInput.FocusLost:Connect(function()
    local fpsCap = tonumber(fpsCapInput.Text)
    if fpsCap then
        print("FPS Cap set to: " .. fpsCap)
        -- Apply FPS cap logic
    else
        print("Invalid FPS Cap")
    end
end)

-- Hide loading screen after 3 seconds
wait(3)
loadingScreen.Visible = false
mainFrame.Visible = true
