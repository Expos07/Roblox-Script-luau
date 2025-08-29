local bluePart = script.Parent

bluePart.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local head = hit.Parent.Head
		if head and not bluePart:FindFirstChild("WeldConstraint") then
			bluePart.CFrame = head.CFrame * CFrame.new(0,10,0)
			local weldConstraint = Instance.new("WeldConstraint")
			weldConstraint.Part0 = head
			weldConstraint.Part1 = bluePart
			weldConstraint.Parent = bluePart
		end
	end
end)
---------------------------------
