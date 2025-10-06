local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "Victory User 🌠")
ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayBio", "Welcome, " .. LocalPlayer.DisplayName)
ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.fromRGB(0, 128, 255))
ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.fromRGB(0, 0, 0))

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Loading"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.IgnoreGuiInset = true -- Ignore others gui

-- Background
local Background = Instance.new("ImageLabel")
Background.Size = UDim2.new(1,0,1,0) -- Cover Screen
Background.Position = UDim2.new(0,0,0,0)
Background.Image = "rbxassetid://"
Background.ScaleType = Enum.ScaleType.Crop
Background.BackgroundTransparency = 0
Background.BackgroundColor3 = Color3.fromRGB(0,0,0)
Background.Parent = ScreenGui

-- Rounded Borders
local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0.02,0)
bgCorner.Parent = Background

local bgGradient = Instance.new("UIGradient")
bgGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)),
		ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 0)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 128, 255))
	})
bgGradient.Parent = Background

-- Top Text
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 300, 0, 50)
Title.Position = UDim2.new(0.5, -150, 0.2, 0)
Title.BackgroundTransparency = 1
Title.Text = "Victory Hub 🌠 "
Title.TextColor3 = Color3.fromRGB(180,180,180) -- Color
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.Parent = ScreenGui

-- Background Loading Bar
local BarBackground = Instance.new("Frame")
BarBackground.Size = UDim2.new(0, 400, 0, 30)
BarBackground.Position = UDim2.new(0.5, -200, 0.5, 0)
BarBackground.BackgroundColor3 = Color3.fromRGB(20,20,20)
BarBackground.BorderSizePixel = 0
BarBackground.Parent = ScreenGui
BarBackground.ClipsDescendants = true

-- Background Rounded Borders
local barBgCorner = Instance.new("UICorner")
barBgCorner.CornerRadius = UDim.new(0.5,0)
barBgCorner.Parent = BarBackground

-- Progress Bar
local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0,0,1,0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0,128,255)
ProgressBar.BorderSizePixel = 0
ProgressBar.Parent = BarBackground

-- Progress Rounded Borders
local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0.5,0)
progressCorner.Parent = ProgressBar

-- Text %
local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(1,0,1,0)
PercentText.Position = UDim2.new(0,0,0,0)
PercentText.BackgroundTransparency = 1
PercentText.TextColor3 = Color3.fromRGB(180,180,180)
PercentText.Font = Enum.Font.GothamBold
PercentText.TextScaled = true
PercentText.Text = "0%"
PercentText.Parent = BarBackground

-- Loading Animation
local totalTime = 5 -- Seconds
local steps = 100
local delayPerStep = totalTime / steps

for i = 1, steps do
    ProgressBar.Size = UDim2.new(i/steps,0,1,0)
    PercentText.Text = i .. "%"
    wait(delayPerStep)
end
-- Delete GUI in the end
ScreenGui:Destroy()

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/nxvap/VictoryHub/refs/heads/main/VictoryUi.lua"))()
local Window = Lib:MakeWindow({
    Title = "Victory Hub | Brookhaven RP 🌠 ",
    SubTitle = " by Roun95",
    SaveFolder = "VictoryData"
})

Window:AddMinimizeButton({
    Button = {Image = "rbxassetid://131130781251656", BackgroundTransparency = 0},
    Corner = {CornerRadius = UDim.new(1,1)},
})

local Tab1 = Window:MakeTab({"Info", "info"})
local Tab2 = Window:MakeTab({"Player", "user"})
local Tab3 = Window:MakeTab({"Avatar", "shirt"})
local Tab4 = Window:MakeTab({"RGB", "brush"})
local Tab5 = Window:MakeTab({"House", "home"})
local Tab6 = Window:MakeTab({"Car", "car"})
local Tab7 = Window:MakeTab({"Music", "music"})
local Tab8 = Window:MakeTab({"Troll", "skull"})
local Tab9 = Window:MakeTab({"Teleportes", "mappin"})
local Tab10 = Window:MakeTab({"Scripts", "scroll"})
local Tab11 = Window:MakeTab({"Graphics", "wind"})
----------------------------------------------------------------------------------------------------
                                    -- === Tab 1: Info === --
----------------------------------------------------------------------------------------------------
Tab1:AddSection({"》 Version 2.0 (70% translation)"})
Tab1:AddParagraph({"Executor", identifyexecutor()})
Tab1:AddParagraph({"Credits", "• Roun95\n• Developer and designer\n\n• Contribution\n• Deluxe_Studios (Nova Hub)"})

Tab1:AddButton({
    Name = "Rejoin server",
    Callback = function()
        local success, _ = pcall(function()
Players = game:GetService("Players")
TS = game:GetService("TeleportService")
if #Players:GetPlayers() <= 1 then
Players.LocalPlayer:kick("Rejoining...")
wait()
TS:Teleport(game.PlaceId, Players.LocalPlayer)
else
TS:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
end
        end)
        StarterGui:SetCore("SendNotification", {
            Title = success and "Success" or "Failed",
            Text = success and "Rejoined now" or "Rejoin failed",
            Duration = 5
        })
    end
})

Tab1:AddSection({"》 Information"})
Tab1:AddParagraph({"News", "• New options\n• Extended options and improvements \n• Development test version"})
----------------------------------------------------------------------------------------------------
                                -- === Tab 2: Player === --
----------------------------------------------------------------------------------------------------
Tab2:AddSection({"》 Player Character"})

local selectedPlayerName = nil
local headsitActive = false

local function headsitOnPlayer(targetPlayer)
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
        warn("Character has no Head")
        return false
    end
    local targetHead = targetPlayer.Character.Head
    local localRoot = Character:FindFirstChild("HumanoidRootPart")
    if not localRoot then
        warn("Character has no HumanoidRootPart")
        return false
    end
    localRoot.CFrame = targetHead.CFrame * CFrame.new(0, 2.2, 0)
    for _, v in pairs(localRoot:GetChildren()) do
        if v:IsA("WeldConstraint") then
            v:Destroy()
        end
    end

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = localRoot
    weld.Part1 = targetHead
    weld.Parent = localRoot
    if Humanoid then
        Humanoid.Sit = true
    end
    print("Headsit activated on " .. targetPlayer.Name)
    return true
end

local function removeHeadsit()
    local localRoot = Character:FindFirstChild("HumanoidRootPart")
    if localRoot then
        for _, v in pairs(localRoot:GetChildren()) do
            if v:IsA("WeldConstraint") then
                v:Destroy()
            end
        end
    end
    if Humanoid then
        Humanoid.Sit = false
    end
    print("Headsit disabled")
end

local function findPlayerByPartialName(partial)
    partial = partial:lower()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Name:lower():sub(1, #partial) == partial then
            return player
        end
    end
    return nil
end

local function notifyPlayerSelected(player)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, _ = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)
    StarterGui:SetCore("SendNotification", {
        Title = "Player selected",
        Text = player.Name .. " selected!",
        Icon = content,
        Duration = 5
    })
end

Tab2:AddTextBox({
    Name = "Headsit Player",
    Description = "Enter part of the player name",
    PlaceholderText = "Nor → Nort_VT",
    Callback = function(Value)
    local foundPlayer = findPlayerByPartialName(Value)
        if foundPlayer then
            selectedPlayerName = foundPlayer.Name
            notifyPlayerSelected(foundPlayer)
        else
            warn("No player found with that name")
        end
    end
})

Tab2:AddButton({"Enable Headsit", function()
    if not selectedPlayerName then
        return
    end
    if not headsitActive then
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and headsitOnPlayer(target) then
			headsitActive = true
        end
    else
        removeHeadsit()
		headsitActive = false
    end
end
})

Tab2:AddSlider({
    Name = "Speed",
    Min = 1,
    Max = 900,
    Increase = 1,
    Default = 16,
    Callback = function(Value)
        Humanoid.WalkSpeed = Value
    end
})

Tab2:AddSlider({
    Name = "JumpPower",
    Min = 1,
    Max = 900,
    Increase = 1,
    Default = 50,
    Callback = function(Value)
        Humanoid.JumpPower = Value
    end
})

Tab2:AddSlider({
    Name = "Gravity",
    Min = 1,
    Max = 900,
    Increase = 1,
    Default = 196,
    Callback = function(Value)
        Workspace.Gravity = Value
    end
})
 
local infjumpEnabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjumpEnabled then
      if Character and Character:FindFirstChild("Humanoid") then
		Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
   end
end)

Tab2:AddButton({
    Name = "Reset Status",
    Callback = function()
        Workspace.Gravity = 196.2
        Humanoid.JumpPower = 50
        Humanoid.WalkSpeed = 16
        infjumpEnabled = false
    end
})

Tab2:AddToggle({
	Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
       infjumpEnabled = Value
    end
})

Tab2:AddToggle({
    Name = "Anti Sit",
    Default = false,
    Callback = function(state)
        if state then
            antiSitEnabled = RunService.Heartbeat:Connect(function()
                if Humanoid then
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if Humanoid:GetState() == Enum.HumanoidStateType.Seated then
                        Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                    if Humanoid.SeatPart then
                        Humanoid.Sit = false
                        Humanoid.SeatPart = nil
                    end
                end
            end)
        else
            if antiSitEnabled then antiSitEnabled:Disconnect() end
            if Humanoid then
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            end
        end
    end
})

Tab2:AddToggle({
    Name = "Noclip",
    Default = true,
    Callback = function(v)
        noclipEnabled = v
    end
})

