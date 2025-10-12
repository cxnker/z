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
local totalTime = 6 -- Seconds
local steps = 100
local delayPerStep = totalTime / steps

for i = 1, steps do
    ProgressBar.Size = UDim2.new(i/steps,0,1,0)
    PercentText.Text = i .. "%"
    wait(delayPerStep)
end
-- Delete GUI in the end
ScreenGui:Destroy()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Notify",
    Text = "Follow me for more scripts: @Roun95",
    Icon = game.Players:GetUserThumbnailAsync(game.Players:GetUserIdFromNameAsync("Roun95"), Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100),
    Duration = 10
})

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/nxvap/VictoryHub/refs/heads/main/VictoryUi.lua"))()
local Window = Lib:MakeWindow({
    Title = "Victory Hub | Brookhaven RP 🌠 ",
    SubTitle = "by Roun95",
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
local Tab12 = Window:MakeTab({"Protection", "rbxassetid://10734951847"})
----------------------------------------------------------------------------------------------------
                                    -- === Tab 1: Info === --
----------------------------------------------------------------------------------------------------
Tab1:AddSection({"》 Version 2.1"})
Tab1:AddDiscordInvite({
    Name = "Nova Studio | Victory Support",
    Description = "Official group of the Victory & Nova development team",
    Logo = "rbxassetid://137031510785437",
    Invite = "https://discord.gg/Q9R5FDapth",
})
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
Tab1:AddParagraph({"News", "• New troll options\n• Extended options and improvements\n• New protection features\n• Vfly, Telekinesis, Admin Tool and more"})
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
    PlaceholderText = "Rou → Roun95",
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

local fovValue = 70

Tab2:AddTextBox({
  Name = "Fov player",
  Description = "", 
  PlaceholderText = "70",
  Callback = function(Value)
    fovValue = tonumber(Value) or 70
  end
})

Tab2:AddButton({
  Name = "Adjust fov",
  Callback = function()
    local camera = workspace.CurrentCamera
    if camera and typeof(fovValue) == "number" then
      camera.FieldOfView = fovValue
    end
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
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 189, 0, 54)

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(74,76,81)
up.Size = UDim2.new(0, 44, 0, 27)
up.Font = Enum.Font.SourceSans
up.Text = "↑"
up.TextColor3 = Color3.fromRGB(202,178,251)
up.TextSize = 14

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(74,76,81)
down.Position = UDim2.new(0, 0, 0.52, 0)
down.Size = UDim2.new(0, 44, 0, 27)
down.Font = Enum.Font.SourceSans
down.Text = "↓"
down.TextColor3 = Color3.fromRGB(202,178,251)
down.TextSize = 14

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(74,76,81)
onof.Position = UDim2.new(0.72, 0, 0.52, 0)
onof.Size = UDim2.new(0, 54, 0, 27)
onof.Font = Enum.Font.SourceSans
onof.Text = "FLY"
onof.TextColor3 = Color3.fromRGB(202,178,251)
onof.TextSize = 14

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(46,49,54)
TextLabel.Position = UDim2.new(0.475, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 27)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "FLY GUI"
TextLabel.TextColor3 = Color3.fromRGB(202,178,251)
TextLabel.TextSize = 25
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(54,57,62)
plus.Position = UDim2.new(0.236, 0, 0, 0)
plus.Size = UDim2.new(0, 44, 0, 27)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(202,178,251)
plus.TextSize = 25
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(74,76,81)
speed.Position = UDim2.new(0.48, 0, 0.52, 0)
speed.Size = UDim2.new(0, 44, 0, 27)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(202,178,251)
speed.TextScaled = true
speed.TextSize = 14
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(54,57,62)
mine.Position = UDim2.new(0.24, 0, 0.516, 0)
mine.Size = UDim2.new(0, 44, 0, 27)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(202,178,251)
mine.TextSize = 25
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(54,57,62)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 44, 0, 27)
closebutton.Text = "x"
closebutton.TextColor3 = Color3.fromRGB(202,178,251)
closebutton.TextSize = 25
closebutton.Position =  UDim2.new(0, 0, -1, 27)

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

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Notify";
    Text = "Follow me for more scripts: @Roun95";
    Icon = game.Players:GetUserThumbnailAsync(game.Players:GetUserIdFromNameAsync("Roun95"), Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)})
    Duration = 10;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true

		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	

				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end

	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then

		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
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
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

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
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false

	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
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
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
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
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false
	end
end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
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
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)

plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then

		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	

				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
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
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	

					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 54)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
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
    Max = 8,
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

Tab6:AddSection({"》 Other functions"})

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

Tab6:AddButton({
    Name = "Remove all vehicles V2",
    Callback = function()
        local ofnawufn = false

if ofnawufn == true then
    return
end
ofnawufn = true

local cawwfer = "MilitaryBoatFree" -- Alterado para MilitaryBoatFree
local oldcfffff = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58) -- Coordenadas atualizadas
wait(0.3)

local args = {
    [1] = "PickingBoat", -- Alterado para PickingBoat
    [2] = cawwfer
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(1)

local wrinfjn
for _, errb in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if errb:IsA("VehicleSeat") then
        wrinfjn = errb
    end
end

repeat
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then return end
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        if not game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,1,0)
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,-1,0)
    task.wait()
until game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn

for _, wifn in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if wifn.Name == "PhysicalWheel" then
        wifn:Destroy()
    end
end

local FLINGED = Instance.new("BodyThrust", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass) 
FLINGED.Force = Vector3.new(50000, 0, 50000) 
FLINGED.Name = "SUNTERIUM HUB FLING"
FLINGED.Location = game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.Position

