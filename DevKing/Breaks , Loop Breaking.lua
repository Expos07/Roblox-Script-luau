local rainspawned = 0

while true do
	if rainspawned >= 50 then
		break
	end
	wait()
	local Rain = Instance.new("Part", game.Workspace)
	rainspawned += 1
	Rain.Size = Vector3.new(0.5,2,0.5)
	Rain.Position = Vector3.new(0,15,0)
	Rain.Transparency = 0.5
	Rain.Anchored = false
end