RunService.Stepped:Connect(function()
    if noclipEnabled and Character then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
	else
		if noclipEnabled then noclipEnabled:Disconnect() end
			for _, part in pairs(Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
		end
	end)

Tab2:AddButton({
    Name = "Fly GUI Universal",
    Callback = function()
local main = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local name = Instance.new("TextLabel")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local plus = Instance.new("TextButton")
local mine = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local flybtn = Instance.new("TextButton")
local closebtn = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

local plr = game.Players.LocalPlayer
local chr = plr.Character
local hmn = chr.Humanoid
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
local RunService = game:GetService("RunService")

pcall(function() plr:WaitForChild("PlayerGui"):FindFirstChild("flygui"):Destroy() end)

main.Name = "flygui"
main.Parent = plr:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

frame.Parent = main
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderColor3 = Color3.fromRGB(30, 30, 30)
frame.Position = UDim2.new(0.1, 0, 0.1, 0)
frame.Size = UDim2.new(0, 189, 0, 54)

name.Name = "name"
name.Parent = frame
name.BackgroundColor3 = Color3.fromRGB(46,49,54)
name.Position = UDim2.new(0.475, 0, 0, 0)
name.Size = UDim2.new(0, 100, 0, 27)
name.Font = "SourceSans"
name.Text = "FLY GUI"
name.TextColor3 = Color3.fromRGB(202,178,251)
name.TextSize = 25
name.TextWrapped = true

up.Name = "up"
up.Parent = frame
up.BackgroundColor3 = Color3.fromRGB(74,76,81)
up.Size = UDim2.new(0, 44, 0, 27)
up.Font = "SourceSans"
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(202,178,251)
up.TextSize = 14

down.Name = "down"
down.Parent = frame
down.BackgroundColor3 = Color3.fromRGB(74,76,81)
down.Position = UDim2.new(0, 0, 0.52, 0)
down.Size = UDim2.new(0, 44, 0, 27)
down.Font = "SourceSans"
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(202,178,251)
down.TextSize = 14

plus.Name = "plus"
plus.Parent = frame
plus.BackgroundColor3 = Color3.fromRGB(54,57,62)
plus.Position = UDim2.new(0.236, 0, 0, 0)
plus.Size = UDim2.new(0, 44, 0, 27)
plus.Font = "SourceSans"
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(202,178,251)
plus.TextSize = 25
plus.TextWrapped = true

mine.Name = "mine"
mine.Parent = frame
mine.BackgroundColor3 = Color3.fromRGB(54,57,62)
mine.Position = UDim2.new(0.24, 0, 0.516, 0)
mine.Size = UDim2.new(0, 44, 0, 27)
mine.Font = "SourceSans"
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(202,178,251)
mine.TextSize = 25
mine.TextWrapped = true

speed.Name = "speed"
speed.Parent = frame
speed.BackgroundColor3 = Color3.fromRGB(74,76,81)
speed.Position = UDim2.new(0.48, 0, 0.52, 0)
speed.Size = UDim2.new(0, 44, 0, 27)
speed.Font = "SourceSans"
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(202,178,251)
speed.TextScaled = true
speed.TextSize = 14
speed.TextWrapped = true

flybtn.Name = "fly"
flybtn.Parent = frame
flybtn.BackgroundColor3 = Color3.fromRGB(74,76,81)
flybtn.Position = UDim2.new(0.72, 0, 0.52, 0)
flybtn.Size = UDim2.new(0, 54, 0, 27)
flybtn.Font = "SourceSans"
flybtn.Text = "FLY"
flybtn.TextColor3 = Color3.fromRGB(202,178,251)
flybtn.TextSize = 14

closebtn.Name = "close"
closebtn.Parent = main.Frame
closebtn.BackgroundColor3 = Color3.fromRGB(54,57,62)
closebtn.Font = "SourceSans"
closebtn.Size = UDim2.new(0, 44, 0, 27)
closebtn.Text = "x"
closebtn.TextColor3 = Color3.fromRGB(202,178,251)
closebtn.TextSize = 25
closebtn.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(46,49,54)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 44, 0, 27)
mini.Text = "-"
mini.TextColor3 = Color3.fromRGB(202,178,251)
mini.TextSize = 35
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(46,49,54)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 44, 0, 27)
mini2.Text = "+"
mini2.TextColor3 = Color3.fromRGB(202,178,251)
mini2.TextSize = 30
mini2.Position = UDim2.new(0, 44, -1, 54)
mini2.Visible = false

speeds = 1

fly = false
frame.Active = true
frame.Draggable = true
flybtn.MouseButton1Down:connect(function()
    if fly == true then
        fly = false
        hmn:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Running,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
        hmn:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    else 
        fly = true
        for i = 1, speeds do
            spawn(function()
                local rs = RunService.Heartbeat
                tpwalking = true
                while tpwalking and rs:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
        chr.Animate.Disabled = true
        local Hum = chr:FindFirstChildOfClass("Humanoid") or chr:FindFirstChildOfClass("AnimationController")
        for i,v in next, Hum:GetPlayingAnimationTracks() do
            v:AdjustSpeed(0)
        end
        hmn:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Running,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
        hmn:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
        hmn:ChangeState(Enum.HumanoidStateType.Swimming)
    end

    if chr:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
        local torso = chr.Torso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0
        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if fly == true then
            hmn.PlatformStand = true
        end

        while fly == true or hmn.Health == 0 do
            RunService.RenderStepped:Wait()
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end

            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end
            --    game.Players.LocalPlayer.Character.Animate.Disabled = true
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        hmn.PlatformStand = false
        chr.Animate.Disabled = false
        tpwalking = false
    else
        local UpperTorso = chr.UpperTorso
        local flying = true
        local deb = true
        local ctrl = {f = 0, b = 0, l = 0, r = 0}
        local lastctrl = {f = 0, b = 0, l = 0, r = 0}
        local maxspeed = 50
        local speed = 0
        local bg = Instance.new("BodyGyro", UpperTorso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = UpperTorso.CFrame
        local bv = Instance.new("BodyVelocity", UpperTorso)
        bv.velocity = Vector3.new(0,0.1,0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if fly == true then
            hmn.PlatformStand = true
        end
        while fly == true or hmn.Health == 0 do
            wait()
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed+.5+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed-1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
            else
                bv.velocity = Vector3.new(0,0,0)
            end

            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
        end
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        hmn.PlatformStand = false
        chr.Animate.Disabled = false
        tpwalking = false
    end
end)

local tis

up.MouseButton1Down:connect(function()
    tis = up.MouseEnter:connect(function()
        while tis do
            wait()
            chr.HumanoidRootPart.CFrame = chr.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
        end
    end)
end)

up.MouseLeave:connect(function()
    if tis then
        tis:Disconnect()
        tis = nil
    end
end)

local dis

down.MouseButton1Down:connect(function()
    dis = down.MouseEnter:connect(function()
        while dis do
            wait()
            chr.HumanoidRootPart.CFrame = chr.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
        end
    end)
end)

down.MouseLeave:connect(function()
    if dis then
        dis:Disconnect()
        dis = nil
    end
end)

plr.CharacterAdded:Connect(function(char)
    wait(0.7)
    hmn.PlatformStand = false
    chr.Animate.Disabled = false
 
end)

plus.MouseButton1Down:connect(function()
    speeds = speeds + 1
    speed.Text = speeds
    if fly == true then

        tpwalking = false
        for i = 1, speeds do
            spawn(function()
                local rs = RunService.Heartbeat
                tpwalking = true
                local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                while tpwalking and rs:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
    end
end)

mine.MouseButton1Down:connect(function()
    if speeds == 1 then
        speed.Text = 'cannot be less than 1'
        wait(1)
        speed.Text = speeds
    else
        speeds = speeds - 1
        speed.Text = speeds
        if fly == true then
            tpwalking = false
            for i = 1, speeds do
                spawn(function()
                    local rs = RunService.Heartbeat    

                    tpwalking = true
                    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
                    while tpwalking and rs:Wait() and chr and hum and hum.Parent do
                        if hum.MoveDirection.Magnitude > 0 then
                            chr:TranslateBy(hum.MoveDirection)
                        end
                    end
                end)
            end
        end
    end
end)

closebtn.MouseButton1Click:Connect(function()
    main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
    up.Visible = false
    down.Visible = false
    flybtn.Visible = false
    plus.Visible = false
    speed.Visible = false
    mine.Visible = false
    mini.Visible = false
    mini2.Visible = true
    main.Frame.BackgroundTransparency = 1
    closebtn.Position =  UDim2.new(0, 0, -1, 54)
end)

mini2.MouseButton1Click:Connect(function()
    up.Visible = true
    down.Visible = true
    flybtn.Visible = true
    plus.Visible = true
    speed.Visible = true
    mine.Visible = true
    mini.Visible = true
    mini2.Visible = false
    main.Frame.BackgroundTransparency = 0 
    closebtn.Position =  UDim2.new(0, 0, -1, 27)
end)
    end
})

Tab2:AddSection({"》 ESP"})
local billboardGuis = {}
local connections = {}
local espEnabled = false
local selectedColor = "RGB"

Tab2:AddDropdown({
    Name = "Select color",
    Default = "RGB",
    Options = {
        "RGB", "Blanco", "Negro", "Rojo",
        "Verde", "Azul", "Amarillo", "Rosado", "Morado"
    },
    Callback = function(value)
        selectedColor = value
    end
})

local function getESPColor()
    if selectedColor == "RGB" then
        local h = (tick() % 5) / 5
        return Color3.fromHSV(h, 1, 1)
    elseif selectedColor == "Negro" then
        return Color3.fromRGB(0, 0, 0)
    elseif selectedColor == "Blanco" then
        return Color3.fromRGB(255, 255, 255)
    elseif selectedColor == "Rojo" then
        return Color3.fromRGB(255, 0, 0)
    elseif selectedColor == "Verde" then
        return Color3.fromRGB(0, 255, 0)
    elseif selectedColor == "Azul" then
        return Color3.fromRGB(0, 170, 255)
    elseif selectedColor == "Amarillo" then
        return Color3.fromRGB(255, 255, 0)
    elseif selectedColor == "Rosado" then
        return Color3.fromRGB(255, 105, 180)
    elseif selectedColor == "Morado" then
        return Color3.fromRGB(128, 0, 128)
    end
    return Color3.new(1, 1, 1)
end

local function updateESP(player)
    if player == LocalPlayer then return end
    if not espEnabled then return end

	local character = player.Character
    if character then
        local head = character:FindFirstChild("Head")
        if head then
            if billboardGuis[player] then
                billboardGuis[player]:Destroy()
            end

            local billboard = Instance.new("BillboardGui")
            billboard.Parent = head
            billboard.Adornee = head
            billboard.Size = UDim2.new(0,200,0,50)
            billboard.StudsOffset = Vector3.new(0,3,0)
            billboard.AlwaysOnTop = true

            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1,0,1,0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextStrokeTransparency = 0.5
            textLabel.Font = Enum.Font.GothamBold
            textLabel.TextSize = 14
            textLabel.Text = player.Name .. " | " .. player.AccountAge .. " dias"
            textLabel.TextColor3 = getESPColor()

            billboardGuis[player] = billboard
        end
    end
end

local function removeESP(player)
    if billboardGuis[player] then
        billboardGuis[player]:Destroy()
        billboardGuis[player] = nil
    end
end

local Toggle1 = Tab2:AddToggle({
    Name = "Enable ESP",
    Default = false
})

Toggle1:Callback(function(value)
    espEnabled = value

    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            updateESP(player)
        end

        local updateConnection = RunService.Heartbeat:Connect(function()
            for _, player in pairs(Players:GetPlayers()) do
                updateESP(player)
            end
            if selectedColor == "RGB" then
                for _, player in pairs(Players:GetPlayers()) do
                    local gui = billboardGuis[player]
                    if gui and gui:FindFirstChild("TextLabel") then
                        gui.TextLabel.TextColor3 = getESPColor()
                    end
                end
            end
        end)
        table.insert(connections, updateConnection)

        local playerAdded = Players.PlayerAdded:Connect(function(player)
            updateESP(player)
            local charConn = player.CharacterAdded:Connect(function()
                updateESP(player)
            end)
            table.insert(connections, charConn)
        end)
        table.insert(connections, playerAdded)

        local playerRemoving = Players.PlayerRemoving:Connect(function(player)
            removeESP(player)
        end)
        table.insert(connections, playerRemoving)
    else
        for _, player in pairs(Players:GetPlayers()) do
            removeESP(player)
        end
        for _, conn in pairs(connections) do
            conn:Disconnect()
        end
        connections = {}
        billboardGuis = {}
    end
end)
----------------------------------------------------------------------------------------------------
                                -- === Tab 3: Avatar === --
----------------------------------------------------------------------------------------------------
Tab3:AddSection({"》 Copy Avatar"})
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local PlayerValue
local Target = nil

local function GetPlayerNamess()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local Dropdown = Tab3:AddDropdown({
    Name = "Select player",
    Options = GetPlayerNamess(),
    Default = "",
    Flag = "player list",
    Callback = function(playernamee)
        PlayerValue = playernamee
        Target = playernamee
    end
})

local function UpdatePlayerss()
    Dropdown:Set(GetPlayerNamess())
end
UpdatePlayerss()

Tab3:AddButton({"Update list", function()
    UpdatePlayerss()
end})

Players.PlayerAdded:Connect(UpdatePlayerss)
Players.PlayerRemoving:Connect(UpdatePlayerss)

Tab3:AddButton({
    Name = "Copy avatar",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")
            if LHumanoid and THumanoid then
                local LDesc = LHumanoid:GetAppliedDescription()
                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end
                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end
                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end
                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end
                local PDesc = THumanoid:GetAppliedDescription()
                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)
                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end
                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end
                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end
                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end
                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end
                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end
                if tonumber(PDesc.WalkAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.WalkAnimation))
                    task.wait(0.3)
                end
                if tonumber(PDesc.RunAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.RunAnimation))
                    task.wait(0.3)
                end
                if tonumber(PDesc.JumpAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.JumpAnimation))
                    task.wait(0.3)
                end
                if tonumber(PDesc.FallAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.FallAnimation))
                    task.wait(0.3)
                end
                if tonumber(PDesc.SwimAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.SwimAnimation))
                    task.wait(0.3)
                end
                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})

Tab3:AddSection({"》 3D Clothes"})

Tab3:AddDropdown({
    Name = "Select clothes",
    Default = nil,
    Options = {
        "Black-Arm-Bandages-1-0",
        "Black-Oversized-Warmers",
        "Black-Oversized-Off-Shoulder-Hoodie",
        "White-Oversized-Off-Shoulder-Hoodie",
        "Left-Leg-Spikes"
    },
    Callback = function(selected)
        local clothes = {
            ["Black-Arm-Bandages-1-0"] = 11458078735,
            ["Black-Oversized-Warmers"] = 10789914680,
            ["Black-Oversized-Off-Shoulder-Hoodie"] = 18396592827,
            ["White-Oversized-Off-Shoulder-Hoodie"] = 18396754379,
            ["Left-Leg-Spikes"] = 10814325667
        }
        if clothes[selected] then
            pcall(function()
                local args = {clothes[selected]}
                ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
                StarterGui:SetCore("SendNotification", {
                    Title = "Avatar",
                    Text = "Avatar " .. selected .. " equiped!",
                    Duration = 5
                })
            end)
        end
    end
})

Tab3:AddSection({"》 Avatar editor"})
Tab3:AddParagraph({"Adjust the proportions of your avatar for a better result"})

Tab3:AddButton({
    Name = "Mini-Plushie + (Headless)",
    Callback = function()
        local args = {
            {
                107431241133468, -- Right Leg
                103380121023771,  -- Left Leg
                76079756909323,  -- Right Arm
                82598238110471,  -- Left Arm
                112722466960512, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "S15-Thin-Hourglass + (Headless)",
    Callback = function()
        local args = {
            {
                128776848621889, -- Right Leg
                81547744637409,  -- Left Leg
                133466157082146,  -- Right Arm
                73001997018020,  -- Left Arm
                129543160215232, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "inf15-Thin + (Headless)",
    Callback = function()
        local args = {
            {
                84418052877367, -- Right Leg
                124343282827669,  -- Left Leg
                99519402284266,  -- Right Arm
                115905570886697,  -- Left Arm
                92757812011061, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "Blush-Fashion-Doll + (Headless)",
    Callback = function()
        local args = {
            {
                127241951574732, -- Right Leg
                118303475394830,  -- Left Leg
                18839824209,  -- Right Arm
                18839824132,  -- Left Arm
                115745153758680, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "(+18) Girl Body + (Headless)",
    Callback = function()
        local args = {
            {
                127241951574732, -- Right Leg
                118303475394830,  -- Left Leg
                18839824209,  -- Right Arm
                18839824132,  -- Left Arm
                114206707267907, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "(+18) Girl Body + (Headless/Korblox)",
    Callback = function()
        local args = {
            {
                139607718, -- Right Leg
                118303475394830,  -- Left Leg
                18839824209,  -- Right Arm
                18839824132,  -- Left Arm
                114206707267907, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "(+18) Boy Body + (Headless)",
    Callback = function()
        local args = {
            {
                2517207746, -- Right Leg
                2517204456,  -- Left Leg
                4416788553,  -- Right Arm
                4416785861,  -- Left Arm
                32336059, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "(+18) Girl Body",
    Callback = function()
        local args = {
            {
                127968751428204, -- Right Leg
                101521138059051,  -- Left Leg
                18839824209,  -- Right Arm
                18839824132,  -- Left Arm
                114206707267907, -- Torso
                14970560459   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "Classic-Female-v2-Torso + (Headless)",
    Callback = function()
        local args = {
            {
                4637265517, -- Torso
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
Tab3:AddButton({
    Name = "Headless/Korblox (BETA)",
    Callback = function()
        local args = {
            {
                139607718, -- Right Leg
                15093053680   -- Head
            }
        }
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    end
})
----------------------------------------------------------------------------------------------------
                                    -- === Tab4: RGB === --
----------------------------------------------------------------------------------------------------
Tab4:AddSection({"》 RGB Player"})
local rgbSpeed = 1

Tab4:AddSlider({
    Name = "Adjust RGB Speed",
    Min = 1,
    Max = 5,
    Increase = 1,
    Default = 2,
    Callback = function(Value)
        rgbSpeed = Value
    end
})

local function getRainbowColor(speedMultiplier)
    local h = (tick() * speedMultiplier % 5) / 5
    return Color3.fromHSV(h, 1, 1)
end

local function fireServer(eventName, args)
    local event = ReplicatedStorage:FindFirstChild("RE")
    if event and event:FindFirstChild(eventName) then
        pcall(function()
            event[eventName]:FireServer(unpack(args))
        end)
    end
end

local nameBioRGBActive = false
Tab4:AddToggle({
    Name = "Name and Bio RGB",
    Default = false,
    Callback = function(state)
        nameBioRGBActive = state
        if state then
            task.spawn(function()
                while nameBioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1RPNam1eColo1r", {"PickingRPNameColor", color})
                    fireServer("1RPNam1eColo1r", {"PickingRPBioColor", color})
                    task.wait(0.03)
                end
            end)
        end
    end
})
----------------------------------------------------------------------------------------------------
                                    -- === Tab5: House === --
----------------------------------------------------------------------------------------------------
Tab5:AddButton({
    Name = "Unbanned from all houses",
    Callback = function()
        local successCount = 0
        local failCount = 0
        for i = 1, 37 do
            local bannedBlockName = "BannedBlock" .. i
            local bannedBlock = Workspace:FindFirstChild(bannedBlockName, true)
            if bannedBlock then
                local success, _ = pcall(function()
                    bannedBlock:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        for _, house in pairs(Workspace:GetDescendants()) do
            if house.Name:match("BannedBlock") then
                local success, _ = pcall(function()
                    house:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        if successCount > 0 then
            StarterGui:SetCore("SendNotification", {
                Title = "Success",
                Text = "Unbanned from " .. successCount .. " houses",
                Duration = 5
            })
        end
        if failCount > 0 then
            StarterGui:SetCore("SendNotification", {
                Title = "Failed",
                Text = "Not unbanned from " .. failCount .. " houses",
                Duration = 5
            })
        end
        if successCount == 0 and failCount == 0 then
            StarterGui:SetCore("SendNotification", {
                Title = "Warn",
                Text = "Not banned houses find",
                Duration = 5
            })
        end
    end
})
----------------------------------------------------------------------------------------------------
                                	-- === Tab8: Cars === --
----------------------------------------------------------------------------------------------------
Tab6:AddSection({"》 Spawm Premium Cars"})

Tab6:AddButton({
    Name = "Hummer",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="Hummer"}))
    end
})
Tab6:AddButton({
    Name = "RollsSUV",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="RollsSUV"}))
    end
})
Tab6:AddButton({
    Name = "NascarPremium",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="NascarPremium"}))
    end
})
Tab6:AddButton({
    Name = "RaptorMonster",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="RaptorMonster"}))
    end
})
Tab6:AddButton({
    Name = "Roadster",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="Roadster"}))
    end
})
Tab6:AddButton({
    Name = "Bugatti",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="Bugatti"}))
    end
})
Tab6:AddButton({
    Name = "CyberTruck",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="CyberTruck"}))
    end
})
Tab6:AddButton({
    Name = "CopLamborgini",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="CopLamborgini"}))
    end
})
Tab6:AddButton({
    Name = "Buggy",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="Buggy"}))
    end
})
Tab6:AddButton({
    Name = "GoKartVPass",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="GoKartVPass"}))
    end
})
Tab6:AddButton({
    Name = "Skyline",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="Skyline"}))
    end
})
Tab6:AddButton({
    Name = "4DoorJeep",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="4DoorJeep"}))
    end
})
Tab6:AddButton({
    Name = "HummerLimo",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="HummerLimo"}))
    end
})
Tab6:AddButton({
    Name = "Ferrari",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="Ferrari"}))
    end
})
Tab6:AddButton({
    Name = "Formula1",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="Formula1"}))
    end
})
Tab6:AddButton({
    Name = "SuperCar",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="SuperCar"}))
    end
})
Tab6:AddButton({
    Name = "Lamboego",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="Lamboego"}))
    end
})
Tab6:AddButton({
    Name = "BatMobile",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="BatMobile"}))
    end
})
Tab6:AddButton({
    Name = "HalloweenBatMobile",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="HalloweenBatMobile"}))
    end
})
Tab6:AddButton({
    Name = "HalloweenGreenTruck",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="HalloweenGreenTruck"}))
    end
})
Tab6:AddButton({
    Name = "SWAT",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="SWAT"}))
    end
})
Tab6:AddButton({
    Name = "TankPremium",
    Callback = function()
        ReplicatedStorage.RE["1Ca1r"]:FireServer(table.unpack({[1]="PickingCar", [2]="TankPremium"}))
    end
})
----------------------------------------------------------------------------------------------
Tab6:AddSection({"》 All vehicle functions"})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local vehicleTeleport = {}
vehicleTeleport.Players = Players
vehicleTeleport.Workspace = Workspace
vehicleTeleport.LocalPlayer = LocalPlayer
vehicleTeleport.Camera = Camera