for _, wvwvwasc in pairs(game.workspace.Vehicles:GetChildren()) do
    for _, ascegr in pairs(wvwvwasc:GetDescendants()) do
        if ascegr.Name == "VehicleSeat" then
            local targetcar = ascegr
            local tet = Instance.new("BodyVelocity", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass)
            tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            tet.P = 1250
            tet.Velocity = Vector3.new(0,0,0)
            tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
            for m=1,25 do
                local pos = {x=0, y=0, z=0}
                pos.x = targetcar.Position.X
                pos.y = targetcar.Position.Y
                pos.z = targetcar.Position.Z
                pos.x = pos.x + targetcar.Velocity.X / 2
                pos.y = pos.y + targetcar.Velocity.Y / 2
                pos.z = pos.z + targetcar.Velocity.Z / 2
                if pos.y <= -200 then
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(0,1000,0)
                else
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z))
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) + Vector3.new(0,-2,0)
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(0,0,2)
                    task.wait()
                    game.workspace.Vehicles[
game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(2,0,0)
                    task.wait()
                end
                task.wait()
            end
        end
    end
end

task.wait()
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
game.Players.LocalPlayer.Character.Humanoid.Sit = false
wait()
local tet = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
tet.P = 1250
tet.Velocity = Vector3.new(0,0,0)
tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
wait(0.1)
for m=1,2 do 
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
end
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"):Destroy()
wait(0.2)
ofnawufn = false
    end
})

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

local WheelLoop = false

Tab6:AddToggle({
    Name = "Auto Wheel Decal",
    Default = false,
    Callback = function(Value)
        WheelLoop = Value
        if WheelLoop then
            spawn(function()
                while WheelLoop do
                    pcall(function()
                        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SetWheelDecal"):InvokeServer()
                    end)
                    wait(0.5)
                end
            end)
        end
    end
})

local SuspensionLoop = false

Tab6:AddToggle({
    Name = "Suspension Loop",
    Default = false,
    Callback = function(v)
        SuspensionLoop = v
        if SuspensionLoop then
            spawn(function()
                while SuspensionLoop do
                    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SetNextSuspensionHeight"):InvokeServer()
                    wait(0.2)
                end
            end)
        end
    end
})
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
            dropdown:Set(currentValue)
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
            warn("Teleportation failed: " .. tostring(errorMessage))
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

        print("Teleported to the player: " .. playerName .. " .")
    else
        print("Player not found to teleport")
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
    Name = "Select player",
    Description = "Choose a player to kill, lure, see, or throw",
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

Tab8:AddButton({"Update list", function()
    UptadePlayers()
end})

UptadePlayers()

Tab8:AddButton({
    Title = "Teleport to the player",
    Callback = function()
        local selectedPlayerName = player_name_value
        if selectedPlayerName and selectedPlayerName ~= "" then
            local success, errorMessage = pcall(teleportToPlayer, selectedPlayerName)
            if not success then
                warn("Teleportation failed: " .. tostring(errorMessage))
            end
        else
            print("Select a player first")
        end
    end
})

local SpectateToggleTab10 = Tab8:AddToggle({
    Name = "View player",
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

Players.PlayerAdded:Connect(function()
    task.wait(1)
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
end)

updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)

Tab8:AddSection({"》 Kill or Pull player"})

local DropdownKillPullMethod = Tab8:AddDropdown({
    Name = "Select an option",
    Options = {"Sofa", "Autobus"},
    Callback = function(value)
        selectedKillPullMethod = value
    end
})
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
    Name = "Kill",
	Description = "Throws the player into the void",
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
    Name = "Pull",
    Description = "Pull the player to your position",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod or selectedKillPullMethod ~= "Sofa" then return end
        pullWithSofa(selectedPlayer)
    end
})

Tab8:AddButton({
    Name = "Stop all (Kill/Pull)",
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

Tab8:AddSection({"》 Throw player"})

local DropdownFlingMethod = Tab8:AddDropdown({
    Name = "Select an option",
    Options = {"Sofa", "Autobus", "Balon", "Balon V2", "Barco", "Camion"},
    Callback = function(value)
        selectedFlingMethod = value
    end
})

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
    Name = "Fling player",
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

Tab8:AddSection({"》 Troll functions"})

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
        warn("Error getting image: " .. tostring(result))
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
    Name = "Add player to whitelist",
    PlaceholderText = "Player name",
    Callback = function(Value)
        if Value == "" then
            showNotification("Warn", "Enter the player name", nil)
            return
        end

        local player = findPlayerByPartialName(Value)
        if player then
            -- Comprueba si el jugador ya esta excluido
            for _, excluded in ipairs(excludedPlayers) do
                if excluded == player then
                    showNotification("The player is already on the list", "Player " .. player.Name .. " has already been added.", getPlayerThumbnail(player.UserId))
                    return
                end
            end
            table.insert(excludedPlayers, player)
            local thumbnail = getPlayerThumbnail(player.UserId)
            showNotification("Player added", "Player " .. player.Name .. " was added.", thumbnail)
        else
            showNotification("Player not found", "No players were found with '" .. Value .. "'.", nil)
        end
    end
})

Tab8:AddButton({"Verify whitelist", function()
    if #excludedPlayers == 0 then
        showNotification("Warn", "No players found.", nil)
        return
    end
    for i, player in ipairs(excludedPlayers) do
        local thumbnail = getPlayerThumbnail(player.UserId)
        showNotification("Player added " .. i, "Player " .. player.Name .. " was added.", thumbnail)
        task.wait(0.5)
    end
end})

