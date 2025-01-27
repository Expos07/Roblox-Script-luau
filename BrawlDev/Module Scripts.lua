-- 💎 Module Script Syntax
-- 빈 모듈 스크립트 구조 생성
local module = {  
}

-- 테이블을 반환하여 다른 스크립트에서 사용 가능하게 만듦
return module

--------------------------------------------

-- 💎 Adding Variables
-- 테이블 내부에 변수 추가
local module = {
  myNumber = 10,  -- 숫자 변수
  myString = "Hello World!" -- 문자열 변수
}

-- 테이블 반환
return module

--------------------------------------------

-- 💎 require()
-- 모듈 스크립트에 변수 선언
local module = {
  myNumber = 10, -- 숫자 값
  myString = "Hello World!" -- 문자열 값
}

return module

-- 다른 스크립트에서 require()로 모듈을 호출
local moduleScript = require(game.ReplicatedStorage.ModuleScript)

-- 모듈 내 변수 출력
print(moduleScript.myNumber) -- 10 출력
print(moduleScript.myString) -- "Hello World!" 출력

--------------------------------------------

-- 💎 Adding Functions
-- 테이블에 변수와 함수 추가
local module = {
  myNumber = 10, -- 숫자 값
  myString = "Hello world!", -- 문자열 값

  -- 함수 추가 (테이블 내부에 정의)
  myFunction = function()
    print("this is a module script function!") -- 함수 내용 출력
  end,
}

-- 테이블 반환
return module

-- 다른 스크립트에서 require()로 모듈 호출
local moduleScript = require(game.ReplicatedStorage.ModuleScript)

-- 모듈 내 변수 및 함수 사용
print(moduleScript.myNumber) -- 10 출력
print(moduleScript.myString) -- "Hello world!" 출력
moduleScript.myFunction() -- "this is a module script function!" 출력

--------------------------------------------

-- 함수 외부 정의 방식
local module = {}

-- 변수 추가
module.myNumber = 10
module.myString = "Hello World!"

-- 함수 정의
function module.myFunction()
  print("this is a module script function!") -- 함수 내용 출력
end

-- 테이블 반환
return module

--------------------------------------------

-- 💎 BasicCalculator
-- 계산기 기능을 가진 모듈 생성
local BasicCalculator = {}

-- 더하기 함수
function BasicCalculator.add(num1, num2)
  local result = num1 + num2 -- 두 숫자 더하기
  return result -- 결과 반환
end

-- 빼기 함수
function BasicCalculator.subtract(num1, num2)
  local result = num1 - num2 -- 두 숫자 빼기
  return result -- 결과 반환
end

-- 곱하기 함수
function BasicCalculator.multiply(num1, num2)
  local result = num1 * num2 -- 두 숫자 곱하기
  return result -- 결과 반환
end

-- 나누기 함수
function BasicCalculator.divide(num1, num2)
  local result = num1 / num2 -- 두 숫자 나누기
  return result -- 결과 반환
end

-- 테이블 반환
return BasicCalculator

--------------------------------------------

-- 계산기 모듈 호출 및 사용
local BasicCalculator = require(game.ReplicatedStorage.BasicCalculator)

-- add() 호출 (더하기)
local addResult = BasicCalculator.add(5, 5)
print(addResult) -- 10 출력

-- subtract() 호출 (빼기)
local subResult = BasicCalculator.subtract(5, 5)
print(subResult) -- 0 출력

-- multiply() 호출 (곱하기)
local multResult = BasicCalculator.multiply(5, 5)
print(multResult) -- 25 출력

-- divide() 호출 (나누기)
local divResult = BasicCalculator.divide(5, 5)
print(divResult) -- 1 출력
