local NewPart = Instance.new("Part", game.Workspace) -- 파트 생성

NewPart.Size = Vector3.new(50,50,50)
NewPart.Position = Vector3.new(50,200,50)
NewPart.Anchored = true

while true do
  wait()
  local Rain = Instance.new("Part", game.Workspace)
  Rain.Position = Vector3.new(0,15,0)
  Rain.Size = Vector3.new(0.5, 2, 0.5)
  Rain.Anchored = false
  Rain.Transparency = 0.5
end
