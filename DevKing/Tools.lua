local tool = script.Parent

tool.Activated:Connect(function() -- 클릭
	print("u clicked me")
end)

tool.Deactivated:Connect(function() -- 클릭 비활성화
	print("i got deactivated")
end)

tool.Equipped:Connect(function() -- 장착
	print("Yay, u r using me")
end)

tool.Unequipped:Connect(function() -- 장착 해
	print("ToT, u r not using me")
end)

-----

local Tool = script.Parent

Tool.Activated:Connect(function()
	local DestoryMe = game.Workspace.DestoryMe
	DestoryMe:Destroy()
end)
