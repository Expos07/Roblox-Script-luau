--💎 TweenService 설정
local TweenService = game:GetService("TweenService") -- TweenService를 가져옵니다.
local part = script.Parent -- Tween을 적용할 대상 Part입니다.

--💎 TweenInfo 생성
-- Tween의 지속 시간과 기타 속성을 설정합니다.
local tweenInfo = TweenInfo.new(
	5, -- 지속 시간 (초 단위)
	Enum.EasingStyle.Bounce, -- Easing 스타일 (Bounce로 설정)
	Enum.EasingDirection.In, -- Easing 방향 (In으로 설정)
	5, -- 반복 횟수
	true, -- 반복 시 역방향 애니메이션 실행 여부
	2 -- Tween 시작 전 지연 시간
)

--💎 목표 설정 (Goal)
-- Tween이 완료되었을 때 객체가 가지게 될 속성을 정의합니다.
local goal = {
	Position = Vector3.new(67, 2, 26), -- 목표 위치
	Size = Vector3.new(10, 10, 10) -- 목표 크기
}

--💎 Tween 생성
-- Part 객체에 대해 Tween을 생성합니다.
local tween = TweenService:Create(part, tweenInfo, goal)

--💎 Tween 실행 (Play)
task.wait(2) -- 2초 대기 후
tween:Play() -- Tween을 실행합니다.

--💎 Tween 제어 (Pause / Cancel)
-- Tween 실행 후 특정 조건에서 일시 중지하거나 취소할 수 있습니다.
task.wait(2) -- 2초 대기
tween:Pause() -- Tween 일시 중지
task.wait(2) -- 2초 대기
tween:Cancel() -- Tween 취소

--💎 Tween 완료 이벤트
-- Tween 완료 시 특정 동작을 실행합니다.
tween.Completed:Connect(function()
	print("Tween이 완료되었습니다!") -- Tween 완료 메시지 출력
end)

-- Completed 이벤트를 대기하며, Tween이 끝난 후 코드를 실행합니다.
tween.Completed:Wait()
print("Tween 작업이 모두 종료되었습니다!") -- 완료 메시지 출력