Tab8:AddButton({"Remove whitelist", function()
    if #excludedPlayers == 0 then
        showNotification("Warn", "No players found.", nil)
        return
    end
    excludedPlayers = {}
    showNotification("Warn", "All players were removed.", nil)
end})

Tab8:AddButton({"Orbiting Fling Ball (Patched)", function()
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

Tab8:AddButton({"Fling All V1 (Patched)", function()
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

Tab8:AddButton({"Fling All V2 (Patched)", function()
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
Tab8:AddButton({"Stop all", function()
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
    showNotification("Warn", "All options were disabled.", nil)
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
    Name = "[BETA] Click Fling Ball (Tool)",
    Callback = function()
        local jogadores = game:GetService("Players")
        local rep = game:GetService("ReplicatedStorage")
        local mundo = game:GetService("Workspace")
        local entrada = game:GetService("UserInputService")
        local cam = mundo.CurrentCamera
        local eu = jogadores.LocalPlayer

        local NOME_FERRAMENTA = "Admin Fling"
        local ferramentaEquipada = false

        local mochila = eu:WaitForChild("Backpack")

        for _, ferramentaExistente in pairs(mochila:GetChildren()) do
            if ferramentaExistente:IsA("Tool") and ferramentaExistente.Name:lower():find("fling") then
                ferramentaExistente.Name = "Admin Fling"
            end
        end

        if not mochila:FindFirstChild(NOME_FERRAMENTA) then
            local ferramenta = Instance.new("Tool")
            ferramenta.Name = NOME_FERRAMENTA
            ferramenta.RequiresHandle = true
            ferramenta.CanBeDropped = false

            local handle = Instance.new("Part")
            handle.Name = "Handle"
            handle.Size = Vector3.new(1, 1, 1)
            handle.Transparency = 1
            handle.Parent = ferramenta

            local decal = Instance.new("Decal")
            decal.Texture = "rbxassetid://775552544"
            decal.Face = Enum.NormalId.Front
            decal.Parent = handle

            ferramenta.Equipped:Connect(function()
                ferramentaEquipada = true
            end)

            ferramenta.Unequipped:Connect(function()
                ferramentaEquipada = false
            end)

            ferramenta.Parent = mochila
        end

        local function FlingBall(target)
            local player = jogadores.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local hrp = character:WaitForChild("HumanoidRootPart")
            local backpack = player:WaitForChild("Backpack")
            local ServerBalls = mundo:WaitForChild("WorkspaceCom"):WaitForChild("001_SoccerBalls")

            local function GetBall()
                if not backpack:FindFirstChild("SoccerBall") and not character:FindFirstChild("SoccerBall") then
                    rep.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
                end
                repeat task.wait() until backpack:FindFirstChild("SoccerBall") or character:FindFirstChild("SoccerBall")
                local ballTool = backpack:FindFirstChild("SoccerBall")
                if ballTool then ballTool.Parent = character end
                repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)
                return ServerBalls:FindFirstChild("Soccer" .. player.Name)
            end

            local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
            Ball.CanCollide = false
            Ball.Massless = true
            Ball.Transparency = 1             -- BOLA INVISÍVEL
            Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

            if target ~= player then
                local tchar = target.Character
                if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then
                    local troot = tchar.HumanoidRootPart
                    local thum = tchar.Humanoid
                    if Ball:FindFirstChildWhichIsA("BodyVelocity") then
                        Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
                    end
                    local bv = Instance.new("BodyVelocity")
                    bv.Name = "FlingPower"
                    bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.P = 9e900
                    bv.Parent = Ball
                    mundo.CurrentCamera.CameraSubject = thum

                    repeat
                        if troot.Velocity.Magnitude > 0 then
                            local pos = troot.Position + (troot.Velocity / 1.5)
                            Ball.CFrame = CFrame.new(pos)
                            Ball.Orientation += Vector3.new(45, 60, 30)
                        else
                            for _, v in pairs(tchar:GetChildren()) do
                                if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
                                    Ball.CFrame = v.CFrame
                                    task.wait(1/6000)
                                end
                            end
                        end
                        task.wait(1/6000)
                    until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(mundo) or target.Parent ~= jogadores

                    mundo.CurrentCamera.CameraSubject = humanoid
                end
            end
        end

        entrada.TouchTap:Connect(function(toques, processado)
            if not ferramentaEquipada or processado then return end
            local pos = toques[1]
            local raio = cam:ScreenPointToRay(pos.X, pos.Y)
            local hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)
            if hit and hit.Instance then
                local modelo = hit.Instance:FindFirstAncestorOfClass("Model")
                local jogador = jogadores:GetPlayerFromCharacter(modelo)
                if jogador and jogador ~= eu then
                    FlingBall(jogador)
                end
            end
        end)

    end
})

Tab8:AddButton({
    Name = "Click Kill Couch (Tool)",
    Callback = function()

local jogadores = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local loop = game:GetService("RunService")
local mundo = game:GetService("Workspace")
local entrada = game:GetService("UserInputService")

local eu = jogadores.LocalPlayer
local cam = mundo.CurrentCamera

local NOME_FERRAMENTA = "Click Kill Couch"
local ferramentaEquipada = false
local nomeAlvo = nil
local loopTP = nil
local sofaEquipado = false
local base = nil
local posInicial = nil
local raiz = nil

local mochila = eu:WaitForChild("Backpack")
if not mochila:FindFirstChild(NOME_FERRAMENTA) then
	local ferramenta = Instance.new("Tool")
	ferramenta.Name = NOME_FERRAMENTA
	ferramenta.RequiresHandle = false
	ferramenta.CanBeDropped = false

	ferramenta.Equipped:Connect(function()
		ferramentaEquipada = true
	end)

	ferramenta.Unequipped:Connect(function()
		ferramentaEquipada = false
		nomeAlvo = nil
		limparSofa()
	end)

	ferramenta.Parent = mochila
end

function limparSofa()
	if loopTP then
		loopTP:Disconnect()
		loopTP = nil
	end

	if sofaEquipado then
		local boneco = eu.Character
		if boneco then
			local sofa = boneco:FindFirstChild("Couch")
			if sofa then
				sofa.Parent = eu.Backpack
				sofaEquipado = false
			end
		end
	end

	if base then
		base:Destroy()
		base = nil
	end

	if getgenv().AntiSit then
		getgenv().AntiSit:Set(false)
	end

	local humano = eu.Character and eu.Character:FindFirstChildOfClass("Humanoid")
	if humano then
		humano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
		humano:ChangeState(Enum.HumanoidStateType.GettingUp)
	end

	if posInicial and raiz then
		raiz.CFrame = posInicial
		posInicial = nil
	end
end

function pegarSofa()
	local boneco = eu.Character
	if not boneco then return end
	local mochila = eu.Backpack

	if not mochila:FindFirstChild("Couch") and not boneco:FindFirstChild("Couch") then
		local args = { "PickingTools", "Couch" }
		rep.RE["1Too1l"]:InvokeServer(unpack(args))
		task.wait(0.1)
	end

	local sofa = mochila:FindFirstChild("Couch") or boneco:FindFirstChild("Couch")
	if sofa then
		sofa.Parent = boneco
		sofaEquipado = true
	end
end

function posAleatoriaAbaixo(boneco)
	local rp = boneco:FindFirstChild("HumanoidRootPart")
	if not rp then return Vector3.new() end
	local offset = Vector3.new(math.random(-2, 2), -5.1, math.random(-2, 2))
	return rp.Position + offset
end

function tpAbaixo(alvo)
	if not alvo or not alvo.Character or not alvo.Character:FindFirstChild("HumanoidRootPart") then return end

	local meuBoneco = eu.Character
	local minhaRaiz = meuBoneco and meuBoneco:FindFirstChild("HumanoidRootPart")
	local humano = meuBoneco and meuBoneco:FindFirstChildOfClass("Humanoid")

	if not minhaRaiz or not humano then return end

	humano:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

	if not base then
		base = Instance.new("Part")
		base.Size = Vector3.new(10, 1, 10)
		base.Anchored = true
		base.CanCollide = true
		base.Transparency = 0.5
		base.Parent = mundo
	end

	local destino = posAleatoriaAbaixo(alvo.Character)
	base.Position = destino
	minhaRaiz.CFrame = CFrame.new(destino)

	humano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
end

function arremessarComSofa(alvo)
	if not alvo then return end
	nomeAlvo = alvo.Name
	local boneco = eu.Character
	if not boneco then return end

	posInicial = boneco:FindFirstChild("HumanoidRootPart") and boneco.HumanoidRootPart.CFrame
	raiz = boneco:FindFirstChild("HumanoidRootPart")
	pegarSofa()

	loopTP = loop.Heartbeat:Connect(function()
		local alvoAtual = jogadores:FindFirstChild(nomeAlvo)
		if not alvoAtual or not alvoAtual.Character or not alvoAtual.Character:FindFirstChild("Humanoid") then
			limparSofa()
			return
		end
		if getgenv().AntiSit then
			getgenv().AntiSit:Set(true)
		end
		tpAbaixo(alvoAtual)
	end)

	task.spawn(function()
		local alvoAtual = jogadores:FindFirstChild(nomeAlvo)
		while alvoAtual and alvoAtual.Character and alvoAtual.Character:FindFirstChild("Humanoid") do
			task.wait(0.05)
			if alvoAtual.Character.Humanoid.SeatPart then
				local buraco = CFrame.new(265.46, -450.83, -59.93)
				alvoAtual.Character.HumanoidRootPart.CFrame = buraco
				eu.Character.HumanoidRootPart.CFrame = buraco
				task.wait(0.4)
				limparSofa()
				task.wait(0.2)
				if posInicial then
					eu.Character.HumanoidRootPart.CFrame = posInicial
				end
				break
			end
		end
	end)
end

entrada.TouchTap:Connect(function(toques, processado)
	if not ferramentaEquipada or processado then return end
	local pos = toques[1]
	local raio = cam:ScreenPointToRay(pos.X, pos.Y)
	local hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)
	if hit and hit.Instance then
		local modelo = hit.Instance:FindFirstAncestorOfClass("Model")
		local jogador = jogadores:GetPlayerFromCharacter(modelo)
		if jogador and jogador ~= eu then
			arremessarComSofa(jogador)
		end
	end
end)
end
})

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
    Name = "Telekinesis Tool",
    Callback = function()
Range = "Default" -- "Min" (idk), "Max" (lag), "Default" (fastest)

local BP = Instance.new("BodyPosition")
BP.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
BP.P = BP.P * 1.1

local BP = Instance.new("BodyPosition")
BP.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
BP.Position = BP.Position + Vector3.new(0, 0.1, 0)

task.spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
if Range == "Max" then
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 0)
elseif Range == "Min" then
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 500)
end
end)
end)

