local Parts = game.Workspace.Parts:GetChildren() -- 자식 다 가져옴
------------------
for i, v in pairs(Parts) do
	v:Destroy()
	wait(1)
end
------------------
 local character = game.Workspace:WaitForChild("NEPTUNE")
------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
------------------
local Part = game.Workspace:FindFirstChild("Part")
------------------
local Part = game.Workspace.Part
wait(5)
local part2 = Part:Clone()
part2.Parent = game.Workspace
part2.Position = Vector3.new(1, 100, 1)
------------------
local Part = game.Workspace.Part
Part:Destroy()
