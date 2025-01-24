-- 💎 Coroutine 개념 복습용 코드 💎

-- 💡 1. Coroutine 생성과 실행
local task2 = coroutine.create(function()
	print("coroutine task") -- 코루틴이 실행되면 출력
end)

coroutine.resume(task2) -- 코루틴 실행


-- 💡 2. Coroutine wrap
local wrappedTask = coroutine.wrap(function()
	print("COROUTINE TASK") -- wrap된 코루틴 실행 시 출력
end)

wrappedTask() -- 함수처럼 호출 가능

coroutine.wrap(function()
	print("inline coroutine task") -- 바로 실행되는 코루틴
end)()


-- 💡 3. Coroutine에 함수 전달
local myFunction = function()
	print("function executed") -- 일반 함수가 실행되는 경우
end

coroutine.wrap(myFunction)() -- 함수 형태로 실행

local function anotherFunction()
	print("another function executed")
end

coroutine.wrap(anotherFunction)() -- 또 다른 함수 실행


-- 💡 4. Coroutine에 인수 전달
local taskWithArgs = coroutine.create(function(num1, num2)
	print(num1 + num2) -- 전달받은 인수의 합 출력
	print("coroutine task with arguments")
end)

coroutine.resume(taskWithArgs, 5, 5) -- 인수 5, 5를 전달하며 실행


-- 💡 5. Multiple tasks (멀티태스킹)
local loop1 = coroutine.create(function()
	while true do
		print("Task 1 running") -- 첫 번째 코루틴의 작업
		task.wait(0.01) -- 약간의 대기
	end
end)

coroutine.resume(loop1) -- 첫 번째 코루틴 실행

while true do
	print("Task 2 running") -- 메인 작업 실행
	task.wait(0.01)
end


-- 💡 6. Coroutine 상태 확인
local loopStatus = coroutine.create(function()
	-- 무한 루프 작업 (주석 처리됨)
	--[[while true do
		print("Checking status")
		task.wait(0.01)
	end]]
end)

print(coroutine.status(loopStatus)) -- "suspended" 상태 출력
coroutine.resume(loopStatus)
print(coroutine.status(loopStatus)) -- 상태가 "dead"로 변경


-- 💡 7. Coroutine yield
local loopYield = coroutine.create(function()
	for i = 1, 10 do
		print(i) -- 숫자 출력
		coroutine.yield() -- 실행 중단
	end
end)

coroutine.resume(loopYield) -- 1 출력
print("Execution paused")
coroutine.resume(loopYield) -- 2 출력
print("Execution paused")
coroutine.resume(loopYield) -- 3 출력


-- 💡 8. Coroutine close
local loopClose = coroutine.create(function()
	for i = 1, 10 do
		print(i) -- 숫자 출력
		coroutine.yield() -- 실행 중단
	end
end)

coroutine.resume(loopClose) -- 1 출력
print("Execution paused")
coroutine.resume(loopClose) -- 2 출력
coroutine.close(loopClose) -- 코루틴 강제 종료
print(coroutine.status(loopClose)) -- "dead" 상태 출력


-- 💡 9. Coroutine yield with return values
local loopWithReturn = coroutine.create(function()
	for i = 1, 10 do
		print(i) -- 숫자 출력
		coroutine.yield(true, i, "Running") -- 값 반환
	end
end)

local success, result1, result2, result3 = coroutine.resume(loopWithReturn)
print(result1, result2, result3) -- true, 1, "Running" 출력

print("Execution paused")
coroutine.resume(loopWithReturn)
