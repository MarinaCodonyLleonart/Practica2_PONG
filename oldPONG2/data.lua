Object = Object or require ("lib/classic")
Data = Object:extend()

function Data:new()
 
local ballX, ballY = w/2, h/2
local ballRadius = 10
local ballAngle = math.pi/4
local ballBaseSpeed = 150
local ballAcc = 0.1

local playerX, playerY = 20, h/2-50
local cpuX, cpuY =  w-30, h/2-50
 
local paddleWidth = 10
local paddleHeight = 100
local paddleSpeed = 300

end

return Data