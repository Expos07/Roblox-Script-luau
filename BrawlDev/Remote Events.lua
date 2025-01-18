--💎 Client to Server (FireServer / OnServerEvent)
-- Leaderstats 설정
game.Players.PlayerAdded:Connect(function(player)
    -- 새로운 플레이어가 게임에 들어왔을 때 leaderstats 폴더 생성
    local leaderstats = Instance.new("Folder", player)
    leaderstats.Name = "leaderstats" -- leaderstats라는 이름으로 폴더 설정
    
    -- Coins라는 IntValue 생성 및 초기값 설정
    local Coin = Instance.new("IntValue", leaderstats)
    Coin.Name = "Coins" -- Coins라는 이름으로 설정
    Coin.Value = 0 -- 초기값은 0으로 설정
end)

-- ReplicatedStorage에서 "GiveCoin" 이벤트 찾기
local giveCoin = game.ReplicatedStorage:FindFirstChild("GiveCoin")

-- 서버에서 "GiveCoin" 이벤트 처리
giveCoin.OnServerEvent:Connect(function(plr, CoinsAmount)
    -- 플레이어의 leaderstats 가져오기
    local leaderstats = plr.leaderstats
    local Coins = leaderstats.Coins
    
    -- Coins 값에 전달받은 CoinsAmount 추가
    Coins.Value += CoinsAmount
end)

-- Gui LocalScript
-- GUI 관련 스크립트 시작
local gui = script.Parent -- 현재 스크립트의 부모인 GUI 객체
local giveButton = gui.GiveCoin -- GUI 버튼 객체 가져오기

-- ReplicatedStorage에서 "GiveCoin" 이벤트 찾기
local giveCoin = game.ReplicatedStorage:FindFirstChild("GiveCoin")

-- 버튼 클릭 시 서버로 이벤트 전송
giveButton.MouseButton1Click:Connect(function()
    giveCoin:FireServer(50) -- 서버에 "GiveCoin" 이벤트 전송 (50 코인을 추가 요청)
end)

--💎 Server to Client (FireClient / OnClientEvent)
-- Leaderstats 설정
game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"
	
	local Coin = Instance.new("IntValue", leaderstats)
	Coin.Name = "Coins"
	Coin.Value = 0
	
	greetPlayer:FireClient(player, "Hellow new player! ".. player.Name)
end)

-- Gui LocalScript
local gui = script.Parent

local greetPlayer = game.ReplicatedStorage.GreetPlayer

local GreetingLabel = gui.Greeting

greetPlayer.OnClientEvent:Connect(function(message)
	GreetingLabel.Text = message
end)

-- 💎 Server to All Clients (FireAll)

-- ServerScript
local giveAnnouncement = game.ReplicatedStorage.GiveAnnouncement -- ReplicatedStorage에서 GiveAnnouncement 이벤트 가져오기

-- 일정 시간(12초) 대기 후 모든 클라이언트로 이벤트 전송
task.wait(12)
giveAnnouncement:FireAllClients() -- FireAllClients를 사용하여 모든 클라이언트에 이벤트 전송

-- Local Script
-- 클라이언트에서 서버의 이벤트를 처리

local giveAnnouncement = game.ReplicatedStorage.GiveAnnouncement -- ReplicatedStorage에서 GiveAnnouncement 이벤트 가져오기
local AnnouncementLabel = gui.Announcement -- GUI의 Announcement 레이블 가져오기

-- 서버로부터 GiveAnnouncement 이벤트를 받을 때 처리
giveAnnouncement.OnClientEvent:Connect(function()
    AnnouncementLabel.Visible = true -- AnnouncementLabel을 화면에 표시
end)
