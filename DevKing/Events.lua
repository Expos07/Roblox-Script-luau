game.Workspcae.MyFavPart.Touched:Connect(function()
    print("I WAS STEPPED ON GURR!")
end)

local function AwesomeSause()
  print("FUNCTION CALLED")
  print("I WAS STEPPED ON GURR!")
  game.Workspace.MyFavPart.Anchored = false
end

game.Workspcae.MyFavPart.Touched:Connect(AwesomeSause())
