local Cpaddle = Cpaddle or require "src/paddle"
local Cpaddle_cpu = Cpaddle:extend()

function Cpaddle_cpu:new(x, y)
 Cpaddle_player.super.new(self,"Resources/redPaddle.png",d.cpu0X,d.cpu0Y,d.paddleBaseSpeed,0,0)  --Actor:new(image,x,y,speed,fx,fy)
  self.speed = d.paddleSpeed
end

function Cpaddle_cpu:update(dt)
  Keyboard__CpuPaddle(dt)
end

function Cpaddle_player:draw()
  love.graphics.rectangle("fill", d.cpuX, d.cpuY, d.paddleWidth, d.paddleHeight)
end

--Other functions
function CpuPaddleMovement(dt)
  self.forward = -(self.position.y-ballY)/math.sqrt(ballX^2+ballY^2)
  self.position.y = self.position.y + self.position.y*dt*self.forward
end

function Keyboard__CpuPaddle(dt)
  if love.keyboard.isDown("w") then
    self.position.y = self.position.y - self.Speed*dt
  elseif love.keyboard.isDown("s") then
    self.position.y = self.position.y + self.speed*dt
  end
end

return Cpaddle_cpu