function vehicleTeleport:showNotify(mensagem)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Warn",
            Text = mensagem,
            Duration = 5
        })
    end)
end

function vehicleTeleport:ToggleFallDamage(disable)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then return false end
    local humanoid = self.LocalPlayer.Character.Humanoid
    if disable then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
        return true
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        return false
    end
end

function vehicleTeleport:TeleportToSeat(seat, car)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then
        self:showNotify("Player not found")
        return false
    end
    local humanoid = self.LocalPlayer.Character.Humanoid
    local rootPart = self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        self:showNotify("HumanoidRootPart not found")
        return false
    end

    humanoid.Sit = false
    task.wait(0.1)

    rootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
    task.wait(0.1)

    seat:Sit(humanoid)
    task.wait(0.5)
    return humanoid.SeatPart == seat
end

function vehicleTeleport:TeleportToVoid(car)
    if not car then
        self:showNotify("Invalid vehicle")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
            self:showNotify("Main part of the vehicle not found")
            return
        end
    end
    local voidPosition = Vector3.new(0, -1000, 0)
    car:SetPrimaryPartCFrame(CFrame.new(voidPosition))
    task.wait(0.5)
end

function vehicleTeleport:TeleportToPlayer(car, playerPos)
    if not car then
        self:showNotify("Invalid vehicle")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
            self:showNotify("Main part of the vehicle not found")
            return
        end
    end
    local targetPos = playerPos + Vector3.new(5, 0, 5)
    car:SetPrimaryPartCFrame(CFrame.new(targetPos))
    task.wait(0.5)
end

function vehicleTeleport:ExitCarAndReturn(originalPos)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then return end
    local humanoid = self.LocalPlayer.Character.Humanoid
    if humanoid.SeatPart then
        humanoid.Sit = false
    end
    task.wait(0.1)
    if originalPos then
        self.LocalPlayer.Character:PivotTo(CFrame.new(originalPos))
    end
end

function vehicleTeleport:UpdateVehicleList()
    local folderVehicles = self.Workspace:FindFirstChild("Vehicles")
    local listVehicles = {}
    
    if folderVehicles then
        for _, car in ipairs(folderVehicles:GetChildren()) do
            if car.Name:match("Car$") then
                table.insert(listVehicles, car.Name)
            end
        end
    end
    return listVehicles
end

Tab6:AddToggle({
    Name = "Remove all vehicles (Patched)",
    Default = false,
    Callback = function(state)
        local originalPosition
        local teleportActive = state
        local fallDamageDisabled = false

        if state then
            if self.LocalPlayer.Character and self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                originalPosition = self.LocalPlayer.Character.HumanoidRootPart.Position
            else
                vehicleTeleport:showNotify("Player not found")
                return
            end

            fallDamageDisabled = vehicleTeleport:ToggleFallDamage(true)

            spawn(function()
                local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
                if not vehiclesFolder then
                    vehicleTeleport:showNotify("Vehicle not found")
                    return
                end

                local cars = {}
                for _, car in ipairs(vehiclesFolder:GetChildren()) do
                    if car.Name:match("Car$") then
                        table.insert(cars, car)
                    end
                end

                for _, car in ipairs(cars) do
                    if not teleportActive then break end

                    local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
                    if vehicleSeat and vehicleSeat.Occupant == nil then
                        local success = vehicleTeleport:TeleportToSeat(vehicleSeat, car)
                        if success then
                            vehicleTeleport:TeleportToVoid(car)
                            vehicleTeleport:ExitCarAndReturn(originalPosition)
                            task.wait(1)
                        end
                    end
                end

                if teleportActive then
                    teleportActive = false
                    vehicleTeleport:ToggleFallDamage(false)
                end
            end)
        else
            teleportActive = false
            vehicleTeleport:ToggleFallDamage(false)
        end
    end
})
----------------------------------------------------------------------------------------------------
Tab6:AddSection({"》 Vehicle features"})

Tab6:AddDropdown({
    Name = "Select vehicle",
    Default = nil,
    Options = vehicleTeleport:UpdateVehicleList(),
    Callback = function(selectedCar)
        _G.SelectedVehicle = selectedCar
    end
})

Tab6:AddToggle({
    Name = "View vehicle camera",
    Default = false,
    Callback = function(state)
        if state then
            if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
                vehicleTeleport:showNotify("No vehicle selected")
                return
            end

            local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
            if not vehiclesFolder then
                vehicleTeleport:showNotify("No vehicles found in folder")
                return
            end

            local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
            if not vehicle then
                vehicleTeleport:showNotify("Vehicle not found")
                return
            end

            local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
            if not vehicleSeat then
                vehicleTeleport:showNotify("Vehicle seat no found")
                return
            end

            vehicleTeleport.OriginalCameraSubject = vehicleTeleport.Camera.CameraSubject
            vehicleTeleport.OriginalCameraType = vehicleTeleport.Camera.CameraType

            vehicleTeleport.Camera.CameraSubject = vehicleSeat
            vehicleTeleport.Camera.CameraType = Enum.CameraType.Follow
            vehicleTeleport:showNotify("Camera adjusted for the vehicle " .. _G.SelectedVehicle .. "!")
        else
            if vehicleTeleport.OriginalCameraSubject then
                vehicleTeleport.Camera.CameraSubject = vehicleTeleport.OriginalCameraSubject
                vehicleTeleport.Camera.CameraType = vehicleTeleport.OriginalCameraType or Enum.CameraType.Custom
                vehicleTeleport:showNotify("Restored camera")
                vehicleTeleport.OriginalCameraSubject = nil
                vehicleTeleport.OriginalCameraType = nil
            end
        end
    end
})

vehicleTeleport.Workspace:WaitForChild("Vehicles").ChildAdded:Connect(function()
    Dropdown:Set(vehicleTeleport:UpdateVehicleList())
end)
vehicleTeleport.Workspace:WaitForChild("Vehicles").ChildRemoved:Connect(function()
    Dropdown:Set(vehicleTeleport:UpdateVehicleList())
end)
----------------------------------------------------------------------------------------------------
Tab6:AddSection({"》 Other functions"})

Tab6:AddButton({
    Name = "Delete selected vehicle",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            vehicleTeleport:showNotify("No vehicle selected")
            return
        end

        local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            vehicleTeleport:showNotify("No vehicles found in folder")
            return
        end

        local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
        if not vehicle then
            vehicleTeleport:showNotify("Vehicle not found")
            return
        end

        local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if not vehicleSeat then
            vehicleTeleport:showNotify("Vehicle seat no found")
            return
        end

        if vehicleSeat.Occupant then
            vehicleTeleport:showNotify("Vehicle in use, it is not possible to delete it")
            return
        end

        local originalPos
        if vehicleTeleport.LocalPlayer.Character and vehicleTeleport.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = vehicleTeleport.LocalPlayer.Character.HumanoidRootPart.Position
        else
            vehicleTeleport:showNotify("Player character not found")
            return
        end

        local isFallDamageOff = vehicleTeleport:ToggleFallDamage(true)
        local success = vehicleTeleport:TeleportToSeat(vehicleSeat, vehicle)
        if success then
            vehicleTeleport:TeleportToVoid(vehicle)
            vehicleTeleport:showNotify("Vehicle " .. _G.SelectedVehicle .. " was teleported into the void")
            vehicleTeleport:ExitCarAndReturn(originalPos)
        else
            vehicleTeleport:showNotify("Failure to sit in the vehicle")
        end
        vehicleTeleport:ToggleFallDamage(false)
    end
})

Tab6:AddButton({
    Name = "Bring selected vehicle",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            vehicleTeleport:showNotify("No vehicle selected")
            return
        end

        local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            vehicleTeleport:showNotify("No vehicles found in folder")
            return
        end

        local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
        if not vehicle then
            vehicleTeleport:showNotify("Vehicle not found")
            return
        end

        local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if not vehicleSeat then
            vehicleTeleport:showNotify("Vehicle seat no found")
            return
        end

        if vehicleSeat.Occupant then
            vehicleTeleport:showNotify("The vehicle is in use, teleportation failed")
            return
        end

        local originalPos
        if vehicleTeleport.LocalPlayer.Character and vehicleTeleport.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = vehicleTeleport.LocalPlayer.Character.HumanoidRootPart.Position
        else
            vehicleTeleport:showNotify("Player character not found")
            return
        end

        local isFallDamageOff = vehicleTeleport:ToggleFallDamage(true)
        local success = vehicleTeleport:TeleportToSeat(vehicleSeat, vehicle)
        if success then
            vehicleTeleport:TeleportToPlayer(vehicle, originalPos)
            vehicleTeleport:showNotify("Vehicle " .. _G.SelectedVehicle .. " was teleported to you")
            vehicleTeleport:ExitCarAndReturn(originalPos)
        else
            vehicleTeleport:showNotify("failure to sit in the vehicle")
        end
        vehicleTeleport:ToggleFallDamage(false)
    end
})

Tab6:AddButton({
    Name = "Bring all vehicles",
    Callback = function()
        local originalPos
        if vehicleTeleport.LocalPlayer.Character and vehicleTeleport.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = vehicleTeleport.LocalPlayer.Character.HumanoidRootPart.Position
        else
            vehicleTeleport:showNotify("Player characted not found")
            return
        end

        local vehiclesFolder = vehicleTeleport.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            vehicleTeleport:showNotify("No vehicles found in folder")
            return
        end

        local isFallDamageOff = vehicleTeleport:ToggleFallDamage(true)
        local cars = {}
        for _, car in ipairs(vehiclesFolder:GetChildren()) do
            if car.Name:match("Car$") then
                table.insert(cars, car)
            end
        end

        for _, car in ipairs(cars) do
            local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
            if vehicleSeat and vehicleSeat.Occupant == nil then
                local success = vehicleTeleport:TeleportToSeat(vehicleSeat, car)
                if success then
                    vehicleTeleport:TeleportToPlayer(car, originalPos)
                    vehicleTeleport:ExitCarAndReturn(originalPos)
                    vehicleTeleport:showNotify("Vehicle " .. car.Name .. " was teleported to you")
                    task.wait(1)
                else
                    vehicleTeleport:showNotify("You cannot sit in the vehicle " .. car.Name .. "!")
                end
            else
                if vehicleSeat then
                    vehicleTeleport:showNotify("Vehicle " .. car.Name .. " in use")
                else
                    vehicleTeleport:showNotify("Vehicle " .. car.Name .. " seat no found")
                end
            end
        end

        vehicleTeleport:ToggleFallDamage(false)
        if #cars == 0 then
            vehicleTeleport:showNotify("no vehicle available for teleportation")
        end
    end
})

local fallDamageDisabled = false
vehicleTeleport.LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    if fallDamageDisabled then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
    end
end)
----------------------------------------------------------------------------------------------------
                                	-- === Tab7: Music === --