local function a(b, c)
    local d = getfenv(c)
    local e =
        setmetatable(
        {},
        {__index = function(self, f)
                if f == "script" then
                    return b
                else
                    return d[f]
                end
            end}
    )
    setfenv(c, e)
    return c
end
local power = 1000
local usrinput = game:GetService("UserInputService")
local g = {}
local h = Instance.new("Model", game:GetService("Lighting"))
local i = Instance.new("Tool")
local j = Instance.new("Part")
local k = Instance.new("Script")
local l = Instance.new("LocalScript")
local m = sethiddenproperty or set_hidden_property
i.Name = "Telekinesis"
i.Parent = h
i.Grip = CFrame.new(0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
i.GripForward = Vector3.new(-0, -1, -0)
i.GripRight = Vector3.new(0, 0, 1)
i.GripUp = Vector3.new(1, 0, 0)
j.Name = "Handle"
j.Parent = i
j.CFrame = CFrame.new(-17.2635937, 15.4915619, 46, 0, 1, 0, 1, 0, 0, 0, 0, -1)
j.Orientation = Vector3.new(0, 180, 90)
j.Position = Vector3.new(-17.2635937, 15.4915619, 46)
j.Rotation = Vector3.new(-180, 0, -90)
j.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
j.Transparency = 1
j.Size = Vector3.new(1, 1.20000005, 1)
j.BottomSurface = Enum.SurfaceType.Weld
j.BrickColor = BrickColor.new("Really black")
j.Material = Enum.Material.Metal
j.TopSurface = Enum.SurfaceType.Smooth
j.brickColor = BrickColor.new("Really black")
k.Name = "LineConnect"
k.Parent = i
table.insert(
    g,
    a(
        k,
        function()
            wait()
            local n = script.Part2
            local o = script.Part1.Value
            local p = script.Part2.Value
            local q = script.Par.Value
            local color = script.Color
            local r = Instance.new("Part")
            r.TopSurface = 0
            r.BottomSurface = 0
            r.Reflectance = .5
            r.Name = "Laser"
            r.Locked = true
            r.CanCollide = false
            r.Anchored = true
            r.formFactor = 0
            r.Size = Vector3.new(1, 1, 1)
            local s = Instance.new("BlockMesh")
            s.Parent = r
            while true do
                if n.Value == nil then
                    break
                end
                if o == nil or p == nil or q == nil then
                    break
                end
                if o.Parent == nil or p.Parent == nil then
                    break
                end
                if q.Parent == nil then
                    break
                end
                local t = CFrame.new(o.Position, p.Position)
                local dist = (o.Position - p.Position).magnitude
                r.Parent = q
                r.BrickColor = color.Value.BrickColor
                r.Reflectance = color.Value.Reflectance
                r.Transparency = color.Value.Transparency
                r.CFrame = CFrame.new(o.Position + t.lookVector * dist / 2)
                r.CFrame = CFrame.new(r.Position, p.Position)
                s.Scale = Vector3.new(.25, .25, dist)
                wait()
            end
            r:remove()
            script:remove()
        end
    )
)
k.Disabled = true
l.Name = "MainScript"
l.Parent = i
table.insert(
    g,
    a(
        l,
        function()
            wait()
            tool = script.Parent
            lineconnect = tool.LineConnect
            object = nil
            mousedown = false
            found = false
            BP = Instance.new("BodyPosition")
            BP.maxForce = Vector3.new(math.huge * math.huge, math.huge * math.huge, math.huge * math.huge)
            BP.P = BP.P * 2
            dist = nil
            point = Instance.new("Part")
            point.Locked = true
            point.Anchored = true
            point.formFactor = 0
            point.Shape = 0
            point.BrickColor = BrickColor.Black()
            point.Size = Vector3.new(1, 1, 1)
            point.CanCollide = false
            local s = Instance.new("SpecialMesh")
            s.MeshType = "Sphere"
            s.Scale = Vector3.new(.7, .7, .7)
            s.Parent = point
            handle = tool.Handle
            front = tool.Handle
            color = tool.Handle
            objval = nil
            local u = false
            local v = BP:clone()
            v.maxForce = Vector3.new(30000, 30000, 30000)
            function LineConnect(o, p, q)
                local w = Instance.new("ObjectValue")
                w.Value = o
                w.Name = "Part1"
                local x = Instance.new("ObjectValue")
                x.Value = p
                x.Name = "Part2"
                local y = Instance.new("ObjectValue")
                y.Value = q
                y.Name = "Par"
                local z = Instance.new("ObjectValue")
                z.Value = color
                z.Name = "Color"
                local A = lineconnect:clone()
                A.Disabled = false
                w.Parent = A
                x.Parent = A
                y.Parent = A
                z.Parent = A
                A.Parent = workspace
                if p == object then
                    objval = x
                end
            end
            function onButton1Down(B)
                if mousedown == true then
                    return
                end
                mousedown = true
                coroutine.resume(
                    coroutine.create(
                        function()
                            local C = point:clone()
                            C.Parent = tool
                            LineConnect(front, C, workspace)
                            while mousedown == true do
                                C.Parent = tool
                                if object == nil then
                                    if B.Target == nil then
                                        local t = CFrame.new(front.Position, B.Hit.p)
                                        C.CFrame = CFrame.new(front.Position + t.lookVector * 1000)
                                    else
                                        C.CFrame = CFrame.new(B.Hit.p)
                                    end
                                else
                                    LineConnect(front, object, workspace)
                                    break
                                end
                                wait()
                            end
                            C:remove()
                        end
                    )
                )
                while mousedown == true do
                    if B.Target ~= nil then
                        local D = B.Target
                        if D.Anchored == false then
                            object = D
                            dist = (object.Position - front.Position).magnitude
                            break
                        end
                    end
                    wait()
                end
                while mousedown == true do
                    if object.Parent == nil then
                        break
                    end
                    local t = CFrame.new(front.Position, B.Hit.p)
                    BP.Parent = object
                    BP.position = front.Position + t.lookVector * dist
                    wait()
                end
                BP:remove()
                object = nil
                objval.Value = nil
            end
            function onKeyDown(E, B)
                local E = E:lower()
                local F = false
                if E == "q" then
                    if dist >= 5 then
                        dist = dist - 10
                    end
                end
                if E == "r" then
                    if object == nil then
                        return
                    end
                    for G, H in pairs(object:children()) do
                        if H.className == "BodyGyro" then
                            return nil
                        end
                    end
                    BG = Instance.new("BodyGyro")
                    BG.maxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    BG.cframe = CFrame.new(object.CFrame.p)
                    BG.Parent = object
                    repeat
                        wait()
                    until object.CFrame == CFrame.new(object.CFrame.p)
                    BG.Parent = nil
                    if object == nil then
                        return
                    end
                    for G, H in pairs(object:children()) do
                        if H.className == "BodyGyro" then
                            H.Parent = nil
                        end
                    end
                    object.Velocity = Vector3.new(0, 0, 0)
                    object.RotVelocity = Vector3.new(0, 0, 0)
                    object.Orientation = Vector3.new(0, 0, 0)
                end
                if E == "e" then
                    dist = dist + 10
                end
                if E == "t" then
                    if dist ~= 10 then
                        dist = 10
                    end
                end
                if E == "y" then
                    if dist ~= 200 then
                        dist = 200
                    end
                end
                if E == "=" then
                    BP.P = BP.P * 1.5
                end
                if E == "-" then
                    BP.P = BP.P * 0.5
                end
            end
            function onEquipped(B)
                touched = false
                uneq = false
                keymouse = B
                local I = tool.Parent
                human = I.Humanoid
                human.Changed:connect(
                    function()
                        if human.Health == 0 then
                            mousedown = false
                            uneq = true
                            touched = false
                            BP:remove()
                            point:remove()
                            tool:remove()
                        end
                    end
                )
                usrinput.TouchTapInWorld:connect(
                    function()
                        if uneq == false then
                        if touched == false then
                        onButton1Down(B)
                        touched = true
                        elseif touched == true then
                        touched = false
                        end
                        end
                    end
                )
                usrinput.TouchLongPress:connect(function()
                    if uneq == false then
                        if dist ~= power then
                            dist = power
                        end
                    end
                end)
                B.KeyDown:connect(
                    function(E)
                        onKeyDown(E, B)
                    end
                )
                B.Icon = "rbxasset://textures\\GunCursor.png"
            end
            tool.Equipped:connect(onEquipped)
            tool.Unequipped:connect(function() uneq = true touched = false mousedown = false end)
        end
    )
)
for J, H in pairs(h:GetChildren()) do
    H.Parent = game:GetService("Players").LocalPlayer.Backpack
    pcall(
        function()
            H:MakeJoints()
        end
    )
end
h:Destroy()
for J, H in pairs(g) do
    spawn(
        function()
            pcall(H)
        end
    )
end
	end
})

