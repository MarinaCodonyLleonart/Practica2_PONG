local Actor = Actor or require "src/actor" --1: Find file of father class
local Cball = Actor:extend() --2: make the hierarchy

local Vector = Vector or require "src/vector"
local vector = Vector()

local Cdata = Cdata or require "data"
local d = Cdata()

function Cball:new(x, y)
  --Actor:new(image,x,y,speed,fx,fy)
  Cball.super:new("Resources/flowerBall.png",d.ballX,d.ballY,d.ballBaseSpeed,1,0)
  self.scale= vector.new(0.1,0.1)
  self.rot = d.ballAngle
end

function Cball:update(dt, ball, cpuPaddle, playerPaddle)
  --cpu=cpuPaddle
  --player=playerPaddle
  
  BallCollisionsPaddle(ball, cpuPaddle, playerPaddle)
 
  BallCollisionsScreen()
  
  self.forward = self.forward.rotate(self.rot)
  
  Cball.super:update(dt)
  
  ----ADDITIONAL BALL FUNCTIONS
local function ResetBall()
      self.position= vector.new(d.w/2, d.h/2)
      self.speed = d.ballBaseSpeed 
    end
    
local function BallCollisionsPaddle(ball, cpu, player)
  if ball.intersect(ball, player) or ball.intersect(ball, cpu) then 
   self.rot = -(self.rot - math.pi/2) + math.pi/2
  end
end
local function BallCollisionsScreen() 
  --Superior and inferior parts of the screen
  if self.position.y<0 or self.position.y>d.h then
    self.rot = -(-self.rot - math.pi/4) + math.pi/4
  end
  --Lateral sides of the screen
  if self.position.x<0 then 
      d.cpuPoints = d.cpuPoints + 1
      ResetBall()
  elseif self.position.x>d.w then 
      d.playerPoints = d.playerPoints + 1
      ResetBall()
  end
end

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


 
return Cball