----------------------------------------------------------------------------------------------------
local loopAtivo = false
local InputID = ""

Tab7:AddTextBox({
    Name = "Sound Player",
    Description = "Enter the sound ID",
    Default = "",
    PlaceholderText = "ej: 6832470734",
    ClearTextOnFocus = true,
    Callback = function(text)
        InputID = tonumber(text)
    end
})

local function fireServer(eventName, args)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

Tab7:AddButton({
    Name = "Play sound",
    Callback = function()
        if InputID then
            fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
            local globalSound = Instance.new("Sound", Workspace)
            globalSound.SoundId = "rbxassetid://" .. InputID
            globalSound.Looped = false
            globalSound:Play()
            task.wait(3)
            globalSound:Destroy()
        end
    end
})

Tab7:AddToggle({
    Name = "Loop sound",
    Default = false,
    Callback = function(state)
        loopAtivo = state
        if loopAtivo then
            spawn(function()
                while loopAtivo do
                    if InputID then
                        fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
                        local globalSound = Instance.new("Sound", Workspace)
                        globalSound.SoundId = "rbxassetid://" .. InputID
                        globalSound.Looped = false
                        globalSound:Play()
                        task.spawn(function()
                            task.wait(3)
                            globalSound:Destroy()
                        end)
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

local function createSoundDropdown(title, musicOptions, defaultOption)
	local musicNames = {}
    local categoryMap = {}
    for category, sounds in pairs(musicOptions) do
        for _, music in ipairs(sounds) do
            if music.name ~= "" and music.id ~= "4354908569" then
                table.insert(musicNames, music.name)
                categoryMap[music.name] = {id = music.id, category = category}
            end
        end
    end

	local selectedSoundID = nil
    local currentVolume = 1
    local currentPitch = 1

    local function playSound(soundId, volume, pitch)
        fireServer("1Gu1nSound1s", {Workspace, soundId, volume})
        local globalSound = Instance.new("Sound")
        globalSound.Parent = Workspace
        globalSound.SoundId = "rbxassetid://" .. soundId
        globalSound.Volume = volume
        globalSound.Pitch = pitch
        globalSound.Looped = false
        globalSound:Play()
        task.spawn(function()
            task.wait(3)
            globalSound:Destroy()
        end)
    end
	Tab7:AddDropdown({
    	Name = title,
    	Description = "Choose a sound to play on the server",
    	Default = defaultOption,
    	Multi = false,
    	Options = musicNames,
    	Callback = function(selectedSound)
        	if selectedSound and categoryMap[selectedSound] then
            	selectedSoundID = categoryMap[selectedSound].id
        	else
            	selectedSoundID = nil
        	end
    	end
	})
	Tab7:AddButton({
    	Name = "Play sound",
    	Callback = function()
    	    if selectedSoundID then
    	        playSound(selectedSoundID, currentVolume, currentPitch)
    	    end
    	end
	})

	local dropdownLoopActive = false
	Tab7:AddToggle({
    	Name = "Loop sound",
    	Default = false,
    	Callback = function(state)
    	dropdownLoopActive = state
        	if state then
            	task.spawn(function()
                	while dropdownLoopActive do
                    	if selectedSoundID then
                    		playSound(selectedSoundID, currentVolume, currentPitch)
                    	end
                    	task.wait(1)
                	end
            	end)
        	end
    	end
	})
end

createSoundDropdown("Select an option", {
	["Sounds"] = {
		{name = "SUS", id = "6701126635"},
    	{name = "Sus", id = "7153419575"},
    	{name = "Amongus", id = "6651571134"},
    	{name = "Sonic.exe", id = "2496367477"},
    	{name = "Mandrake Detected", id = "9068077052"},
    	{name = "Super fast groan", id = "128863565301778"},
    	{name = "dodichan onnn", id = "134640594695384"},
    	{name = "Oh my god", id = "73349649774476"},
    	{name = "China boy", id = "84403553163931"}
    }
}, "SUS")
-----------------------------------------------------------------------------
local selectedPlayer = nil
local isFollowingKill = false
local isFollowingPull = false
local running = false
local connection = nil
local flingConnection = nil
local originalPosition = nil
local savedPosition = nil
local originalProperties = {}
local selectedKillPullMethod = nil
local selectedFlingMethod = nil
local soccerBall = nil
local couch = nil
local isSpectating = false
local spectatedPlayer = nil
local characterConnection = nil
local flingToggle = nil

local SetNetworkOwnerEvent = Instance.new("RemoteEvent")
SetNetworkOwnerEvent.Name = "SetNetworkOwnerEvent_" .. tostring(math.random(1000, 9999))
SetNetworkOwnerEvent.Parent = ReplicatedStorage

local serverScriptCode = [[
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:WaitForChild("]] .. SetNetworkOwnerEvent.Name .. [[")
    
    event.OnServerEvent:Connect(function(player, part, networkOwner)
        if part and part:IsA("BasePart") then
            pcall(function()
                part:SetNetworkOwner(networkOwner)
                part.Anchored = false
                part.CanCollide = true
                part.CanTouch = true
            end)
        end
    end)
]]

pcall(function()
    loadstring(serverScriptCode)()
end)

local function disableCarClient()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local carClient = backpack:FindFirstChild("CarClient")
    if carClient and carClient:IsA("LocalScript") then
        carClient.Disabled = true
    end
end

local function enableCarClient()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local carClient = backpack:FindFirstChild("CarClient")
    if carClient and carClient:IsA("LocalScript") then
        carClient.Disabled = false
    end
end

local function getPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local function updateDropdown(dropdown, spectateToggle)
    pcall(function()
        local currentValue = dropdown:Get()
        local playerNames = getPlayerNames()
        dropdown:Set(playerNames) -- Mantiene el nombre del jugador
        if currentValue and not table.find(playerNames, currentValue) then
            dropdown:Set("")
            selectedPlayer = nil
            if isSpectating then
                stopSpectating()
                if spectateToggle then
                    pcall(function() spectateToggle:Set(false) end)
                end
            end
            if running or isFollowingKill or isFollowingPull then
                running = false
                isFollowingKill = false
                isFollowingPull = false
                if connection then connection:Disconnect() connection = nil end
                if flingConnection then flingConnection:Disconnect() flingConnection = nil end
                if flingToggle then pcall(function() flingToggle:Set(false) end) end
            end
        elseif currentValue and table.find(playerNames, currentValue) then
            dropdown:Set(currentValue) -- Mantiene la seleccion si el jugador todavia esta en el juego
        end
    end)
end

local function spectatePlayer(playerName)
    if characterConnection then
        characterConnection:Disconnect()
        characterConnection = nil
    end

    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer and targetPlayer ~= LocalPlayer then
        spectatedPlayer = targetPlayer
        isSpectating = true

        local function updateCamera()
            if not isSpectating or not spectatedPlayer then return end
            if spectatedPlayer.Character and spectatedPlayer.Character:FindFirstChild("Humanoid") then
                Workspace.CurrentCamera.CameraSubject = spectatedPlayer.Character.Humanoid
            else
                Workspace.CurrentCamera.CameraSubject = nil
            end
        end

        updateCamera()

        characterConnection = RunService.Heartbeat:Connect(function()
            if not isSpectating then
                characterConnection:Disconnect()
                characterConnection = nil
                return
            end
            pcall(updateCamera)
        end)

        spectatedPlayer.CharacterAdded:Connect(function()
            if isSpectating then updateCamera() end
        end)
    else
        isSpectating = false
        spectatedPlayer = nil
    end
end

local function stopSpectating()
    if characterConnection then
        characterConnection:Disconnect()
        characterConnection = nil
    end

    isSpectating = false
    spectatedPlayer = nil

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    else
        Workspace.CurrentCamera.CameraSubject = nil
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
end

local function teleportToPlayer(playerName)
    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if not myHRP or not myHumanoid then
            print("Your character has not fully loaded to teleport")
            return
        end

        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
                part.Anchored = true
            end
        end

        local success, errorMessage = pcall(function()
            myHRP.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0))
        end)
        if not success then
            warn("Teleport failed: " .. tostring(errorMessage))
            return
        end

        myHumanoid.Sit = false
        myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        task.wait(0.5)

        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = false
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end

        print("Teletransportado al jugador: " .. playerName .. " con anclaje seguro.")
    else
        print("Jugador o personaje no encontrado para teletransportarse.")
    end
end

LocalPlayer.CharacterAdded:Connect(function(character)
    if isSpectating then
        stopSpectating()
        pcall(function() SpectateToggleTab10:Set(false) end)
    end
end)

local player_name_value

local DropdownPlayerTab2 = Tab8:AddDropdown({
    Name = "Seleccionar Jugador",
    Description = "Elige un jugador para matar, atraer, ver o lanzar",
    Default = "",
    Multi = false,
    Options = getPlayerNames(),
    Flag = "player list",
    Callback = function(selectedPlayerName)
        player_name_value = selectedPlayerName
        if selectedPlayerName == "" or selectedPlayerName == nil then
            selectedPlayer = nil
            if running or isFollowingKill or isFollowingPull then
                running = false
                isFollowingKill = false
                isFollowingPull = false
                if connection then connection:Disconnect() end
                if flingConnection then flingConnection:Disconnect() end
                if flingToggle then pcall(function() flingToggle:Set(false) end) end
            end
            if isSpectating then stopSpectating() end
        else
            selectedPlayer = Players:FindFirstChild(selectedPlayerName)
            if isSpectating then
                stopSpectating()
                spectatePlayer(selectedPlayerName)
            end
        end
    end
})

function UptadePlayers()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    DropdownPlayerTab2:Set(playerNames)
end

Tab8:AddButton({"Actualizar lista", function()
    UptadePlayers()
end})

UptadePlayers()

Tab8:AddButton({
    Title = "Teletransportarse al jugador",
    Desc = "Teletransportarse a la posicion del jugador seleccionado",
    Callback = function()
        local selectedPlayerName = player_name_value
        if selectedPlayerName and selectedPlayerName ~= "" then
            local success, errorMessage = pcall(teleportToPlayer, selectedPlayerName)
            if not success then
                warn("Error al teletransportarse: " .. tostring(errorMessage))
            end
        else
            print("Seleccione un jugador antes de teletransportarse.")
        end
    end
})

local SpectateToggleTab10 = Tab8:AddToggle({
    Name = "Visualizar jugador",
    Description = "Activar/desactivar la visualizacion del jugador seleccionado",
    Default = false,
    Callback = function(state)
        if state then
            if selectedPlayer then
                pcall(spectatePlayer, selectedPlayer.Name)
            else
                SpectateToggleTab10:Set(false)
            end
        else
            pcall(stopSpectating)
        end
    end
})

-- Remueve automaticamente los jugadores que salen
Players.PlayerRemoving:Connect(function(player)
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
    if selectedPlayer == player then
        selectedPlayer = nil
        if isSpectating then stopSpectating() end
        if running then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            if flingToggle then flingToggle:Set(false) end
        end
        SpectateToggleTab10:Set(false)
        DropdownPlayerTab2:Set("")
    end
end)

-- Actualizacion automatica de un nuevo jugador ingresado
Players.PlayerAdded:Connect(function()
    task.wait(1) -- Pequeño retraso para garantizar que el reproductor este listo
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
end)

-- Inicia el menu desplegable
updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
----------------------------------------------------------------------------------------------------
Tab8:AddSection({"Matar o Atraer jugador"})

local DropdownKillPullMethod = Tab8:AddDropdown({
    Name = "Selecciona una opcion",
    Description = "Elige una opcion para matar o atraer a un jugador",
    Options = {"Sofa", "Autobus"},
    Callback = function(value)
        selectedKillPullMethod = value
    end
})
----------------------------------------------------------------------------------------------------
-- Lanzar con Sofa --
local function equipSofa()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local sofa = backpack:FindFirstChild("Couch") or LocalPlayer.Character:FindFirstChild("Couch")
    if not sofa then
        local args = { [1] = "PickingTools", [2] = "Couch" }
        local success = pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        end)
        if not success then return false end
        repeat
            sofa = backpack:FindFirstChild("Couch")
            task.wait()
        until sofa or task.wait(5)
        if not sofa then return false end
    end
    if sofa.Parent ~= LocalPlayer.Character then
        sofa.Parent = LocalPlayer.Character
    end
    return true
end

local function killWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    if not equipSofa() then return end
    isFollowingKill = true
    originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end

local function pullWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    if not equipSofa() then return end
    isFollowingPull = true
    originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Autobus --