Tab10:AddButton({
    Name = "VFly",
    Callback = function()
local Flymguiv2 = Instance.new("ScreenGui")
local Drag = Instance.new("Frame")
local FlyFrame = Instance.new("Frame")
local ddnsfbfwewefe = Instance.new("TextButton")
local Speed = Instance.new("TextBox")
local Fly = Instance.new("TextButton")
local Speeed = Instance.new("TextLabel")
local Stat = Instance.new("TextLabel")
local Stat2 = Instance.new("TextLabel")
local Unfly = Instance.new("TextButton")
local Vfly = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local Flyon = Instance.new("Frame")
local W = Instance.new("TextButton")
local S = Instance.new("TextButton")

--Properties:

Flymguiv2.Name = "Car Fly gui v2"
Flymguiv2.Parent = game.CoreGui
Flymguiv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Drag.Name = "Drag"
Drag.Parent = Flymguiv2
Drag.Active = true
Drag.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Drag.BorderSizePixel = 0
Drag.Draggable = true
Drag.Position = UDim2.new(0.482438415, 0, 0.454874992, 0)
Drag.Size = UDim2.new(0, 237, 0, 27)

FlyFrame.Name = "FlyFrame"
FlyFrame.Parent = Drag
FlyFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
FlyFrame.BorderSizePixel = 0
FlyFrame.Draggable = true
FlyFrame.Position = UDim2.new(-0.00200000009, 0, 0.989000022, 0)
FlyFrame.Size = UDim2.new(0, 237, 0, 139)

ddnsfbfwewefe.Name = "ddnsfbfwewefe"
ddnsfbfwewefe.Parent = FlyFrame
ddnsfbfwewefe.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
ddnsfbfwewefe.BorderSizePixel = 0
ddnsfbfwewefe.Position = UDim2.new(-0.000210968778, 0, -0.00395679474, 0)
ddnsfbfwewefe.Size = UDim2.new(0, 237, 0, 27)
ddnsfbfwewefe.Font = Enum.Font.SourceSans
ddnsfbfwewefe.Text = "by Roun95"
ddnsfbfwewefe.TextColor3 = Color3.fromRGB(255, 255, 255)
ddnsfbfwewefe.TextScaled = true
ddnsfbfwewefe.TextSize = 14.000
ddnsfbfwewefe.TextWrapped = true

Speed.Name = "Speed"
Speed.Parent = FlyFrame
Speed.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
Speed.BorderColor3 = Color3.fromRGB(0, 0, 191)
Speed.BorderSizePixel = 0
Speed.Position = UDim2.new(0.445025861, 0, 0.402877688, 0)
Speed.Size = UDim2.new(0, 111, 0, 33)
Speed.Font = Enum.Font.SourceSans
Speed.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Speed.Text = "50"
Speed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed.TextScaled = true
Speed.TextSize = 14.000
Speed.TextWrapped = true

Fly.Name = "Fly"
Fly.Parent = FlyFrame
Fly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Fly.BorderSizePixel = 0
Fly.Position = UDim2.new(0.0759493634, 0, 0.705797076, 0)
Fly.Size = UDim2.new(0, 199, 0, 32)
Fly.Font = Enum.Font.SourceSans
Fly.Text = "Enable"
Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
Fly.TextScaled = true
Fly.TextSize = 14.000
Fly.TextWrapped = true
Fly.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	Fly.Visible = false
	Stat2.Text = "On"
	Stat2.TextColor3 = Color3.fromRGB(0, 255, 0)
	Unfly.Visible = true
	Flyon.Visible = true
	local BV = Instance.new("BodyVelocity",HumanoidRP)
	local BG = Instance.new("BodyGyro",HumanoidRP)
	BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	game:GetService('RunService').RenderStepped:connect(function()
	BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
	BG.D = 5000
	BG.P = 100000
	BG.CFrame = game.Workspace.CurrentCamera.CFrame
	end)
end)

Speeed.Name = "Speeed"
Speeed.Parent = FlyFrame
Speeed.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Speeed.BorderSizePixel = 0
Speeed.Position = UDim2.new(0.0759493634, 0, 0.402877688, 0)
Speeed.Size = UDim2.new(0, 87, 0, 32)
Speeed.ZIndex = 0
Speeed.Font = Enum.Font.SourceSans
Speeed.Text = "Speed:"
Speeed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speeed.TextScaled = true
Speeed.TextSize = 14.000
Speeed.TextWrapped = true

Stat.Name = "Stat"
Stat.Parent = FlyFrame
Stat.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Stat.BorderSizePixel = 0
Stat.Position = UDim2.new(0.299983799, 0, 0.239817441, 0)
Stat.Size = UDim2.new(0, 85, 0, 15)
Stat.Font = Enum.Font.SourceSans
Stat.Text = "Status:"
Stat.TextColor3 = Color3.fromRGB(255, 255, 255)
Stat.TextScaled = true
Stat.TextSize = 14.000
Stat.TextWrapped = true

Stat2.Name = "Stat2"
Stat2.Parent = FlyFrame
Stat2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Stat2.BorderSizePixel = 0
Stat2.Position = UDim2.new(0.546535194, 0, 0.239817441, 0)
Stat2.Size = UDim2.new(0, 27, 0, 15)
Stat2.Font = Enum.Font.SourceSans
Stat2.Text = "Off"
Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
Stat2.TextScaled = true
Stat2.TextSize = 14.000
Stat2.TextWrapped = true

Unfly.Name = "Unfly"
Unfly.Parent = FlyFrame
Unfly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Unfly.BorderSizePixel = 0
Unfly.Position = UDim2.new(0.0759493634, 0, 0.705797076, 0)
Unfly.Size = UDim2.new(0, 199, 0, 32)
Unfly.Visible = false
Unfly.Font = Enum.Font.SourceSans
Unfly.Text = "Disable"
Unfly.TextColor3 = Color3.fromRGB(255, 255, 255)
Unfly.TextScaled = true
Unfly.TextSize = 14.000
Unfly.TextWrapped = true
Unfly.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	Fly.Visible = true
	Stat2.Text = "Off"
	Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
	wait()
	Unfly.Visible = false
	Flyon.Visible = false
	HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
	HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
end)

