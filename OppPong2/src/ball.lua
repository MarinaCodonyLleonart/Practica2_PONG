local Actor = Actor or require "src/actor" --1: Find file of father class
local Cball = Actor:extend() --2: make the hierarchy

local Vector = Vector or require "src/vector"
local vector = Vector()

local Cdata = Cdata or require "data"
local d = Cdata()

function Cball:new(x, y)
  --Actor:new(image,x,y,speed,fx,fy)
  Cball.super:new("Resources/flowerBall.png",d.ballX,d.ballY,d.ballBaseSpeed,1,0)
  self.scale= vector.new(0.5,0.5)
  --self.rot = d.ballAngle
end

function Cball:update(dt, cpuPaddle, playerPaddle)
  Cball.super:update(dt)
  BallCollisionsPaddle(cpuPaddle, playerPaddle)
  BallCollisionsScreen()
  --main = require "main"
  self.forward = self.forward.rotate(self.rot)
  
  
  
  --self.position = (self.position.X +bSpeed*dt*math.cos(bAngle),
                   --self.position.Y + bSpeed*dt*math.sin(bAngle))
  --bX = bX + bSpeed*dt*math.cos(bAngle)
  --bY = bY + bSpeed*dt*math.sin(bAngle)
 
  
end

function Cball:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)end

--ADDITIONAL BALL FUNCTIONS
function ResetBall()
      self.position= vector.new(d.w/2, d.h/2)
      self.speed = d.ballBaseSpeed 
    end

function BallCollisionsPaddle()

  if self.intersect(self, playerPaddle) or self.intersect(self, cpuPaddle) then 
   self.rot = -(self.rot - math.pi/2) + math.pi/2
  end
  
 --if (bY>playerY and bY<playerY+d.paddleHeight and bX<playerX+paddleWidth)
 --  or (bY>cpuY and bY<cpuY+d.paddleHeight and bX>cpuX-d.paddleWidth) then
 --  bAngle = -(bAngle - math.pi/2) + math.pi/2
 --  self.speed = self.speed + bSpeed*paddleAcc
 --end
  
end

function BallCollisionsScreen() 
  --Superior and inferior parts of the screen
  if self.position.y<0 or self.position.y>d.h then
    self.rot = -(-self.rot - math.pi/4) + math.pi/4
  end
  
  --Lateral sides of the screen
  if self.position.x<0 then 
      cpuPoints = cpuPoints + 1
      ResetBall()
  elseif self.position.x>d.w then 
      playerPoints = playerPoints + 1
      ResetBall()
  end
end

return Cball