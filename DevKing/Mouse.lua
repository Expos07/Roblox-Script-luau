local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Button1Down:Connect(function()
	print("Player Pressed Mouse Down")
end)
--------------------------------
mouse.Move:Connect(function()
	print(mouse.X, mouse.Y)
end)
--------------------------------
mouse.Move:Connect(function()
	print(mouse.Target)
end)
--------------------------------
mouse.Icon = "http://www.roblox.com/asset?id=163023520" -- 에셋 아이디를 넣으면 마우스 사진이 바뀜