Vfly.Name = "Vfly"
Vfly.Parent = Drag
Vfly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Vfly.BorderSizePixel = 0
Vfly.Size = UDim2.new(0, 57, 0, 27)
Vfly.Font = Enum.Font.SourceSans
Vfly.Text = "Vfly"
Vfly.TextColor3 = Color3.fromRGB(255, 255, 255)
Vfly.TextScaled = true
Vfly.TextSize = 14.000
Vfly.TextWrapped = true

Close.Name = "Close"
Close.Parent = Drag
Close.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.875, 0, 0, 0)
Close.Size = UDim2.new(0, 27, 0, 27)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Click:Connect(function()
	Flymguiv2:Destroy()
end)

Minimize.Name = "Minimize"
Minimize.Parent = Drag
Minimize.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.75, 0, 0, 0)
Minimize.Size = UDim2.new(0, 27, 0, 27)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextScaled = true
Minimize.TextSize = 14.000
Minimize.TextWrapped = true
function Mini()
	if Minimize.Text == "-" then
		Minimize.Text = "+"
		FlyFrame.Visible = false
	elseif Minimize.Text == "+" then
		Minimize.Text = "-"
		FlyFrame.Visible = true
	end
end
Minimize.MouseButton1Click:Connect(Mini)

Flyon.Name = "Fly on"
Flyon.Parent = Flymguiv2
Flyon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Flyon.BorderSizePixel = 0
Flyon.Position = UDim2.new(0.117647067, 0, 0.550284624, 0)
Flyon.Size = UDim2.new(0.148000002, 0, 0.314999998, 0)
Flyon.Visible = false
Flyon.Active = true
Flyon.Draggable = true

