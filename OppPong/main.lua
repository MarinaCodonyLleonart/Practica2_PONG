Object = require "lib/classic"
local Cdata = Cdata or require "data"
local Cball = Cball or require "src/ball"
local Cpaddle = paddle or require "src/paddle"
local Cscore = Ccore or require "src/score"


function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  local d = Cdata()
  local ball = Cball()
  local playerPaddle = Cpaddle()
  local cpuPaddle = Cpaddle()
  
  d.w, d.h = love.graphics.getDimensions() -- Get the screen width and height  
  
  
 
 
end

function love.update(dt)
  -- TODO 9: Make the ball move using the ballSpeed variable
  ballX = ballX + ballSpeed*dt*math.cos(ballAngle)
  ballY = ballY + ballSpeed*dt*math.sin(ballAngle)
  -- TODO 17: Comment all the code of the TODO 9 and make the ball move using the ballAngle variable
  
  -- TODO 13: Move the player paddle getting the up and down arrows keys of the keyboard using the variable paddleSpeed
  Keyboard__PlayerPaddle(dt)
  Keyboard__CpuPaddle(dt)
  
  -- TODO 14: Detect the ball collision with the player paddle and make it bounce
  --BallCollisions()
  
  -- TODO 15: Detect the ball collision with the cpu paddle and make it bounce
  
  -- TODO 25: Add the needed code at TODO 19 to make the ball quicker at paddle collision
  
  -- TODO 19: Comment all the code of the TODO 14 and TODO 15 and make it bounce using the new ball angle
  BallCollisionsPaddle()
 
  -- TODO 20: Detect the ball collision with the top and bottom of the field and make it bounce
  BallCollisionsScreen()
   
  -- TODO 26: Add the needed code at TODO 23 to reset the ball speed
  
  -- TODO 23: Detect the ball collision with the player and cpu sides, increse the points accordingly and reset the ball
    if ballX<0 then 
      cpuPoints = cpuPoints + 1
      ResetBall()
    elseif ballX>d.w
 then 
      playerPoints = playerPoints + 1
      ResetBall()
    end
  -- TODO 24: Make the cpu paddle move to get the ball
  CpuPaddleMovement(dt)
end

function love.draw()
  -- TODO 1: Draw the center of the field
  --love.graphics.rectangle("fill", 800/2-1, 0,5, 600)
  love.graphics.line(d.w
/2, 0, d.w
/2,d.h
)
  
  -- TODO 2: Draw the ball at the center of the field
  love.graphics.circle( "fill", ballX, ballY, ballRadius )
  
  -- TODO 3: Draw the player and cpu paddles
  --love.graphics.rectangle("fill", 20, h/2-50, 10, 100)
  --love.graphics.rectangle("fill", w-30, h/2-50,10, 100)
  
  -- TODO 4: Draw the player and cpu points
  --love.graphics.print(0, font, w/4-20, h/4-110, 0, 1, 1, 0, 0, 0, 0 )
  --love.graphics.print(0, font, w/4*3-20, h/4-110, 0, 1, 1, 0, 0, 0, 0 )

  -- TODO 7: Comment all the code of the TODO 2 and use the ballX and ballY variables to draw the ball
  
  -- TODO 11: Comment all the code of the TODO 3 and use the playerX, playerY, cpuX and cpuY variables to draw the player and cpu paddles
  love.graphics.rectangle("fill", playerX, playerY,paddleWidth, paddleHeight)
  love.graphics.rectangle("fill", cpuX, cpuY,paddleWidth, paddleHeight)
  
  -- TODO 22: Comment all the code of the TODO 4 and use the playerPoints and cpuPOints variables to draw the points
  love.graphics.print(playerPoints, font, d.w
/4-20, d.h
/4-110, 0, 1, 1, 0, 0, 0, 0 )
  love.graphics.print(cpuPoints, font, d.w
/4*3-20, d.h
/4-110, 0, 1, 1, 0, 0, 0, 0 )
end

function Keyboard__PlayerPaddle(dt)
  if love.keyboard.isDown("up") then
    playerY = playerY - paddleSpeed*dt
  elseif love.keyboard.isDown("down") then
    playerY = playerY + paddleSpeed*dt
  end
end

--just for testing
function Keyboard__CpuPaddle(dt)
  if love.keyboard.isDown("w") then
    cpuY= cpuY - paddleSpeed*dt
  elseif love.keyboard.isDown("s") then
    cpuY = cpuY + paddleSpeed*dt
  end
end

--TODO 14
--[[
function BallCollisions()
  if playerX+paddleWidth > ballX-ballRadius then
    ballSpeed = ballSpeed*(-1)
  elseif cpuX < ballX+ballRadius then
    ballSpeed = ballSpeed*(-1)
  end
end ]]--

--TODO 19
function BallCollisionsPaddle()
  --if playerX+paddleWidth > ballX-ballRadius or cpuX < ballX+ballRadius then
  --if isBallCollisionsPaddleCpu() or isBallCollisionsPaddlePlayer() then
  if (ballY>playerY and ballY<playerY+paddleHeight and ballX<playerX+paddleWidth)
    or (ballY>cpuY and ballY<cpuY+paddleHeight and ballX>cpuX-paddleWidth) then
    ballAngle = -(ballAngle - math.pi/2) + math.pi/2
    ballSpeed=ballSpeed + ballSpeed*paddleAcc
  end
end

--TODO 20
function BallCollisionsScreen()
  if ballY<0 or ballY>d.h then
    ballAngle = -(-ballAngle - math.pi/4) + math.pi/4
   -- ballSpeed = ballSpeed + ballSpeed*paddleAcc--ELIMINAR
  end
end

function CpuPaddleMovement(dt)
  --distanceY = cpuY-ballY
  forward = -(cpuY-ballY)/math.sqrt(ballX^2+ballY^2)
  --cpuY = ballY-paddleHeight/2
  --cpuY = cpuY - distanceY*dt*paddleSpeed 
  --cpuY = cpuY - distanceY/(dt*paddleSpeed) 
  --cpuY = cpuY + paddleSpeed*dt*forward
  cpuY = cpuY + paddleSpeed*dt*forward
end

--TODO26
    function ResetBall()
      ballX, ballY = d.w/2, d.h/2
      ballSpeed = ballBaseSpeed 
    end