--💎coroutine create
local task2 = coroutine.create(function()
	print("coroutine task")
end)

--💎coroutine resume
coroutine.resume(task2)

--💎coroutine wrap
local task2 = coroutine.wrap(function()
	print("COROUTINE TASK")
end)

task2()

coroutine.wrap(function()
	print("coroutine task")
end)()

local myFunction = function()
	print("function")
end

coroutine.wrap(myFunction)()

local function myFunction()
	print("function")
end

coroutine.wrap(myFunction)()

--💎coroutine arguments
local task2 = coroutine.create(function(num1, num2)
	print(num1 + num2)
	print("coroutine task")
end)

coroutine.resume(task2, 5, 5)

--💎multiple tasks
local loop1 = coroutine.create(function()
	while true do
		print("task 1")
		task.wait(.01)
	end
end)

coroutine.resume(loop1)

while true do
	print("task 2")
	task.wait(.01)
end

--💎coroutine.status()
local loop1 = coroutine.create(function()
	--[[while true do
		print("task 1")
		task.wait(.01)
	end]]
end)

print(coroutine.status(loop1))
coroutine.resume(loop1)
print(coroutine.status(loop1))

--[[while true do
	print("task 2")
	task.wait(.01)
end]]

--💎coroutine.yield()
