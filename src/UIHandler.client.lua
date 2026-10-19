-- UI Handler Script

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Function to create the UI
local function createUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "PCPartsGameUI"
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 50)
    frame.Position = UDim2.new(0.5, -100, 0, 10)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Position = UDim2.new(0, 0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Text = "Points: 0"
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextSize = 20
    textLabel.Parent = frame

    -- Update the points display
    local leaderstats = player:WaitForChild("leaderstats")
    local points = leaderstats:WaitForChild("Points")
    
    points.Changed:Connect(function()
        textLabel.Text = "Points: " .. points.Value
    end)
end

-- Create the UI when the player is added
createUI()
