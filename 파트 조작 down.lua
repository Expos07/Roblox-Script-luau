-- 모델, 버튼(down), 그리고 SpotLight 객체를 변수로 가져오기
local Model = game.Workspace.Model -- 이동할 모델
local down = game.Workspace.down -- 버튼 역할을 하는 파츠
local SpotLight = down:FindFirstChild("SpotLight") -- 버튼의 자식 중 SpotLight 찾기

-- 이동 상태를 제어하는 변수
local Ismove = false -- 모델이 이동 중인지 확인하기 위한 플래그

-- 모델의 파츠를 이동시키는 함수
local function downMove()
    while Ismove do -- Ismove가 true일 때만 실행
        for _, part in pairs(Model:GetChildren()) do -- 모델의 모든 자식 파츠를 순회
            part.Position += Vector3.new(-0.5, 0, 0) -- X축으로 -0.5씩 이동 (왼쪽 방향)
            task.wait(0.1) -- 0.1초 대기 후 다음 이동
        end
    end
end

-- SpotLight가 존재하는지 확인
if SpotLight then
    -- 버튼이 터치되었을 때 실행되는 이벤트
    down.Touched:Connect(function(hit)
        local Humanoid = hit.Parent:FindFirstChild("Humanoid") -- 터치한 객체의 부모에서 Humanoid 찾기
        if Humanoid then -- Humanoid가 존재하면 (플레이어가 터치한 경우)
            SpotLight.Enabled = true -- SpotLight 활성화
            Ismove = true -- 이동 루프를 시작하도록 플래그 설정
            downMove() -- 모델 이동 함수 실행
        end
    end)

    -- 버튼에서 손을 뗐을 때 실행되는 이벤트
    down.TouchEnded:Connect(function(hit)
        local Humanoid = hit.Parent:FindFirstChild("Humanoid") -- 버튼에서 손을 뗀 객체의 부모에서 Humanoid 찾기
        if Humanoid then -- Humanoid가 존재하면 (플레이어가 손을 뗀 경우)
            SpotLight.Enabled = false -- SpotLight 비활성화
            Ismove = false -- 이동 루프를 중단하도록 플래그 설정
            -- downMove를 다시 호출할 필요는 없음 (루프는 Ismove로 종료됨)
        end
    end)
end
