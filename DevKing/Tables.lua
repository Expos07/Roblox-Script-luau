local omlette = {"Ham", "Egg", "Cheese"}
local PlayerPhoneNumbers = {4, 6, 3, 6, 8, 1}

table.remove(PlayerPhoneNumbers,2) -- 삭제
print(PlayerPhoneNumbers[2])

------------------

local omlette = {"Ham", "Egg", "Cheese"}
local PlayerPhoneNumbers = {4, 6, 3, 6, 8, 1}

table.sort(PlayerPhoneNumbers) -- 정렬
print(PlayerPhoneNumbers[1])

------------------

local PlayerPhoneNumbers = {4, 6, 3, 6, 8, 1}

print(table.concat(PlayerPhoneNumbers," "))

------------------

local omlette = {"Ham", "Egg", "Cheese"}

print(table.concat(omlette, ", "))
