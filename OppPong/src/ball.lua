local Object = Object or require "lib/classic"
local Cball = Object:extend()
--local Cdata = Cdata or require "data"
local d = require "data"

local sound = sound or require "sound"

function Cball:new(x, y, speed, andle)
  --d = Cdata()
  
  self.bX = x
  self.bY = y
  print(bx)
  --load ball sprite
  print(ballBaseSpeed)
  self.bSpeed = speed
  print(bSpeed)
  self.bAngle = angle
  
end


function Cball:update(dt, p, c)
  bX = bX + bSpeed *dt*math.cos(bAngle)
  bY = bY+ bSpeed *dt*math.sin(bAngle)
  
  BallCollisionsPaddle(p, c)
  
  BallCollisionsScreen()
  
  --main = require "main"
  --Cpaddle_player.super.getPos()
end

function Cball:draw()
  love.graphics.circle( "fill", bX, bY, ballRadius )
end

--ADDITIONAL BALL FUNCTIONS
function getPos()
  return bX, bY
end

function ResetBall()
      bX, bY = w/2, h/2
      bSpeed = ballBaseSpeed 
    end

function BallCollisionsPaddle(p, c)
  
  if (self.bY>p.super.pY and self.bY<p.super.pY+paddleHeight and self.bX<p.super.pX+paddleWidth)
    or (self.bY>c.super.pY and self.bY<c.super.pY+paddleHeight and self.bX>c.super.pX-paddleWidth) then
    bAngle = -(bAngle - math.pi/2) + math.pi/2
    bSpeed = bSpeed + bSpeed*paddleAcc
    
    sound.ballCollision:play()
  end
  
end

function BallCollisionsScreen()
  
  if bY<0 or bY>h then
    bAngle = -(-bAngle - math.pi/4) + math.pi/4
    
    sound.ballCollision:play()
  end
  
end

return Cball