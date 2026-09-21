--//====================================================\\--
--||			   CREATED BY SHACKLUSTER
--||           	CONVERTED TO FE BY JHONXD2006
--||         UPDATED FOR MODERN ROBLOX BY JOHN666XREAL
--\\====================================================//--

script.Parent = owner.PlayerGui

local mouseHit = Vector3.new(0, 0, 0)
local remote = Instance.new("RemoteEvent", script)
remote.Name = "GGRemote"
remote.OnServerEvent:Connect(function(who, wht, data)
	if who ~= owner then return end
	if wht == "HitPosition" then
		mouseHit = data
	end
end)

local nls = NLS([[local remote = script.Parent:WaitForChild("GGRemote")
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()

mouse.Button1Down:Connect(function()
	remote:FireServer("MouseDown")
end)
mouse.Button1Up:Connect(function()
	remote:FireServer("MouseUp")
end)
mouse.UserInputService = game:GetService("UserInputService")
mouse.UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.B then
		remote:FireServer("KeyDown", "b")
	elseif input.KeyCode == Enum.KeyCode.T then
		remote:FireServer("KeyDown", "t")
	end
end)

while true do
	remote:FireServer("HitPosition", mouse.Hit.Position)
	task.wait()
end]], script)

nls.Name = "LocalBruh"
script:WaitForChild("LocalBruh")
task.wait(0.2)

local Player = owner
local PlayerGui = Player.PlayerGui
local Backpack = Player.Backpack
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Torso = Character:WaitForChild("Torso")
local Head = Character:WaitForChild("Head")
local RightArm = Character:WaitForChild("Right Arm")
local LeftArm = Character:WaitForChild("Left Arm")
local RightLeg = Character:WaitForChild("Right Leg")
local LeftLeg = Character:WaitForChild("Left Leg")
local RootJoint = RootPart:WaitForChild("RootJoint")
local Neck = Torso:WaitForChild("Neck")
local RightShoulder = Torso:WaitForChild("Right Shoulder")
local LeftShoulder = Torso:WaitForChild("Left Shoulder")
local RightHip = Torso:WaitForChild("Right Hip")
local LeftHip = Torso:WaitForChild("Left Hip")

local sick = Instance.new("Sound", Character)
sick.SoundId = "rbxassetid://853707984"
sick.Looped = true
sick.Pitch = 1
sick.Volume = 1
sick:Play()

local IT = Instance.new
local CF = CFrame.new
local VT = Vector3.new
local RAD = math.rad
local C3 = Color3.new
local UD2 = UDim2.new
local BRICKC = BrickColor.new
local ANGLES = CFrame.Angles
local COS = math.cos
local SIN = math.sin
local MRANDOM = math.random

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = ANCHOR ~= false
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = Torso.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

local Player_Size = 1
local Animation_Speed = 3
local Frame_Speed = 1 / 60

local function weldBetween(a, b)
	local weldd = Instance.new("ManualWeld")
	weldd.Part0 = a
	weldd.Part1 = b
	weldd.C0 = CFrame.new()
	weldd.C1 = b.CFrame:Inverse() * a.CFrame
	weldd.Parent = a
	return weldd
end

local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))

local ATTACK = false
local HOLD = false
local SINE = 0
local HITFLOOR = nil
local UNANCHOR = true

local WEAPONGUI = IT("ScreenGui", PlayerGui)
WEAPONGUI.Name = "Weapon GUI"
local Weapon = IT("Model", Character)
Weapon.Name = "Adds"
local Delete = IT("Model", Character)
Delete.Name = "Banlist"
local Effects = IT("Folder", Weapon)
Effects.Name = "Effects"

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

task.spawn(function()
	while script.Parent do
		game:GetService("RunService").Heartbeat:Wait()
		ArtificialHB:Fire()
	end
end)

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:Wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:Wait()
		end
	end
end

function Clerp(a, b, t)
	return a:Lerp(b, t)
end

function CreateSound(ID, PARENT, VOLUME, PITCH)
	coroutine.wrap(function()
		local NEWSOUND = IT("Sound", PARENT)
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "http://www.roblox.com/asset/?id="..ID
		NEWSOUND:Play()
		game:GetService("Debris"):AddItem(NEWSOUND, 10)
	end)()
end

function CreateWave(SIZE, WAIT, CFRAME, DOESROT, ROT, COLOR, GROW)
	local wave = CreatePart(3, Effects, Enum.Material.Neon, 0, 0.5, BRICKC(COLOR), "Effect", VT(0,0,0))
	local mesh = IT("SpecialMesh", wave)
	mesh.MeshType = "FileMesh"
	mesh.MeshId = "http://www.roblox.com/asset/?id=20329976"
	mesh.Scale = SIZE
	mesh.Offset = VT(0,0,-SIZE.X/8)
	wave.CFrame = CFRAME
	coroutine.wrap(function()
		for i = 1, WAIT do
			Swait()
			mesh.Scale = mesh.Scale + GROW
			mesh.Offset = VT(0,0,-(mesh.Scale.X/8))
			if DOESROT then
				wave.CFrame = wave.CFrame * CFrame.Angles(0, ROT, 0)
			end
			wave.Transparency = wave.Transparency + (0.5/WAIT)
		end
		wave:Destroy()
	end)()
