---------- Local_Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DeletePart = ReplicatedStorage:WaitForChild("DeletePart")
local DeletePartFunction = ReplicatedStorage:WaitForChild("DeletePartFunction")
local UIS = game:GetService("UserInputService")
local part = game.Workspace:WaitForChild("Part")

---------- RemoteEvent 사용
UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Delete then
		print("Delete Key Pressed")
		DeletePart:FireServer(part) -- 클라이언트 → 서버 : 일방적으로 메시지 보냄 (응답 없음)
	end
end)
---------- RemoteFunction 사용
UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.Delete then
		print("Delete Key Pressed")
		DeletePartFunction:InvokeServer(part) -- 클라이언트 → 서버 : 요청 보냄 + 서버에서 값 반환 가능 (서버 응답 기다림)
	end
end)
---------- Server_Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DeletePart = ReplicatedStorage:WaitForChild("DeletePart")
local DeletePartFunction = ReplicatedStorage:WaitForChild("DeletePartFunction")
---------- RemoteEvent 서버 처리
DeletePart.OnServerEvent:Connect(function(player, part) -- 항상 첫 매개변수는 player
	part:Destroy()
end)
---------- RemoteFunction 서버 처리
DeletePartFunction.OnServerInvoke = function(player, part) -- 항상 첫 매개변수는 player
	part:Destroy()
  -- return 가능 (InvokeServer는 서버의 반환값을 기다림)
end
---------- Local_Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DeletePartFunction = ReplicatedStorage:WaitForChild("DeletePartFunction")
local part = game.Workspace:WaitForChild("Part")
-- 서버가 InvokeClient(player, ...) 했을 때 실행됨
DeletePartFunction.OnClientInvoke = function(message)
	print("서버가 보낸 메시지:", message) -- 서버에서 보낸 인자 출력
	-- 클라이언트가 return한 값은 서버에서 InvokeClient의 결과로 받게 됨
	return "클라이언트도 안녕!"
end

---------- Server_Script
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DeletePartFunction = ReplicatedStorage:WaitForChild("DeletePartFunction")
-- 플레이어가 접속했을 때 실행
game.Players.PlayerAdded:Connect(function(player)
  -- 서버 → 클라이언트 요청
	-- 클라이언트에서 OnClientInvoke 실행 + return 값 기다림
	local response = DeletePartFunction:InvokeClient(player, "Hello")
  -- 클라이언트에서 돌려준 값 확인
	if response then
		print("Client response:", response) -- "클라이언트도 안녕!" 출력
	end
end)
