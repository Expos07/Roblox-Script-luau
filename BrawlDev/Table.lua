--⭐ Arrays (루아 배열은 1부터 시작한다는 점)
local myArray = {10, "string", true, 500}
print(myArray[3]) -- output true


for index = 1, #myArray do -- 해시태그는 배열의 요소 개수를 반환,반복문에서 배열의 끝 알수있게 해줌
  print(myArray[index]) -- output 10 , string , true , 500
end

--⭐ tale.insert() and table.remove()
local myArray = {10, 20, 30}

for i = 1, #myArray do
  print(myArray[i]) -- output 10, 20, 30
end

-- table.insert는 배열의 끝에 새로운 요소를 추가하거나, 특정 위치에 삽입할 수 있음
table.insert(myArray, 40) -- 테이블의 끝에 40을 추가
-- 특정 위치에 삽입하려면 중간에 위치 값을 적어주면 됨

for i = 1, #myArray do
  print(myArray[i]) -- output 10, 20, 30, 40
end

-- table.remove는 특정 인덱스의 요소를 삭제하고, 삭제된 값을 반환함
table.remove(myArray, 4) -- 4번째 요소(40)를 삭제

-- 배열의 각 요소를 하나씩 출력할 때는 #myArray로 끝까지 순회
for i = 1, #myArray do
  print(myArray[i]) -- output 10, 20, 30
end

--⭐ Searching Array Values (table.find)
local myArray = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100}

-- 배열에서 특정 값을 찾을 때는 조건문을 사용하여 순차적으로 검색 (비 효율적)
for i = 1, #myArray do
  if myArray[i] == 50 then
    print("50 has been found!") -- output 50 has been found!
  end
end


if table.find(myArray, 50) then
  print("50 has been found!") -- output 50 has been found!
end

-- 이런식으로 index를 반환할수도 있음
local index = table.find(myArray, 50)
if index ~= nil then 
  print("50 has been found!") -- output 50 has been found!
end

--⭐Dictionaries (사전)

local menu = {
  ["Cheeseburger"] = 15, -- 쉼표로 항목을 구분 가능 / 왼쪽이 key , 오른쪽이 Value
  ["Cola"] = 4, 
  ["Pancakes"] = 8,
  ["Milk"] = 4,
}

menu["Cheeseburger"] = 5 -- 값을 조작 가능

print(menu["Cheeseburger"], menu["Cola"], menu["Milk"]) -- output 5 , 4 , 4


local menu = {
  Cheeseburger = 15,
  Cola = 4,
}

menu.Cheeseburger = 5 -- 값을 조작 가능

print(menu.Cheeseburger, menu.Cola) -- output 5 , 4

--⭐pairs() and ipairs()

for menuItem, price in pairs(menu) do -- 하나는 menuItem으로 하나는 price로 
  print(menuItem, price) -- Cola 4 , Cheeseburger 15 ... (pairs는 무작위라서 순서가 안 맞음)
end


local myArray = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100}

for index, number in ipairs(myArray) do -- 인덱스는 요소 위치, 넘버는 각 항목 값
  print(index, number) -- output 1 10, 2 20, 3 30, 4 40 ...
end

for _, number in ipairs(myArray) do -- 인덱스 필요 없음 그래서 _, 로 숨기기 가능
  print(number) -- output 10, 20, 30, 40 ...
end


local model = game.Workspace.Model -- [model 자식] = Part1, Part2, Part3

for index, part in pairs(model:GetChildren()) do -- 모델 자식 전부 포함
  print(part.Name) -- output Part1 , Part3 , Part2
end
