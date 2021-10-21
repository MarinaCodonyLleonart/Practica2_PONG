Object = Object or require ("lib/classic")
local Cdata = Object:extend()

function Cdata:new()
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height

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
  
   ballX, ballY = w/2, h/2
   ballRadius = 10
   ballAngle = math.pi/4
   ballBaseSpeed = 150
   ballAcc = 0.1

   playerX, playerY = 20, h/2-50
   cpuX, cpuY =  w-30, h/2-50
  
   paddleWidth = 10
   paddleHeight = 100
   paddleSpeed = 300
end

return Cdata