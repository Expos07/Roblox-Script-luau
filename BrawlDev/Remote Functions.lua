--💎leaderstats
game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"
	
	local Coin = Instance.new("IntValue", leaderstats)
	Coin.Name = "Coins"
	Coin.Value = 1000
end)

local buyButtonRemote = game.ReplicatedStorage.BuyButton

buyButtonRemote.OnServerInvoke = function(plr, toolName, toolPrice)
	local buySuccessful = false
	
	local leaderstats = plr.leaderstats
	local Coins = leaderstats.Coins
	
	if Coins.Value >= toolPrice then
		Coins.Value -= toolPrice
		local tool = game.ServerStorage:WaitForChild(toolName)
		
		local toolClone = tool:Clone()
		toolClone.Parent = plr.Backpack
		
		buySuccessful = true
	end
	
	return buySuccessful
end

--💎Gui Local Script
-- BuyButton Remote 이벤트와 GUI 초기 설정
local buyButtonRemote = game.ReplicatedStorage.BuyButton -- ReplicatedStorage에서 BuyButton 원격 함수 가져오기

local gui = script.Parent -- 스크립트의 부모 GUI 객체
local prompt = gui.Prompt -- 구매 메시지 레이블

local buying = false -- 구매 중인지 여부를 나타내는 플래그

-- 구매 버튼 및 관련 정보를 테이블로 정리
local items = {
	{button = gui.AppleBuyButton, name = "apple", price = 50},
	{button = gui.BananaBuyButton, name = "Banana", price = 30},
	{button = gui.GreenAppleBuyButton, name = "GreenApple", price = 80},
}

-- 구매 함수 정의
local function Buy(toolName, toolPrice)
	local buySuccessful = buyButtonRemote:InvokeServer(toolName, toolPrice) 
	-- 서버에 구매 요청(도구 이름과 가격 전달)
	buying = true -- 구매 상태를 true로 설정

	if buySuccessful then
		-- 구매 성공 처리
		prompt.Text = "Buy SUCCESSFUL" -- 성공 메시지 표시
		prompt.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- 초록색 배경
		task.wait(5) -- 5초 대기
	else
		-- 구매 실패 처리
		prompt.Text = "Buy FAILED" -- 실패 메시지 표시
		prompt.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- 빨간색 배경
		task.wait(5) -- 5초 대기
	end

	-- 메시지와 배경 색상 초기화
	prompt.Text = "Would you like to buy this button?" -- 기본 메시지로 복원
	prompt.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- 흰색 배경
	buying = false -- 구매 상태를 false로 설정
end

-- 버튼 클릭 이벤트 설정
for _, item in pairs(items) do
	item.button.MouseButton1Click:Connect(function()
		if not buying then -- 현재 구매 중이 아니면
			Buy(item.name, item.price) -- 아이템 이름과 가격 전달
		end
	end)
end
