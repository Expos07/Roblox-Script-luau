--⭐Tool Events
local tool = script.Parent

tool.Equipped:Connect(function() -- tool 장착 했을때
    print("this tool has been equipped")
end)

tool.Unequipped:Connect(function() -- tool 장착 해제 했을때
    print("this tool has been Unequipped")
end)

tool.Activated:Connect(function() -- tool 클릭 = 활성화 했을때
    print("tool has been activated")
end)

tool.Deactivated:Connect(function() -- tool 클릭 해제? = 비활성화 했을때
    print("tool has been deactivated")
end) 

--⭐CHALLENGE

--리더 통계 생성
game.Players.PlayerAdded:Connect(function(Plr)
	local leaderstats = Instance.new("Folder", Plr)
	leaderstats.Name = "leaderstats"
	
	local Clicks = Instance.new("IntValue", leaderstats)
	Clicks.Name = "Clicks"
	Clicks.Value = 0
end)

--Tool 스크립트
local tool  = script.Parent
local sound = tool.beep
local holdDown = false

tool.Equipped:Connect(function()
	print("tool 들었습니다")
	sound:Play()
end)

tool.Unequipped:Connect(function()
	print("tool 놓았습니다")
end)

tool.Activated:Connect(function(Plr)
  print("tool 활성화")
	holdDown = true
	tool:ScaleTo(2)

	while holdDown do
		tool.Handle.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
		task.wait(0.1)
	end
	
	game.Players:FindFirstChild("Expos_074").leaderstats.Clicks.Value += 1
end)


tool.deactivated:Connect(function()
  print("tool 비활성화")
	holdDown = false
	tool:ScaleTo(1)
end)