local function killWithBus(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    args = { [1] = "PickingCar", [2] = "SchoolBus" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local busName = LocalPlayer.Name .. "Car"
    local bus = vehiclesFolder:FindFirstChild(busName)
    if not bus then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(bus:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local lastUpdate = tick()
    local updateInterval = 0.05
    local startTime = tick()
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        local targetCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
        local newTargetHRP = targetCharacter:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetCharacter:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then return end
        if not myHRP or not humanoid then running = false return end
        if tick() - lastUpdate < updateInterval then return end
        lastUpdate = tick()
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            bus:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(bus:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            pcall(function()
                bus:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
            end)
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end
            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)
        end
    end)
end

local followConnection
if followConnection then followConnection:Disconnect() end
followConnection = RunService.Heartbeat:Connect(function()
    if (isFollowingKill or isFollowingPull) and selectedPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        pcall(function()
            local targetPosition = selectedPlayer.Character.HumanoidRootPart.Position
            LocalPlayer.Character:SetPrimaryPartCFrame(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
    end
end)

local sitCheckConnection
if sitCheckConnection then sitCheckConnection:Disconnect() end
sitCheckConnection = RunService.Heartbeat:Connect(function()
    if (isFollowingKill or isFollowingPull) and selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Humanoid") then
        pcall(function()
            if selectedPlayer.Character.Humanoid.Sit then
                if isFollowingKill then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
                        task.wait(0.5)
                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "Couch")
                        task.wait(1)
                    end
                end
                isFollowingKill = false
                isFollowingPull = false
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and originalPosition then
                    local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                    if myHRP then
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(originalPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end
                    originalPosition = nil
                end
            end
        end)
    end
end)

Tab8:AddButton({
    Name = "Matar",
    Description = "Teletransporta el jugador seleccionado al vacio",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod then return end
        if selectedKillPullMethod == "Sofa" then
            killWithSofa(selectedPlayer)
        elseif selectedKillPullMethod == "Autobus" then
            killWithBus(selectedPlayer)
        end
    end
})

Tab8:AddButton({
    Name = "Atraer",
    Description = "Teletransporta el jugador seleccionado a tu posicion",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod or selectedKillPullMethod ~= "Sofa" then return end
        pullWithSofa(selectedPlayer)
    end
})

Tab8:AddButton({
    Name = "Parar todo (Matar o Atraer)",
    Callback = function()
        isFollowingKill = false
        isFollowingPull = false
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
        local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
        for _, seat in ipairs(Workspace:GetDescendants()) do
            if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
        end
        if originalPosition then
            local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myHRP then
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(originalPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end
            originalPosition = nil
        end

        disableCarClient()

        local args = { [1] = "DeleteAllVehicles" }
        pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
        end)
    end
})
----------------------------------------------------------------------------------------------------
Tab8:AddSection({"Lanzar Jugador"})

local DropdownFlingMethod = Tab8:AddDropdown({
    Name = "Selecciona una opcion",
    Description = "Elige una opcion para lanzar a un jugador",
    Options = {"Sofa", "Autobus", "Balon", "Balon V2", "Barco", "Camion"},
    Callback = function(value)
        selectedFlingMethod = value
    end
})
----------------------------------------------------------------------------------------------------
-- Lanzar con Sofa --
local function flingWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then
        return
    end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then
        return
    end
    savedPosition = myHRP.Position
    if not equipSofa() then return end
    task.wait(0.5)
    couch = character:FindFirstChild("Couch")
    if not couch then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if (obj.Name == "Couch" or obj.Name == "Couch" .. LocalPlayer.Name) and (obj:IsA("BasePart") or obj:IsA("Tool")) then
                couch = obj
                break
            end
        end
    end
    if not couch then
        return
    end
    if couch:IsA("BasePart") then
        originalProperties = {
            Anchored = couch.Anchored,
            CanCollide = couch.CanCollide,
            CanTouch = couch.CanTouch
        }
        couch.Anchored = false
        couch.CanCollide = true
        couch.CanTouch = true
        pcall(function() couch:SetNetworkOwner(nil) end)
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
    local startTime = tick()
    local walkFlingInstance = nil
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then
            running = false
            return
        end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then
            running = false
            return
        end
        if not myHRP or not humanoid then
            running = false
            return
        end
        pcall(function()
            local targetPosition = newTargetHRP.Position
            character:SetPrimaryPartCFrame(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        if newTargetHumanoid.Sit or tick() - startTime > 10 then
            running = false
            flingConnection:Disconnect()
            flingConnection = nil
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    pcall(function() part:SetNetworkOwner(nil) end)
                end
            end
            walkFlingInstance = Instance.new("BodyVelocity")
            walkFlingInstance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            walkFlingInstance.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
            walkFlingInstance.Parent = myHRP
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16))
                myHRP.Anchored = false
            end)
            local spinStart = tick()
            local spinConnection
            spinConnection = RunService.Heartbeat:Connect(function()
                if tick() - spinStart >= 0.5 then
                    spinConnection:Disconnect()
                    return
                end
                pcall(function()
                    character:SetPrimaryPartCFrame(
                        myHRP.CFrame * CFrame.Angles(
                            math.rad(Workspace.DistributedGameTime * 12000),
                            math.rad(Workspace.DistributedGameTime * 15000),
                            math.rad(Workspace.DistributedGameTime * 18000)
                        )
                    )
                end)
            end)
            task.wait(0.5)
            local args = { [1] = "PlayerWantsToDeleteTool", [2] = "Couch" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
            end)
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end)
            if walkFlingInstance then
                walkFlingInstance:Destroy()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            if flingToggle then
                flingToggle:SetValue(false)
            end
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Autobus --
local function flingWithBus(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    args = { [1] = "PickingCar", [2] = "SchoolBus" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local busName = LocalPlayer.Name .. "Car"
    local bus = vehiclesFolder:FindFirstChild(busName)
    if not bus then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(bus:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local startTime = tick()
    local walkFlingInstancePlayer = nil
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            bus:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(bus:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            flingConnection:Disconnect()
            flingConnection = nil
            pcall(function()
                bus:PivotTo(CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16)))
            end)

            walkFlingInstancePlayer = Instance.new("BodyVelocity")
            walkFlingInstancePlayer.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            walkFlingInstancePlayer.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
            walkFlingInstancePlayer.Parent = myHRP
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if walkFlingInstancePlayer then
                walkFlingInstancePlayer:Destroy()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end)
            if flingToggle then flingToggle:Set(false) end
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Balon --
local function equipBall()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local ball = backpack:FindFirstChild("SoccerBall") or LocalPlayer.Character:FindFirstChild("SoccerBall")
    if not ball then
        local args = { [1] = "PickingTools", [2] = "SoccerBall" }
        local success = pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        end)
        if not success then return false end
        repeat
            ball = backpack:FindFirstChild("SoccerBall")
            task.wait()
        until ball or task.wait(5)
        if not ball then return false end
    end
    if ball.Parent ~= LocalPlayer.Character then
        ball.Parent = LocalPlayer.Character
    end
    return true
end

local function flingWithBall(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    if not equipBall() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return end
    local soccerBalls = workspaceCom:FindFirstChild("001_SoccerBalls")
    if not soccerBalls then return end
    soccerBall = soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    savedPosition = myHRP.Position
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
    if humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        humanoid.Sit = false
    end
    for _, seat in ipairs(Workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = true end
    end
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeDown", 4)
    end)
    running = true
    local lastFlingTime = 0
    connection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp or not hum or not myHRP then return end
        local moveDir = hum.MoveDirection
        local isStill = moveDir.Magnitude < 0.1
        local isSitting = hum.Sit
        if isSitting then
            local y = math.sin(tick() * 50) * 2
            soccerBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.75 + y, 0))
        elseif isStill then
            local z = math.sin(tick() * 50) * 3
            soccerBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.75, z))
        else
            local offset = moveDir.Unit * math.clamp(hrp.Velocity.Magnitude * 0.15, 5, 12)
            soccerBall.CFrame = CFrame.new(hrp.Position + offset + Vector3.new(0, 0.75, 0))
        end
        myHRP.CFrame = CFrame.new(soccerBall.Position + Vector3.new(0, 1, 0))
    end)
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dist = (soccerBall.Position - hrp.Position).Magnitude
        if dist < 4 and tick() - lastFlingTime > 0.4 then
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
            fling.Parent = hrp
            task.delay(0.3, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Balon V2 --
local function flingWithBallV2(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    if not equipBall() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return end
    local soccerBalls = workspaceCom:FindFirstChild("001_SoccerBalls")
    if not soccerBalls then return end
    soccerBall = soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    savedPosition = myHRP.Position
    running = true
    local lastFlingTime = 0
    connection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        if not hrp or not hum then return end
        local speed = hrp.Velocity.Magnitude
        local isMoving = hum.MoveDirection.Magnitude > 0.05
        local isJumping = hum:GetState() == Enum.HumanoidStateType.Jumping
        local offset
        if isMoving or isJumping then
            local extra = math.clamp(speed / 1.5, 6, 15)
            offset = hrp.CFrame.LookVector * extra + Vector3.new(0, 1, 0)
        else
            local wave = math.sin(tick() * 25) * 4
            local side = math.cos(tick() * 20) * 1.5
            offset = Vector3.new(side, 1, wave)
        end
        pcall(function()
            soccerBall.CFrame = CFrame.new(hrp.Position + offset)
            soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
        end)
    end)
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dist = (soccerBall.Position - hrp.Position).Magnitude
        if dist < 4 and tick() - lastFlingTime > 0.4 then
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
            fling.Parent = hrp
            task.delay(0.3, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Barco --
local function flingWithBoat(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(-3359.52, -5.05, -501.94))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(0.4)
    args = { [1] = "PickingBoat", [2] = "MilitaryBoatFree" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1.5)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local boatName = LocalPlayer.Name .. "Car"
    local boat = vehiclesFolder:FindFirstChild(boatName)
    if not boat then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(-3358.85, 5.25, -521.95))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(boat:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local startTime = tick()
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            boat:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(boat:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            pcall(function()
                boat:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
            end)
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end
            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)
            if flingToggle then flingToggle:Set(false) end
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Lanzar con Camion --
local function flingWithTruck(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    -- Se teletransporta a la posicion inicial del autobus para invocar el camion.
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)
    -- Desactiva el cliente del vehiculo para evitar interferencias.
    disableCarClient()
    -- Eliminar cualquier vehiculo existente
    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    -- Invoca el camion (Semi) usando el comando dado
    args = { [1] = "PickingCar", [2] = "Semi" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    -- Encuentra el camion invocado
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local truckName = LocalPlayer.Name .. "Car"
    local truck = vehiclesFolder:FindFirstChild(truckName)
    if not truck then return end
    -- Se teletransporta al asiento del camion.
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1176.56, 79.90, -1166.65))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    -- Espera o jogador sentar no caminhão
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    -- Desactiva la colisión de piezas del camión y establece la propiedad de la red.
    for _, part in ipairs(truck:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    -- Inicia el proceso de lanzamiento
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)

    local startTime = tick()
    local lastFlingTime = 0
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        -- Encuentra la parte del Trailer para lanzar
        local trailer = truck:FindFirstChild("Body") and truck.Body:FindFirstChild("Trailer")
        if not trailer then return end
        -- Hace que el remolque se mueva hacia arriba y hacia abajo muy rápidamente.
        local verticalOffset = math.sin(tick() * 30) * 5 -- Oscila entre -5 y 5 unidades verticalmente, incluso más rápido.
        pcall(function()
            local targetPosition = newTargetHRP.Position + Vector3.new(0, verticalOffset, 0)
            trailer:PivotTo(CFrame.new(targetPosition)) -- Sólo movimiento vertical, sin rotación.
        end)
        -- Comprueba la distancia entre el remolque y el jugador objetivo para aplicar el lanzamiento.
        local dist = (trailer.Position - newTargetHRP.Position).Magnitude
        if dist < 5 and tick() - lastFlingTime > 0.4 then --Aplica el lanzamiento si el jugador está a menos de 5 unidades de distancia
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            -- Aplica un lanzamiento extremadamente fuerte.
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-10, 10), 50, math.random(-10, 10)).Unit * 10000000 + Vector3.new(0, 5000000, 0)
            fling.Parent = newTargetHRP
            task.delay(0.5, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
        -- Detiene el lanzamiento si el jugador objetivo está sentado, o después de 10 segundos.
        local playerSeated = false
        for _, seat in ipairs(truck:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end

        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            -- Teletransporta el camion a una posición fuera del mapa.
            pcall(function()
                truck:PivotTo(CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16)))
            end)
            task.wait(0.5)
            -- Limpieza: elimina el camion y reinicia al jugador.
            disableCarClient()
            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)

            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end

            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end

            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)

            if flingToggle then flingToggle:Set(false) end
        end
    end)
end
----------------------------------------------------------------------------------------------------
-- Stop All --
local function stopFling()
    running = false
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if flingConnection then
        flingConnection:Disconnect()
        flingConnection = nil
    end
    if soccerBall then
        soccerBall.Anchored = originalProperties.Anchored
        soccerBall.CanCollide = originalProperties.CanCollide
        soccerBall.CanTouch = originalProperties.CanTouch
    end
    if couch and couch:IsA("BasePart") then
        couch.Anchored = originalProperties.Anchored
        couch.CanCollide = originalProperties.CanCollide
        couch.CanTouch = originalProperties.CanTouch
    end

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(0.2)
    local character = LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
    end
    local myHumanoid = character and character:FindFirstChild("Humanoid")
    if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
    for _, seat in ipairs(Workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
    end
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
    end)
    if savedPosition then
        local myHRP = character and character:FindFirstChild("HumanoidRootPart")
        if myHRP then
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end)
        end
    end
end

flingToggle = Tab8:AddToggle({
    Name = "Lanzar jugador",
    Default = false,
    Callback = function(state)
        if state then
            if isFollowingKill or isFollowingPull or running then
                flingToggle:Set(false)
                return
            end
            if selectedFlingMethod == "Sofa" then
                flingWithSofa(selectedPlayer)
            elseif selectedFlingMethod == "Balon" then
                flingWithBall(selectedPlayer)
            elseif selectedFlingMethod == "Balon V2" then
                flingWithBallV2(selectedPlayer)
            elseif selectedFlingMethod == "Barco" then
                flingWithBoat(selectedPlayer)
            elseif selectedFlingMethod == "Camion" then
                flingWithTruck(selectedPlayer)
            elseif selectedFlingMethod == "Autobus" then
                flingWithBus(selectedPlayer)
            end
        else
            stopFling()
        end
    end
})
----------------------------------------------------------------------------------------------------
Tab8:AddSection({"Turn off everything before use"})

-- Variables globales al inicio de Tab2
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

orbitando = false
orbitConn = nil
allFling = false
allConn = nil
currentPlayerList = nil
currentPlayerIndex = nil
lastSwitchTime = nil
allFling2 = false
allConn2 = nil
soccerBall = nil
originalProperties = nil
excludedPlayers = {} -- Tabla para jugadores excluidos de los flings

-- Funcion auxiliar para obtener la foto de perfil del jugador
local function getPlayerThumbnail(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local success, result = pcall(function()
        return Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    end)
    if success then
        return result
    else
        warn("Error al obtener la miniatura: " .. tostring(result))
        return nil
    end
end

-- Funcion para buscar jugadores por parte del nombre
local function findPlayerByPartialName(partialName)
    partialName = partialName:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(partialName) then
            return plr
        end
    end
    return nil
end

-- Funcion para mostrar las notificaciones
local function showNotification(title, description, icon)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = description,
            Icon = icon or "",
            Duration = 5
        })
    end)
end

-- Cuadro de texto para eliminar un jugador
Tab8:AddTextBox({
    Name = "Añadir jugador a la lista blanca",
    Description = "Ingrese parte del nombre del jugador",
    PlaceholderText = "ej: Rou → Roun95",
    Callback = function(Value)
        if Value == "" then
            showNotification("Ninguna accion", "Introduzca un nombre para agregar un jugador.", nil)
            return
        end

        local player = findPlayerByPartialName(Value)
        if player then
            -- Comprueba si el jugador ya esta excluido
            for _, excluded in ipairs(excludedPlayers) do
                if excluded == player then
                    showNotification("El jugador ya está en la lista de espera", "Jugador " .. player.Name .. " ya se ha añadido.", getPlayerThumbnail(player.UserId))
                    return
                end
            end
            table.insert(excludedPlayers, player)
            local thumbnail = getPlayerThumbnail(player.UserId)
            showNotification("Jugador añadido", "Jugador " .. player.Name .. " fue removido.", thumbnail)
        else
            showNotification("Jugador no encontrado", "No se encontraron jugadores con '" .. Value .. "'.", nil)
        end
    end
})

