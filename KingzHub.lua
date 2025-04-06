-- SETTINGS
local KEY = "King"
local allowedGames = {
    [117965110267191] = "Anime Adventures",
    [18668065416] = "Blue Lock Rivals"
}

local gameName = allowedGames[game.PlaceId]

if not gameName then
    warn("⚠️ KingzHub: Unsupported game or undetected!")
    return
end

-- LOADING SCREEN
local loadingGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
loadingGui.Name = "KingzLoading"
local frame = Instance.new("Frame", loadingGui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0

local luffyImage = Instance.new("ImageLabel", frame)
luffyImage.Size = UDim2.new(1, 0, 1, 0)
luffyImage.Image = "rbxassetid://10511856020" -- Luffy image asset ID
luffyImage.BackgroundTransparency = 1

local loadingText = Instance.new("TextLabel", frame)
loadingText.Size = UDim2.new(1, 0, 0.3, 0)
loadingText.Position = UDim2.new(0, 0, 0.7, 0)
loadingText.Text = "Loading " .. gameName .. " Script..."
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.GothamBlack
loadingText.TextScaled = true

task.wait(3)
loadingGui:Destroy()

-- GUI Setup
loadstring(game:HttpGet("https://pastebin.com/raw/YourFinalGuiLinkHere"))()

-- ADD FEATURES
if gameName == "Anime Adventures" then
    loadstring(game:HttpGet("https://pastebin.com/raw/AnimeAdvFeatures"))()
elseif gameName == "Blue Lock Rivals" then
    loadstring(game:HttpGet("https://pastebin.com/raw/BlueLockFeatures"))()
end

-- ANTI-LOG / SPOOF
local mt = getrawmetatable(game)
setreadonly(mt, false)
local oldNamecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "FireServer" or method == "InvokeServer" then
        if tostring(self):lower():find("log") or tostring(self):lower():find("ban") then
            return nil
        end
    end
    return oldNamecall(self, unpack(args))
end)

-- UNDETECTABLE PATCH
local function spoofHumanoidStats()
    local plr = game:GetService("Players").LocalPlayer
    local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp:GetPropertyChangedSignal("Velocity"):Connect(function()
            if math.abs(hrp.Velocity.Y) > 150 then
                hrp.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    end
end

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(spoofHumanoidStats)
if game:GetService("Players").LocalPlayer.Character then
    spoofHumanoidStats()
end

-- GAME-SPECIFIC SCRIPT: Anime Adventures
if gameName == "Anime Adventures" then
    -- Add Anime Adventures-specific functions here
    -- Example of modifying unit damage
    local args = {
        [1] = {
            ["magic"] = {
                ["_secondary_damage_types"] = {
                    ["lightning_damage"] = true;
                };
                ["is_execute"] = false;
                ["is_crit"] = false;
                ["_base_damage_type"] = "magic";
                ["damage"] = 11.417675555101855;
            };
        };
    }
    game:GetService("ReplicatedStorage"):WaitForChild("endpoints", 9e9):WaitForChild("client_to_server", 9e9):WaitForChild("unit_damaged", 9e9):InvokeServer(unpack(args))

    -- Token Trait Reroll
    local rerollArgs = {
        [1] = "{906b0464-73a4-45ce-8e0e-9ee68debf4d0}";
    }
    game:GetService("ReplicatedStorage"):WaitForChild("endpoints", 9e9):WaitForChild("client_to_server", 9e9):WaitForChild("request_token_trait_reroll", 9e9):InvokeServer(unpack(rerollArgs))

    -- Redeem Code Example
    local redeemArgs = {
        [1] = "UPDATESOON5189";
    }
    game:GetService("ReplicatedStorage"):WaitForChild("endpoints", 9e9):WaitForChild("client_to_server", 9e9):WaitForChild("redeem_code", 9e9):InvokeServer(unpack(redeemArgs))
end

-- GAME-SPECIFIC SCRIPT: Blue Lock Rivals
if gameName == "Blue Lock Rivals" then
    -- Add Blue Lock Rivals-specific functions here
    -- Example rollback and teleporting to golden wheel
    local rollbackButton = Instance.new("TextButton")
    rollbackButton.Text = "Rollback"
    rollbackButton.Size = UDim2.new(0, 200, 0, 50)
    rollbackButton.Position = UDim2.new(0.5, -100, 0.8, 0)
    rollbackButton.Parent = game.CoreGui

    rollbackButton.MouseButton1Click:Connect(function()
        -- Rejoin functionality (rollback)
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end)

    -- Add visual changes and spins/money
    -- Example of a visual spin (this would be adjusted based on actual game mechanics)
    local function changeSpinsMoney(spins, money)
        -- Add code here to change the in-game spins and money
        print("Updated Spins: " .. spins)
        print("Updated Money: " .. money)
    end

    -- Example of teleporting to the golden wheel
    local teleportButton = Instance.new("TextButton")
    teleportButton.Text = "Teleport to Golden Wheel"
    teleportButton.Size = UDim2.new(0, 200, 0, 50)
    teleportButton.Position = UDim2.new(0.5, -100, 0.9, 0)
    teleportButton.Parent = game.CoreGui

    teleportButton.MouseButton1Click:Connect(function()
        -- Add teleportation logic here
        local goldenWheelPosition = Vector3.new(100, 50, 100) -- Example coordinates
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(goldenWheelPosition)
    end)
end

-- FINALIZE SCRIPT
print("✅ KingzHub Loaded: " .. gameName)
