local lplr = game.Players.LocalPlayer
local rs = game:GetService("RunService")
pcall(function() lplr:WaitForChild("PlayerGui"):FindFirstChild("superRing"):Destroy() end)

local gui = Instance.new("ScreenGui", lplr:WaitForChild("PlayerGui"))
gui.Name = "superRing"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 180, 0, 160)
main.Position = UDim2.new(0.5, -110, 0.5, -95)
main.BackgroundColor3 = Color3.fromRGB(47,49,54)
main.BorderSizePixel = 0

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Super Ring Parts"
title.TextColor3 = Color3.fromRGB(202,178,251)
title.BackgroundColor3 = Color3.fromRGB(41,43,47)
title.Font = "SourceSansBold"
title.TextSize = 18

local UICorner = Instance.new("UICorner", main)
UICorner.CornerRadius = UDim.new(0, 20)

local titleCorner = Instance.new("UICorner", title)
titleCorner.CornerRadius = UDim.new(0, 20)

local togglebtn = Instance.new("TextButton", main)
togglebtn.Size = UDim2.new(0.8, 0, 0, 35)
togglebtn.Position = UDim2.new(0.1, 0, 0.3, 0)
togglebtn.Text = "Apagado"
togglebtn.BackgroundColor3 = Color3.fromRGB(32,34,37)
togglebtn.TextColor3 = Color3.fromRGB(202,178,251)
togglebtn.Font = "Gotham"
togglebtn.TextSize = 14

local ToggleCorner = Instance.new("UICorner", togglebtn)
ToggleCorner.CornerRadius = UDim.new(0, 10)

local DecreaseRadius = Instance.new("TextButton", main)
DecreaseRadius.Size = UDim2.new(0.2, 0, 0, 35)
DecreaseRadius.Position = UDim2.new(0.1, 0, 0.6, 0)
DecreaseRadius.Text = "<"
DecreaseRadius.BackgroundColor3 = Color3.fromRGB(32,34,37)
DecreaseRadius.TextColor3 = Color3.fromRGB(202,178,251)
DecreaseRadius.Font = Enum.Font.Gotham
DecreaseRadius.TextSize = 14

local DecreaseCorner = Instance.new("UICorner")
DecreaseCorner.CornerRadius = UDim.new(0, 10)
DecreaseCorner.Parent = DecreaseRadius

local IncreaseRadius = Instance.new("TextButton", main)
IncreaseRadius.Size = UDim2.new(0.2, 0, 0, 35)
IncreaseRadius.Position = UDim2.new(0.7, 0, 0.6, 0)
IncreaseRadius.Text = ">"
IncreaseRadius.BackgroundColor3 = Color3.fromRGB(32,34,37)
IncreaseRadius.TextColor3 = Color3.fromRGB(202,178,251)
IncreaseRadius.Font = Enum.Font.Gotham
IncreaseRadius.TextSize = 14

local IncreaseCorner = Instance.new("UICorner")
IncreaseCorner.CornerRadius = UDim.new(0, 10)
IncreaseCorner.Parent = IncreaseRadius

local RadiusDisplay = Instance.new("TextLabel", main)
RadiusDisplay.Size = UDim2.new(0.4, 0, 0, 35)
RadiusDisplay.Position = UDim2.new(0.3, 0, 0.6, 0)
RadiusDisplay.Text = "Alcance: 50"
RadiusDisplay.BackgroundColor3 = Color3.fromRGB(41,43,47)
RadiusDisplay.TextColor3 = Color3.fromRGB(202,178,251)
RadiusDisplay.Font = Enum.Font.Gotham
RadiusDisplay.TextSize = 14

local RadiusCorner = Instance.new("UICorner")
RadiusCorner.CornerRadius = UDim.new(0, 10)
RadiusCorner.Parent = RadiusDisplay

local info = Instance.new("TextLabel", main)
info.Size = UDim2.new(1, 0, 0, 20)
info.Position = UDim2.new(0, 0, 1, -20)
info.Text = "Super Ring GUI - By @Roun95"
info.TextColor3 = Color3.fromRGB(202,178,251)
info.BackgroundTransparency = 1
info.Font = Enum.Font.Gotham
info.TextSize = 12

