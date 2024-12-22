-- MainGame 객체를 Workspace에서 찾고 로드될 때까지 기다림
local mainGame = game.Workspace:WaitForChild("MainGame")

-- MainGame 내부에서 Gates, buttons, traps 폴더를 각각 찾음
local gates = mainGame:WaitForChild("Gates")
local buttons = mainGame:WaitForChild("buttons")
local traps = mainGame:WaitForChild("traps")

-- 버튼 활성화 함수 정의
local function activateButton(button, touched)
	touched.Value = true -- 버튼의 Touched 상태를 true로 설정하여 중복 실행 방지
	
	local gate = gates:FindFirstChild(button.Name) -- 버튼 이름과 동일한 게이트 찾기
	
	if gate then
		-- 게이트를 열기 위해 투명도 및 충돌 설정 변경
		gate.Transparency = 0.5
		gate.CanCollide = false
	end

	-- 버튼의 지속 시간(Duration) 값을 가져옴
	local Duration = button:FindFirstChild("Duration")
	local timer = Duration.Value -- 지속 시간을 변수로 저장
	
	-- 지속 시간 동안 1초 간격으로 카운트 출력
	for i = 1, timer do
		print(i)
		task.wait(1) -- 1초 대기
	end

	-- 게이트를 다시 닫기 위해 투명도 및 충돌 설정 복구
	gate.Transparency = 0
	gate.CanCollide = true
	
	touched.Value = false -- 버튼의 Touched 상태를 false로 복구
end

-- 트랩 활성화 함수 정의
local function activateTrap(trap, touched)
	touched.Value = true -- 트랩의 Touched 상태를 true로 설정하여 중복 실행 방지
	
	local trap = traps:FindFirstChild(trap.Name) -- 트랩 이름과 동일한 트랩 찾기
	local speed = trap:FindFirstChild("speed") -- 트랩의 속도(speed) 값 가져오기
	local max = trap:FindFirstChild("Max") -- 트랩의 최대 단계(Max) 값 가져오기

	if trap then
		-- 트랩이 점진적으로 사라지도록 애니메이션 실행
		for i = 1, max.Value do
			trap.Transparency += speed.Value -- 투명도를 속도 값만큼 증가
			task.wait(0.5) -- 0.5초 대기
		end
		trap.CanCollide = false -- 트랩의 충돌 비활성화
		
		task.wait(3) -- 트랩이 비활성화된 상태로 3초 대기
		
		-- 트랩이 점진적으로 나타나도록 애니메이션 실행
		for i = 1, max.Value do
			trap.Transparency -= speed.Value -- 투명도를 속도 값만큼 감소
			task.wait(0.1) -- 0.1초 대기
		end
		trap.CanCollide = true -- 트랩의 충돌 활성화
		touched.Value = false -- 트랩의 Touched 상태를 false로 복구
	end
end

-- 버튼의 Touched 이벤트 연결
for _, button in pairs(buttons:GetChildren()) do 
	button.Touched:Connect(function(otherPart)
		-- 버튼을 터치한 객체에서 Humanoid 확인
		local Humanoid = otherPart.Parent:FindFirstChild("Humanoid")
		local touched = button:FindFirstChild("Touched") -- Touched 상태 가져오기
		
		-- Humanoid와 Touched 값이 유효하고 Touched가 false일 때 버튼 활성화
		if Humanoid and touched and touched.Value == false then
			activateButton(button, touched)
		end
	end)
end

-- 트랩의 Touched 이벤트 연결
for _, trap in pairs(traps:GetChildren()) do
	trap.Touched:Connect(function(hit)
		-- 트랩을 터치한 객체에서 Humanoid 확인
		local Humanoid = hit.Parent:FindFirstChild("Humanoid")
		local touched = trap:FindFirstChild("Touched") -- Touched 상태 가져오기
		
		-- Humanoid와 Touched 값이 유효하고 Touched가 false일 때 트랩 활성화
		if Humanoid and touched and touched.Value == false then
			activateTrap(trap, touched)
		end
	end)
end
