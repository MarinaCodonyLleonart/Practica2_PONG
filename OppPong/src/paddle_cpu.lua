Object = Object or require("lib/classic")
Cpaddle = paddle or require "src/paddle"
Cpaddle_cpu = Cpaddle:extend()

function Cpaddle_cpu:new(x, y)
  Cpaddle_cpu.super.new(self)
end


function Cpaddle_cpu:update(dt)
  CpuPaddleMovement(dt)
end


function Cpaddle_cpu:draw()
  love.graphics.rectangle("fill", Cpaddle_cpu.super.pX, Cpaddle_cpu.super.pY, paddleWidth, paddleHeight)
end

function CpuPaddleMovement(dt)
  forward = -(Cpaddle.super.pY-ballY)/math.sqrt(ballX^2+ballY^2)
  Cpaddle.super.pY = Cpaddle.super.pY + Cpaddle.super.pSpeed*dt*forward
end

----just for testing
--function Keyboard__CpuPaddle(dt)
--  if love.keyboard.isDown("w") then
--    cpuY= cpuY - paddleSpeed*dt
--  elseif love.keyboard.isDown("s") then
--    cpuY = cpuY + paddleSpeed*dt
--  end
--end



return Cpaddle_cpu