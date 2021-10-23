Object = Object or require("lib/classic")
CData = CData or require("data")

CPaddle = Object:extend()

local d = CData()

function CPaddle:new(x, y, speed, width, height, isPlayer, image)
  self.x = x
  self.y = y
  self.baseSpeed = speed
  self.speed = speed
  --self.width = width
  --self.height = height
  self.isPlayer = isPlayer
  
  self.image = image
  self.height = self.image:getHeight()
  self.width  = self.image:getWidth()
end

function CPaddle:update(dt, ball)

  if stateMachine == gameStates[2] then
      
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
    end
    
  elseif stateMachine == gameStates[3] then
    if self.isPlayer then
    --Keyboard__PlayerPaddle
      if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
      elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
      end
      
    else
    --Keyboard__CpuPaddle
      if love.keyboard.isDown("up") then
      self.y = self.y - self.speed*dt
      elseif love.keyboard.isDown("down") then
      self.y = self.y + self.speed*dt
      end
    end
  end
  
end

function CPaddle:draw()
  --love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  local sx = 0.5
  local sy = 0.5
  local ox = self.width/2
  local oy = self.height/2
  --love.graphics.draw( drawable, x, y, r, sx, sy, ox, oy, kx, ky )
  love.graphics.draw(self.image, self.x, self.y, self.angle, sx, sy, ox, oy, 0, 0 )
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