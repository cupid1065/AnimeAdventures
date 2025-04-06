-- Creating GUI Elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Loading Frame
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
loadingFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingFrame.BackgroundTransparency = 0.5
loadingFrame.Parent = screenGui

-- Loading Text
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0.2, 0)
loadingText.Position = UDim2.new(0, 0, 0.4, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading..."
loadingText.TextSize = 30
loadingText.TextColor3 = Color3.fromRGB(0, 0, 0)
loadingText.TextStrokeTransparency = 0.8
loadingText.Parent = loadingFrame

-- Add custom logo to loading screen
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0.4, 0, 0.4, 0)
logo.Position = UDim2.new(0.3, 0, 0.2, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://file_000000003e605230bb9f10d503f59045"  -- Replace with actual asset ID of the logo
logo.Parent = loadingFrame

-- Game Detection Function
local function detectGame()
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    if gameName == "Anime Adventures" then
        print("Detected Anime Adventures")
        -- Replace loading screen with Anime Adventures GUI
        loadingText.Text = "Loading Anime Adventures Script..."
        -- Call your Anime Adventures specific functions here
        animeAdventuresRollback()
        traitReroll()
    elseif gameName == "Blue Lock Rivals" then
        print("Detected Blue Lock Rivals")
        -- Replace loading screen with Blue Lock Rivals GUI
        loadingText.Text = "Loading Blue Lock Rivals Script..."
        -- Call your Blue Lock Rivals specific functions here
        blueLockRivalsRollback()
    else
        loadingText.Text = "Game Not Detected"
        print("Game Not Detected")
    end
end

-- Hide Loading GUI once game is detected
local function hideLoadingGUI()
    loadingFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1, true)
    wait(1)  -- Wait for the animation to finish
    screenGui:Destroy()  -- Destroy the loading screen GUI after it's hidden
end

-- Trigger the detection and hiding of loading screen after game is loaded
detectGame()
wait(3)  -- Wait 3 seconds to simulate loading
hideLoadingGUI()  -- Hide loading screen after loading

-- --- Anime Adventures Functions ---
-- Rollback function for Anime Adventures
local function animeAdventuresRollback()
    -- Add your rollback code here
    -- Example: Rollback code for trait reroll or other actions
end

-- Trait Reroll function for Anime Adventures
local function traitReroll()
    local args = {
        [1] = "{906b0464-73a4-45ce-8e0e-9ee68debf4d0}";
    }

    game:GetService("ReplicatedStorage"):WaitForChild("endpoints", 9e9):WaitForChild("client_to_server", 9e9):WaitForChild("request_token_trait_reroll", 9e9):InvokeServer(unpack(args))
end

-- --- Blue Lock Rivals Functions ---
-- Rollback function for Blue Lock Rivals
local function blueLockRivalsRollback()
    -- Example: Blue Lock Rivals rollback code here
    -- Add rollback or other game-specific functions
end
