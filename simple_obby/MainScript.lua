-- 플레이어가 게임에 들어왔을 때 리더보드(leaderstats) 생성
game.Players.PlayerAdded:Connect(function(player)
	-- 플레이어의 리더보드 폴더 생성
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = 'leaderstats' -- 폴더 이름을 "leaderstats"로 설정
	leaderstats.Parent = player -- 리더보드 폴더를 플레이어에 추가
	
	-- 코인 값을 저장할 IntValue 생성
	local Coins = Instance.new("IntValue")
	Coins.Name = "Coins" -- 변수 이름을 "Coins"로 설정
	Coins.Parent = leaderstats -- 코인을 리더보드 폴더에 추가
	Coins.Value = 0 -- 초기 코인 값은 0
end)

-- 게임 내 "MainGame" 객체를 기다려 로드
local mainGame = game.Workspace:WaitForChild("MainGame")

-- "Coins" 폴더를 기다려 로드
local Coins = mainGame:WaitForChild("Coins")

-- Coins 폴더 내의 모든 코인 객체를 반복적으로 탐색
for _, Coin in pairs(Coins:GetChildren()) do
	-- 각 코인이 터치되었을 때 실행될 함수 연결
	Coin.Touched:Connect(function(otherPart)
		-- 충돌한 객체의 부모에서 Humanoid를 찾아 플레이어 여부 확인
		local Humanoid = otherPart.Parent:FindFirstChild("Humanoid")
		-- 캐릭터를 기반으로 플레이어 객체를 찾음
		local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)
		-- 코인에 이미 "Touched"라는 BoolValue가 있는지 확인
		local Touched = Coin:FindFirstChild("Touched")
		
		-- Humanoid, 플레이어, Touched 값이 유효하고 아직 코인이 터치되지 않았을 경우 실행
		if Humanoid and player and Touched and Touched.Value == false then
			Touched.Value = true -- 코인 터치 상태를 true로 설정하여 다시 터치되지 않도록 방지
			
			-- 플레이어의 코인 값을 1에서 5 사이의 랜덤 값만큼 증가
			player.leaderstats.Coins.Value += math.random(1, 5)
			
			-- 코인의 투명도를 변경하여 터치된 상태를 표시
			Coin.Transparency = 0.75
		end
	end)
end
