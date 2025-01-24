local music = script.Parent.TestMusic

music:Play() -- 음악 재생

task.wait(3) -- 3초 기다림
music:Pause() -- 음악 일시 정지

task.wait(2) -- 2초 기다림
music:Resume() -- 음악 재개

task.wait(5) -- 5초 기다림
music:Stop() -- 음악 정지

--

local SoundService = game:GetService("SoundService") -- 사운드 서비스 가져오기
local music = SoundService:WaitForChild("Music"):GetChildren() -- Music 폴더의 모든 자식 객체 가져오기

local randomNum = math.random(1, #music) -- 랜덤 숫자 생성 (1부터 음악 개수까지)
local randomSound = music[randomNum] -- 랜덤으로 선택된 음악

randomSound:Play() -- 선택된 음악 재생

