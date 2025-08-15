local RandomNumber = math.random(1, 30)
print(RandomNumber)

-------

local rainspawned = 0

while true do
	if rainspawned >= 50 then
		break
	end
	local RandomNumber = math.random(1, 53)
	local RandomNumber2 = math.random(1, 50)
	local RandomNumber3 = math.random(1, 50)
	rainspawned += 1
	wait()
	local Rain = Instance.new("Part", game.Workspace)
	Rain.Size = Vector3.new(0.5,2,0.5)
	Rain.Position = Vector3.new(RandomNumber, RandomNumber2, RandomNumber3)
	Rain.Transparency = 0.5
	Rain.Anchored = false
end
