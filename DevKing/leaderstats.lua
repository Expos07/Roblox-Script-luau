game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"
	
	local Cash = Instance.new("IntValue", leaderstats)
	Cash.Name = "Cash"
	Cash.Value = 5
	
	local XP = Instance.new("IntValue", leaderstats)
	XP.Name = "XP"
	
end)

----------------

script.Parent.ClickDetector.MouseClick:Connect(function(player)
	player.leaderstats.Cash.Value += 1
end)
