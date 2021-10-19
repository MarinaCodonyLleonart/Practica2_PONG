local Cpaddle = Cpaddle or require "src/paddle"
local Cpaddle_cpu = Cpaddle:extend()

local Cdata = Cdata or require "data"
local d = Cdata()

function Cpaddle_cpu:new(x, y) 
  --Actor:new(image,x,y,speed,fx,fy)
  Cpaddle_cpu.super.new(self,"Resources/redPaddle.png",d.cpu0X,d.cpu0Y,     d.paddleBaseSpeed,0,0) 
end

function Cpaddle_cpu:update(dt,ball)
  Keyboard__CpuPaddle(dt)
  CpuPaddleMovement(dt,ball)--better if it doesn't work
end

function Cpaddle_cpu:draw()
  Cpaddle_cpu.super:draw()
  --love.graphics.rectangle("fill", d.cpuX, d.cpuY, d.paddleWidth, d.paddleHeight)
end

--Other functions
function CpuPaddleMovement(dt,b)
  self.forward = vector.new(0, -(self.position.y-b.position.y)/math.sqrt(b.position.y^2+b.position.y^2))
  --self.position.y = self.position.y + self.position.y*dt*self.forward --
  Cpaddle_cpu.super.update(self,dt)

end

function Keyboard__CpuPaddle(dt)
  if love.keyboard.isDown("w") then
    self.position.y = self.position.y - self.speed*dt
  elseif love.keyboard.isDown("s") then
    self.position.y = self.position.y + self.speed*dt
  end
end

return Cpaddle_cpu