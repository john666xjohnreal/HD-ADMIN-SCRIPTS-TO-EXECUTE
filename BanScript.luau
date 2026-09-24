local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local banEvent = ReplicatedStorage:WaitForChild("BanEvent")
local screenGui = script.Parent
local toggleBtn = screenGui:WaitForChild("ToggleButton")
local panel = screenGui:WaitForChild("Panel")
local scroller = panel:WaitForChild("PlayerList")

local isOpen = false

toggleBtn.MouseButton1Click:Connect(function()
	isOpen = not isOpen
	panel.Visible = isOpen
	toggleBtn.Text = isOpen and "Cerrar Panel" or "Admin Panel"
	if isOpen then
		refreshPlayerList()
	end
end)

local function createPlayerRow(player)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, -10, 0, 50)
	row.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	row.BorderSizePixel = 0
	row.LayoutOrder = 0

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = row

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Size = UDim2.new(0.6, 0, 1, 0)
	nameLabel.Position = UDim2.new(0, 8, 0, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = player.Name
	nameLabel.TextColor3 = Color3.new(1, 1, 1)
	nameLabel.Font = Enum.Font.SourceSansSemibold
	nameLabel.TextScaled = true
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nameLabel.Parent = row

	local banBtn = Instance.new("TextButton")
	banBtn.Size = UDim2.new(0, 70, 0, 30)
	banBtn.Position = UDim2.new(1, -78, 0.5, 0)
	banBtn.AnchorPoint = Vector2.new(0, 0.5)
	banBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	banBtn.Text = "Ban"
	banBtn.TextColor3 = Color3.new(1, 1, 1)
	banBtn.Font = Enum.Font.SourceSansBold
	banBtn.TextScaled = true
	banBtn.Parent = row

	local corner2 = Instance.new("UICorner")
	corner2.CornerRadius = UDim.new(0, 4)
	corner2.Parent = banBtn

	banBtn.MouseButton1Click:Connect(function()
		banEvent:FireServer("ban", player.Name)
		task.wait(0.3)
		refreshPlayerList()
	end)

	return row
end

function refreshPlayerList()
	-- Limpiar lista
	for _, child in ipairs(scroller:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end

	-- Llenar con jugadores actuales
	for _, player in ipairs(Players:GetPlayers()) do
		local row = createPlayerRow(player)
		row.Parent = scroller
	end
end

-- Actualizar lista cuando entran o salen jugadores
Players.PlayerAdded:Connect(function()
	if isOpen then
		task.wait(0.2)
		refreshPlayerList()
	end
end)

Players.PlayerRemoving:Connect(function()
	if isOpen then
		task.wait(0.2)
		refreshPlayerList()
	end
end)

-- Inicializar lista al abrir
refreshPlayerList()
