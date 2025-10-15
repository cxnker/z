
-- ===============================================
-- SISTEMA DE WHITELIST - Linux Hub V4
-- ===============================================

-- Lista de usuários autorizados
local WHITELIST = {
    "LinuxhubDev1",
    "carol00941",
    "kanakiwhakO",
    "crmmff2",
    "thurr_blox666",
    "pedroxxjr018",
    "LBD_NICOLAS",
    "Geison006",
    "loki48932",
    "anthonyroblo3x",
    "gabrielgg1551r",
    "minhairmapertuba",
    "ea_clarinhakkj",
    "ycarog139",
    "Olokodois",
    "MULADEIROSSS",
    "ravsadino",
    "user666Ap",
    "62397_hackerr",
    "murilo_12303",
    "darkizinho9910",
    "FgzinZzz",
    "ADM_hub6",
    "Roun95",
    "cantanguandi2",
    "ronia_oys",
}

-- Verificação de autorização
local LocalPlayer = game.Players.LocalPlayer
local playerName = LocalPlayer.Name
local displayName = LocalPlayer.DisplayName
local isAuthorized = false

-- Debug: Mostrar o nome do jogador
print("Verificando autorização para:", playerName)
print("Display Name:", displayName)

-- Verifica tanto o nome normal quanto o display name
for _, whitelistedName in ipairs(WHITELIST) do
    if playerName == whitelistedName or displayName == whitelistedName then
        isAuthorized = true
        print("Usuário autorizado:", whitelistedName)
        break
    end
end

-- Se não autorizado, para a execução
if not isAuthorized then
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Acesso Negado",
        Text = "Você não tem permissão para usar este script agora chore kkj.\nSeu nick: " .. playerName,
        Duration = 8,
    })
    print("Acesso negado para:", playerName, "Display:", displayName)
    return -- Para a execução do script
else
    -- Notificação de sucesso
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Linux Hub V4",
        Text = "Acesso autorizado! Bem-vindo " .. playerName,
        Duration = 3,
    })
end

-- ===============================================
-- SCRIPT PRINCIPAL (só executa se autorizado)
-- ===============================================

-- Carrega a biblioteca WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Sistema de gerenciamento de carros
local TeleportCarro = {}
TeleportCarro.LocalPlayer = game.Players.LocalPlayer
TeleportCarro.Workspace = game:GetService("Workspace")
TeleportCarro.Camera = game:GetService("Workspace").CurrentCamera
TeleportCarro.OriginalCameraSubject = nil
TeleportCarro.OriginalCameraType = nil

-- Função para mostrar notificações
function TeleportCarro:MostrarNotificacao(mensagem)
    WindUI:Notify({
        Title = "System",
        Content = mensagem,
        Duration = 2,
        Icon = "info",
    })
end

-- Função para atualizar a lista de carros
function TeleportCarro:AtualizarListaCarros()
    local carros = {}
    local vehiclesFolder = self.Workspace:FindFirstChild("Vehicles")
    if vehiclesFolder then
        for _, vehicle in ipairs(vehiclesFolder:GetChildren()) do
            if vehicle.Name:match("Car$") then
                table.insert(carros, vehicle.Name)
            end
        end
    end
    return carros
end

-- Função para teleportar para o assento do carro
function TeleportCarro:TeleportToSeat(seat, vehicle)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    
    local humanoid = self.LocalPlayer.Character:FindFirstChild("Humanoid")
    if not humanoid then
        return false
    end
    
    -- Teleporta para perto do assento
    self.LocalPlayer.Character.HumanoidRootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
    task.wait(0.1)
    
    -- Senta no carro
    seat:Sit(humanoid)
    task.wait(0.5)
    
    return seat.Occupant == humanoid
end

-- Função para teleportar carro para o void
function TeleportCarro:TeleportToVoid(vehicle)
    if vehicle.PrimaryPart then
        vehicle:SetPrimaryPartCFrame(CFrame.new(0, -1000, 0))
    else
        local seat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if seat then
            seat.CFrame = CFrame.new(0, -1000, 0)
        end
    end
end

-- Função para teleportar carro para o jogador
function TeleportCarro:TeleportToPlayer(vehicle, playerPos)
    local offsetPos = playerPos + Vector3.new(math.random(-10, 10), 3, math.random(-10, 10))
    if vehicle.PrimaryPart then
        vehicle:SetPrimaryPartCFrame(CFrame.new(offsetPos))
    else
        local seat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if seat then
            seat.CFrame = CFrame.new(offsetPos)
        end
    end
end

-- Função para sair do carro e retornar à posição
function TeleportCarro:ExitCarAndReturn(originalPos)
    task.wait(0.5)
    if self.LocalPlayer.Character and self.LocalPlayer.Character:FindFirstChild("Humanoid") then
        self.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        task.wait(0.5)
        if self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            self.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(originalPos + Vector3.new(0, 5, 0))
        end
    end
end

-- Função para alternar dano de queda
function TeleportCarro:ToggleFallDamage(disable)
    if not self.LocalPlayer.Character then return false end
    
    local humanoid = self.LocalPlayer.Character:FindFirstChild("Humanoid")
    if not humanoid then return false end
    
    if disable then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
    end
    
    return true
end

-- Cria a janela principal
local Window = WindUI:CreateWindow({
    Title = "Linux Hub V4",
    Icon = "penguin",
    Author = "by Nightmare",
    Folder = "LinuxHubV3",
    Size = UDim2.fromOffset(600, 370),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 220,
    BackgroundImageTransparency = 0.3,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("Linux Hub V3 - User Profile")
        end,
    },
})

local AvatarTab = Window:Tab({
    Title = "Avatar",
    Icon = "user",
    Locked = false,
})
local TagsTab = Window:Tab({
    Title = "Tags",
    Icon = "tag",
    Locked = false,
})
local BladeBallTab = Window:Tab({
    Title = "Blade Ball",
    Icon = "sword",
    Locked = false,
})
local StealBrainrotTab = Window:Tab({
    Title = "Steal a Brainrot",
    Icon = "brain",
    Locked = false,
})
local ScriptsTab = Window:Tab({
    Title = "Scripts",
    Icon = "scroll",
    Locked = false,
})
local AdminTab = Window:Tab({
    Title = "Admin",
    Icon = "crown",
    Locked = false,
})
local ScriptsNovosTab = Window:Tab({
    Title = "Scripts Novos",
    Icon = "sparkles",
    Locked = false,
})
local BrookhavenTab = Window:Tab({
    Title = "Brookhaven",
    Icon = "home",
    Locked = false,
})
local TrollTab = Window:Tab({
    Title = "Troll",
    Icon = "ghost",
    Locked = false,
})
local ExtrasTab = Window:Tab({
    Title = "Extras",
    Icon = "target",
    Locked = false,
})
local FarmsTab = Window:Tab({
    Title = "Farms",
    Icon = "wheat",
    Locked = false,
})
local ToolsTab = Window:Tab({
    Title = "Tools",
    Icon = "wrench",
    Locked = false,
})
local ImunesTab = Window:Tab({
    Title = "Imunes",
    Icon = "shield",
    Locked = false,
})
local PlayersTab = Window:Tab({
    Title = "Players",
    Icon = "users",
    Locked = false,
})
local GhostHubTab = Window:Tab({
    Title = "GhostHub",
    Icon = "ghost",
    Locked = false,
})
local MinecraftTab = Window:Tab({
    Title = "Minecraft",
    Icon = "pickaxe",
    Locked = false,
})
local DesastresTab = Window:Tab({
    Title = "Desastres",
    Icon = "tornado",
    Locked = false,
})
local FlorestaTab = Window:Tab({
    Title = "99 Noites",
    Icon = "tree",
    Locked = false,
})
local RivalsTab = Window:Tab({
    Title = "Rivals",
    Icon = "swords",
    Locked = false,
})
local MMTab = Window:Tab({
    Title = "Murder Mystery",
    Icon = "knife",
    Locked = false,
})
local PrisonTab = Window:Tab({
    Title = "Prison Life",
    Icon = "building",
    Locked = false,
})
local R6R15Tab = Window:Tab({
    Title = "R6/R15",
    Icon = "bot",
    Locked = false,
})
local FunTab = Window:Tab({
    Title = "Diversão",
    Icon = "star",
    Locked = false,
})
local TeleportTab = Window:Tab({
    Title = "Teleporte",
    Icon = "zap",
    Locked = false,
})
local AdultTab = Window:Tab({
    Title = "SCRIPTS +18",
    Icon = "lock",
    Locked = false,
})

