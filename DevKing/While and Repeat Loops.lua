local A = 1

repeat -- 먼저 1번 실행하고 그 다음 조건을 검사
  print("Printing From the repeat loop")
  A = A + 1
until A == 3

while A == 3 do -- 조건을 보고 조건이 안 맞으면 실행 X
  print("Printing From the while loop")
end
