Object = Object or require("lib/classic")
CData = CData or require("data")
CSound = CSound or require("sound")
CAnimatedSprite = CAnimatedSprite or require("src/animatedSprite")

CBall = Object:extend()

local d = CData()
local s = CSound()

function CBall:new(x, y, angle, speed, radius, accel, hScreen, wScreen, bimage)
  self.x = x
  self.y = y
  self.angle = angle
  self.speed = speed
  self.baseSpeed = speed
  self.radius = radius --should be diameter of sprite/2
  self.acceleration = accel
  self.h = hScreen
  self.w = wScreen
  self.bcpuPoints, self.bplayerPoints = 0,0 --maybe innecesary

  --ANIMACIÓ
  self.image = bimage
  self.numFrames = 3 
  self.height = self.image:getHeight()
  self.width  = self.image:getWidth()/self.numFrames
  
  sprite = CAnimatedSprite(self.image, self.numFrames)
  
end

function CBall:update(dt, player, cpu, scoreCpu, scorePlayer)
  --Movement
  self.x = self.x + self.speed * dt * math.cos(self.angle)
  self.y = self.y + self.speed * dt * math.sin(self.angle)
  
  --Animations
  sprite:update(dt)
  
  --BallCollisionsScreen(
  if self.y-self.radius <= 0 or self.y+self.radius >= self.h then
    s.ballcollision()
    self.angle = -(-self.angle - math.pi/4) + math.pi/4
  end
  
  --BallCollisionsPaddle
  if (self.y > (player.y-self.radius-190) and self.y < (player.y + player.height +self.radius+20) and self.x < (player.x + player.width - self.radius))
    or (self.y > (cpu.y-self.radius-100) and self.y < cpu.y + cpu.height-self.radius-20) and self.x > (cpu.x-cpu.width+self.radius) then
      s.ballcollision()
      self.angle = -(self.angle - math.pi/2) + math.pi/2
      self.speed = self.speed + self.speed * self.acceleration
  end
  
   --Lateral sides of the screen --POINTS
  if self.x-self.radius < 0 then 
    s.scoring()
    self.bcpuPoints = self.bcpuPoints + 1 --points
    --ResetBall()
    self.x, self.y = self.w/2, self.h/2
    self.speed = self.baseSpeed
    
  elseif self.x+self.radius> self.w then 
    s.scoring()
    self.bplayerPoints = self.bplayerPoints + 1 --points
    --ResetBall()
    self.x, self.y = self.w/2, self.h/2
    self.speed = self.baseSpeed
  end
  
end

function CBall:draw()
  --love.graphics.circle("fill", self.x, self.y, self.radius)
  local sx = 0.2
  local sy = 0.2
  local ox = self.width/2
  local oy = self.height/2
  --love.graphics.draw( drawable, x, y, r, sx, sy, ox, oy, kx, ky )
  
   --ANIMACIONS
  --love.graphics.draw(self.image, self.x, self.y, self.angle, sx, sy, ox, oy, 0, 0 )
  --substituir self.image per self.sprite.getActFrameQuad()
  --local actSprite = sprite.getActFrameQuad()
  --local quad = sprite:getActFrame()
  sprite:draw(self.x, self.y, self.angle, sx, sy, ox, oy, 0, 0)
  --love.graphics.draw(self.image, self.quadsTable[quad], self.x, self.y, self.angle, sx, sy, ox, oy, 0, 0)
  --love.graphics.draw(quad, self.x, self.y, self.angle, sx, sy, ox, oy, 0, 0 )

  
end
-----METHODS OF BALL UPDATE
--function ResetBall()--Load the ball in the init point and v
--  self.x, self.y = self.w/2, self.h/2
--  self.speed = self.baseSpeed 
--end
--
--function BallCollisionsPaddle(player, cpu)
--if (self.y > player.y and self.y < player.y + player.height and self.x < player + player.width)
--    or (self.y > cpu.y and self.y < cpu.y + cpu.height and self.x > cpu.x-cpu.width) then
--    self.angle = -(self.angle - math.pi/2) + math.pi/2
--    self.speed = self.speed + self.speed * self.acceleration
--  end
--end
--
--function BallCollisionsScreen(h)
--  if self.y<0 or self.y>self.h then
--    self.angle = -(-self.angle - math.pi/4) + math.pi/4
--  end
--end

return CBall