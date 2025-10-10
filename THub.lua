local Players, RunService, ReplicatedStorage, StarterGui = game:GetService("Players"), game:GetService("RunService"), game:GetService("ReplicatedStorage"), game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid, RootPart = Character:WaitForChild("Humanoid"), Character:WaitForChild("HumanoidRootPart")

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/z/refs/heads/main/TestUi.lua"))()
local Window = Lib:MakeWindow({
    Title = "Victory Hub Source | Brookhaven RP 🌠 ",
    SubTitle = " by Roun95",
    SaveFolder = "VictoryData"
})

Window:AddMinimizeButton({
    Button = {Image = "rbxassetid://137031510785437", BackgroundTransparency = 0},
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

Tab1:AddParagraph({"Executor", identifyexecutor()})
Tab1:AddSection({"Based on v1.3"})

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
	StarterGui:SetCore("SendNotification", {
        Title = "Player selected",
        Text = player.Name .. " selected",
        Icon = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100),
        Duration = 5
    })
end

Tab2:AddTextBox({
    Name = "Headsit Player",
    Description = "Enter part of the player name",
    PlaceholderText = "ej: Rou → Roun95",
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
    Name = "Jump",
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
    Name = "Fly GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cxnker/x/refs/heads/main/Scripts/Fly.lua"))()
	end
})

Tab2:AddSection({"》 ESP"})
local billboardGuis = {}
local connections = {}
local espEnabled = false
local selectedColor = "RGB"

Tab2:AddDropdown({
    Name = "Seleccionar color",
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

    if Character then
        local head = Character:FindFirstChild("Head")
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
            textLabel.Font = Enum.Font.SourceSansBold
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

local espToggle = Tab2:AddToggle({
    Name = "Espiar jugadores",
    Description = "Muestra la entidad de los jugadores.",
    Default = false
})

espToggle:Callback(function(value)
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

Tab3:AddSection({"》 Copiar avatar"})
local Remotes = ReplicatedStorage.Remotes
local Wear, ChangeCharacterBody = Remotes.Wear, Remotes.ChangeCharacterBody

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

local updateList = Tab3:AddDropdown({
    Name = "Seleccionar jugador",
    Options = GetPlayerNames(),
    Default = "",
    Callback = function(playername)
        PlayerValue = playername
        Target = playername
    end
})

local function updatePlayers()
    updateList:Set(GetPlayerNames())
end
updatePlayers()

Tab3:AddButton({"Actualizar lista", function()
    updatePlayers()
end})

Players.PlayerAdded:Connect(updatePlayers)
Players.PlayerRemoving:Connect(updatePlayers)

Tab3:AddButton({
    Name = "Copiar avatar",
    Callback = function()
        if not Target then return end

        local LChar = LocalPlayer.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")
            if LHumanoid and THumanoid then

                local LDesc = LHumanoid:GetAppliedDescription()
                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end
                if tonumber(LDesc.Shirt) then
                    Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end
                if tonumber(LDesc.Pants) then
                    Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end
                if tonumber(LDesc.Face) then
                    Wear:InvokeServer(tonumber(LDesc.Face))
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
                ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end
                if tonumber(PDesc.Pants) then
                    Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end
                if tonumber(PDesc.Face) then
                    Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end
                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end
                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end
                if tonumber(PDesc.IdleAnimation) then
                    Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end
            end
        end
    end
})

Tab3:AddSection({"Ropa 3D"})

local clothes = {
    {"Black-Arm-Bandages-1-0", 11458078735},
    {"Black-Oversized-Warmers", 10789914680},
    {"Black-Oversized-Off-Shoulder-Hoodie", 18396592827},
    {"White-Oversized-Off-Shoulder-Hoodie", 18396754379},
    {"Left-Leg-Spikes", 10814325667}
}

for _, btn in ipairs(clothes) do
    Tab3:AddButton({
        btn[1],
        function()
			local args = {btn[2]}
            Wear:InvokeServer(unpack(args))
        end
    })
end

Tab3:AddSection({"Editor de avatar (Tu avatar se reiniciara)"})
Tab3:AddParagraph({"Ajusta las proporciones de tu avatar para un mejor resultado"})

Tab3:AddButton({
    Name = "Mini-Plushie (Headless)",
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
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "S15-Thin-Hourglass (Headless)",
    Callback = function()
        local args = {
            {
                128776848621889,
                81547744637409,
                133466157082146,
                73001997018020,
                129543160215232,
                15093053680
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "inf15-Thin (Headless)",
    Callback = function()
        local args = {
            {
                84418052877367,
                124343282827669,
                99519402284266,
                115905570886697,
                92757812011061,
                15093053680
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "Blush-Fashion-Doll (Headless)",
    Callback = function()
        local args = {
            {
                127241951574732,
                118303475394830,
                18839824209,
                18839824132,
                115745153758680,
                15093053680
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "E-Girl Body (Headless)",
    Callback = function()
        local args = {
            {
                127241951574732,
                118303475394830,
                18839824209,
                18839824132,
                114206707267907,
                15093053680
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "E-Girl Body (Headless/Korblox)",
    Callback = function()
        local args = {
            {
                139607718,
                118303475394830,
                18839824209,
                18839824132,
                114206707267907,
                15093053680
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "E-Boy Body (Headless)",
    Callback = function()
        local args = {
            {
                2517207746,
                2517204456,
                4416788553,
                4416785861,
                32336059,
                15093053680
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "E-Girl Body ()",
    Callback = function()
        local args = {
            {
                127968751428204,
                101521138059051,
                18839824209,
                18839824132,
                114206707267907,
                14970560459
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "Classic-Female-v2-Torso (Headless)",
    Callback = function()
        local args = {
            {
                4637265517,
                15093053680
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab3:AddButton({
    Name = "Headless/Korblox (BETA)",
    Callback = function()
        local args = {
            {
                139607718,
                15093053680
            }
        }
        ChangeCharacterBody:InvokeServer(unpack(args))
    end
})

Tab4:AddSection({"Velocidad RGB"})
local rgbSpeed = 1

Tab4:AddSlider({
    Name = "Ajusta la velocidad del RGB",
    Min = 1,
    Max = 9,
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
    local event = ReplicatedStorage.RE
    if event and event:FindFirstChild(eventName) then
        pcall(function()
            event[eventName]:FireServer(unpack(args))
        end)
    end
end

Tab4:AddSection({"Jugador RGB"})
local nameBioRGBActive = false
Tab4:AddToggle({
    Name = "Nombre + Bio RGB",
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

Tab5:AddButton({
    Name = "Desbanear de todas las casas",
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
                Title = "Exito",
                Text = "Desbaneado de " .. successCount .. " casas.",
                Duration = 5
            })
        end
        if failCount > 0 then
            StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Falta ser desbaneado de " .. failCount .. " casas.",
                Duration = 5
            })
        end
        if successCount == 0 and failCount == 0 then
            StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Ningun baneo encontrado.",
                Duration = 5
            })
        end
    end
})

local sites = {
    {"Colina", CFrame.new(-348.64, 65.94, -458.08)},
    {"Inicio", CFrame.new(-26.17, 3.48, -0.93)},
    {"Hotel", CFrame.new(159.10, 3.32, 164.97)},
    {"Playa", CFrame.new(55.69, 2.94, -1403.60)},
    {"Playa2", CFrame.new(42.39, 2.94, 1336.14)},
    {"Granja", CFrame.new(-766.41, 2.92, -61.10)}
}
for _, tp in ipairs(sites) do
    Tab9:AddButton({
        tp[1],
        function()
            RootPart.CFrame = tp[2]
        end
    })
end
