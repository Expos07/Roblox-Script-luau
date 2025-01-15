--⭐task.wait()
--task 1
print("before") -- task.wait 호출 전의 출력

task.wait(3) -- 수행 중인 작업을 중단하고 3초 동안 기다린 후 다음 코드 실행

--task 2
print("after") -- 3초 기다린 후 출력


--⭐task.delay()
--task 1
print("before") -- task.delay 호출 전의 출력
 
--task 3
task.delay(5, function() -- 5초 후에 지정된 함수를 실행, 현재 작업(task 1, task 2)은 중단되지 않음
    print("after x2") -- 지연된 작업이 끝나고 실행되는 출력
end)

--task 2
print("after") -- task.delay를 설정한 직후 실행


--⭐task.cancel()
--task 1
print("before") -- task.cancel 호출 전의 출력
 
--task 3
local delayTask = task.delay(5, function() -- 5초 후에 실행될 작업을 설정
    print("after x2") -- 지연된 작업이 실행될 때의 출력
end)

local randomNumber = math.random(1, 2) -- 1 또는 2를 무작위로 선택 (50% 확률)
if randomNumber == 1 then -- 1이 선택된 경우 지연 작업을 취소
  task.cancel(dealyTask) -- 설정한 지연 작업을 취소
  print("the random number has been picked") -- 취소되었음을 알리는 출력
end

--task 2
print("after") -- task.cancel 관련 로직 실행 후 출력


--⭐task.spawn()
--task 1
print("before") -- task.spawn 호출 전의 출력
 
--task 2
local isLooping = true

task.spawn(function() -- 새로운 스레드 생성, 동시에 여러 루프를 처리 가능
  while isLooping do -- isLooping이 true인 동안 무한 루프 실행
      print("while loop") -- 무한 루프 내에서 출력
      task.wait() -- 반복 루프를 잠시 멈춤으로써 다른 작업과 동시에 처리 가능
  end
end)

--task 3
for i = 1, 10 do -- 10번 반복하는 for 루프 실행
  print("for loop 2") -- for 루프 내에서 출력
  task.wait() -- 루프 사이에 대기 시간을 추가하여 다른 작업과 교차 실행 가능
end
isLooping = false -- while 루프 종료 조건 설정

--task 4
print("after") -- task.spawn 관련 작업 종료 후 출력


--⭐task.defer()
--task 1
print("before") -- task.defer 호출 전의 출력

--task 2
task.defer(function() -- 현재 실행 중인 작업이 모두 끝난 후 지정된 작업 실행
      print("defer") -- 지연 작업이 실행될 때의 출력
end)

--task 3
for i = 1, 10000 do -- 10,000번 반복하는 for 루프 실행
    print("for loop 1") -- for 루프 내에서 출력
end

--task 4
print("after") -- for 루프가 끝난 후 출력
