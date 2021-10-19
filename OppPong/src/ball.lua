local Object = Object or require "lib/classic"
local Cball = Object:extend()
--local Cdata = Cdata or require "data"
local d = require "data"

--local m = require "main"
--print(m.paddlePlayer.pX)



local bX, bY
local bSpeed
local bAngle

function Cball:new(x, y)
  --d = Cdata()
  
  bX, bY = x, y 

  --load ball sprite
  print(ballBaseSpeed)
  bSpeed = 150
  print(bSpeed)
  bAngle = math.pi/6
  
end


function Cball:update(dt)
  bX = bX + bSpeed *dt*math.cos(bAngle)
  bY = bY+ bSpeed *dt*math.sin(bAngle)
  
  BallCollisionsPaddle()
  
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

function BallCollisionsPaddle()
  
  if (bY>player0Y and bY<player0Y+paddleHeight and bX<player0X+paddleWidth)
    or (bY>cpu0Y and bY<cpu0Y+paddleHeight and bX>cpu0X-paddleWidth) then
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