end

local HandlePart = CreatePart(3, Weapon, Enum.Material.SmoothPlastic, 0, 0, "Really black", "Handle", VT(0, 0, 0), false)
local HandleMesh = CreateMesh("SpecialMesh", HandlePart, "FileMesh", "10604848", "10605252", VT(1,1,1), VT(0, 2.7, 0))
local HandleWeld = Instance.new("Weld")
HandleWeld.Part0 = RightArm
HandleWeld.Part1 = HandlePart
HandleWeld.C0 = CF(0,-0.8,0) * ANGLES(RAD(-90), RAD(0), RAD(0))
HandleWeld.Parent = HandlePart

local SKILL1FRAME = IT("Frame", WEAPONGUI)
SKILL1FRAME.BackgroundTransparency = 0.5
SKILL1FRAME.Position = UD2(0.13, 0, 0.80, 0)
SKILL1FRAME.Size = UD2(0.26, 0, 0.07, 0)
SKILL1FRAME.BackgroundColor3 = C3(0,0,0)

local SKILL1TEXT = IT("TextLabel", SKILL1FRAME)
SKILL1TEXT.BackgroundTransparency = 1
SKILL1TEXT.Size = UD2(1,0,1,0)
SKILL1TEXT.TextColor3 = C3(1,1,1)
SKILL1TEXT.TextSize = 14
SKILL1TEXT.Font = Enum.Font.Garamond
SKILL1TEXT.Text = "[CLICK+HOLD] Ban Slam"

function BAN(CHARACTER)
	local BANFOLDER = IT("Folder", Effects)
	local naeeym2 = Instance.new("BillboardGui", BANFOLDER)
	naeeym2.AlwaysOnTop = false
	naeeym2.Size = UDim2.new(5,35,2,35)
	naeeym2.StudsOffset = Vector3.new(0,1,0)
	
	local tecks2 = Instance.new("TextLabel", naeeym2)
	tecks2.BackgroundTransparency = 1
	tecks2.TextScaled = true
	tecks2.Text = "BANNED"
	tecks2.Font = Enum.Font.Code
	tecks2.TextColor3 = Color3.new(1,0,0)
	tecks2.Size = UDim2.new(1,0,0.5,0)
	
	for _, v in ipairs(CHARACTER:GetChildren()) do
		if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
			local BOD = v:Clone()
			BOD.CanCollide = false
			BOD.Anchored = true
			BOD.CFrame = v.CFrame
			BOD.Parent = BANFOLDER
			BOD.Material = Enum.Material.Neon
			BOD.Color = C3(1,0,0)
			if BOD.Name == "Head" then
				naeeym2.Adornee = BOD
			end
		end
	end
	CHARACTER:Destroy()
	game:GetService("Debris"):AddItem(BANFOLDER, 3)
end

function BANNEAREST(POS, RANGE)
	for _, v in ipairs(workspace:GetChildren()) do
		if v ~= Character and v:FindFirstChildOfClass("Humanoid") then
			local hrp = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso")
			if hrp and (hrp.Position - POS).Magnitude < RANGE then
				BAN(v)
			end
		end
	end
end

function BANSLAM()
	ATTACK = true
	CreateSound("147722910", Character, 10, 1)
	BANNEAREST(RootPart.CFrame * CF(0,0,-6).p, 25)
	CreateWave(VT(25,0,25), 45, RootPart.CFrame * CF(0,-5,-6), true, 2, "Really red", VT(0,3,0))
	task.wait(0.5)
	ATTACK = false
end

remote.OnServerEvent:Connect(function(who, wht, data)
	if who ~= owner then return end
	if wht == "MouseDown" then
		HOLD = true
		if not ATTACK then BANSLAM() end
	elseif wht == "MouseUp" then
		HOLD = false
	elseif wht == "KeyDown" then
		if data == "b" and not ATTACK then
			RootPart.CFrame = CF(mouseHit + VT(0, 3, 0))
			CreateSound("769380905", Torso, 10, 1)
		elseif data == "t" then
			CreateSound("1058417264", Head, 10, 1)
			Delete:ClearAllChildren()
		end
	end
end)

-- Bucle Principal Actualizado
task.spawn(function()
	while Character and Character.Parent do
		Swait()
		SINE = SINE + (2 / Animation_Speed)
		if not ATTACK then
			RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5, 0, 0) * ANGLES(RAD(200), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 0.2)
			HandleWeld.C0 = Clerp(HandleWeld.C0, CF(0, -0.8, 0) * ANGLES(RAD(-90), RAD(0), RAD(0)), 0.2)
		end
	end
end)