W.Name = "W"
W.Parent = Flyon
W.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
W.BorderSizePixel = 0
W.Position = UDim2.new(0.134719521, 0, 0.0152013302, 0)
W.Size = UDim2.new(0.708999991, 0, 0.499000013, 0)
W.Font = Enum.Font.SourceSans
W.Text = "^"
W.TextColor3 = Color3.fromRGB(255, 255, 255)
W.TextScaled = true
W.TextSize = 14.000
W.TextWrapped = true
W.TouchLongPress:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

W.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

S.Name = "S"
S.Parent = Flyon
S.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
S.BorderSizePixel = 0
S.Position = UDim2.new(0.134000003, 0, 0.479999989, 0)
S.Rotation = 180.000
S.Size = UDim2.new(0.708999991, 0, 0.499000013, 0)
S.Font = Enum.Font.SourceSans
S.Text = "^"
S.TextColor3 = Color3.fromRGB(255, 255, 255)
S.TextScaled = true
S.TextSize = 14.000
S.TextWrapped = true
S.TouchLongPress:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

S.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)
	end
})

Tab10:AddButton({
    Name = "Invisible FE",
    Callback = function()
	loadstring(game:HttpGet("https://pastebin.com/raw/3Rnd9rHf"))()
	end
})

Tab10:AddButton({
    Name = "Silly Emotes",
    Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Silly%20emote"))()
	end
})

