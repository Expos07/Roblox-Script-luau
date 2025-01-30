local ContextActionService = game:GetService("ContextActionService") -- ContextActionService를 가져옴 (키 입력 감지용)

local Tool = script.Parent -- 이 스크립트가 속한 Tool 객체 가져오기

-- "E" 키 입력 시 실행될 함수
local function PressE(actionName, inputState)
	if actionName == "PressedE" and inputState == Enum.UserInputState.Begin then
		print("Player has pressed the E key!") -- "E" 키를 눌렀을 때 출력
	end
	
	if actionName == "PressedEToEquipTool" and inputState == Enum.UserInputState.Begin then
		print("Player has pressed the E key to equip the tool!") -- "E" 키로 도구를 장착하려 할 때 출력
	end
end

-- 도구가 장착될 때 실행되는 이벤트
Tool.Equipped:Connect(function()
	-- "E" 키 입력을 감지하는 액션을 바인딩 (우선순위 1)
	ContextActionService:BindActionAtPriority("PressedE", PressE, true, 1, Enum.KeyCode.E)
	
	-- 아래 코드는 주석 처리됨 (우선순위 0으로 동일한 키를 감지하는 코드)
	-- ContextActionService:BindActionAtPriority("PressedEToEquipTool", PressE, true, 0, Enum.KeyCode.E)

	-- "E" 키를 누르라는 UI 메시지를 추가
	ContextActionService:SetTitle("PressedE", "Press E!")
	-- 버튼에 이미지를 설정 (로블록스 애셋 ID 사용)
	ContextActionService:SetImage("PressedE", "rbxassetid://15262574528")
	-- 버튼 위치를 설정 (화면의 특정 위치로 배치)
	ContextActionService:SetPosition("PressedE", UDim2.new(0.38, 0, 0.2, 0))
	
	-- 생성된 버튼을 가져옴
	local button = ContextActionService:GetButton("PressedE")
	
	if button then
		button.ImageColor3 = Color3.fromRGB(0, 23, 127) -- 버튼 색상 변경
		button.ImageTransparency = 0.5 -- 버튼 투명도 설정
	end
end)

-- 도구가 해제될 때 실행되는 이벤트
Tool.Unequipped:Connect(function()
	ContextActionService:UnbindAction("PressedE") -- "E" 키 액션을 해제하여 더 이상 감지되지 않도록 함
end)
