-- PC Parts Game Main Script

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Function to spawn a PC part
local function spawnPCPart(player)
    local part = Instance.new("Part")
    part.Size = Vector3.new(4, 1, 2)
    part.Position = Vector3.new(math.random(-50, 50), 10, math.random(-50, 50))
    part.Anchored = true
    part.Parent = workspace

    -- Add a click detector to the part
    local clickDetector = Instance.new("ClickDetector")
    clickDetector.Parent = part

    -- Function to handle part collection
    local function onPartClicked(player)
        -- Remove the part from the workspace
        part:Destroy()
        
        -- Award points to the player
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local points = leaderstats:FindFirstChild("Points")
            if points then
                points.Value = points.Value + 1
            end
        end
    end

    -- Connect the click detector to the function
    clickDetector.MouseClick:Connect(onPartClicked)
end

-- Function to initialize leaderstats for a player
local function initializeLeaderstats(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local points = Instance.new("IntValue")
    points.Name = "Points"
    points.Value = 0
    points.Parent = leaderstats
end

-- Spawn a PC part every 5 seconds
while true do
    for _, player in ipairs(Players:GetPlayers()) do
        spawnPCPart(player)
    end
    wait(5)
end

-- Initialize leaderstats for existing players
for _, player in ipairs(Players:GetPlayers()) do
    initializeLeaderstats(player)
end

-- Initialize leaderstats for new players
Players.PlayerAdded:Connect(initializeLeaderstats)
