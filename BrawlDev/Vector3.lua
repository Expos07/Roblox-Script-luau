-- 💎 Vector3 사용 예제
local part = script.Parent

-- Part의 위치를 설정합니다 (x, y, z 순서로 지정)
part.Position = Vector3.new(0, 0, 5) -- X: 0, Y: 0, Z: 5 위치로 이동

-- Part의 회전을 설정합니다 (x, y, z 순서로 지정)
part.Orientation = Vector3.new(0, 10, 0) -- Y축을 기준으로 10도 회전

-- Part의 크기를 설정합니다 (x, y, z 순서로 지정)
part.Size = Vector3.new(5, 0, 5) -- X: 5, Y: 0, Z: 5 크기로 변경

---

-- 💎 텔레포트 스크립트
game.Players.PlayerAdded:Connect(function(plr) -- 플레이어가 게임에 들어올 때 실행
	task.wait(5) -- 5초 기다립니다
	
	-- 플레이어의 HumanoidRootPart를 가져옵니다 (캐릭터 중심 위치를 나타냄)
	local humanoidRootPart = plr.Character:WaitForChild("HumanoidRootPart")
	
	if humanoidRootPart then -- HumanoidRootPart가 존재할 경우 실행
		-- 텔레포트 위치를 설정합니다
		-- 텔레포트할 Part의 위치에 Vector3(0, 3, 0)을 더해 Y축으로 3만큼 올립니다
		humanoidRootPart.Position = game.Workspace.TelelportPart.Position + Vector3.new(0, 3, 0)
	end
end)