local closebtn = Instance.new("TextButton", main)
closebtn.Size = UDim2.new(0, 30, 0, 30)
closebtn.Position = UDim2.new(1, -175, 0, 5)
closebtn.Text = "X"
closebtn.BackgroundTransparency = 1
closebtn.BackgroundColor3 = Color3.fromRGB(32,34,37)
closebtn.TextColor3 = Color3.fromRGB(170,0,0)
closebtn.Font = Enum.Font.SourceSansBold
closebtn.TextSize = 24

local minimizebtn = Instance.new("TextButton", main)
minimizebtn.Size = UDim2.new(0, 30, 0, 30)
minimizebtn.Position = UDim2.new(1, -35, 0, 5)
minimizebtn.Text = "-"
minimizebtn.BackgroundColor3 = Color3.fromRGB(32,34,37)
minimizebtn.TextColor3 = Color3.fromRGB(202,178,251)
minimizebtn.Font = Enum.Font.SourceSansBold
minimizebtn.TextSize = 14

local MinimizeCorner = Instance.new("UICorner", minimizebtn)
MinimizeCorner.CornerRadius = UDim.new(0, 15)

local minimized = false
minimizebtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        main:TweenSize(UDim2.new(0, 180, 0, 40), "Out", "Quad", 0.3, true)
        minimizebtn.Text = "+"
        togglebtn.Visible = false
        DecreaseRadius.Visible = false
        IncreaseRadius.Visible = false
        RadiusDisplay.Visible = false
        info.Visible = false
    else
        main:TweenSize(UDim2.new(0, 180, 0, 160), "Out", "Quad", 0.3, true)
        minimizebtn.Text = "-"
        togglebtn.Visible = true
        DecreaseRadius.Visible = true
        IncreaseRadius.Visible = true
        RadiusDisplay.Visible = true
        info.Visible = true
    end
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14, 14, 14)
    }
    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end
    local function EnablePartControl()
        lplr.ReplicationFocus = workspace
        rs.Heartbeat:Connect(function()
            sethiddenproperty(lplr, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end
    EnablePartControl()
end

local radius = 50
local height = 100
local rotationSpeed = 10
local attractionStrength = 1000
local ringPartsEnabled = false

local function RetainPart(Part)
    if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
        if Part.Parent == lplr.Character or Part:IsDescendantOf(lplr.Character) then
            return false
        end
        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        Part.CanCollide = false
        return true
    end
    return false
end

local parts = {}
local function addPart(part)
    if RetainPart(part) then
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
    end
end

local function removePart(part)
    local index = table.find(parts, part)
    if index then
        table.remove(parts, index)
    end
end

for _, part in pairs(workspace:GetDescendants()) do
    addPart(part)
end

workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

rs.Heartbeat:Connect(function()
    if not ringPartsEnabled then return end
    
    local humanoidRootPart = lplr.Character and lplr.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tornadoCenter = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
                local newAngle = angle + math.rad(rotationSpeed)
                local targetPos = Vector3.new(
                    tornadoCenter.X + math.cos(newAngle) * math.min(radius, distance),
                    tornadoCenter.Y + (height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / height)))),
                    tornadoCenter.Z + math.sin(newAngle) * math.min(radius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit
                part.Velocity = directionToTarget * attractionStrength
            end
        end
    end
end)

closebtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

togglebtn.MouseButton1Click:Connect(function()
    ringPartsEnabled = not ringPartsEnabled
    togglebtn.Text = ringPartsEnabled and "Encendido" or "Apagado"
    togglebtn.BackgroundColor3 = ringPartsEnabled and Color3.fromRGB(0,200,0) or Color3.fromRGB(32,34,37)
end)

DecreaseRadius.MouseButton1Click:Connect(function()
    radius = math.max(5, radius - 5)
    RadiusDisplay.Text = "Alcance: " .. radius
end)

IncreaseRadius.MouseButton1Click:Connect(function()
    radius = math.min(200, radius + 5)
    RadiusDisplay.Text = "Alcance: " .. radius
end)