Tab10:AddButton({
    Name = "AFEM Emotes/Animations",
    Callback = function()
	loadstring(game:HttpGet("https://yarhm.mhi.im/scr?channel=afemmax"))()
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

Tab12:AddSection({"》 Protection"})

Tab12:AddToggle({
    Name = "Anti-Dump (All tools)",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local dedupLock = {}
        local IGNORED_PLAYER

        if not state then
            return
        end

        local function marcarIgnorado(player)
            IGNORED_PLAYER = player
        end

        local function isTargetTool(inst)
            return inst:IsA("Tool")
        end

        local function gatherTools(player)
            local found = {}
            local containers = {}

            if player.Character then table.insert(containers, player.Character) end
            local backpack = player:FindFirstChildOfClass("Backpack")
            if backpack then table.insert(containers, backpack) end
            local sg = player:FindFirstChild("StarterGear")
            if sg then table.insert(containers, sg) end

            for _, container in ipairs(containers) do
                for _, child in ipairs(container:GetChildren()) do
                    if isTargetTool(child) then
                        table.insert(found, child)
                    end
                end
            end

            return found
        end

        local function dedupePlayer(player)
            if player == IGNORED_PLAYER then return end
            if dedupLock[player] then return end
            dedupLock[player] = true

            local tools = gatherTools(player)
            if #tools > 1 then
                for i = 2, #tools do
                    pcall(function() tools[i]:Destroy() end)
                end
            end

            dedupLock[player] = false
        end

        local function hookPlayer(player)
            if not IGNORED_PLAYER then
                marcarIgnorado(player)
            end

            task.defer(dedupePlayer, player)

            local function setupChar(char)
                task.delay(0.5, function() dedupePlayer(player) end)
                char.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then
                        task.delay(0.1, function() dedupePlayer(player) end)
                    end
                end)
            end

            if player.Character then
                setupChar(player.Character)
            end
            player.CharacterAdded:Connect(setupChar)

            local backpack = player:WaitForChild("Backpack", 10)
            if backpack then
                backpack.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then
                        task.delay(0.1, function() dedupePlayer(player) end)
                    end
                end)
            end

            local sg = player:FindFirstChild("StarterGear") or player:WaitForChild("StarterGear", 10)
            if sg then
                sg.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then
                        task.delay(0.1, function() dedupePlayer(player) end)
                    end
                end)
            end
        end

        Players.PlayerAdded:Connect(hookPlayer)
        for _, plr in ipairs(Players:GetPlayers()) do
            hookPlayer(plr)
        end

        task.spawn(function()
            while state do
                for _, plr in ipairs(Players:GetPlayers()) do
                    dedupePlayer(plr)
                end
                task.wait(2)
            end
        end)
    end
})


Tab12:AddToggle({
    Name = "Anti-Bring Parts (All doors)",
    Default = false,
    Callback = function(state)
        if not _G.hiddenDoors then
            _G.hiddenDoors = {}
        end
        
        if state then
            _G.hiddenDoors = {}
            
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower():find("door") then
                    local doorData = {
                        door = obj,
                        originalTransparency = obj.Transparency,
                        originalCanCollide = obj.CanCollide,
                        originalCastShadow = obj.CastShadow
                    }
                    
                    obj.Transparency = 1
                    obj.CanCollide = false
                    obj.CastShadow = false
                    
                    for _, child in ipairs(obj:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.Transparency = 1
                            child.CanCollide = false
                        elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then
                            child.Enabled = false
                        end
                    end
                    
                    table.insert(_G.hiddenDoors, doorData)
                end
            end
            print("🔧 " .. #_G.hiddenDoors .. " Disabled doors!")
            
        else
            for _, doorData in ipairs(_G.hiddenDoors or {}) do
                if doorData.door and doorData.door.Parent then
                    doorData.door.Transparency = doorData.originalTransparency
                    doorData.door.CanCollide = doorData.originalCanCollide
                    doorData.door.CastShadow = doorData.originalCastShadow
                    
                    for _, child in ipairs(doorData.door:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.Transparency = 0
                            child.CanCollide = true
                        elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then
                            child.Enabled = true
                        end
                    end
                end
            end
            print("✅ " .. #(_G.hiddenDoors or {}) .. " Doors enabled!")
            _G.hiddenDoors = {}
        end
    end
})