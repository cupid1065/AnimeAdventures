--// KingzHub for Anime Adventures //--

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

-- GUI Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KingzHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 350, 0, 220)
frame.Position = UDim2.new(0.5, -175, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.AnchorPoint = Vector2.new(0.5, 0.5)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "KingzHub - Trait Rollback"
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local instructions = Instance.new("TextLabel", frame)
instructions.Size = UDim2.new(1, -20, 0, 70)
instructions.Position = UDim2.new(0, 10, 0, 40)
instructions.Text = "1. Enable Rollback\n2. Spin traits\n3. Keep Rollback ON while clicking Rejoin if bad\n4. Disable Rollback if good"
instructions.BackgroundTransparency = 1
instructions.TextColor3 = Color3.fromRGB(255, 255, 255)
instructions.TextWrapped = true
instructions.Font = Enum.Font.Gotham
instructions.TextSize = 14
instructions.TextYAlignment = Enum.TextYAlignment.Top

local rollbackBtn = Instance.new("TextButton", frame)
rollbackBtn.Text = "Enable Rollback"
rollbackBtn.Size = UDim2.new(0.9, 0, 0, 30)
rollbackBtn.Position = UDim2.new(0.05, 0, 0.65, 0)
rollbackBtn.Font = Enum.Font.GothamBold
rollbackBtn.TextSize = 16
rollbackBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
rollbackBtn.TextColor3 = Color3.new(1,1,1)
rollbackBtn.BorderSizePixel = 0
rollbackBtn.AutoButtonColor = true

local rejoinBtn = Instance.new("TextButton", frame)
rejoinBtn.Text = "Rejoin Server"
rejoinBtn.Size = UDim2.new(0.9, 0, 0, 30)
rejoinBtn.Position = UDim2.new(0.05, 0, 0.80, 0)
rejoinBtn.Font = Enum.Font.GothamBold
rejoinBtn.TextSize = 16
rejoinBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
rejoinBtn.TextColor3 = Color3.new(1,1,1)
rejoinBtn.BorderSizePixel = 0
rejoinBtn.AutoButtonColor = true

-- Logic
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
		print("Rejoined with Rollback enabled")
	else
		print("Please enable Rollback first")
	end
end)