-- Seleciona a primeira aba (agora é RGB)
Window:SelectTab(1)

-- Notificação de boas-vindas
WindUI:Notify({
    Title = "Linux Hub Carregado!",
    Content = "Bem-vindo ao Linux Hub V4 - Nova Aba RGB!",
    Duration = 6.5,
    Icon = "check-circle",
})

-- Tag de versão
Window:Tag({
    Title = "v3.4.0",
    Color = Color3.fromHex("#ff6b6b")
})

-- ==============================
-- AVATAR
-- ==============================

-- Sistema de gerenciamento de avatares
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Função para equipar avatar por ID
local function EquiparAvatarPorID(avatarID, nome)
    local args = { avatarID }
    local success = pcall(function()
        return ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
    end)
    if success then
        print("Avatar " .. nome .. " equipado com sucesso!")
    else
        print("Falha ao equipar o avatar " .. nome)
    end
end

-- Função para equipar partes do corpo
local function EquiparPartesCorpo(partes)
    local args = { partes }
    local success = pcall(function()
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
    end)
    if success then
        print("Partes do corpo equipadas!")
    end
end

-- Função para equipar acessórios (skins normais)
local function equiparAcessorios(accessoryIds, nomeSkin)
    local character = player.Character or player.CharacterAdded:Wait()
    
    local function equipAccessory(assetId)
        local success, accessory = pcall(function()
            return game:GetObjects("rbxassetid://"..assetId)[1]
        end)
        
        if success and accessory then
            accessory.Parent = character
            -- Verifica se é Accessory e adiciona ao Humanoid
            if accessory:IsA("Accessory") then
                character.Humanoid:AddAccessory(accessory)
            end
        else
            warn("Falha ao carregar accessory com ID: "..assetId)
        end
    end
    
    -- Equipar todos os acessórios
    for _, id in ipairs(accessoryIds) do
        equipAccessory(id)
    end
    
    print("Skin " .. nomeSkin .. " equipada com sucesso!")
end

-- ==============================
-- ROUPAS 3D
-- ==============================

local AvatarSection = AvatarTab:Section({
    Title = "Roupas 3D",
    TextXAlignment = "Left",
    TextSize = 17,
})

AvatarTab:Button({
    Title = "Gato de Manga",
    Desc = "Avatar 3D Gato de Manga",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(124948425515124, "Gato de Manga")
    end
})

AvatarTab:Button({
    Title = "Tung Saur",
    Desc = "Avatar 3D Tung Saur",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(117098257036480, "Tung Saur")
    end
})

AvatarTab:Button({
    Title = "Tralaleiro",
    Desc = "Avatar 3D Tralaleiro",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(99459753608381, "Tralaleiro")
    end
})

AvatarTab:Button({
    Title = "Monstro S.A",
    Desc = "Avatar 3D Monstro S.A",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(123609977175226, "Monstro S.A")
    end
})

AvatarTab:Button({
    Title = "Trenzinho",
    Desc = "Avatar 3D Trenzinho",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(80468697076178, "Trenzinho")
    end
})

AvatarTab:Button({
    Title = "Dino",
    Desc = "Avatar 3D Dinossauro",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(11941741105, "Dino")
    end
})

AvatarTab:Button({
    Title = "Pou Idoso",
    Desc = "Avatar 3D Pou Idoso",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(15742966010, "Pou Idoso")
    end
})

AvatarTab:Button({
    Title = "Coco/Boxt@",
    Desc = "Avatar 3D Coco/Boxt@",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(77013984520332, "Coco/Boxt@")
    end
})

AvatarTab:Button({
    Title = "Coelho",
    Desc = "Avatar 3D Coelho",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(71797333686800, "Coelho")
    end
})

AvatarTab:Button({
    Title = "Hipopótamo",
    Desc = "Avatar 3D Hipopótamo",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(73215892129281, "Hipopótamo")
    end
})

AvatarTab:Button({
    Title = "Ratatui",
    Desc = "Avatar 3D Ratatui",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(108557570415453, "Ratatui")
    end
})

AvatarTab:Button({
    Title = "Galinha",
    Desc = "Avatar 3D Galinha",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(71251793812515, "Galinha")
    end
})

AvatarTab:Button({
    Title = "Peppa Pig",
    Desc = "Avatar 3D Peppa Pig",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(92979204778377, "Peppa Pig")
    end
})

AvatarTab:Button({
    Title = "Pinguim",
    Desc = "Avatar 3D Pinguim",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(94944293759578, "Pinguim")
    end
})

AvatarTab:Button({
    Title = "Sid",
    Desc = "Avatar 3D Sid",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(87442757321244, "Sid")
    end
})

AvatarTab:Button({
    Title = "Puga Grande",
    Desc = "Avatar 3D Puga Grande",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(111436158728716, "Puga Grande")
    end
})

AvatarTab:Button({
    Title = "SHREK AMALDIÇOADO",
    Desc = "Avatar 3D Shrek Amaldiçoado",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(120960401202173, "SHREK AMALDIÇOADO")
    end
})

AvatarTab:Button({
    Title = "Mosquito Grande",
    Desc = "Avatar 3D Mosquito Grande",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(108052868536435, "Mosquito Grande")
    end
})

AvatarTab:Button({
    Title = "Noob Invertido",
    Desc = "Avatar 3D Noob Invertido",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(106596990206151, "Noob Invertido")
    end
})

AvatarTab:Button({
    Title = "Pato(a)",
    Desc = "Avatar 3D Pato",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(135132836238349, "Pato")
    end
})

AvatarTab:Button({
    Title = "Cachorro Chihuahua",
    Desc = "Avatar 3D Chihuahua",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(18656467256, "Cachorro Chihuahua")
    end
})

AvatarTab:Button({
    Title = "Gato Sla",
    Desc = "Avatar 3D Gato",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(18994959003, "Gato Sla")
    end
})

AvatarTab:Button({
    Title = "Gato Fei",
    Desc = "Avatar 3D Gato Fei",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(77506186615650, "Gato Fei")
    end
})

AvatarTab:Button({
    Title = "Impostor",
    Desc = "Avatar 3D Impostor",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(18234669337, "Impostor")
    end
})

AvatarTab:Button({
    Title = "Simon Amarelo",
    Desc = "Avatar 3D Simon Amarelo",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(75183593514657, "Simon Amarelo")
    end
})

AvatarTab:Button({
    Title = "Simon Azul",
    Desc = "Avatar 3D Simon Azul",
    Locked = false,
    Callback = function()
        EquiparAvatarPorID(76155710249925, "Simon Azul")
    end
})

-- ==============================
-- SKINS NORMAIS
-- ==============================

local SkinsSection = AvatarTab:Section({
    Title = "Skins Normais",
    TextXAlignment = "Left",
    TextSize = 17,
})

AvatarTab:Button({
    Title = "Linux v1999",
    Desc = "Skin normal Linux v1999",
    Locked = false,
    Callback = function()
        local accessoryIds = {
            6913613757,
            83820363103771,
            15827519439
        }
        equiparAcessorios(accessoryIds, "Linux v1999")
    end
})

-- ==============================
-- AVATAR EDITOR
-- ==============================

local AvatarEditorSection = AvatarTab:Section({
    Title = "Avatar Editor",
    TextXAlignment = "Left",
    TextSize = 17,
})

AvatarTab:Button({
    Title = "Mini REPO",
    Desc = "AVISO: Vai resetar seu avatar",
    Locked = false,
    Callback = function()
        local partes = {
            117101023704825, -- Perna Direita
            125767940563838, -- Perna Esquerda
            137301494386930, -- Braço Direito
            87357384184710,  -- Braço Esquerdo
            133391239416999, -- Torso
            111818794467824  -- Cabeça
        }
        EquiparPartesCorpo(partes)
    end
})

