--⭐ Remove()
task.wait(6)

local part = script.Parent

-- Remove는 객체의 Parent를 nil로 설정하여 월드에서 더 이상 보이지 않게 하지만, 메모리에서는 완전히 제거되지 않음.
-- 따라서 메모리를 계속 점유하고, 필요에 따라 다시 Parent를 설정하면 복구 가능함.
part:Remove()

--⭐ Destroy()
task.wait(6)

local part = script.Parent

-- Destroy는 객체와 관련된 모든 연결과 참조를 끊어 메모리에서 완전히 제거함.
-- 객체를 다시 사용할 수 없으며, 필요하지 않은 객체를 제거할 때 더 적합함.
part:Destroy()

--⭐ Debris
local part = script.Parent

-- Debris는 지정된 시간이 지난 후 객체를 자동으로 제거해주는 서비스.
-- 객체를 명시적으로 제거할 필요 없이, 일정 시간이 지나면 메모리에서 해제됨.
-- 주로 임시로 생성되는 객체(이펙트, 파티클 등)에 유용하게 사용됨.
game.Debris:AddItem(part, 6) -- 6초 뒤에 part 객체를 자동으로 제거함.
