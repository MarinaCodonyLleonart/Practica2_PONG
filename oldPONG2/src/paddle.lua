Object = Object or require("lib/classic")
CData = CData or require("data")

CPaddle = Object:extend()

local d = CData()

function CPaddle:new(x, y, speed, width, height, isPlayer)
  self.x = x
  self.y = y
  self.baseSpeed = speed
  self.speed = speed
  self.width = width
  self.height = height
  self.isPlayer = isPlayer
end

function CPaddle:update(dt, ball)
  
  if self.isPlayer then
  --Keyboard__PlayerPaddle
    if love.keyboard.isDown("up") then
      self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") then
      self.y = self.y + self.speed * dt
    end
    
  else
  --CpuPaddleMovement
    local forward = -(self.y - ball.y) / math.sqrt(ball.x^2 + ball.y^2)
    self.y = self.y + self.speed * dt * forward
    --KeyboardControlTestingCPU
    if love.keyboard.isDown("w") then
    self.y = self.y - self.speed*dt
    elseif love.keyboard.isDown("s") then
    self.y = self.y + self.speed*dt
    end
  end
  
end

function CPaddle:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

-----ADITIONAL not used
--function Keyboard__PlayerPaddle(dt)
--  if love.keyboard.isDown("up") then
--    playerY = playerY - self.speed*dt
--  elseif love.keyboard.isDown("down") then
--    playerY = playerY + self.speed*dt
--  end
--end
----just for testing KEyboardCPU
--function Keyboard__CpuPaddle(dt)
--  if love.keyboard.isDown("w") then
--    cpuY= cpuY - self.speed*dt
--  elseif love.keyboard.isDown("s") then
--    cpuY = cpuY + self.speed*dt
--  end
--end
--
--function CpuPaddleMovement(dt, ball)
--  local forward = -(self.y-ball.y)/math.sqrt(ball.x^2+ball.y^2)
--  self.y = self.y + self.speed*dt*forward
--end
return CPaddle