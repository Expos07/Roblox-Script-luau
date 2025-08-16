local MyFavoriteFoods = {"Pizza", "Pasta", "Hotdogs"}

for i, v in pairs(MyFavoriteFoods) do
	print(i.." = "..v)
end

--------------

local HouseParts = {game.Workspace.Wall1, game.Workspace.Wall2, game.Workspace.Wall3,game.Workspace.floor}

for i, v in pairs(HouseParts) do
	wait(3)
	v:Destroy()
end
