local part = script.Parent

local newCFrame = CFrame.Angles(0, math.rad(45), 0)

part.CFrame = part.CFrame * newCFrame
--------------------
local part = script.Parent

local newCFrame = CFrame.new(0, 0, 10)

part.CFrame = part.CFrame * newCFrame
--------------------
local part = script.Parent

local newCFrame1 = CFrame.Angles(0, math.rad(90), 0)
local newCFrame2 = CFrame.Angles(0, 0, 0)

while true do
	part.CFrame = part.CFrame * newCFrame1 + Vector3.new(0.1, 0, 0)
	task.wait()
end
