Cpaddle_cpu = Cpaddle:extend()

function Cpaddle_cpu:new(x, y)
  Cpaddle_cpu.super.new(self,"Resources/playerShip1_blue.png",400,300,50,1,0)
  self.speed = d.paddleSpeed
end

function Cpaddle_cpu.update(dt)
  Keyboard__CpuPaddle(dt)
end

function Cpaddle_player.draw()
  love.graphics.rectangle("fill", d.cpuX, d.cpuY, d.paddleWidth, d.paddleHeight)
end

--Other functions
function CpuPaddleMovement(dt)
  forward = -(cpuY-ballY)/math.sqrt(ballX^2+ballY^2)
  cpuY = cpuY + paddleSpeed*dt*forward
end

function Keyboard__CpuPaddle(dt)
  if love.keyboard.isDown("w") then
    cpuY= cpuY - paddleSpeed*dt
  elseif love.keyboard.isDown("s") then
    self.position.y = self.position.y + paddleSpeed*dt
  end
end

return Cpaddle_cpu