AvatarTab:Button({
    Title = "Mini Garanhão",
    Desc = "AVISO: Vai resetar seu avatar",
    Locked = false,
    Callback = function()
        local partes = {
            124355047456535, -- Perna Direita
            120507500641962, -- Perna Esquerda
            82273782655463,  -- Braço Direito
            113625313757230, -- Braço Esquerdo
            109182039511426, -- Torso
            0                -- Cabeça
        }
        EquiparPartesCorpo(partes)
    end
})

AvatarTab:Button({
    Title = "Stick",
    Desc = "AVISO: Vai resetar seu avatar",
    Locked = false,
    Callback = function()
        local partes = {
            14731384498, -- Perna Direita
            14731377938, -- Perna Esquerda
            14731377894, -- Braço Direito
            14731377875, -- Braço Esquerdo
            14731377941, -- Torso
            14731382899  -- Cabeça
        }
        EquiparPartesCorpo(partes)
    end
})

AvatarTab:Button({
    Title = "Chunky-Bug",
    Desc = "AVISO: Vai resetar seu avatar",
    Locked = false,
    Callback = function()
        local partes = {
            15527827600, -- Perna Direita
            15527827578, -- Perna Esquerda
            15527831669, -- Braço Direito
            15527836067, -- Braço Esquerdo
            15527827184, -- Torso
            15527827599  -- Cabeça
        }
        EquiparPartesCorpo(partes)
    end
})

AvatarTab:Button({
    Title = "Cursed-Spider",
    Desc = "AVISO: Vai resetar seu avatar",
    Locked = false,
    Callback = function()
        local partes = {
            134555168634906, -- Perna Direita
            100269043793774, -- Perna Esquerda
            125607053187319, -- Braço Direito
            122504853343598, -- Braço Esquerdo
            95907982259204,  -- Torso
            91289185840375   -- Cabeça
        }
        EquiparPartesCorpo(partes)
    end
})

AvatarTab:Button({
    Title = "Possessed-Horror",
    Desc = "AVISO: Vai resetar seu avatar",
    Locked = false,
    Callback = function()
        local partes = {
            122800511983371, -- Perna Direita
            132465361516275, -- Perna Esquerda
            125155800236527, -- Braço Direito
            83070163355072,  -- Braço Esquerdo
            102906187256945, -- Torso
            78311422507297   -- Cabeça
        }
        EquiparPartesCorpo(partes)
    end
})

-- ==============================
-- ABA TAGS (mantida igual)
-- ==============================

local isNameActive = false
local isBioActive = false

local SectionRGBName = TagsTab:Section({
    Name = "Nome RGB"
})

TagsTab:Toggle({
    Title = "Nome RGB",
    Description = "Ativar Nome RGB",
    Default = false,
    Callback = function(value)
        isNameActive = value
        print(value and "RGB Name ativado" or "RGB Name desativado")
    end
})

local SectionRGBBio = TagsTab:Section({
    Name = "RGB BIO"
})

TagsTab:Toggle({
    Title = "RGB BIO",
    Description = "Ativar RGB BIO",
    Default = false,
    Callback = function(value)
        isBioActive = value
        print(value and "RGB BIO ativado" or "RGB BIO desativado")
    end
})

local vibrantColors = {
    Color3.fromRGB(255, 0, 0),   -- Vermelho
    Color3.fromRGB(0, 255, 0),   -- Verde
    Color3.fromRGB(0, 0, 255),   -- Azul
    Color3.fromRGB(255, 255, 0), -- Amarelo
    Color3.fromRGB(255, 0, 255), -- Magenta
    Color3.fromRGB(0, 255, 255), -- Ciano
    Color3.fromRGB(255, 165, 0), -- Laranja
    Color3.fromRGB(128, 0, 128), -- Roxo
    Color3.fromRGB(255, 20, 147) -- Rosa choque
}

