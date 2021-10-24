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
  self.beforeX = x
  self.angle = angle
  self.rot = angle
  self.speed = speed
  self.baseSpeed = speed
  self.radius = radius
  self.acceleration = accel
  self.h = hScreen
  self.w = wScreen
  self.bcpuPoints, self.bplayerPoints = 0,0
  
  --ANIMACIÓ
  self.image = bimage
  self.numFrames = 3 
  self.height = self.image:getHeight()
  self.width  = self.image:getWidth()/self.numFrames
  
  sprite = CAnimatedSprite(self.image, self.numFrames)
  
end

function CBall:update(dt, player, cpu, scoreCpu, scorePlayer)
  --Movement
  self.beforeX = x
  self.x = self.x + self.speed * dt * math.cos(self.angle)
  self.y = self.y + self.speed * dt * math.sin(self.angle)
  
  --Rotation sprite
  if self.x <= self.beforeX then self.rot = self.rot - self.speed*dt/200
  else self.rot = self.rot + self.speed/200*dt end
  --Animations
  sprite:update(dt)
  
  --BallCollisionsTopScreen
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
  
  --BallCollisionsLateralsScreen 
  if self.x-self.radius <= 0 then 
    s.scoring()
    self.bcpuPoints = self.bcpuPoints + 1 --points
    
    --ResetBallSpeed
    self.x, self.y = self.w/2, self.h/2
    self.speed = self.baseSpeed
    
  elseif self.x+self.radius >= self.w then 
    s.scoring()
    self.bplayerPoints = self.bplayerPoints + 1 --points
    
    --ResetBallSpeed
    self.x, self.y = self.w/2, self.h/2
    self.speed = self.baseSpeed
  end
  
end

function CBall:draw()
  local sx = 0.2
  local sy = 0.2
  local ox = self.width/2
  local oy = self.height/2
  
   --ANIMACIONS
  sprite:draw(self.x, self.y, self.rot, sx, sy, ox, oy, 0, 0)
  
end

return CBall