-- 플레이어가 게임에 접속하면 실행되는 이벤트
game.Players.PlayerAdded:Connect(function(player)
	-- 리더보드(leaderstats) 폴더 생성
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = 'leaderstats' -- 리더보드 폴더 이름 설정
	leaderstats.Parent = player -- 리더보드 폴더를 플레이어 객체에 추가
	
	-- 코인 값을 저장할 IntValue 생성
	local Coins = Instance.new("IntValue")
	Coins.Name = "Coins" -- IntValue의 이름을 "Coins"로 설정
	Coins.Parent = leaderstats -- Coins를 리더보드 폴더에 추가
	Coins.Value = 0 -- 초기 코인 값 설정
end)

-- Workspace에서 "MainGame" 객체를 찾고 로드될 때까지 기다림
local mainGame = game.Workspace:WaitForChild("MainGame")

-- "MainGame" 내부에서 "Coins" 폴더를 찾고 로드될 때까지 기다림
local Coins = mainGame:WaitForChild("Coins")

-- "Coins" 폴더 내의 모든 코인 객체를 순회
for _, Coin in pairs(Coins:GetChildren()) do
	-- 각 코인의 Touched 이벤트에 연결
	Coin.Touched:Connect(function(otherPart)
		-- 터치된 객체의 부모에서 Humanoid를 찾아 캐릭터 여부 확인
		local Humanoid = otherPart.Parent:FindFirstChild("Humanoid")
		-- 캐릭터를 기반으로 플레이어 객체 찾기
		local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)
		-- 코인에 "Touched"라는 BoolValue가 있는지 확인
		local Touched = Coin:FindFirstChild("Touched")
		
		-- Humanoid, 플레이어, Touched 값이 유효하고 아직 코인이 터치되지 않았다면 실행
		if Humanoid and player and Touched and Touched.Value == false then
			Touched.Value = true -- 터치 상태를 true로 변경하여 다시 터치되지 않도록 설정
			
			-- 플레이어의 코인 값을 1에서 5 사이의 랜덤 값만큼 증가
			player.leaderstats.Coins.Value += math.random(1, 5)
			
			-- 코인의 Transparency 속성을 변경하여 터치된 상태를 표시
			Coin.Transparency = 0.75
		end
	end)
end
