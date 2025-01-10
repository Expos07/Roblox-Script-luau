--⭐task.wait()
--task 1
print("before")

task.wait(3) -- 수행중인 작업 중단하고 3초 기다리기

--task 2
print("after")


--⭐task.delay()
--task 1
print("before")
 
--task 3
task.delay(5, function() -- 5초후에 실행, 하지만 task1 , task2 작업은 중단하지않음
    print("after x2")
end)

--task 2
print("after")


--⭐task.cancel()
--task 1
print("before")
 
--task 3
local delayTask = task.delay(5, function()
    print("after x2")
end)

local randomNumber = math.random(1, 2) -- 50% 대 50% 확률로 1 or 2
if randomNumber == 1 then -- 1이 걸리면 dealyTask 취소
  task.cancel(dealyTask)
  print("the random number has been picked")
end

--task 2
print("after")


--⭐task.spawn()
--task 1
print("before")
 
--task 2
local isLooping = true

task.spawn(function() -- 동시에 여러 루프를 처리할 수 있도록 하는 기능
  while isLooping do
      print("while loop")
      task.wait()
  end
end


--task 3
for i 1, 10 do
  print("for loop 2")
  task.wait()
end
isLooping = false

--task 4
print("after")

--⭐task.defer()
--task 1
print("before")
--task 2
task.defer(function()
      print("defer")
end)

--task 3
for i = 1, 10000 do
    print("for loop 1")
end
--task 4
print("after")

