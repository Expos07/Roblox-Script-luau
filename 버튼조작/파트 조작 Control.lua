-- 버튼 객체와 모델 객체를 변수에 저장
local button = game.Workspace.button -- 버튼 객체
local model = game.Workspace.Model -- 모델(파츠들의 그룹)
local SpotLight = button:FindFirstChild("SpotLight") -- 버튼에 연결된 SpotLight 객체 찾기

-- 색상 변경 여부를 제어하는 변수
local isChangeColor = false -- 색상 변경 루프를 실행할지 여부를 결정

-- 모델 내 파츠들의 색상을 무작위로 변경하는 함수
local function changeColor() 
    while isChangeColor do -- isChangeColor가 true일 동안 반복
        for _, Part in pairs(model:GetChildren()) do -- 모델의 모든 자식 파츠를 순회
            Part.Color = Color3.fromRGB( -- 색상을 무작위 RGB 값으로 변경
                math.random(0, 255), -- R (0~255)
                math.random(0, 255), -- G (0~255)
                math.random(0, 255)  -- B (0~255)
            )
            task.wait(0.1) -- 0.1초 대기
        end
    end
end

-- SpotLight가 존재하는지 확인
if SpotLight then
    SpotLight.Enabled = false -- 초기 상태에서 SpotLight 비활성화

    -- 버튼이 눌렸을 때 실행되는 이벤트 연결
    button.Touched:Connect(function(hit)
        local Humanoid = hit.Parent:FindFirstChild("Humanoid") -- 버튼을 터치한 객체의 부모에서 Humanoid 탐색
        if Humanoid then -- Humanoid가 존재하면 (플레이어가 터치한 경우)
            SpotLight.Enabled = true -- SpotLight 활성화
            isChangeColor = true -- 색상 변경 루프 시작 플래그 설정
            task.spawn(changeColor) -- 비동기적으로 changeColor 함수 실행
        end
    end)

    -- 버튼에서 손을 뗐을 때 실행되는 이벤트 연결
    button.TouchEnded:Connect(function(hit)
        local Humanoid = hit.Parent:FindFirstChild("Humanoid") -- 버튼에서 손을 뗀 객체의 부모에서 Humanoid 탐색
        if Humanoid then -- Humanoid가 존재하면 (플레이어가 손을 뗀 경우)
            SpotLight.Enabled = false -- SpotLight 비활성화
            isChangeColor = false -- 색상 변경 루프 종료 플래그 설정
            task.spawn(changeColor) -- 비동기적으로 changeColor 함수 실행 (루프 종료)
        end
    end)
end