spawn(function()
    while true do
        if isNameActive then
            local randomColor = vibrantColors[math.random(#vibrantColors)]
            local args = {
                [1] = "PickingRPNameColor",
                [2] = randomColor
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
        end
        wait(0.7)
    end
end)

spawn(function()
    while true do
        if isBioActive then
            local randomColor = vibrantColors[math.random(#vibrantColors)]
            local args = {
                [1] = "PickingRPBioColor",
                [2] = randomColor
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
        end
        wait(0.7)
    end
end)

local SectionNames = TagsTab:Section({
    Name = "Adicionar Nomes no Jogador"
})

local names = {
    {"ＬＩＮＵＸ ＨＵＢ ＤＥＶ", " ＬＩＮＵＸ ＨＵＢ ＤＥＶ "},
    {"ＬＩＮＵＸ ＨＵＢ ＤＯＮＯ", " ＬＩＮＵＸ ＨＵＢ ＤＯＮＯ "},
    {"ＣＡＨＨ ＤＥＶ ＬＩＮＵＸ ＨＵＢ", " ＣＡＨＨ ＤＥＶ ＬＩＮＵＸ ＨＵＢ "},
    {"ＬＩＮＵＸ ＨＵＢ ＥＮＤ ＤＥＶ", " ＬＩＮＵＸ ＨＵＢ ＥＮＤ ＤＥＶ "},
    {"ＬＩＮＵＸ ＨＵＢ ＴＨＵＲ ＤＥＶ", " ＬＩＮＵＸ ＨＵＢ ＴＨＵＲ ＤＥＶ "},
    {"ＬＩＮＵＸ ＨＵＢ ＤＡＶＩ ＤＥＶ", " ＬＩＮＵＸ ＨＵＢ ＤＡＶＩ ＤＥＶ "},
    {"ＬＩＮＵＸ ＨＵＢ ＣＨＡＤＤＡＲｘ ＡＤＭ", " ＬＩＮＵＸ ＨＵＢ ＣＨＡＤＤＡＲｘ ＡＤＭ "},
    {"Ant Mandrakes :: Error", " Ant Mandrakes :: Error "},
    {"ERR0R_666", " ERR0R_666 "},
    {"DARKNE1SSS", " DARKNE1SSS "},
    {"GHOST", " GHOST "},
    {"JOKER", " JOKER "},
    {"ADMIN", " ADMIN "},
    {"TUBERS93", " TUBERS 93 "},
    {"CO0LKID", " CO0 LKID "}
}

for _, name in ipairs(names) do
    TagsTab:Button({
        Title = "Name: " .. name[1],
        Callback = function()
            game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", name[2])
        end
    })
end

-- ==============================
-- ABA BLADE BALL
-- ==============================
local BladeBallSection = BladeBallTab:Section({
    Title = "Blade Ball Hubs",
    TextXAlignment = "Left",
    TextSize = 17,
})

BladeBallTab:Button({
    Title = "Blade Ball Hub #1",
    Desc = "Hub principal para Blade Ball com auto parry e mais funcionalidades",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sirapobsriumang/Blade-ball/main/Blade-ball-free.lua"))()
    end
})

BladeBallTab:Button({
    Title = "Blade Ball Hub #2",
    Desc = "Hub alternativo Soluna para Blade Ball com auto parry",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Auto-ParryScript/Bladeball_Script/refs/heads/main/Soluna", true))()
    end
})

-- ==============================
-- NOVA ABA: STEAL A BRAINROT
-- ==============================

local StealBrainrotSection = StealBrainrotTab:Section({
    Title = "Scripts Brainrot Premium",
    TextXAlignment = "Left",
    TextSize = 17,
})

StealBrainrotTab:Button({
    Title = "Luarmor Script #1",
    Desc = "Script premium protegido - Luarmor",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/9a77cef9455a36ab545e0b157878e42d.lua"))()
    end
})

StealBrainrotTab:Button({
    Title = "KdmlScripts Premium",
    Desc = "Script exclusivo do repositório KdmlScripts",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kedd063/KdmlScripts/refs/heads/main/bcb069eb1943bfd3.lua"))()
    end
})

StealBrainrotTab:Button({
    Title = "Pop It Trading Script",
    Desc = "Script avançado para Pop It Trading",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/obama928292/Respotity/refs/heads/main/Pop%20it%20plays"))()
    end
})

-- ==============================
-- SCRIPTS PRINCIPAIS
-- ==============================

local ScriptsSection = ScriptsTab:Section({
    Title = "Principais Scripts",
    TextXAlignment = "Left",
    TextSize = 17,
})

ScriptsTab:Button({
    Title = "FE Emotes",
    Desc = "Script de emotes para Brookhaven",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Brookhaven-RP-all-emotes-6849"))()
    end
})

ScriptsTab:Button({
    Title = "Ghost Hub",
    Desc = "Hub principal do Ghost",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
    end
})

ScriptsTab:Button({
    Title = "Infinite Yield",
    Desc = "Comandos administrativos",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/infiniteyieldv2/main/Main.txt"))()
    end
})

ScriptsTab:Button({
    Title = "Pesquisar Scripts",
    Desc = "Ferramenta para buscar scripts",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
    end
})

ScriptsTab:Button({
    Title = "R4D",
    Desc = "Hub R4D para Brookhaven",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script"))()
    end
})

ScriptsTab:Button({
    Title = "Rael Hub",
    Desc = "Hub multiusos",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Laelmano24/Rael-Hub/main/main.txt"))()
    end
})

ScriptsTab:Button({
    Title = "Save Servers",
    Desc = "Salvar servidores",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/Sabe-servers/main/Main.txt"))()
    end
})

ScriptsTab:Button({
    Title = "Nameless Admin",
    Desc = "Comandos administrativos avançados",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
    end
})

ScriptsTab:Button({
    Title = "Sander X",
    Desc = "Hub popular",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/SanderXV4.2.2/refs/heads/main/New.lua"))()
    end
})

ScriptsTab:Button({
    Title = "System Broken",
    Desc = "Hub System Broken",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
    end
})

ScriptsTab:Button({
    Title = "View Itens",
    Desc = "Visualizar itens",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/View-itens/main/main.txt"))()
    end
})

ScriptsTab:Button({
    Title = "View Players",
    Desc = "Visualizar jogadores",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/View/main/main.txt"))()
    end
})

ScriptsTab:Button({
    Title = "Void",
    Desc = "Script Void FE",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/Void-fe/main/main.txt"))()
    end
})

ScriptsTab:Button({
    Title = "Freeze Emotes",
    Desc = "Congelar emotes",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/Lockemotes/main/Main.txt"))()
    end
})

ScriptsTab:Button({
    Title = "Tiger Hub",
    Desc = "Hub de funcionalidades",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/Tiger-X-V3/main/Tiger%20X%20V3.5%20Fixed"))()
    end
})

ScriptsTab:Button({
    Title = "Aimbot",
    Desc = "Sistema de mira automática",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/qtZt0Nzb"))()
    end
})

ScriptsTab:Button({
    Title = "Hub Universal",
    Desc = "Hub com múltiplas funcionalidades",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3"))()
    end
})

ScriptsTab:Button({
    Title = "Salvatore",
    Desc = "Hub Salvatore",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RFR-R1CH4RD/Loader/main/Salvatore.lua"))()
    end
})

ScriptsTab:Button({
    Title = "Draw FE",
    Desc = "Ferramenta de desenho FE",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Affexter/Programs/refs/heads/main/scripts/tooldrawFE.lua"))()
    end
})

ScriptsTab:Button({
    Title = "Multiplicar Tools",
    Desc = "Duplicador de ferramentas",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/NeonDuplicator/refs/heads/main/Script.lua"))()
    end
})

ScriptsTab:Button({
    Title = "Chaos Hub",
    Desc = "Hub de funcionalidades avançadas",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Venom-devX/ChaosHub/main/loader.lua"))()
    end
})

ScriptsTab:Button({
    Title = "Rebobination",
    Desc = "Sistema de rebobinação",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/rebobination/main/Main.txt"))()
    end
})

-- ==============================
-- COMANDOS ADMIN
-- ==============================

local AdminSection = AdminTab:Section({
    Title = "Comandos Administrativos",
    TextXAlignment = "Left",
    TextSize = 17,
})

AdminTab:Button({
    Title = "Nameless Admin",
    Desc = "Sistema completo de admin",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
    end
})

AdminTab:Button({
    Title = "Infinite Yield",
    Desc = "Comandos IY",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/infiniteyieldv2/main/Main.txt"))()
    end
})

AdminTab:Button({
    Title = "Reviz Admin",
    Desc = "Admin clássico",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N"))()
    end
})

AdminTab:Button({
    Title = "CMD-X",
    Desc = "Sistema CMD-X",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
    end
})

AdminTab:Button({
    Title = "Fates Admin",
    Desc = "Admin moderno",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    end
})

AdminTab:Button({
    Title = "Linux cmds",
    Desc = "Comandos Linux personalizados",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/angel-commands/main/Main.txt"))()
    end
})

AdminTab:Button({
   Title = "Sistema Anti-Kids",
   Desc = "pra parar digite /stop ou /parar",
   Locked = false,
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/antkids/refs/heads/main/Main.txt"))()
   end
})

AdminTab:Button({
    Title = "CopyAvatar",
    Desc = "Sistema CopyAvatar",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/copyavatar/refs/heads/main/Main.txt"))()
    end
})

-- ==============================
-- SCRIPTS NOVOS
-- ==============================

local ScriptsNovosSection = ScriptsNovosTab:Section({
    Title = "Scripts Recentes",
    TextXAlignment = "Left",
    TextSize = 17,
})


ScriptsNovosTab:Button({
    Title = "Flash",
    Desc = "Sistema de velocidade",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/flash/refs/heads/main/Main.txt"))()
    end
})

ScriptsNovosTab:Button({
    Title = "Chat Bypass",
    Desc = "Bypass do filtro de chat",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/snigglaberry/BYTERPASS/refs/heads/main/byterpass"))()
    end
})

ScriptsNovosTab:Button({
    Title = "Rochips Scripts",
    Desc = "Hub Rochips V3",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/rochipshub-v3-/main/Main.txt"))()
    end
})

ScriptsNovosTab:Button({
    Title = "Realistic FX",
    Desc = "Efeitos realísticos para Brookhaven",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-BrookHaven-UltraFX-44718"))()
    end
})

ScriptsNovosTab:Button({
    Title = "Unban House",
    Desc = "Sistema para desbanir casas",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/Main.txt/main/Main.txt"))()
    end
})

-- ==============================
-- BROOKHAVEN
-- ==============================

local BrookhavenSection = BrookhavenTab:Section({
    Title = "Scripts para Brookhaven RP",
    TextXAlignment = "Left",
    TextSize = 17,
})

BrookhavenTab:Button({
    Title = "Linux Hub",
    Desc = "Hub principal para Brookhaven",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/Linuxhub2/refs/heads/main/Main.txt"))()
    end
})

BrookhavenTab:Button({
    Title = "Shnmax Hub",
    Desc = "Hub atualizado para Brookhaven",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-SHNMAX-UPDATE-FIX-NO-KEYLESS-48289"))()
    end
})

BrookhavenTab:Button({
    Title = "Furia Hub",
    Desc = "Hub Furia",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-FURIA-HUB-47441"))()
    end
})

BrookhavenTab:Button({
    Title = "Sander X",
    Desc = "Hub Sander X para Brookhaven",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))()
    end
})

BrookhavenTab:Button({
    Title = "Chaos Hub",
    Desc = "Hub de funcionalidades avançadas",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Venom-devX/ChaosHub/main/loader.lua"))()
    end
})

BrookhavenTab:Button({
    Title = "Coquette Hub",
    Desc = "Hub Coquette",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-41921"))()
    end
})

BrookhavenTab:Button({
    Title = "Drip Hub",
    Desc = "Hub Drip Client",
    Locked = false,
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/realgengar/Main/refs/heads/main/base.lua"))()
    end
})

BrookhavenTab:Button({
    Title = "Cartola Hub",
    Desc = "Hub Cartola",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))() 
    end
})

-- ==============================
-- R6/R15 ANIMATIONS
-- ==============================


local R6R15Section = R6R15Tab:Section({
    Title = "Scripts de Animações",
    TextXAlignment = "Left",
    TextSize = 17,
})

R6R15Tab:Button({
    Title = "🌟 Hub Universal",
    Desc = "Hub universal de scripts",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()
    end
})

R6R15Tab:Button({
    Title = "🐉 l0rdDr4k3r GUI",
    Desc = "GUI de animações avançadas",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xym..."))()
    end
})

R6R15Tab:Button({
    Title = "😄 Emotes Hub",
    Desc = "Hub de emotes e animações",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fsploit/FeAnimationHub/refs/heads/main/Hub.lua"))()
    end
})

R6R15Tab:Button({
    Title = "🔪 Grab Knife (pode não funcionar)",
    Desc = "Script de faca grab",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753"))()
    end
})

R6R15Tab:Button({
    Title = "💀 Death Hub",
    Desc = "Hub de animações Death",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Die-of-Death-Red-Hub-35696"))()
    end
})

R6R15Tab:Button({
    Title = "🤖 R6 Animation",
    Desc = "Animações R6 específicas",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/1p6xnBNf'),true))()
    end
})

R6R15Tab:Button({
    Title = "⚡ FE Forsaken",
    Desc = "Script FE Forsaken",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/qwertys/refs/heads/main/qwerty0.lua"))()
    end
})

R6R15Tab:Button({
    Title = "🕺 Animation Tools",
    Desc = "Ferramentas de animação",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/My-Scripts/refs/heads/main/Epik%20R6%20Dancezz"))()
    end
})

-- ==============================
-- 99 NOITES NA FLORESTA
-- ==============================

local FlorestaSection = FlorestaTab:Section({
    Title = "Scripts para 99 Nights in the Forest",
    TextXAlignment = "Left",
    TextSize = 17,
})

FlorestaTab:Button({
    Title = "🦊 Vex Hub",
    Desc = "Hub principal para 99 Nights",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yoursvexyyy/VEX-OP/refs/heads/main/99%20nights%20in%20the%20forest"))()
    end
})

FlorestaTab:Button({
    Title = "🐍 Cobra Hub",
    Desc = "Hub Cobra para 99 Nights",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/705e9a93cc18214fb77ab95686a8dba9.lua"))()
    end
})

FlorestaTab:Button({
    Title = "🌌 VoidWare",
    Desc = "Script avançado para o jogo",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
    end
})

FlorestaTab:Button({
    Title = "⚡ EF Hub",
    Desc = "Hub EF para 99 Nights",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://api.exploitingis.fun/loader', true))()
    end
})

FlorestaTab:Button({
    Title = "🎯 COA Hub",
    Desc = "Hub COA/GOA",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nevcit/GOA_HUB/refs/heads/main/99%20Nights%20In%20The%20Forest"))()
    end
})

FlorestaTab:Button({
    Title = "🌙 Soluna Hub",
    Desc = "Hub Soluna para 99 Nights",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://soluna-script.vercel.app/99-Nights-in-the-Forest.lua",true))()
    end
})

-- ==============================
-- DESASTRES NATURAIS
-- ==============================

local DesastresSection = DesastresTab:Section({
    Title = "Scripts para Natural Disaster Survival",
    TextXAlignment = "Left",
    TextSize = 17,
})

DesastresTab:Button({
    Title = "🌟 Hub Novo",
    Desc = "Hub novo para NDS",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main'))()
    end
})

DesastresTab:Button({
    Title = "🌪️ NDS Hub",
    Desc = "Hub para Natural Disaster",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
    end
})

DesastresTab:Button({
    Title = "🌐 Gravity",
    Desc = "Script Gravity",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/96XzjEiK"))()
    end
})

DesastresTab:Button({
    Title = "🏔️ Natural Disaster Hub",
    Desc = "Hub completo para NDS",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Codexxscripts/Script/refs/heads/main/Protected_7867058958573066.lua.txt"))()
    end
})

DesastresTab:Button({
    Title = "🔥 Flames Hub",
    Desc = "Hub Flames",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EnterpriseExperience/MicUpSource/refs/heads/main/retrieve_branch_version.lua')))()
    end
})

DesastresTab:Button({
    Title = "👋 Touch Fling",
    Desc = "Script de fling por toque",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
    end
})

DesastresTab:Button({
    Title = "🕳️ Black Hole",
    Desc = "Script de buraco negro",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/7V8KH60M"))()
    end
})

DesastresTab:Button({
    Title = "🌪️ Tornado de Blocos",
    Desc = "Script de tornado",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/W6fcvJYL"))()
    end
})

-- ==============================
-- MURDER MYSTERY
-- ==============================

local MMSection = MMTab:Section({
    Title = "Scripts para Murder Mystery 2",
    TextXAlignment = "Left",
    TextSize = 17,
})

MMTab:Button({
    Title = "⏰ Ploy Prime Time",
    Desc = "Script principal para MM2",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ployprimetime/MM2/refs/heads/main/script.lua", true))()
    end
})

MMTab:Button({
    Title = "📝 Pastefy Script 1",
    Desc = "Script MM2 Pastefy",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/4r71Frgj/raw"))()
    end
})

MMTab:Button({
    Title = "☀️ Summer UPD",
    Desc = "Script Summer Update",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hoodratleahh/Summer-UPD/refs/heads/main/Initializer.lua"))()
    end
})

MMTab:Button({
    Title = "❄️ SNT Hub",
    Desc = "Hub SNT para MM2",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Snowt-Team/SNT-HUB/refs/heads/main/MurderMystery2.txt"))()
    end
})

MMTab:Button({
    Title = "📝 Pastefy Script 2",
    Desc = "Segundo script MM2 Pastefy",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/FoJFHO9y/raw"))()
    end
})

MMTab:Button({
    Title = "🔺 Vertex Peak",
    Desc = "Hub moderno para MM2",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
    end
})

-- ==============================
-- PRISON LIFE
-- ==============================

local PrisonSection = PrisonTab:Section({
    Title = "Scripts para Prison Life",
    TextXAlignment = "Left",
    TextSize = 17,
})

PrisonTab:Button({
    Title = "♾️ Infinite Yield",
    Desc = "IY para Prison Life",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
    end
})

PrisonTab:Button({
    Title = "🔒 PrisonWare GUI",
    Desc = "GUI completa para Prison Life",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt", true))()
    end
})

PrisonTab:Button({
    Title = "⚙️ Septex Admin",
    Desc = "Admin Septex",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife", true))()
    end
})

PrisonTab:Button({
    Title = "📋 Admin Commands",
    Desc = "Comandos administrativos",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/KA7xFcbL", true))()
    end
})

PrisonTab:Button({
    Title = "🐅 Tiger Admin",
    Desc = "Admin para Prison Life",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/h17s3/TIGERADMIN/main/TIGERADMINSCRIPTFREE", true))()
    end
})

PrisonTab:Button({
    Title = "comandos fodas de prison life esse sim",
    Desc = "Comandos administrativos V2",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SkidMaster999/RobloxScript/refs/heads/main/Game/PrisonLife/PissAdmin.lua"))()
    end
})

-- ==============================
-- RIVALS
-- ==============================

local RivalsSection = RivalsTab:Section({
    Title = "Scripts para Rivals",
    TextXAlignment = "Left",
    TextSize = 17,
})

RivalsTab:Button({
    Title = "🎯 Script 1",
    Desc = "Script básico para Rivals",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/gcUsjvks"))()
    end
})

RivalsTab:Button({
    Title = "🌙 Script Soluna",
    Desc = "Script avançado para Rivals",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://soluna-script.vercel.app/main.lua", true))()
    end
})

RivalsTab:Button({
    Title = "🦉 OwlHub",
    Desc = "Hub para Rivals",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()
    end
})

-- ==============================
-- TROLL SCRIPTS
-- ==============================

local TrollSection = TrollTab:Section({
    Title = "Scripts de Troll",
    TextXAlignment = "Left",
    TextSize = 17,
})

TrollTab:Button({
    Title = "Glue",
    Desc = "Sistema de cola",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/Glue/refs/heads/main/Main.txt"))()
    end
})

TrollTab:Button({
    Title = "annoy Players",
    Desc = "annoy em outros jogadores",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/annoy/refs/heads/main/Main.txt"))()
    end
})

TrollTab:Button({
    Title = "Limpar Chat",
    Desc = "Limpar o chat",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-LIMPA-CHAT-47355"))()
    end
})

TrollTab:Button({
    Title = "Invisível",
    Desc = "Ficar invisível",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Avatar-invisible-45072"))()
    end
})

TrollTab:Button({
    Title = "Bug Server [/bug all /remove bug]",
    Desc = "Sistema para bugar o servidor",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/Bug-all/refs/heads/main/Main.txt"))()
    end
})

TrollTab:Button({
    Title = "Bugzin",
    Desc = "foder a vida dos outros",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/bugzin/refs/heads/main/Main.txt"))()
    end
})

TrollTab:Button({
    Title = "[🖥] Spawn Factory (não visual)",
    Desc = "spawnar a fabrica né pae kkj.",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        local targetPosition = Vector3.new(-37, 19, -145)

        -- Espera o personagem carregar
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            player.CharacterAdded:Wait()
        end

        local character = player.Character
        local root = character:WaitForChild("HumanoidRootPart")

        -- Teleporta o personagem direto
        root.CFrame = CFrame.new(targetPosition)

        task.wait(0.5) -- delay curto pra garantir que tá no lugar certo

        -- 2. Invoca os remotes após o teleporte
        local args1 = { 6 }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:Claim"):InvokeServer(unpack(args1))

        local args2 = { 6, "001_Landmark" }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):FireServer(unpack(args2))
    end
})


-- ==============================
-- EXTRAS
-- ==============================

local ExtrasSection = ExtrasTab:Section({
    Title = "Funcionalidades Extras",
    TextXAlignment = "Left",
    TextSize = 17,
})

ExtrasTab:Button({
    Title = "Modo Gigante",
    Desc = "Avatar gigante",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-FE-BIG-AVATAR-43381"))()
    end
})

ExtrasTab:Button({
    Title = "Virar Bola KKJ",
    Desc = "Transformar em bola",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-ball-rolL-9835"))()
    end
})

ExtrasTab:Button({
    Title = "Sky Hub",
    Desc = "Hub Sky para trolling",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
    end
})

ExtrasTab:Button({
    Title = "Rejoin",
    Desc = "Reconectar ao servidor",
    Locked = false,
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

ExtrasTab:Button({
    Title = "Server Hop",
    Desc = "Trocar de servidor",
    Locked = false,
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"

        local _place = game.PlaceId
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
        
        function ListServers(cursor)
            local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
            return Http:JSONDecode(Raw)
        end

        local Server, Next; repeat
            local Servers = ListServers(Next)
            Server = Servers.data[1]
            Next = Servers.nextPageCursor
        until Server

        TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
    end
})

-- ==============================
-- FARMS
-- ==============================

local FarmsSection = FarmsTab:Section({
    Title = "Scripts de Farm",
    TextXAlignment = "Left",
    TextSize = 17,
})

FarmsTab:Button({
    Title = "RealzX Hub (HubFarms)",
    Desc = "Hub de farms RealzX",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-RealzXHub-New-Event-44226"))()
    end
})

-- ==============================
-- TOOLS
-- ==============================

local ToolsSection = ToolsTab:Section({
    Title = "Ferramentas e Armas",
    TextXAlignment = "Left",
    TextSize = 17,
})

ToolsTab:Button({
    Title = "Arma de Portais",
    Desc = "Arma de portais avançada",
    Locked = false,
    Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/armas-de-portais-dnv/refs/heads/main/Main.txt"))()
    end
})

ToolsTab:Button({
    Title = "Portal Gun",
    Desc = "Arma de portais",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/portal-gun/refs/heads/main/Main.txt"))()
    end
})

ToolsTab:Button({
    Title = "Buraco Negro Tool",
    Desc = "Ferramenta de buraco negro",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Blackhole-Tool-Control-Unanc*d-Parts-27791"))()
    end
})

ToolsTab:Button({
    Title = "Gravity Gun",
    Desc = "Arma de telecinese",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Telekinesis-12332"))()
    end
})

-- ==============================
-- IMUNES
-- ==============================
local ImunesSection = ImunesTab:Section({
    Title = "Proteções e Imunidades",
    TextXAlignment = "Left",
    TextSize = 17,
})

-- Serviços
local LocalPlayer = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- Backup tables
local backupTables = {
    Vehicles = {},
    Canoes = {},
    Jets = {},
    Helis = {},
    Balls = {}
}

-- Notificação simples
local TeleportCarro = {}
function TeleportCarro:MostrarNotificacao(msg)
    print("🔔 "..msg)
end

-- Função genérica anti-fling
local function AntiFlingLoop(name, getFolderFunc)
    local active = false
    task.spawn(function()
        while true do
            if active and LocalPlayer.Character then
                local folder = getFolderFunc()
                if folder then
                    for _, item in ipairs(folder:GetChildren()) do
                        local isMine = false
                        if name == "Vehicles" then
                            for _, seat in ipairs(item:GetDescendants()) do
                                if (seat:IsA("VehicleSeat") or seat:IsA("Seat")) and seat.Occupant and seat.Occupant.Parent == LocalPlayer.Character then
                                    isMine = true
                                    break
                                end
                            end
                        elseif name == "Canoes" then
                            local owner = item:FindFirstChild("Owner")
                            isMine = owner and owner.Value == LocalPlayer
                        elseif name == "Jets" or name == "Helis" then
                            isMine = item.Name == LocalPlayer.Name
                        end
                        if not isMine then
                            table.insert(backupTables[name], item:Clone())
                            item:Destroy()
                        end
                    end
                end
            end
            task.wait(0.03)
        end
    end)
    return function(state)
        active = state
        TeleportCarro:MostrarNotificacao(name.." "..(state and "ativado!" or "desativado!"))
        if not state then
            for _, item in ipairs(backupTables[name]) do
                local parentFolder = getFolderFunc()
                if parentFolder then item.Parent = parentFolder end
            end
            backupTables[name] = {}
        end
    end
end

-- ==============================
-- BOTÕES DE PROTEÇÃO
-- ==============================
ImunesTab:Button({
    Title = "AntiBug",
    Desc = "Devs: cahh,Night",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/antbug/refs/heads/main/Main.txt"))()
    end
})

ImunesTab:Button({
    Title = "Anti Som",
    Desc = "DEU MO TRABALHO SE NÃO GOSTOU FAZ MELHOR AI DESGRAÇA",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/antsomv3/refs/heads/main/Main.txt"))()
    end
})

-- ==============================
-- TOGGLES DE ANTI-FLING / SIT
-- ==============================

-- Veículos
ImunesTab:Toggle({
    Title = "Anti flings de fdps",
    Description = "Remove veículos de outros jogadores automaticamente",
    Default = false,
    Callback = AntiFlingLoop("Vehicles", function()
        return Workspace:FindFirstChild("Vehicles")
    end)
})

-- Canoes
ImunesTab:Toggle({
    Title = "Anti Canoe Fling",
    Description = "Remove canoas de outros players automaticamente (reaparecem ao desativar)",
    Default = false,
    Callback = AntiFlingLoop("Canoes", function()
        local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
        return workspaceCom and workspaceCom:FindFirstChild("001_CanoeStorage")
    end)
})

-- Jets
ImunesTab:Toggle({
    Title = "Anti Fling Jets",
    Description = "Remove jets de outros jogadores automaticamente",
    Default = false,
    Callback = AntiFlingLoop("Jets", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        if folder and folder:FindFirstChild("001_Airport") then
            local storage = folder["001_Airport"]:FindFirstChild("AirportHanger")
            if storage then return storage:FindFirstChild("001_JetStorage") and storage["001_JetStorage"]:FindFirstChild("JetAirport") end
        end
    end)
})

-- Helicópteros
ImunesTab:Toggle({
    Title = "Anti Fling Helicópteros",
    Description = "Remove helicópteros de outros jogadores automaticamente",
    Default = false,
    Callback = AntiFlingLoop("Helis", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        return folder and folder:FindFirstChild("001_HeliStorage") and folder["001_HeliStorage"]:FindFirstChild("PoliceStationHeli")
    end)
})

-- Bolas
ImunesTab:Toggle({
    Title = "Anti Fling Ball",
    Description = "Remove SoccerBalls automaticamente",
    Default = false,
    Callback = AntiFlingLoop("Balls", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        return folder and folder:FindFirstChild("001_SoccerBalls")
    end)
})

-- Anti Sit
local antiSitActive = false
ImunesTab:Toggle({
    Title = "Anti Sit",
    Description = "Não deixa seu personagem sentar",
    Default = false,
    Callback = function(state)
        antiSitActive = state
        TeleportCarro:MostrarNotificacao("Anti Sit "..(state and "ativado!" or "desativado!"))
        task.spawn(function()
            while antiSitActive and LocalPlayer.Character do
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if humanoid:GetState() == Enum.HumanoidStateType.Seated then
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end
                end
                task.wait(0.05)
            end
            if not antiSitActive then
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end
        end)
    end
})

ImunesTab:Toggle({
    Title = "Anti-Lag (Todos os treco kkj)",
    Description = "Ativa ou desativa a deduplicação de todas as ferramentas",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local dedupLock = {}
        local IGNORED_PLAYER -- jogador que executou

        if not state then
            -- Toggle desativada, para automaticamente
            return
        end

        -- Marca automaticamente quem executou o script
        local function marcarIgnorado(player)
            IGNORED_PLAYER = player
        end

        -- Aceita qualquer Tool
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

        -- Varredura periódica
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

ImunesTab:Toggle({
    Name = "Anti Fling Portas",
    Description = "Ativa ou desativa a destruição de todas as portas do mapa",
    Default = false,
    Callback = function(state)
        -- Cria variável persistente se não existir
        if not _G.hiddenDoors then
            _G.hiddenDoors = {}
        end
        
        if state then
            -- Limpa dados anteriores antes de começar
            _G.hiddenDoors = {}
            
            -- Ativa: esconde portas (não remove, só torna invisíveis)
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower():find("door") then
                    -- Salva o estado original
                    local doorData = {
                        door = obj,
                        originalTransparency = obj.Transparency,
                        originalCanCollide = obj.CanCollide,
                        originalCastShadow = obj.CastShadow
                    }
                    
                    -- Esconde a porta (mantém funcionalidade)
                    obj.Transparency = 1
                    obj.CanCollide = false
                    obj.CastShadow = false
                    
                    -- Esconde filhos se houver (maçanetas, etc)
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
            print("🔧 " .. #_G.hiddenDoors .. " portas escondidas!")
            
        else
            -- Desativa: restaura portas (volta ao estado original)
            for _, doorData in ipairs(_G.hiddenDoors or {}) do
                if doorData.door and doorData.door.Parent then
                    -- Restaura propriedades originais
                    doorData.door.Transparency = doorData.originalTransparency
                    doorData.door.CanCollide = doorData.originalCanCollide
                    doorData.door.CastShadow = doorData.originalCastShadow
                    
                    -- Restaura filhos
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
            
            print("✅ " .. #(_G.hiddenDoors or {}) .. " portas restauradas com funcionalidade!")
            _G.hiddenDoors = {} -- Limpa a lista
        end
    end
})


-- ==============================
-- PLAYERS
-- ==============================

local PlayersSection = PlayersTab:Section({
    Title = "Métodos para Players",
    TextXAlignment = "Left",
    TextSize = 17,
})

PlayersTab:Button({
    Title = "Bring",
    Desc = "Trazer jogadores para você",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/Bring/main/Main.txt"))()
    end
})

PlayersTab:Button({
    Title = "Kill Players",
    Desc = "Sistema para eliminar jogadores",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/Kill/main/main.txt"))()
    end
})

PlayersTab:Button({
    Title = "Hub de Espionar",
    Desc = "Espionar outros jogadores",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/guiview/main/Main.txt"))()
    end
})

PlayersTab:Button({
    Title = "Player Informations",
    Desc = "Informações dos jogadores",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow6698/informations/main/Main.txt"))()
    end
})

-- ==============================
-- GHOSTHUB
-- ==============================

local GhostHubSection = GhostHubTab:Section({
    Title = "Scripts do GhostHub",
    TextXAlignment = "Left",
    TextSize = 17,
})

GhostHubTab:Button({
    Title = "⌨️ Keyboard Delta",
    Desc = "Teclado Delta",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
    end
})

GhostHubTab:Button({
    Title = "FE Emotes R15",
    Desc = "Emotes FE para R15",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bfe%20r15%20animation%20player%5D.lua"))()
    end
})

GhostHubTab:Button({
    Title = "Ghost Hub Principal",
    Desc = "Hub principal do Ghost",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
    end
})

GhostHubTab:Button({
    Title = "FE Animation Player",
    Desc = "Player de animações FE",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bfe%20r15%20animation%20player%5D.lua"))()
    end
})

GhostHubTab:Button({
    Title = "Câmeras FE",
    Desc = "Sistema de Câmeras FE",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/CCTV Camera"))()
    end
})

-- ==============================
-- MINECRAFT SCRIPTS
-- ==============================
local MinecraftSection = MinecraftTab:Section({
    Title = "Scripts do Minecraft",
    TextXAlignment = "Left",
    TextSize = 17,
})

MinecraftTab:Button({
    Title = "Blocks Tool",
    Desc = "Ferramenta de blocos Minecraft",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Minecraft-Tools-31506"))()
    end
})

-- ============================== 
-- FUN/DIVERSÃO SCRIPTS 
-- ============================== 
local FunSection = FunTab:Section({
    Title = "Scripts de Diversão",
})


FunTab:Button({
    Title = "Duplicar Itens",
    Description = "Multiplica suas ferramentas/itens",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/duplicar-textos/refs/heads/main/Main.txt"))()
    end
})

FunTab:Button({
    Title = "Pintar com Itens",
    Description = "Desenhe usando suas ferramentas",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Affexter/Programs/refs/heads/main/scripts/tooldrawFE.lua"))()
    end
})

FunTab:Toggle({
    Title = "Escorregador Divertido",
    Description = "Teleporta para ponto específico e volta se passar certo limite",
    Default = false,
    Callback = function(state)
        local droneTPActive = state
        local originalCFrame = nil
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        if state then
            TeleportCarro:MostrarNotificacao("Escorregador Divertido ativado!")
            -- Salvar posição original e teleportar apenas uma vez
            if not originalCFrame then
                originalCFrame = hrp.CFrame
                hrp.CFrame = CFrame.new(-547, 158, 948)
            end
            task.spawn(function()
                while droneTPActive and character.Parent do
                    -- Checa se passou do limite
                    if hrp.Position.X > -263 and hrp.Position.Y > 4 and hrp.Position.Z > 1049 then
                        if originalCFrame then
                            hrp.CFrame = originalCFrame
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            TeleportCarro:MostrarNotificacao("Escorregador Divertido desativado!")
            originalCFrame = nil -- reseta posição salva
        end
    end
})

FunTab:Button({
    Title = "Animation GUI",
    Description = "é so um treco de animação de brookhaven vou atualizar logo logo",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/animationgui/refs/heads/main/Main.txt"))()
    end
})

FunTab:Button({
    Title = "Bug Hammer",
    Description = "Executa o Bug Hammer",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/bug-hammer-/refs/heads/main/Main.txt"))()
        end)
        if success then
            TeleportCarro:MostrarNotificacao("✅ Bug Hammer carregado!")
        else
            TeleportCarro:MostrarNotificacao("❌ Erro ao carregar: " .. tostring(err))
        end
    end
})

FunTab:Button({
    Title = "Espada Goner",
    Description = "Executa a Espada do goner",
    Callback = function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/sword-goner/refs/heads/main/Main.txt"))()
        end)
        if success then
            TeleportCarro:MostrarNotificacao("✅ Espada Bugadora carregada!")
        else
            TeleportCarro:MostrarNotificacao("❌ Erro ao carregar: " .. tostring(err))
        end
    end
})

FunTab:Toggle({
    Title = "Ativar Fogo",
    Description = "Pode funcionar ou não",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local workspace = game:GetService("Workspace")

        local catchFires = {}
        local root

        -- Função para pegar HumanoidRootPart
        local function getRoot()
            local char = player.Character or player.CharacterAdded:Wait()
            return char:WaitForChild("HumanoidRootPart")
        end

        root = getRoot()

        player.CharacterAdded:Connect(function(char)
            root = char:WaitForChild("HumanoidRootPart")
        end)

        -- Função para registrar CatchFire
        local function addCatchFire(part)
            if part:IsA("BasePart") and part.Name == "CatchFire" then
                part.CanCollide = false
                table.insert(catchFires, part)
            end
        end

        -- Resetar lista sempre que ativar
        catchFires = {}
        for _, obj in ipairs(workspace:GetDescendants()) do
            addCatchFire(obj)
        end
        workspace.DescendantAdded:Connect(function(obj)
            addCatchFire(obj)
        end)

        if state then
            TeleportCarro:MostrarNotificacao("🔥 Fogo ativado!")
            -- Loop ativo
            task.spawn(function()
                while state and task.wait(0.01) do
                    if root and root.Parent then
                        for _, part in ipairs(catchFires) do
                            if part and part.Parent then
                                part.CanCollide = false
                                part.CFrame = root.CFrame
                            end
                        end
                    end
                end
            end)
        else
            TeleportCarro:MostrarNotificacao("❌ Fogo desativado!")
        end
    end
})

FunTab:Button({
    Title = "Skins Hub",
    Desc = "Abre o Skin Hub",
    Locked = false,
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/skins-hub/refs/heads/main/Main.txt"))()
    end
})

FunTab:Button({
    Title = "Fe vr pra foder os outros kk",
    Desc = "Executa o FE VR fiz por fazer ficou uma bosta metade é minha e outra do rochips",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/fe-vr-kkj/refs/heads/main/Main.txt"))()
    end
})

FunTab:Button({
    Title = "Ominitrix",
    Desc = "Equipa o relógio Omnitrix",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/Ominitrix/refs/heads/main/Main.txt"))()
    end
})

FunTab:Button({
    Title = "Kamui",
    Desc = "Ativa o Kamui (hubzin)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/kamui/refs/heads/main/Main.txt"))()
    end
})

FunTab:Button({
    Title = "Comer e não ser comido",
    Desc = "Hubzinho divertido com animação super-sus",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-The-script-super-sus-animation-49976"))()
    end
})

FunTab:Button({
    Title = "Sla, Secso Talvez?",
    Desc = "Hubzinho divertido com Player Clapper / Banger",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Player-clapper-or-banger-33270"))()
    end
})

FunTab:Button({
    Title = "Jerk",
    Desc = "Bater umazinha, né pai?",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Edge.lua"))()
    end
})

FunTab:Button({
    Title = "Formar texto conforme os itens",
    Desc = "ele funciona só com o de multiplicar tools",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/formar-textos/refs/heads/main/Main.txt"))()
    end
})

FunTab:Button({
    Title = "Ficar enviando iPhone",
    Desc = "fique tranquilo ele ta funcionando kk",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/Iphone-troll/refs/heads/main/Main.txt"))()
    end
})

FunTab:Button({
    Title = "Trolar com guitarra",
    Desc = "so por o nick real e completo completo do player",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FDSASLEISKKJ/guitarratroll/refs/heads/main/Main.txt"))()
    end
})

-- ============================== 
-- TELEPORTES/TELEPORTS SCRIPTS 
-- ============================== 

local locations = {
    ["Salão de Beleza"] = Vector3.new(-76, 4, -123),
    ["Local do Sofá"] = Vector3.new(-82, 22, -128),
    ["Doceria"] = Vector3.new(-125, 6, -120),
    ["Lugar de Jogos"] = Vector3.new(-172, 1, -126),
    ["Delegacia"] = Vector3.new(-121, 4, 31),
    ["Hospital"] = Vector3.new(-293, 4, 40),
    ["Banco Comum"] = Vector3.new(-358, 25, -143),
    ["Bombeiros"] = Vector3.new(-469, 6, -122),
    ["Cemitério"] = Vector3.new(-486, 7, 56),
    ["Escola"] = Vector3.new(-315, 6, 211),
    ["Creche"] = Vector3.new(-157, 4, 125),
    ["Local das Caixas"] = Vector3.new(-162, 4, 268),
    ["Local de Lanches Espanhóis"] = Vector3.new(-169, 20, 291),
    ["Livraria"] = Vector3.new(-129, 4, 259),
    ["Celulares"] = Vector3.new(-127, 21, 253),
    ["Coffes"] = Vector3.new(-96, 5, 250),
    ["Veterinário"] = Vector3.new(-100, 22, 262),
    ["Dentista"] = Vector3.new(-53, 20, 268),
    ["Novo Banco"] = Vector3.new(3, 4, 257),
    ["Hotel"] = Vector3.new(199, 2, 182),
    ["Hamburgueria"] = Vector3.new(156, 8, 39),
    ["Aeroporto"] = Vector3.new(317, 7, 40),
    ["Shopping"] = Vector3.new(165, 5, -158),
    ["Apartamento 1"] = Vector3.new(-35, 20, -126),
    ["Apartamento 2"] = Vector3.new(-34, 37, -136),
    ["Igreja"] = Vector3.new(-64, 37, -192),
    ["Praia Guarda-Chuva Azul"] = Vector3.new(70, 8, -1433),
    ["Casa Abandonada"] = Vector3.new(1044, 8, 54),
    ["Casa de Máquinas"] = Vector3.new(235, 4, 813),
    ["Praia Normal"] = Vector3.new(-218, 1, 760),
    ["Iate"] = Vector3.new(-125, 33, 856),
    ["Cabana"] = Vector3.new(-249, 6, 1078),
    ["Praia Guarda-Chuva Vermelho"] = Vector3.new(15, 4, 1460),
    ["Drones"] = Vector3.new(-680, 252, 762),
    ["Fazenda 1"] = Vector3.new(-851, 6, -57),
    ["Fazenda 2"] = Vector3.new(-863, 6, -375),
    ["Praça"] = Vector3.new(-13, 6, -17),
    ["Montanha"] = Vector3.new(-580, 1, 1026),
    ["Posto de Gasolina"] = Vector3.new(133, 2, -338),
    ["Loja de Roupas"] = Vector3.new(-39, 2, 255)
}

-- Função de teleporte
local function teleportTo(position)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

-- Criar botões para cada localização
for locationName, position in pairs(locations) do
    TeleportTab:Button({
        Title = locationName,
        Description = "Teleportar para " .. locationName,
        Callback = function()
            teleportTo(position)
        end
    })
end

-- ==============================
-- Aba SCRIPTS +18
-- ==============================

-- Seção dentro da aba
local AdultSection = AdultTab:Section({
    Title = "Hubs +18",
})

-- Hub 1
AdultSection:Button({
    Title = "Hub 1",
    Description = "Executa o Hub 1",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/hkyuHQ7Y"))()
    end
})

-- Hub 2
AdultSection:Button({
    Title = "Hub 2",
    Description = "Executa o Hub 2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/4gh9/Bang-Script-Gui/main/bang%20gui.lua"))()
    end
})

-- Hub 3
AdultSection:Button({
    Title = "Hub 3",
    Description = "Executa o Hub 3",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()
    end
})

-- Hub 4
AdultSection:Button({
    Title = "Hub 4",
    Description = "Executa o Hub 4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Markklol/aw/refs/heads/main/Protected/BangScript.lua"))()
    end
})


print("🐧 Linux Hub V3 WindUI carregado com sucesso! - Criado por Nightmare")
