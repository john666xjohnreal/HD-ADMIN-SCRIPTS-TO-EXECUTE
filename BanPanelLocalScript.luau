-- LocalScript - Panel de Administración de Baneo
-- Presiona la tecla 'B' para abrir/cerrar el panel

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local BanRemote = ReplicatedStorage:WaitForChild("BanRemote")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear la interfaz
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BanPanelGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 380)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Esquinas redondeadas
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
title.Text = "PANEL DE BANEO"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.BorderSizePixel = 0
title.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = title

-- Lista de jugadores (ScrollingFrame)
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -20, 0, 150)
scrollingFrame.Position = UDim2.new(0, 10, 0, 50)
scrollingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.Parent = mainFrame

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 6)
scrollCorner.Parent = scrollingFrame

-- Layout para la lista
local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 4)
listLayout.Parent = scrollingFrame

-- Caja de texto para nombre de usuario
local userLabel = Instance.new("TextLabel")
userLabel.Size = UDim2.new(1, -20, 0, 20)
userLabel.Position = UDim2.new(0, 10, 0, 210)
userLabel.BackgroundTransparency = 1
userLabel.Text = "Nombre de usuario a banear:"
userLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
userLabel.Font = Enum.Font.Gotham
userLabel.TextSize = 13
userLabel.TextXAlignment = Enum.TextXAlignment.Left
userLabel.Parent = mainFrame

local userBox = Instance.new("TextBox")
userBox.Size = UDim2.new(1, -20, 0, 30)
userBox.Position = UDim2.new(0, 10, 0, 232)
userBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
userBox.Text = ""
userBox.PlaceholderText = "Escribe el nombre del jugador..."
userBox.TextColor3 = Color3.fromRGB(255, 255, 255)
userBox.Font = Enum.Font.Gotham
userBox.TextSize = 14
userBox.BorderSizePixel = 0
userBox.Parent = mainFrame

local userCorner = Instance.new("UICorner")
userCorner.CornerRadius = UDim.new(0, 6)
userCorner.Parent = userBox

-- Caja de texto para razón
local reasonLabel = Instance.new("TextLabel")
reasonLabel.Size = UDim2.new(1, -20, 0, 20)
reasonLabel.Position = UDim2.new(0, 10, 0, 268)
reasonLabel.BackgroundTransparency = 1
reasonLabel.Text = "Razón (opcional):"
reasonLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
reasonLabel.Font = Enum.Font.Gotham
reasonLabel.TextSize = 13
reasonLabel.TextXAlignment = Enum.TextXAlignment.Left
reasonLabel.Parent = mainFrame

local reasonBox = Instance.new("TextBox")
reasonBox.Size = UDim2.new(1, -20, 0, 30)
reasonBox.Position = UDim2.new(0, 10, 0, 290)
reasonBox.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
reasonBox.Text = ""
reasonBox.PlaceholderText = "Escribe la razón del baneo..."
reasonBox.TextColor3 = Color3.fromRGB(255, 255, 255)
reasonBox.Font = Enum.Font.Gotham
reasonBox.TextSize = 14
reasonBox.BorderSizePixel = 0
reasonBox.Parent = mainFrame

local reasonCorner = Instance.new("UICorner")
reasonCorner.CornerRadius = UDim.new(0, 6)
reasonCorner.Parent = reasonBox

-- Botón de banear
local banButton = Instance.new("TextButton")
banButton.Size = UDim2.new(0, 100, 0, 30)
banButton.Position = UDim2.new(0, 10, 0, 328)
banButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
banButton.Text = "BANEAR"
banButton.TextColor3 = Color3.fromRGB(255, 255, 255)
banButton.Font = Enum.Font.GothamBold
banButton.TextSize = 14
banButton.BorderSizePixel = 0
banButton.Parent = mainFrame

local banCorner = Instance.new("UICorner")
banCorner.CornerRadius = UDim.new(0, 6)
banCorner.Parent = banButton

-- Botón de cerrar
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 80, 0, 30)
closeButton.Position = UDim2.new(1, -90, 0, 328)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
closeButton.Text = "Cerrar"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.Gotham
closeButton.TextSize = 13
closeButton.BorderSizePixel = 0
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

-- Función para actualizar la lista de jugadores
local function refreshPlayerList()
    -- Limpiar lista anterior
    for _, child in ipairs(scrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Agregar jugadores actuales
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 30)
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            btn.Text = p.Name
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.BorderSizePixel = 0
            btn.Parent = scrollingFrame

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 6)
            btnCorner.Parent = btn

            btn.MouseButton1Click:Connect(function()
                local reason = reasonBox.Text
                BanRemote:FireServer(p.Name, reason)
                userBox.Text = ""
                reasonBox.Text = ""
            end)
        end
    end

    -- Actualizar tamaño del scroll
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end

-- Mostrar/ocultar panel con la tecla B
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.B then
        mainFrame.Visible = not mainFrame.Visible
        if mainFrame.Visible then
            refreshPlayerList()
        end
    end
end)

-- Botón de cerrar
-- Botón de banear manual
banButton.MouseButton1Click:Connect(function()
    local targetName = userBox.Text
    if targetName ~= "" then
        local reason = reasonBox.Text
        BanRemote:FireServer(targetName, reason)
        userBox.Text = ""
        reasonBox.Text = ""
    end
end)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Actualizar la lista cuando un jugador entra o sale
Players.PlayerAdded:Connect(function()
    if mainFrame.Visible then
        refreshPlayerList()
    end
end)

Players.PlayerRemoving:Connect(function()
    if mainFrame.Visible then
        refreshPlayerList()
    end
end)

print("[BanPanel] Panel de baneo cargado. Presiona 'B' para abrirlo.")
