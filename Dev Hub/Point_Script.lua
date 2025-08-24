local pointPart = script.Parent

--- Colors
local Blue = Color3.fromRGB(0, 0, 255)
local Green = Color3.fromRGB(0, 255, 0)
local Red = Color3.fromRGB(255, 0, 0)

--- Points value
local smallPoints = 10
local largePoints = 50
local losePoints = 100

local player = game:GetService("Players")

local function givePoints(player)
	local currentColor = pointPart.Color
	
	local playerStats = player:WaitForChild("leaderstats")
	local Points = playerStats:WaitForChild("Points")

	if currentColor == Blue then
		Points.Value += smallPoints
	elseif currentColor == Green then
		Points.Value += largePoints
	else
		Points.Value -= losePoints
	end
	
	pointPart:Destroy()
	local playerCharacter = player.Character
	
	local Particle = Instance.new("ParticleEmitter")
	Particle.Color = ColorSequence.new(currentColor)
	Particle.Parent = playerCharacter:WaitForChild("Head")
	task.wait(1)
	Particle:Destroy()
end

local function partTouched(otherPart)
	local player = player:GetPlayerFromCharacter(otherPart.Parent) -- Roblox가 내부적으로 캐릭터-플레이어를 확인
	if player then
		givePoints(player)
	end
end

pointPart.Touched:Connect(partTouched)

while true do
	pointPart.Color = Blue
	task.wait(3)
	pointPart.Color = Green
	task.wait(2)
	pointPart.Color = Red
	task.wait(1)
end
