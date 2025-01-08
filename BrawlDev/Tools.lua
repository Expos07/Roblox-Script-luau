--⭐ Tool Events
local tool = script.Parent

-- Tool이 장착되었을 때 실행
-- 예: 플레이어가 Tool을 손에 들었을 때
tool.Equipped:Connect(function() 
    print("this tool has been equipped")
end)

-- Tool이 장착 해제되었을 때 실행
-- 예: 플레이어가 Tool을 손에서 놓았을 때
tool.Unequipped:Connect(function() 
    print("this tool has been Unequipped")
end)

-- Tool이 활성화되었을 때 실행
-- 예: 플레이어가 Tool을 클릭했을 때
tool.Activated:Connect(function() 
    print("tool has been activated")
end)

-- Tool이 비활성화되었을 때 실행
-- 예: 플레이어가 Tool 클릭을 해제했을 때
tool.Deactivated:Connect(function() 
    print("tool has been deactivated")
end) 

--⭐ CHALLENGE

-- 플레이어가 게임에 추가되었을 때 leaderstats 폴더 생성
-- leaderstats는 플레이어의 통계 데이터를 저장하기 위한 폴더
-- 예: "Clicks" 통계를 관리

-- "PlayerAdded" 이벤트는 새로운 플레이어가 게임에 들어올 때 발생
-- 각 플레이어에 대한 leaderstats 설정

-- 리더 통계 생성
game.Players.PlayerAdded:Connect(function(Plr)
    local leaderstats = Instance.new("Folder", Plr) -- 새로운 Folder 생성, 부모는 Plr
    leaderstats.Name = "leaderstats" -- leaderstats로 이름 지정

    local Clicks = Instance.new("IntValue", leaderstats) -- IntValue 생성, 부모는 leaderstats
    Clicks.Name = "Clicks" -- "Clicks"라는 이름 지정
    Clicks.Value = 0 -- 초기값을 0으로 설정
end)

-- Tool 스크립트
-- Tool 관련 기능을 정의
local tool  = script.Parent
local sound = tool.beep -- Tool에서 "beep"라는 사운드 객체
local holdDown = false -- Tool 활성화 상태를 추적하는 변수

-- Tool이 장착되었을 때 실행
-- Tool 사용 시 사운드를 재생
tool.Equipped:Connect(function()
    print("tool 들었습니다") -- 장착 확인 출력
    sound:Play() -- beep 소리 재생
end)

-- Tool이 장착 해제되었을 때 실행
tool.Unequipped:Connect(function()
    print("tool 놓았습니다") -- 장착 해제 확인 출력
end)

-- Tool이 활성화되었을 때 실행
-- Tool이 활성화되면 색상을 무작위로 변경하며 크기를 키움
tool.Activated:Connect(function(Plr)
    print("tool 활성화") -- 활성화 확인 출력
    holdDown = true -- 활성화 상태로 변경
    tool:ScaleTo(2) -- Tool 크기를 2배로 확대

    while holdDown do -- 활성화 상태에서 반복
        tool.Handle.Color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255)) -- 무작위 색상 적용
        task.wait(0.1) -- 0.1초 대기
    end

    -- 특정 플레이어의 Clicks 값을 증가
    -- 여기서는 "Expos_074"라는 이름의 플레이어를 대상으로 함
    game.Players:FindFirstChild("Expos_074").leaderstats.Clicks.Value += 1
end)

-- Tool이 비활성화되었을 때 실행
-- Tool 비활성화 시 크기를 원래대로 복구
tool.Deactivated:Connect(function()
    print("tool 비활성화") -- 비활성화 확인 출력
    holdDown = false -- 비활성화 상태로 변경
    tool:ScaleTo(1) -- Tool 크기를 원래 크기로 축소
end)
