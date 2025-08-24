UserInputService = game:GetService("UserInputService")

local aKeyPressed = false

UserInputService.InputBegan:Connect(function(input, gameProccesedEvent)
	if input.KeyCode == Enum.KeyCode.A then
		aKeyPressed = true
		
		while aKeyPressed do
			wait()
			print("A Key is being held")
		end
	end
end)

UserInputService.InputEnded:Connect(function(input, gameProccesedEvent)
	if input.KeyCode == Enum.KeyCode.A then
		aKeyPressed = false
	end
end)
------------------------------
UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProccesedEvent)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		print(input.KeyCode)
	end
end)
------------------------------
