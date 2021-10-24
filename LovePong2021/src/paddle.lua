Object = Object or require("lib/classic")
CData = CData or require("data")

CPaddle = Object:extend()

local d = CData()

function CPaddle:new(x, y, speed, width, height, isPlayer, image)
  self.x = x
  self.y = y
  self.baseSpeed = speed
  self.speed = speed
  self.isPlayer = isPlayer
  
  --SPRITE
  self.image = image
  self.height = self.image:getHeight()
  self.width  = self.image:getWidth()
end

function CPaddle:update(dt, ball)

  if stateMachine == gameStates[2] then
      
    if self.isPlayer then
    --PlayerPaddle_KeyboardInput
      if love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
      elseif love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
      end
      
    else
    --CpuPaddle_Movement
      local forward = -(self.y - ball.y) / math.sqrt(ball.x^2 + ball.y^2)
      self.y = self.y + self.speed * dt * forward
    end
    
  elseif stateMachine == gameStates[3] then
    if self.isPlayer then
    --PlayerPaddle_KeyboardInput
      if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
      elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
      end
      
    else
    --CpuPaddle_KeyboardInput
      if love.keyboard.isDown("up") then
      self.y = self.y - self.speed*dt
      elseif love.keyboard.isDown("down") then
      self.y = self.y + self.speed*dt
      end
    end
  end
  
end

function CPaddle:draw()

  local sx = 0.5
  local sy = 0.5
  local ox = self.width/2
  local oy = self.height/2

  love.graphics.draw(self.image, self.x, self.y, self.angle, sx, sy, ox, oy, 0, 0 )
end


return CPaddle