Object = Object or require("lib/classic")
Cpaddle = Object:extend()
--local Cdata = Cdata or require "d"
local d = require "data"
--global px, py
--local pSpeed

function Cpaddle:new(x, y)
  self.pX = x
  self.py = y
  pSpeed = paddleBaseSpeed
end


function Cpaddle:update(dt)
  CpuPaddleMovement(dt)
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

--just for testing
function Keyboard__CpuPaddle(dt)
  if love.keyboard.isDown("w") then
    cpuY= cpuY - paddleSpeed*dt
  elseif love.keyboard.isDown("s") then
    cpuY = cpuY + paddleSpeed*dt
  end
end



return Cpaddle