Tab8:AddButton({"Verificar lista blanca", function()
    if #excludedPlayers == 0 then
        showNotification("Aviso", "Ningun jugador fue removido.", nil)
        return
    end
    for i, player in ipairs(excludedPlayers) do
        local thumbnail = getPlayerThumbnail(player.UserId)
        showNotification("Jugador añadido " .. i, "Jugador " .. player.Name .. " fue removido.", thumbnail)
        task.wait(0.5) -- Breve retraso entre notificaciones para evitar superposiciones
    end
end})

Tab8:AddButton({"Remover lista blanca", function()
    if #excludedPlayers == 0 then
        showNotification("Aviso", "Ningun jugador de la lista blanca fue removido.", nil)
        return
    end
    excludedPlayers = {}
    showNotification("Aviso", "Todos los jugadores de la lista blanca fueron removidos.", nil)
end})

Tab8:AddButton({"Orbiting Fling Ball", function()
    if orbitando then return end
    if not equipBall() then return end
    task.wait(0.5)
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    orbitando = true
    orbitConn = RunService.Heartbeat:Connect(function()
        if not orbitando or not soccerBall or not soccerBall.Parent or not myHRP or not myHRP.Parent or not character or not character.Parent then
            if orbitConn then
                orbitConn:Disconnect()
                orbitConn = nil
            end
            orbitando = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            return
        end
        local t = tick() * 10
        local radius = 5
        local offset = Vector3.new(math.cos(t) * radius, -1, math.sin(t) * radius)
        soccerBall.CFrame = CFrame.new(myHRP.Position + offset)
        soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
    end)
end})

Tab8:AddButton({"Fling All V1", function()
    if allFling then return end
    if not equipBall() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    allFling = true

    local function getShuffledPlayers()
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            local isExcluded = false
            for _, excluded in ipairs(excludedPlayers) do
                if plr == excluded then
                    isExcluded = true
                    break
                end
            end
            if plr ~= LocalPlayer and not isExcluded and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playerList, plr)
            end
        end
        for i = #playerList, 2, -1 do
            local j = math.random(i)
            playerList[i], playerList[j] = playerList[j], playerList[i]
        end
        return playerList
    end

    allConn = RunService.Heartbeat:Connect(function()
        if not allFling or not soccerBall or not soccerBall.Parent then
            if allConn then
                allConn:Disconnect()
                allConn = nil
            end
            allFling = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            currentPlayerList = nil
            currentPlayerIndex = nil
            lastSwitchTime = nil
            return
        end

        if not currentPlayerList or #currentPlayerList == 0 then
            currentPlayerList = getShuffledPlayers()
            currentPlayerIndex = 1
            lastSwitchTime = tick()
        end

        if #currentPlayerList == 0 then
            return
        end

        if tick() - lastSwitchTime >= 4 then
            currentPlayerIndex = currentPlayerIndex + 1
            if currentPlayerIndex > #currentPlayerList then
                currentPlayerList = getShuffledPlayers()
                currentPlayerIndex = 1
            end
            lastSwitchTime = tick()
        end

        local target = currentPlayerList[currentPlayerIndex]
        if not target or not target.Character then
            return
        end

        local targetChar = target.Character
        if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("Humanoid") then
            local hrp = targetChar.HumanoidRootPart
            local humanoid = targetChar.Humanoid
            local velocity = hrp.Velocity
            local speed = velocity.Magnitude
            local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
            local isMoving = humanoid.MoveDirection.Magnitude > 0.05
            local offset
            if isMoving or isJumping then
                local moveDir = hrp.CFrame.LookVector
                local extraDist = math.clamp(speed / 1.5, 6, 18)
                offset = moveDir * extraDist + Vector3.new(0, 1, 0)
            else
                local waveZ = math.sin(tick() * 25) * 4
                local sideX = math.cos(tick() * 20) * 1.5
                offset = Vector3.new(sideX, 1, waveZ)
            end
            soccerBall.CFrame = CFrame.new(hrp.Position + offset)
            soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
            if (soccerBall.Position - hrp.Position).Magnitude < 4 then
                local fling = Instance.new("BodyVelocity")
                fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
                fling.Parent = hrp
                task.delay(0.3, function()
                    fling:Destroy()
                end)
            end
        end
    end)
end})

Tab8:AddButton({"Fling All V2", function()
    if allFling2 then return end
    if not equipBall() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    allFling2 = true
    allConn2 = RunService.Heartbeat:Connect(function()
        if not allFling2 or not soccerBall or not soccerBall.Parent then
            if allConn2 then
                allConn2:Disconnect()
                allConn2 = nil
            end
            allFling2 = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            return
        end
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            local isExcluded = false
            for _, excluded in ipairs(excludedPlayers) do
                if plr == excluded then
                    isExcluded = true
                    break
                end
            end
            if plr ~= LocalPlayer and not isExcluded and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playerList, plr)
            end
        end
        for i = #playerList, 2, -1 do
            local j = math.random(i)
            playerList[i], playerList[j] = playerList[j], playerList[i]
        end
        for _, target in ipairs(playerList) do
            if not allFling2 then break end
            local targetChar = target.Character
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("Humanoid") then
                local hrp = targetChar.HumanoidRootPart
                local humanoid = targetChar.Humanoid
                local velocity = hrp.Velocity
                local speed = velocity.Magnitude
                local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
                local isMoving = humanoid.MoveDirection.Magnitude > 0.05
                local offset
                if isMoving or isJumping then
                    local moveDir = hrp.CFrame.LookVector
                    local extraDist = math.clamp(speed / 1.5, 6, 18)
                    offset = moveDir * extraDist + Vector3.new(0, 1, 0)
                else
                    local waveZ = math.sin(tick() * 25) * 4
                    local sideX = math.cos(tick() * 20) * 1.5
                    offset = Vector3.new(sideX, 1, waveZ)
                end
                soccerBall.CFrame = CFrame.new(hrp.Position + offset)
                soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
                if (soccerBall.Position - hrp.Position).Magnitude < 4 then
                    local fling = Instance.new("BodyVelocity")
                    fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
                    fling.Parent = hrp
                    task.delay(0.3, function()
                        fling:Destroy()
                    end)
                end
            end
            task.wait(0.1)
        end
    end)
end})
-- Parar todo
Tab8:AddButton({"Parar todo", function()
    -- Parar Orbitando
    orbitando = false
    if orbitConn then
        orbitConn:Disconnect()
        orbitConn = nil
    end
    -- Parar Fling ALL V1
    allFling = false
    if allConn then
        allConn:Disconnect()
        allConn = nil
    end
    currentPlayerList = nil
    currentPlayerIndex = nil
    lastSwitchTime = nil
    -- Parar Fling ALL V2
    allFling2 = false
    if allConn2 then
        allConn2:Disconnect()
        allConn2 = nil
    end
    -- Restaurar las propiedades del balon
    if soccerBall and originalProperties then
        soccerBall.Anchored = originalProperties.Anchored
        soccerBall.CanCollide = originalProperties.CanCollide
        soccerBall.CanTouch = originalProperties.CanTouch
    end
    soccerBall = nil
    originalProperties = nil
    showNotification("Aviso", "Se han desactivado todas las funciones.", nil)
end})
----------------------------------------------------------------------------------------------------
                                	-- === Tab8: Troll === --
----------------------------------------------------------------------------------------------------
Tab8:AddSection({"》 Troll Scripts"})

Tab8:AddButton({
    Name = "Bring parts",
    Callback = function()
local Gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local Main = Instance.new("Frame")
local Box = Instance.new("TextBox")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local Label = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local Button = Instance.new("TextButton")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")

pcall(function() game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("BringParts"):Destroy() end)

Gui.Name = "BringParts"
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(75,75,75)
Main.BorderColor3 = Color3.fromRGB(0,0,0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.3,0,0.5,0)
Main.Size = UDim2.new(0.24,0,0.17,0)
Main.Active = true
Main.Draggable = true

Box.Name = "Box"
Box.Parent = Main
Box.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
Box.BorderSizePixel = 0
Box.Position = UDim2.new(0.1, 0, 0.22, 0)
Box.Size = UDim2.new(0.8, 0, 0.365, 0)
Box.Font = Enum.Font.SourceSansSemibold
Box.PlaceholderText = "Player here"
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.TextScaled = true
Box.TextSize = 30
Box.TextWrapped = true
UITextSizeConstraint.Parent = Box
UITextSizeConstraint.MaxTextSize = 30

Label.Name = "Label"
Label.Parent = Main
Label.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Size = UDim2.new(1, 0, 0.16, 0)
Label.Font = Enum.Font.Nunito
Label.Text = "Bring Parts | by Roun95"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextScaled = true
Label.TextSize = 14
Label.TextWrapped = true
UITextSizeConstraint_2.Parent = Label
UITextSizeConstraint_2.MaxTextSize = 21

Button.Name = "Button"
Button.Parent = Main
Button.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.18, 0, 0.65, 0)
Button.Size = UDim2.new(0.63, 0, 0.27, 0)
Button.Font = Enum.Font.Nunito
Button.Text = "Bring | Off"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.TextSize = 28
Button.TextWrapped = true

UITextSizeConstraint_3.Parent = Button
UITextSizeConstraint_3.MaxTextSize = 28

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local character
local humanoidRootPart

mainStatus = true
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessedEvent then
		mainStatus = not mainStatus
		Main.Visible = mainStatus
	end
end)

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
	getgenv().Network = {
		BaseParts = {},
		Velocity = Vector3.new(14, 14, 14)
	}

	Network.RetainPart = function(Part)
		if Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
			table.insert(Network.BaseParts, Part)
			Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
			Part.CanCollide = false
		end
	end

	local function EnablePartControl()
		LocalPlayer.ReplicationFocus = Workspace
		RunService.Heartbeat:Connect(function()
			sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
			for _, Part in pairs(Network.BaseParts) do
				if Part:IsDescendantOf(Workspace) then
					Part.Velocity = Network.Velocity
				end
			end
		end)
	end
	EnablePartControl()
end

local function ForcePart(v)
	if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
		for _, x in ipairs(v:GetChildren()) do
			if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then
				x:Destroy()
			end
		end
		if v:FindFirstChild("Attachment") then
			v:FindFirstChild("Attachment"):Destroy()
		end
		if v:FindFirstChild("AlignPosition") then
			v:FindFirstChild("AlignPosition"):Destroy()
		end
		if v:FindFirstChild("Torque") then
			v:FindFirstChild("Torque"):Destroy()
		end
		v.CanCollide = false
		local Torque = Instance.new("Torque", v)
		Torque.Torque = Vector3.new(100000, 100000, 100000)
		local AlignPosition = Instance.new("AlignPosition", v)
		local Attachment2 = Instance.new("Attachment", v)
		Torque.Attachment0 = Attachment2
		AlignPosition.MaxForce = math.huge
		AlignPosition.MaxVelocity = math.huge
		AlignPosition.Responsiveness = 200
		AlignPosition.Attachment0 = Attachment2
		AlignPosition.Attachment1 = Attachment1
	end
end

local blackHoleActive = false
local DescendantAddedConnection

local function toggleBlackHole()
	blackHoleActive = not blackHoleActive
	if blackHoleActive then
		Button.Text = "Bring Parts | On"
		for _, v in ipairs(Workspace:GetDescendants()) do
			ForcePart(v)
		end

		DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v)
			if blackHoleActive then
				ForcePart(v)
			end
		end)

		spawn(function()
			while blackHoleActive and RunService.RenderStepped:Wait() do
				Attachment1.WorldCFrame = humanoidRootPart.CFrame
			end
		end)
	else
		Button.Text = "Bring Parts | Off"
		if DescendantAddedConnection then
			DescendantAddedConnection:Disconnect()
		end
	end
end

local function getPlayer(name)
	local lowerName = string.lower(name)
	for _, p in pairs(Players:GetPlayers()) do
		local lowerPlayer = string.lower(p.Name)
		if string.find(lowerPlayer, lowerName) then
			return p
		elseif string.find(string.lower(p.DisplayName), lowerName) then
			return p
		end
	end
end

local player = nil

local function SearchPlayer()
	local script = Instance.new('Script', Box)

	script.Parent.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			player = getPlayer(Box.Text)
			if player then
				Box.Text = player.Name
				print("Player found:", player.Name)
			else
				print("Player not found")
			end
		end
	end)
end
coroutine.wrap(SearchPlayer)()
local function SelectPlayer()
	local script = Instance.new('Script', Button)

	script.Parent.MouseButton1Click:Connect(function()
		if player then
			character = player.Character or player.CharacterAdded:Wait()
			humanoidRootPart = character:WaitForChild("HumanoidRootPart")
			toggleBlackHole()
		else
			print("Player is not selected")
		end
	end)
end
coroutine.wrap(SelectPlayer)()
	end
})

Tab8:AddButton({
    Name = "(+18) Jerk off",
    Callback = function()
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChild("Humanoid") or char:WaitForChild("Humanoid")
local anim = hum:FindFirstChildOfClass("Animator") or hum:WaitForChild("Animator")
local pack = plr:FindFirstChild("Backpack") or plr:WaitForChild("Backpack")

if workspace:FindFirstChild("aaa") then
	workspace:FindFirstChild("aaa"):Destroy()
end

local function getmodel()
	return hum.RigType == Enum.HumanoidRigType.R15 and "R15" or "R6"
end

local animation = Instance.new("Animation")
animation.Name = "aaa"
animation.Parent = workspace

animation.AnimationId = getmodel() == "R15" and "rbxassetid://698251653" or "rbxassetid://72042024"

local tool = Instance.new("Tool")
tool.Name = "Jerk"
tool.RequiresHandle = false
tool.Parent = pack

local doing = false
local animtrack = nil

tool.Equipped:Connect(function()
	doing = true
	while doing do
		if not animtrack then
			animtrack = anim:LoadAnimation(animation)
		end

		animtrack:Play()
		animtrack:AdjustSpeed(0.7)
		animtrack.TimePosition = 0.6

		task.wait(0.1)
		while doing and animtrack and animtrack.TimePosition < 0.7 do
			task.wait(0.05)
		end

		if animtrack then
			animtrack:Stop()
			animtrack:Destroy()
			animtrack = nil
		end
	end
end)

tool.Unequipped:Connect(function()
	doing = false
	if animtrack then
		animtrack:Stop()
		animtrack:Destroy()
		animtrack = nil
	end
end)

hum.Died:Connect(function()
	doing = false
	if animtrack then
		animtrack:Stop()
		animtrack:Destroy()
		animtrack = nil
	end
end)
	end
})

