local bridge = script.Parent
local button = workspace.ButtonBridge
local timerText = workspace.TimerDisplay.SurfaceGui.TextLabel
-----
local timerDuration = 5
local timerActive = false

local function startTimer()
	timerActive = true
	bridge.Transparency = 0
	bridge.CanCollide = true
	
	for count = timerDuration, 0, -1 do
		timerText.Text = count
		task.wait(1)
	end
	
	bridge.Transparency = 0.8
	bridge.CanCollide = false
	timerText.Text = ""
	timerActive = false
end

local function buttonPressed(partTouched)
	local character = partTouched.Parent
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid and not timerActive then
		startTimer()
	end
end

button.Touched:Connect(buttonPressed)
