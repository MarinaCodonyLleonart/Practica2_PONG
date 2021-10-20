--Data = Data or require("data")
--Cball = Data:extend()
Object = Object or require("lib/classic")

CBall = Object:extend()

function CBall:new(x, y, angle, speed, radius, accel, hScreen, wScreen)
  self.x = x
  self.y = y
  self.angle = angle
  self.speed = speed
  self.radius = radius
  self.acceleration = accel
  self.h = hScreen
  self.w = wScreen
end

function CBall:update(dt, player, cpu, scoreCpu, scorePlayer)
  --Movement
  self.x = self.x + self.speed * dt * math.cos(self.angle)
  self.y = self.y + self.speed * dt * math.sin(self.angle)
  
  --BallCollisionsScreen(h)
  if self.y<0 or self.y>self.h then
    self.angle = -(-self.angle - math.pi/4) + math.pi/4
  end
  
  --BallCollisionsPaddle(player, cpu)
  if (self.y > player.y and self.y < player.y + player.height and self.x < player.x + player.width)
    or (self.y > cpu.y and self.y < cpu.y + cpu.height and self.x > cpu.x-cpu.width) then
    self.angle = -(self.angle - math.pi/2) + math.pi/2
    self.speed = self.speed + self.speed * self.acceleration
  end
   --Lateral sides of the screen
  if self.x < 0 then 
    scoreCpu.cpuPoints = scoreCpu.cpuPoints + 1
    ResetBall()
  elseif self.x > self.w then 
    scorePlayer.playerPoints = scorePlayer.playerPoints + 1
    ResetBall()
  end
end

function CBall:draw()
  love.graphics.circle("fill", self.x, self.y, self.radius)
end
-----METHODS OF BALL UPDATE
function ResetBall()--Load the ball in the init point and v
  self.x, self.y = self.w/2, self.h/2
  self.speed = self.baseSpeed 
end

function BallCollisionsPaddle(player, cpu)
if (self.y > player.y and self.y < player.y + player.height and self.x < player + player.width)
    or (self.y > cpu.y and self.y < cpu.y + cpu.height and self.x > cpu.x-cpu.width) then
    self.angle = -(self.angle - math.pi/2) + math.pi/2
    self.speed = self.speed + self.speed * self.acceleration
  end
end

function BallCollisionsScreen(h)
  if self.y<0 or self.y>self.h then
    self.angle = -(-self.angle - math.pi/4) + math.pi/4
  end
end

return CBall