Tab8:AddSection({"》 OP Command"})

Tab8:AddButton({
    Name = "Annoy server",
    Callback = function()
        local RE = ReplicatedStorage:WaitForChild("RE")
        local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
        local ToolEvent = RE:FindFirstChild("1Too1l")
        local FireEvent = RE:FindFirstChild("1Gu1n")

        local function clearAllTools()
            if ClearEvent then
                ClearEvent:FireServer("ClearAllTools")
            end
        end
        local function getAssault()
            if ToolEvent then
                ToolEvent:InvokeServer("PickingTools", "Assault")
            end
        end
        local function hasAssault()
            return LocalPlayer.Backpack:FindFirstChild("Assault") ~= nil
        end
        local function fireAtPart(targetPart)
            local gunScript = LocalPlayer.Backpack:FindFirstChild("Assault")
                and LocalPlayer.Backpack.Assault:FindFirstChild("GunScript_Local")
            if not gunScript or not targetPart then return end
            local args = {
                targetPart,
                targetPart,
                Vector3.new(9e16, 9e16, 9e16),
                targetPart.Position,
                gunScript:FindFirstChild("MuzzleEffect"),
                gunScript:FindFirstChild("HitEffect"),
                0,
                0,
                { false },
                {
                    25,
                    Vector3.new(1000, 1000, 1000),
                    BrickColor.new(29),
                    0.25,
                    Enum.Material.SmoothPlastic,
                    0.25
                },
                true,
                false
            }
            FireEvent:FireServer(unpack(args))
        end
        local function fireAtAllPlayers(times)
            for i = 1, times do
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        fireAtPart(player.Character.HumanoidRootPart)
                        task.wait(0.1)
                    end
                end
            end
        end
        task.spawn(function()
            while true do
                clearAllTools()
                getAssault()
                repeat
                    task.wait(0.2)
                until hasAssault()
                fireAtAllPlayers(3)
                task.wait(1)
            end
        end)
    end
})
----------------------------------------------------------------------------------------------------
                                	-- === Tab9: Teleportes === --
----------------------------------------------------------------------------------------------------
Tab9:AddSection({"》 Brookhaven Sites"})

local sites = {
    {"Hill", CFrame.new(-348.64, 65.94, -458.08)},
    {"Start", CFrame.new(-26.17, 3.48, -0.93)},
    {"Hotel", CFrame.new(159.10, 3.32, 164.97)},
    {"Beach", CFrame.new(55.69, 2.94, -1403.60)},
    {"Beach2", CFrame.new(42.39, 2.94, 1336.14)},
    {"Farm", CFrame.new(-766.41, 2.92, -61.10)}
}
for _, btn in ipairs(sites) do
    Tab9:AddButton({
        btn[1],
        function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = btn[2]
        end
    })
end
----------------------------------------------------------------------------------------------------
                                	-- === Tab10: Scripts === --
----------------------------------------------------------------------------------------------------
Tab10:AddSection({"》 Scripts"})

Tab10:AddButton({
    Name = "Virtual keyboard",
    Callback = function()
local function ClonedService(name)
    local Service = (game.GetService);
	local Reference = (cloneref) or function(reference) return reference end
	return Reference(Service(game, name));
end

local UIS = ClonedService("UserInputService")
local GuiS = ClonedService("GuiService")
local VIM = ClonedService("VirtualInputManager")
local TS = ClonedService("TextService")

local function protectUI(sGui)
    if sGui:IsA("ScreenGui") then
        sGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
		sGui.DisplayOrder = 999999999
		sGui.ResetOnSpawn = false
		sGui.IgnoreGuiInset = true
    end
    local cGUI = ClonedService("CoreGui")
    local lPlr = ClonedService("Players").LocalPlayer

    local function NAProtection(inst, var)
        if inst then
            if var then
                inst[var] = "\0"
                inst.Archivable = false
            else
                inst.Name = "\0"
                inst.Archivable = false
            end
        end
    end

    if gethui then
		NAProtection(sGui)
		sGui.Parent = gethui()
		return sGui
	elseif cGUI and cGUI:FindFirstChild("RobloxGui") then
		NAProtection(sGui)
		sGui.Parent = cGUI:FindFirstChild("RobloxGui")
		return sGui
	elseif cGUI then
		NAProtection(sGui)
		sGui.Parent = cGUI
		return sGui
	elseif lPlr and lPlr:FindFirstChildWhichIsA("PlayerGui") then
		NAProtection(sGui)
		sGui.Parent = lPlr:FindFirstChildWhichIsA("PlayerGui")
		sGui.ResetOnSpawn = false
		return sGui
	else
		return nil
	end
end

local themes = {
	Dark = {Bg = Color3.fromRGB(40, 40, 40), Btn = Color3.fromRGB(60, 60, 60), Acc = Color3.fromRGB(60, 180, 60), Txt = Color3.fromRGB(255, 255, 255)},
	Light = {Bg = Color3.fromRGB(245, 245, 245), Btn = Color3.fromRGB(220, 220, 220), Acc = Color3.fromRGB(100, 200, 255), Txt = Color3.fromRGB(0, 0, 0)},
	Red = {Bg = Color3.fromRGB(60, 0, 0), Btn = Color3.fromRGB(100, 0, 0), Acc = Color3.fromRGB(200, 30, 30), Txt = Color3.fromRGB(255, 255, 255)},
	Green = {Bg = Color3.fromRGB(0, 60, 0), Btn = Color3.fromRGB(0, 100, 0), Acc = Color3.fromRGB(50, 200, 50), Txt = Color3.fromRGB(255, 255, 255)},
	Blue = {Bg = Color3.fromRGB(0, 0, 60), Btn = Color3.fromRGB(0, 0, 100), Acc = Color3.fromRGB(50, 100, 255), Txt = Color3.fromRGB(255, 255, 255)},
	Yellow = {Bg = Color3.fromRGB(100, 100, 0), Btn = Color3.fromRGB(180, 180, 0), Acc = Color3.fromRGB(255, 255, 50), Txt = Color3.fromRGB(0, 0, 0)},
	Orange = {Bg = Color3.fromRGB(100, 50, 0), Btn = Color3.fromRGB(160, 80, 0), Acc = Color3.fromRGB(255, 140, 0), Txt = Color3.fromRGB(255, 255, 255)},
	Purple = {Bg = Color3.fromRGB(50, 0, 100), Btn = Color3.fromRGB(80, 0, 160), Acc = Color3.fromRGB(180, 50, 255), Txt = Color3.fromRGB(255, 255, 255)},
	Pink = {Bg = Color3.fromRGB(100, 0, 60), Btn = Color3.fromRGB(180, 0, 100), Acc = Color3.fromRGB(255, 105, 180), Txt = Color3.fromRGB(255, 255, 255)},
	Teal = {Bg = Color3.fromRGB(0, 60, 60), Btn = Color3.fromRGB(0, 100, 100), Acc = Color3.fromRGB(0, 200, 200), Txt = Color3.fromRGB(255, 255, 255)},
	Cyan = {Bg = Color3.fromRGB(0, 100, 100), Btn = Color3.fromRGB(0, 150, 150), Acc = Color3.fromRGB(0, 255, 255), Txt = Color3.fromRGB(0, 0, 0)},
	Indigo = {Bg = Color3.fromRGB(40, 0, 80), Btn = Color3.fromRGB(60, 0, 120), Acc = Color3.fromRGB(90, 70, 255), Txt = Color3.fromRGB(255, 255, 255)},
	Lime = {Bg = Color3.fromRGB(80, 100, 0), Btn = Color3.fromRGB(120, 180, 0), Acc = Color3.fromRGB(180, 255, 0), Txt = Color3.fromRGB(0, 0, 0)},
	Magenta = {Bg = Color3.fromRGB(80, 0, 80), Btn = Color3.fromRGB(140, 0, 140), Acc = Color3.fromRGB(255, 0, 255), Txt = Color3.fromRGB(255, 255, 255)},
	Maroon = {Bg = Color3.fromRGB(80, 0, 0), Btn = Color3.fromRGB(120, 0, 0), Acc = Color3.fromRGB(180, 20, 20), Txt = Color3.fromRGB(255, 255, 255)},
	Navy = {Bg = Color3.fromRGB(0, 0, 60), Btn = Color3.fromRGB(0, 0, 100), Acc = Color3.fromRGB(0, 0, 180), Txt = Color3.fromRGB(255, 255, 255)},
	Olive = {Bg = Color3.fromRGB(80, 80, 0), Btn = Color3.fromRGB(100, 100, 20), Acc = Color3.fromRGB(160, 160, 60), Txt = Color3.fromRGB(0, 0, 0)},
	Brown = {Bg = Color3.fromRGB(60, 30, 0), Btn = Color3.fromRGB(100, 50, 0), Acc = Color3.fromRGB(160, 80, 20), Txt = Color3.fromRGB(255, 255, 255)},
	Silver = {Bg = Color3.fromRGB(200, 200, 200), Btn = Color3.fromRGB(230, 230, 230), Acc = Color3.fromRGB(255, 255, 255), Txt = Color3.fromRGB(0, 0, 0)}
}

local gui = Instance.new("ScreenGui")
gui.Name = "VKB"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
protectUI(gui)

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 650, 0, 250)
Main.Position = UDim2.new(0.5, -325, 0.8, -125)
Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Main.BorderSizePixel = 0
Main.Parent = gui

local c1 = Instance.new("UICorner")
c1.CornerRadius = UDim.new(0, 10)
c1.Parent = Main

local Title = Instance.new("Frame")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Title.BorderSizePixel = 0
Title.Parent = Main

local c2 = Instance.new("UICorner")
c2.CornerRadius = UDim.new(0, 10)
c2.Parent = Title

local TLabel = Instance.new("TextLabel")
TLabel.Size = UDim2.new(1, -200, 1, 0)
TLabel.Position = UDim2.new(0, 10, 0, 0)
TLabel.BackgroundTransparency = 1
TLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TLabel.TextSize = 16
TLabel.Font = Enum.Font.SourceSansBold
TLabel.Text = "Virtual Keyboard"
TLabel.TextXAlignment = Enum.TextXAlignment.Left
TLabel.Parent = Title

local Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Size = UDim2.new(0, 40, 0, 25)
Close.Position = UDim2.new(1, -85, 0, 2.5)
Close.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.Text = "X"
Close.TextSize = 16
Close.Font = Enum.Font.SourceSansBold
Close.Parent = Title
local c3 = Instance.new("UICorner")
c3.CornerRadius = UDim.new(0, 5)
c3.Parent = Close

local AddBTN = Instance.new("TextButton")
AddBTN.Name = "Add"
AddBTN.Size = UDim2.new(0, 40, 0, 25)
AddBTN.Position = UDim2.new(1, -45, 0, 2.5)
AddBTN.BackgroundColor3 = Color3.fromRGB(60, 180, 60)
AddBTN.TextColor3 = Color3.fromRGB(255, 255, 255)
AddBTN.Text = "+"
AddBTN.TextSize = 16
AddBTN.Font = Enum.Font.SourceSansBold
AddBTN.Parent = Title
local c4 = Instance.new("UICorner")
c4.CornerRadius = UDim.new(0, 5)
c4.Parent = AddBTN

local ThemeBtn = Instance.new("TextButton")
ThemeBtn.Name = "Theme"
ThemeBtn.Size = UDim2.new(0, 80, 0, 25)
ThemeBtn.Position = UDim2.new(1, -170, 0, 2.5)
ThemeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ThemeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ThemeBtn.Text = "Dark"
ThemeBtn.TextSize = 14
ThemeBtn.Font = Enum.Font.SourceSansBold
ThemeBtn.Parent = Title
local c5 = Instance.new("UICorner")
c5.CornerRadius = UDim.new(0, 5)
c5.Parent = ThemeBtn

local Keys = Instance.new("Frame")
Keys.Name = "Keys"
Keys.Size = UDim2.new(1, -20, 1, -40)
Keys.Position = UDim2.new(0, 10, 0, 35)
Keys.BackgroundTransparency = 1
Keys.Parent = Main

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Position = UDim2.new(0, 20, 0.5, -25)
Toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.Text = "⌨️"
Toggle.TextSize = 20
Toggle.Font = Enum.Font.SourceSansBold
Toggle.Parent = gui
local c6 = Instance.new("UICorner")
c6.CornerRadius = UDim.new(0, 10)
c6.Parent = Toggle

local function applyTheme(name)
	local t = themes[name]
	if not t then return end
	Main.BackgroundColor3 = t.Bg
	Title.BackgroundColor3 = t.Btn
	Keys.BackgroundColor3 = t.Bg
	Toggle.BackgroundColor3 = t.Btn
	AddBTN.BackgroundColor3 = isSel and t.Acc or t.Btn
	Close.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
	ThemeBtn.BackgroundColor3 = t.Btn
	TLabel.TextColor3 = t.Txt
	AddBTN.TextColor3 = t.Txt
	Close.TextColor3 = t.Txt
	Toggle.TextColor3 = t.Txt
	ThemeBtn.TextColor3 = t.Txt
	for _, k in ipairs(Keys:GetChildren()) do
		if k:IsA("TextButton") then
			k.BackgroundColor3 = t.Btn
			k.TextColor3 = t.Txt
		end
	end
end

ThemeBtn.MouseButton1Click:Connect(function()
	local opts = {
		"Dark", "Light", "Red", "Green", "Blue", "Yellow", "Orange", "Purple", "Pink",
		"Teal", "Cyan", "Indigo", "Lime", "Magenta", "Maroon", "Navy", "Olive", "Brown", "Silver"
	}
	local idx = table.find(opts, ThemeBtn.Text) or 1
	local next = opts[idx % #opts + 1]
	ThemeBtn.Text = next
	applyTheme(next)
end)

applyTheme("Dark")

local keyboardLayout = {
    {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "=", "Backspace"},
    {"Tab", "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "[", "]", "\\"},
    {"Caps", "A", "S", "D", "F", "G", "H", "J", "K", "L", ";", "'", "Enter"},
    {"Shift", "Z", "X", "C", "V", "B", "N", "M", ",", ".", "/", "Shift"},
    {"Ctrl", "Win", "Alt", "Space", "Alt", "Fn", "Ctrl"}
}

local keyToEnum = {
    ["1"] = Enum.KeyCode.One,
    ["2"] = Enum.KeyCode.Two,
    ["3"] = Enum.KeyCode.Three,
    ["4"] = Enum.KeyCode.Four,
    ["5"] = Enum.KeyCode.Five,
    ["6"] = Enum.KeyCode.Six,
    ["7"] = Enum.KeyCode.Seven,
    ["8"] = Enum.KeyCode.Eight,
    ["9"] = Enum.KeyCode.Nine,
    ["0"] = Enum.KeyCode.Zero,
    ["-"] = Enum.KeyCode.Minus,
    ["="] = Enum.KeyCode.Equals,
    ["Backspace"] = Enum.KeyCode.Backspace,
    ["Tab"] = Enum.KeyCode.Tab,
    ["Q"] = Enum.KeyCode.Q,
    ["W"] = Enum.KeyCode.W,
    ["E"] = Enum.KeyCode.E,
    ["R"] = Enum.KeyCode.R,
    ["T"] = Enum.KeyCode.T,
    ["Y"] = Enum.KeyCode.Y,
    ["U"] = Enum.KeyCode.U,
    ["I"] = Enum.KeyCode.I,
    ["O"] = Enum.KeyCode.O,
    ["P"] = Enum.KeyCode.P,
    ["["] = Enum.KeyCode.LeftBracket,
    ["]"] = Enum.KeyCode.RightBracket,
    ["\\"] = Enum.KeyCode.BackSlash,
    ["Caps"] = Enum.KeyCode.CapsLock,
    ["A"] = Enum.KeyCode.A,
    ["S"] = Enum.KeyCode.S,
    ["D"] = Enum.KeyCode.D,
    ["F"] = Enum.KeyCode.F,
    ["G"] = Enum.KeyCode.G,
    ["H"] = Enum.KeyCode.H,
    ["J"] = Enum.KeyCode.J,
    ["K"] = Enum.KeyCode.K,
    ["L"] = Enum.KeyCode.L,
    [";"] = Enum.KeyCode.Semicolon,
    ["'"] = Enum.KeyCode.Quote,
    ["Enter"] = Enum.KeyCode.Return,
    ["Shift"] = Enum.KeyCode.LeftShift,
    ["Z"] = Enum.KeyCode.Z,
    ["X"] = Enum.KeyCode.X,
    ["C"] = Enum.KeyCode.C,
    ["V"] = Enum.KeyCode.V,
    ["B"] = Enum.KeyCode.B,
    ["N"] = Enum.KeyCode.N,
    ["M"] = Enum.KeyCode.M,
    [","] = Enum.KeyCode.Comma,
    ["."] = Enum.KeyCode.Period,
    ["/"] = Enum.KeyCode.Slash,
    ["Ctrl"] = Enum.KeyCode.LeftControl,
    ["Win"] = Enum.KeyCode.LeftMeta,
    ["Alt"] = Enum.KeyCode.LeftAlt,
    ["Space"] = Enum.KeyCode.Space,
    ["Fn"] = Enum.KeyCode.F1
}

local specialKeySizes = {
    ["Backspace"] = 2,
    ["Tab"] = 1.5,
    ["Caps"] = 1.75,
    ["Enter"] = 1.75,
    ["Shift"] = 2.25,
    ["Ctrl"] = 1.5,
    ["Win"] = 1.25,
    ["Alt"] = 1.25,
    ["Space"] = 6,
    ["Fn"] = 1.25
}

local function createKey(text, row, col, width)
    local key = Instance.new("TextButton")
    key.Name = "Key_"..text
    key.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    key.BorderSizePixel = 0
    key.TextColor3 = Color3.fromRGB(255, 255, 255)
    key.Text = text
    key.TextSize = 16
    key.Font = Enum.Font.SourceSans
    key.AutoButtonColor = true

    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 5)
    keyCorner.Parent = key

    local isHolding = false
    local keyCode = keyToEnum[text]

    key.MouseButton1Down:Connect(function()
        key.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        isHolding = true

        if keyCode then
            VIM:SendKeyEvent(true, keyCode, false, game)
        end
    end)

    key.MouseButton1Up:Connect(function()
        key.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        isHolding = false

        if keyCode then
            VIM:SendKeyEvent(false, keyCode, false, game)
        end
    end)

    key.MouseLeave:Connect(function()
        if isHolding and keyCode then
            VIM:SendKeyEvent(false, keyCode, false, game)
            isHolding = false
            key.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end
    end)

    return key
end

local rowHeight = 1 / #keyboardLayout
local currentY = 0

for rowIndex, row in ipairs(keyboardLayout) do
    local totalWidth = 0
    for _, key in ipairs(row) do
        totalWidth = totalWidth + (specialKeySizes[key] or 1)
    end

    local currentX = 0
    for keyIndex, keyText in ipairs(row) do
        local keyWidth = specialKeySizes[keyText] or 1
        local relativeWidth = keyWidth / totalWidth

        local key = createKey(keyText, rowIndex, keyIndex, keyWidth)
        key.Size = UDim2.new(relativeWidth, -2, rowHeight, -2)
        key.Position = UDim2.new(currentX, 1, currentY, 1)
        key.Parent = Keys

        currentX = currentX + relativeWidth
    end

    currentY = currentY + rowHeight
end

local function makeDraggable(frame, handle)
    local isDragging = false
    local dragInput
    local dragStart
    local startPos

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    isDragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and isDragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

makeDraggable(Main, Title)
makeDraggable(Toggle, Toggle)

local isSelectionMode = false

AddBTN.MouseButton1Click:Connect(function()
    isSelectionMode = not isSelectionMode
    AddBTN.BackgroundColor3 = isSelectionMode and Color3.fromRGB(180, 60, 60) or Color3.fromRGB(60, 180, 60)
end)

local function createFloatingKey(text)
	local sz = TS:GetTextSize(text, 20, Enum.Font.SourceSansBold, Vector2.new(math.huge, math.huge))

	local btn = Instance.new("TextButton")
	btn.Name = "FloatingKey_" .. text
	btn.Size = UDim2.new(0, sz.X + 20, 0, sz.Y + 20)
	btn.Position = UDim2.new(0.5, -((sz.X + 20) / 2), 0.5, -((sz.Y + 20) / 2))
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Text = text
	btn.TextSize = 20
	btn.Font = Enum.Font.SourceSansBold
	btn.Parent = gui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = btn

	local remove = Instance.new("TextButton")
	remove.Name = "Remove"
	remove.Size = UDim2.new(0, 20, 0, 20)
	remove.Position = UDim2.new(1, -25, 0, -5)
	remove.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
	remove.Text = "X"
	remove.TextColor3 = Color3.fromRGB(255, 255, 255)
	remove.TextSize = 16
	remove.Font = Enum.Font.SourceSansBold
	remove.Parent = btn

	local rCorner = Instance.new("UICorner")
	rCorner.CornerRadius = UDim.new(0, 10)
	rCorner.Parent = remove

	local isDown = false
	local keyCode = keyToEnum[text]

	btn.MouseButton1Down:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		isDown = true
		if keyCode then VIM:SendKeyEvent(true, keyCode, false, game) end
	end)

	btn.MouseButton1Up:Connect(function()
		btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		isDown = false
		if keyCode then VIM:SendKeyEvent(false, keyCode, false, game) end
	end)

	btn.MouseLeave:Connect(function()
		if isDown and keyCode then
			VIM:SendKeyEvent(false, keyCode, false, game)
			btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			isDown = false
		end
	end)

	remove.MouseButton1Click:Connect(function()
		btn:Destroy()
	end)

	makeDraggable(btn, btn)
end

for _, key in ipairs(Keys:GetChildren()) do
    if key:IsA("TextButton") then
        key.MouseButton1Click:Connect(function()
            if isSelectionMode then
                createFloatingKey(key.Text)
                isSelectionMode = false
                AddBTN.BackgroundColor3 = Color3.fromRGB(60, 180, 60)
            end
        end)
    end
end

Close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.BackgroundColor3 = Main.Visible and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 60, 60)
end)

UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F2 then
        Main.Visible = not Main.Visible
        Toggle.BackgroundColor3 = Main.Visible and Color3.fromRGB(80, 180, 80) or Color3.fromRGB(60, 60, 60)
    end
end)
	end
})

Tab10:AddButton({
    Name = "Shift lock",
    Callback = function()
local Player = game.Players.LocalPlayer
local cam = workspace.CurrentCamera
local humanoid
local shiftLocked = false

pcall(function() game.CoreGui:FindFirstChild("ShiftLock"):Destroy() end)

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ShiftLock"
gui.ResetOnSpawn = false
local button = Instance.new("ImageButton", gui)
button.Size = UDim2.new(0,35,0,35)
button.Position = UDim2.new(0.8,0,0.8,0)
button.BackgroundTransparency = 1
button.Image = "rbxassetid://105987953182009"

local function applyShiftLock(enabled)
	if humanoid then if enabled then
			humanoid.CameraOffset = Vector3.new(1,0,0)
			button.ImageColor3 = Color3.fromRGB(0,170,255)
			cam.CameraSubject = humanoid
			humanoid.AutoRotate = false
		else
			humanoid.CameraOffset = Vector3.new(0,0,0)
			button.ImageColor3 = Color3.fromRGB(255,255,255)
			humanoid.AutoRotate = true
		end
	end
end

local function toggle()
	shiftLocked = not shiftLocked
	applyShiftLock(shiftLocked)
end
button.MouseButton1Click:Connect(toggle)
Player.CharacterAdded:Connect(function(char)
	humanoid = char:WaitForChild("Humanoid")
	if shiftLocked then
		applyShiftLock(true)
	end
end)
if Player.Character then
	humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
end
game:GetService("RunService").RenderStepped:Connect(function()
	if shiftLocked and humanoid and humanoid.RootPart then
		local lookVector = cam.CFrame.LookVector
		local flatLook = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
		humanoid.RootPart.CFrame = CFrame.new(humanoid.RootPart.Position, humanoid.RootPart.Position + flatLook)
	end

end)
	end
})

Tab10:AddButton({
    Name = "Silly Emotes",
    Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Silly%20emote"))()
	end
})
----------------------------------------------------------------------------------------------------
                                	-- === Tab11: Graphics === --
----------------------------------------------------------------------------------------------------
Tab11:AddSection({"》 Optimization"})

Tab11:AddButton({
    Name = "Fps boost",
    Callback = function()
local decalsyeeted = true
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 1
l.GlobalShadows = false
l.Brightness = 0
l.FogEnd = 9e9
l.FogStart = 9e9
l.ShadowSoftness = 0
settings().Rendering.QualityLevel = "Level01"
settings().Rendering.ReloadAssets = false
settings().Physics.AllowSleep = true
settings().Rendering.EagerBulkExecution = false
settings().Rendering.TextureQuality = Enum.TextureQuality.Low
for i, v in pairs(g:GetDescendants()) do
	if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
            v.Material = "Plastic"
            v.Reflectance = 0
			v.BackSurface = "SmoothNoOutlines"
			v.BottomSurface = "SmoothNoOutlines"
			v.FrontSurface = "SmoothNoOutlines"
			v.LeftSurface = "SmoothNoOutlines"
			v.RightSurface = "SmoothNoOutlines"
			v.TopSurface = "SmoothNoOutlines"
        elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("Beam") then
            v.Enabled = false
        end
    end
    for i, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") or e:IsA("PostEffect") then
            e.Enabled = false
        end
	w.DescendantAdded:Connect(function(child)
		task.spawn(function()
			if child:IsA('ForceField') or child:IsA('Sparkles') or child:IsA('Smoke') or child:IsA('Fire') or child:IsA('Beam') then
				g.RunService.Heartbeat:Wait()
				child:Destroy()
			end
		end)
	end)
    end
	end
})
Tab11:AddSection({"》 Graphics"})

Tab11:AddButton({
    Name = "Shaders",
    Callback = function()
local l = game.Lighting
local s = Instance.new("Sky", l)
local c = Instance.new("ColorCorrectionEffect", l)
local b = Instance.new("BloomEffect", l)
local sr = Instance.new("SunRaysEffect", l)
local bl = Instance.new("BlurEffect", l)
local model = game.Workspace:FindFirstChild("Model")
if model then
	local function setMat(obj)
		for _, c in pairs(obj:GetChildren()) do
			if c:IsA("BasePart") then
				c.Material = Enum.Material.Basalt
			elseif c:IsA("Model") or c:IsA("Folder") then
				setMat(c)
			end
		end
	end
	if model:FindFirstChild("001_SnowStreet") then
		setMat(model["001_SnowStreet"])
	end
	if model:FindFirstChild("Street") then
		for _, o in pairs(model.Street:GetDescendants()) do
			if o:IsA("BasePart") then
				o.Material = Enum.Material.Basalt
			end
		end
	end
	for _, o in pairs(model:GetChildren()) do
		if o:IsA("BasePart") and (o.Name == "Sidewalk" or o.Name == "Wedge") and o.Material == Enum.Material.SmoothPlastic then
			o.Material = Enum.Material.Cobblestone
		end
	end
	model.ChildAdded:Connect(function(obj)
		if obj:IsA("BasePart") and (obj.Name == "Sidewalk" or obj.Name == "Wedge") and obj.Material == Enum.Material.SmoothPlastic then
			obj.Material = Enum.Material.Cobblestone
		end
	end)
end
l.Ambient = Color3.fromRGB(60, 60, 60)
l.Brightness = 2
l.EnvironmentDiffuseScale = 0.5
l.EnvironmentSpecularScale = 1
l.GlobalShadows = true
l.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
l.ShadowSoftness = 0.4
l.FogColor = Color3.fromRGB(120, 130, 140)
l.FogEnd = 600
l.FogStart = 80
s.MoonTextureId = "rbxassetid://9027816797"
s.SunTextureId = "rbxassetid://5560116180"
s.SkyboxBk = "rbxassetid://159454299"
s.SkyboxDn = "rbxassetid://159454296"
s.SkyboxFt = "rbxassetid://159454293"
s.SkyboxLf = "rbxassetid://159454286"
s.SkyboxRt = "rbxassetid://159454300"
s.SkyboxUp = "rbxassetid://159454304"
c.Brightness = 0.03
c.Contrast = 0.15
c.Saturation = 0.05
c.TintColor = Color3.fromRGB(255, 240, 220)
b.Intensity = 0.8
b.Size = 56
b.Threshold = 0.9
sr.Intensity = 0.05
sr.Spread = 0.8
bl.Size = 2
	end
})
