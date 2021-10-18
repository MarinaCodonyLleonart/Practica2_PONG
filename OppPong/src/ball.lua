local Cball = Object:extend()
local Cdata = Cdata or require "data"
local d = Cdata()

local bx, by
local bSpeed
local bAngle

function Cball:new(x, y)
  bx, by = x, y or d.ballX, d.ballY
  
end

function Cball.load(arg)
  --load ball sprite
  bSpeed = d.ballBaseSpeed
  bAngle = d.ballAngle

end

function Cball.update(dt)
  bX = bX + ballSpeed*dt*math.cos(ballAngle)
  bY = bY+ ballSpeed*dt*math.sin(ballAngle)
  
  BallCollisionsPaddle()
  
  BallCollisionsScreen()
  main = require "main"
  
end

function Cball.draw()
  love.graphics.circle( "fill", bX, bY, d.ballRadius )
end

--ADDITIONAL BALL FUNCTIONS
function ResetBall()
      bX, bY = d.w/2, d.h/2
      bSpeed = ballBaseSpeed 
    end

function BallCollisionsPaddle()
  
  if (bY>playerY and bY<playerY+d.paddleHeight and bX<playerX+paddleWidth)
    or (bY>cpuY and bY<cpuY+d.paddleHeight and bX>cpuX-d.paddleWidth) then
    bAngle = -(bAngle - math.pi/2) + math.pi/2
    bSpeed = bSpeed + bSpeed*paddleAcc
  end
  
end

function BallCollisionsScreen()
  
  if bY<0 or bY>d.h then
    bAngle = -(-bAngle - math.pi/4) + math.pi/4
  end
  
end

return Cball