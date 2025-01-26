local CollectionService = game:GetService("CollectionService") -- CollectionService를 가져옵니다.

-- "killBricks" 태그가 있는 모든 객체를 가져옵니다.
local killBricks = CollectionService:GetTagged("killBricks")

-- "killBricks" 태그가 있는 각 객체에 대해 Touched 이벤트를 연결합니다.
for i, killBrick in pairs(killBricks) do
	killBrick.Touched:Connect(function(hit)
		local humanoid = hit.Parent:FindFirstChild("Humanoid") -- 충돌한 객체의 부모에서 Humanoid를 찾습니다.
		
		if humanoid then
			humanoid.Health = 0 -- Humanoid의 체력을 0으로 설정하여 캐릭터를 죽입니다.
		end
	end)
end

-- "Killbricks" 태그가 추가된 객체를 감지합니다.
CollectionService:GetInstanceAddedSignal("Killbricks"):Connect(function()
	print("Killbrick has been added to the collection!") -- 새로운 Killbrick 추가 시 메시지를 출력합니다.
end)

-- "Killbricks" 태그가 제거된 객체를 감지합니다.
CollectionService:GetInstanceRemovedSignal("Killbricks"):Connect(function()
	print("Killbrick has been removed from the collection!") -- Killbrick 제거 시 메시지를 출력합니다.
end)

-- 특정 파트에 적용된 모든 태그를 가져옵니다.
local partTags = CollectionService:GetTags(game.Workspace.Part1)
for i, tag in pairs(partTags) do
	print(tag) -- 각 태그를 출력합니다.
end

-- 게임 내 존재하는 모든 태그를 가져옵니다.
local allTags = CollectionService:GetAllTags()
for i, tag in pairs(allTags) do
	print(tag) -- 모든 태그를 출력합니다.
end

----

-- 새로운 파트(NewPart)를 CollectionService에 추가 및 태그 관리
local newPart = game.Workspace:WaitForChild("NewPart") -- NewPart를 가져옵니다.
CollectionService:AddTag(newPart, "Killbricks") -- "Killbricks" 태그를 NewPart에 추가합니다.

-- 태그 확인
if CollectionService:HasTag(newPart, "Killbricks") then
	print("newPart has the tag!") -- NewPart가 태그를 가지고 있으면 메시지를 출력합니다.
end

task.wait(5) -- 5초 대기

CollectionService:RemoveTag(newPart, "Killbricks") -- NewPart에서 "Killbricks" 태그를 제거합니다.

-- 태그 제거 후 다시 확인
if CollectionService:HasTag(newPart, "Killbricks") then
	print("newPart has the tag!") -- 제거 후에도 태그가 있으면 메시지를 출력합니다.
end
