local Actor = Actor or require "src/actor" --1: Find file of father class
local Cball = Actor:extend() --2: make the hierarchy

local Vector = Vector or require "src/vector"

local Cmain = Cmain or require "main" --is used in BallCollisionsPaddle()
local main = Cmain()
local Cdata = Cdata or require "data"
local d = Cdata()

--local bx, by
--local bSpeed
--local bAngle

function Cball:new(x, y)
    --Actor:new(image,x,y,speed,fx,fy)
  Cball.super:new("Resources/flower.png",d.ballX,d.ballY,d.ballBaseSpeed,1,0)

 -- self.position = Vector.new(d.ballX, d.ballY)
  --bx, by = x, y or d.ballX, d.ballY
 -- self.speed = d.ballBaseSpeed
  --self.rot = d.ballAngle
  --local bSpeed = d.ballBaseSpeed
  --local bAngle = d.ballAngle
end

function Cball:update(dt)
  BallCollisionsPaddle()
  BallCollisionsScreen()
  --main = require "main"
  self.forward = self.forward.rotate(self.rot)
  
  Cball.super:update(dt)
  
  --self.position = (self.position.X +bSpeed*dt*math.cos(bAngle),
                   --self.position.Y + bSpeed*dt*math.sin(bAngle))
                   
  --bX = bX + bSpeed*dt*math.cos(bAngle)
  --bY = bY + bSpeed*dt*math.sin(bAngle)
 
  
end

function Cball.draw()
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
      bX, bY = d.w/2, d.h/2
      bSpeed = ballBaseSpeed 
    end

function BallCollisionsPaddle()

  if self.intersect(self, main.playerPaddle) or self.intersect(self, main.cpuPaddle) then 
   self.rot = -(self.rot - math.pi/2) + math.pi/2
  end
  
 -- if (self.position.y>playerY and self.position.y<playerY+d.paddleHeight and bX<playerX+paddleWidth)
 --  or (self.position.y>cpuY and self.position.y<cpuY+d.paddleHeight and bX>cpuX-d.paddleWidth) then
 -- bAngle = -(bAngle - math.pi/2) + math.pi/2
 -- self.speed = self.speed + bSpeed*paddleAcc
 --end
 --if (bY>playerY and bY<self.position.Y+d.paddleHeight and bX<playerX+paddleWidth)
 --  or (bY>cpuY and bY<cpuY+d.paddleHeight and bX>cpuX-d.paddleWidth) then
 --  bAngle = -(bAngle - math.pi/2) + math.pi/2
 --  self.speed = self.speed + bSpeed*paddleAcc
 --end
  
end

function BallCollisionsScreen() --Superior and inferior parts of the screen
  
  if self.position.y<0 or self.position.y>d.h then
    self.rot = -(-self.rot - math.pi/4) + math.pi/4
  end
  
end

return Cball