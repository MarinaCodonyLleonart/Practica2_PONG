Cpaddle = Object:extend()
--local Cdata = Cdata or require "d"
local d = require "data"
--global px, py
--local pSpeed
local pX, pY

function Cpaddle:new(x, y)
  pX, pY = x, y
end

function Cpaddle:load(arg)  
 pSpeed = paddleBaseSpeed
  --Position
  
end

function Cpaddle:update(dt)
  
end

function Cpaddle:draw()
  --love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)
 -- love.graphics.rectangle("fill", d.cpuX, d.cpuY, d.paddleWidth, d.paddleHeight)
  
end

function getPos()
  return pX, pY
end


function CpuPaddleMovement(dt)
  forward = -(Cpaddle.super.pY-ballY)/math.sqrt(ballX^2+ballY^2)
  cpuY = cpuY + paddleSpeed*dt*forward
end


return Cpaddle