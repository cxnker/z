local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

pcall(function() LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("SuperRing"):Destroy() end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SuperRing"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 180, 0, 160)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -95)
MainFrame.BackgroundColor3 = Color3.fromRGB(47,49,54)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "Super Ring Parts"
Title.TextColor3 = Color3.fromRGB(202,178,251)
Title.BackgroundColor3 = Color3.fromRGB(41,43,47)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = Title

local togglebtn = Instance.new("TextButton")
togglebtn.Size = UDim2.new(0.8, 0, 0, 35)
togglebtn.Position = UDim2.new(0.1, 0, 0.3, 0)
togglebtn.Text = "Apagado"
togglebtn.BackgroundColor3 = Color3.fromRGB(32,34,37)
togglebtn.TextColor3 = Color3.fromRGB(202,178,251)
togglebtn.Font = Enum.Font.Gotham
togglebtn.TextSize = 14
togglebtn.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 10)
ToggleCorner.Parent = togglebtn

local DecreaseRadius = Instance.new("TextButton")
DecreaseRadius.Size = UDim2.new(0.2, 0, 0, 35)
DecreaseRadius.Position = UDim2.new(0.1, 0, 0.6, 0)
DecreaseRadius.Text = "<"
DecreaseRadius.BackgroundColor3 = Color3.fromRGB(32,34,37)
DecreaseRadius.TextColor3 = Color3.fromRGB(202,178,251)
DecreaseRadius.Font = Enum.Font.Gotham
DecreaseRadius.TextSize = 14
DecreaseRadius.Parent = MainFrame

local DecreaseCorner = Instance.new("UICorner")
DecreaseCorner.CornerRadius = UDim.new(0, 10)
DecreaseCorner.Parent = DecreaseRadius

local IncreaseRadius = Instance.new("TextButton")
IncreaseRadius.Size = UDim2.new(0.2, 0, 0, 35)
IncreaseRadius.Position = UDim2.new(0.7, 0, 0.6, 0)
IncreaseRadius.Text = ">"
IncreaseRadius.BackgroundColor3 = Color3.fromRGB(32,34,37)
IncreaseRadius.TextColor3 = Color3.fromRGB(202,178,251)
IncreaseRadius.Font = Enum.Font.Gotham
IncreaseRadius.TextSize = 14
IncreaseRadius.Parent = MainFrame

local IncreaseCorner = Instance.new("UICorner")
IncreaseCorner.CornerRadius = UDim.new(0, 10)
IncreaseCorner.Parent = IncreaseRadius

local RadiusDisplay = Instance.new("TextLabel")
RadiusDisplay.Size = UDim2.new(0.4, 0, 0, 35)
RadiusDisplay.Position = UDim2.new(0.3, 0, 0.6, 0)
RadiusDisplay.Text = "Alcance: 50"
RadiusDisplay.BackgroundColor3 = Color3.fromRGB(41,43,47)
RadiusDisplay.TextColor3 = Color3.fromRGB(202,178,251)
RadiusDisplay.Font = Enum.Font.Gotham
RadiusDisplay.TextSize = 14
RadiusDisplay.Parent = MainFrame

local RadiusCorner = Instance.new("UICorner")
RadiusCorner.CornerRadius = UDim.new(0, 10)
RadiusCorner.Parent = RadiusDisplay

local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Position = UDim2.new(0, 0, 1, -20)
Watermark.Text = "Super Ring GUI - By @Roun95"
Watermark.TextColor3 = Color3.fromRGB(202,178,251)
Watermark.BackgroundTransparency = 1
Watermark.Font = Enum.Font.Gotham
Watermark.TextSize = 12
Watermark.Parent = MainFrame

local closebtn = Instance.new("TextButton")
closebtn.Size = UDim2.new(0, 30, 0, 30)
closebtn.Position = UDim2.new(1, -175, 0, 5)
closebtn.Text = "X"
closebtn.BackgroundTransparency = 1
closebtn.BackgroundColor3 = Color3.fromRGB(32,34,37)
closebtn.TextColor3 = Color3.fromRGB(170,0,0)
closebtn.Font = Enum.Font.SourceSansBold
closebtn.TextSize = 24
closebtn.Parent = MainFrame

local minimizebtn = Instance.new("TextButton")
minimizebtn.Size = UDim2.new(0, 30, 0, 30)
minimizebtn.Position = UDim2.new(1, -35, 0, 5)
minimizebtn.Text = "-"
minimizebtn.BackgroundColor3 = Color3.fromRGB(32,34,37)
minimizebtn.TextColor3 = Color3.fromRGB(202,178,251)
minimizebtn.Font = Enum.Font.SourceSansBold
minimizebtn.TextSize = 14
minimizebtn.Parent = MainFrame

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 15)
MinimizeCorner.Parent = minimizebtn

local minimized = false
minimizebtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 180, 0, 40), "Out", "Quad", 0.3, true)
        minimizebtn.Text = "+"
        togglebtn.Visible = false
        DecreaseRadius.Visible = false
        IncreaseRadius.Visible = false
        RadiusDisplay.Visible = false
        Watermark.Visible = false
    else
        MainFrame:TweenSize(UDim2.new(0, 180, 0, 160), "Out", "Quad", 0.3, true)
        minimizebtn.Text = "-"
        togglebtn.Visible = true
        DecreaseRadius.Visible = true
        IncreaseRadius.Visible = true
        RadiusDisplay.Visible = true
        Watermark.Visible = true
    end
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
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
        LocalPlayer.ReplicationFocus = workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
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
        if Part.Parent == LocalPlayer.Character or Part:IsDescendantOf(LocalPlayer.Character) then
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

RunService.Heartbeat:Connect(function()
    if not ringPartsEnabled then return end
    
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
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
    ScreenGui:Destroy()
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