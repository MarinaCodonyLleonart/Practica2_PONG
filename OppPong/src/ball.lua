local Object = Object or require "lib/classic"
local Cball = Object:extend()
--local Cdata = Cdata or require "data"
local d = require "data"

--local m = require "main"
--print(m.paddlePlayer.pX)

local bX, bY = 0 ,0
local bSpeed = 0
local bAngle = 0

function Cball:new()
  --d = Cdata()
  
  bX, bY = ball0X, ball0Y
  print(bx)
  --load ball sprite
  print(ballBaseSpeed)
  bSpeed = 150
  print(bSpeed)
  bAngle = math.pi/6
  
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
  end
  
end

function BallCollisionsScreen()
  
  if bY<0 or bY>h then
    bAngle = -(-bAngle - math.pi/4) + math.pi/4
  end
  
end

return Cball