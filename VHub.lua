local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/nxvap/VictoryHub/refs/heads/main/VictoryUi.lua"))()
local Window = Lib:MakeWindow({
    Title = "Victory Hub | Brookhaven RP 🌠 ",
    SubTitle = " by Nort_VT",
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
ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "ST4R 🌠")
ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayBio", "⌠ Welcome ⌡" .. LocalPlayer.DisplayName)

Tab1:AddSection({"》 Victory Hub Version 1.4"})
Tab1:AddParagraph({"Executor", identifyexecutor()})
Tab1:AddParagraph({"Credits", "• Nort_VT\n• Developer and designer\n\n• Roun95\n• Contributor and developer"})

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
Tab1:AddParagraph({"News", "• Added new style in the interface\n• Added new functions\n• Bugs fixed\n• Optimization and improvements"})
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

local function GetPlayerNames()
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
    Options = GetPlayerNames(),
    Default = "",
    Flag = "player list",
    Callback = function(playername)
        PlayerValue = playername
        Target = playername
    end
})

local function UpdatePlayers()
    Dropdown:Set(GetPlayerNames())
end
UpdatePlayers()

Tab3:AddButton({"Update list", function()
    UpdatePlayers()
end})

Players.PlayerAdded:Connect(UpdatePlayers)
Players.PlayerRemoving:Connect(UpdatePlayers)

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

Tab6:AddParagraph({"Coming soon", "Thanks for waiting:)"})
----------------------------------------------------------------------------------------------------
                                	-- === Tab7: Music === --
----------------------------------------------------------------------------------------------------
local audios = {
    {Name = "SUS", ID = 6701126635},
    {Name = "Sus", ID = 7153419575},
    {Name = "Amongus", ID = 6651571134},
    {Name = "Sonic.exe", ID = 2496367477},
    {Name = "Mandrake Detected", ID = 9068077052},
    {Name = "Super fast groan", ID = 128863565301778},
    {Name = "dodichan onnn", ID = 134640594695384},
    {Name = "Oh my god", ID = 73349649774476},
    {Name = "China boy", ID = 84403553163931}
}

local audioNames = {}
for _, audio in ipairs(audios) do
    table.insert(audioNames, audio.Name)
end

Tab7:AddDropdown({
    Name = "Select audio",
    Options = audioNames,
    Default = audioNames[1],
    Callback = function(value)
        for _, audio in ipairs(audios) do
            if audio.Name == value then
                audioID = audio.ID
                break
            end
        end
    end
})

local function fireServer(eventName, args)
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

local audioLoop = false

local function loopAudio()
    while audioLoop do
        if audioID then
			local args = { Workspace, audioID, 1 }
            ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
            local sound = Instance.new("Sound", Workspace)
            sound.SoundId = "rbxassetid://" .. audioID
            sound:Play()
        end
        task.wait(1)
    end
end

local function playAudio()
    local args = { Workspace, audioID, 1 }
		ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
        local sound = Instance.new("Sound", Workspace)
        sound.SoundId = "rbxassetid://" .. audioID
        sound:Play()
        task.wait(3)
        sound:Destroy()
end

Tab7:AddButton({
    Name = "Play audio",
    Callback = function()
	    if audioID then
    	    playAudio(audioID)
    	end
    end
})

Tab7:AddToggle({
    Name = "Loop audio",
    Default = false,
    Callback = function(value)
        audioLoop = value
        if audioLoop then
            task.spawn(loopAudio)
        end
    end
})
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
