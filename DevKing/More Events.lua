local Part = script.Parent

Part.Touched:Connect(function()
  print("Hi")
end)

local Part = script.Parent

local function hamburger()
  print("Hi")
end
Part.Touched:Connect(hamburger()

Part.Touched:Connect(function(hit)
  print(hit)
end)

local Part = script.Parent
  if hit.Parent:FindFirstChild("Humanoid") then
    hit.Parent.Humanoid.Health = 0
  end
end)

