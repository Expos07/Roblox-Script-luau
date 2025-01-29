-- 🏗 1. 유저 입력 서비스 가져오기
local UserInputService = game:GetService("UserInputService")

-- ✅ 점프 상태 확인 변수
local IsJumping = false

-- ⏳ 더블탭(W 키 두 번) 감지를 위한 현재 시간 저장
local currentTick = os.clock()

-- 📱 2. 모바일 기기 감지
if UserInputService.TouchEnabled then
	print("player is playing on a mobile device") -- 모바일에서 실행 중임을 출력
	workspace:WaitForChild("Baseplate").Color = Color3.fromRGB(0, 255, 255) -- 바닥 색상을 시안(Cyan)으로 변경
end

-- 🥽 3. VR 기기 감지
if UserInputService.VREnabled then
	print("player is playing on a VR") -- VR로 실행 중임을 출력
	workspace:WaitForChild("Baseplate").Color = Color3.fromRGB(0, 255, 255) -- 바닥 색상을 시안(Cyan)으로 변경
end

-- 🎮 4. 입력이 시작될 때 (키보드, 마우스, 터치 등)
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	print("입력이 감지됨!") -- 어떤 입력이든 감지되면 출력

	-- 🚫 UI나 채팅창에서 입력한 경우 무시
	if gameProcessedEvent then
		return
	end

	-- ⌨️ 4-1. 특정 키 조합 감지 (Q + R 키)
	if UserInputService:IsKeyDown(Enum.KeyCode.Q) and input.KeyCode == Enum.KeyCode.R then
		print("플레이어가 Q키를 누른 상태로 R키를 누름") -- R 키 입력 확인
	end
	
	-- ⏩ 4-2. 빠르게 W 키를 두 번 눌렀을 때 감지 (0.2초 이내)
	if input.KeyCode == Enum.KeyCode.W and (os.clock() - currentTick <= 0.2) then
		print("플레이어가 W를 2번 눌렀습니다.")
	end
	currentTick = os.clock() -- 현재 시간 업데이트
	
	-- 🖱 4-3. 마우스 왼쪽 버튼 클릭 감지
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		print("사용자가 왼쪽 마우스 버튼을 누름!") -- 마우스 클릭 확인
	end

	-- 📱 4-4. 모바일 터치 감지
	if input.UserInputType == Enum.UserInputType.Touch then
		print("사용자가 화면을 터치함!") -- 터치 입력 감지
	end

	-- 🎮 4-5. 게임패드 입력 감지
	if input.UserInputType == Enum.UserInputType.Gamepad1 then
		print("첫 번째 게임패드에서 입력 감지됨!")

		-- 🎮 A 버튼 감지
		if input.KeyCode == Enum.KeyCode.ButtonA then
			print("게임패드 A 버튼이 눌렸음!")
		
		-- 🎮 B 버튼 감지
		elseif input.KeyCode == Enum.KeyCode.ButtonB then
			print("게임패드 B 버튼이 눌렸음!")
		end
	end
end)

-- ✋ 5. 사용자가 입력을 해제했을 때
UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
	print("사용자가 입력을 해제함!") -- 입력이 끝났음을 출력
end)

-- ⬆️ 6. 점프 요청 감지 (점프 중복 방지)
UserInputService.JumpRequest:Connect(function()
	if not IsJumping then
		IsJumping = true
		print("플레이어가 점프를 했습니다.")

		task.wait(0.5) -- 점프 후 0.5초 동안 대기
		IsJumping = false
	end
end)
