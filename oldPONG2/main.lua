CBall = CBall or require("src/ball")
CPaddle = CPaddle or require("src/paddle")
CScore = CScore or require("src/score")

local w, h 

local ballX, ballY 
local ballRadius
local ballSpeed
local ballAngle


local playerX, playerY, cpuX, cpuY 

local paddleWidth 
local paddleHeight 
local paddleSpeed



function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  --CBall:new(x, y, angle, speed, radius)
  ball = CBall(w/2, h/2, math.pi/4, 150, 10)
  
  --CPaddle:new(x, y, speed, isPlayer)
  cpuPaddle = CPaddle(cpuX, cpuY, paddleSpeed, false)
  playerPaddle = CPaddle(playerX, playerY, paddleSpeed, true)
  
  --CScore:new(x, y, size, w, h)
  scorePlayer = CScore(w/4-20, h/4-110, 80, w, h)
  scoreCpu = CScore(w/4*3-20, h/4-110, 80, w, h)

  -----
  ballX, ballY = w/2, h/2
  ballRadius = 10
  ballAngle = math.pi/4
  ballBaseSpeed = 150
  ballSpeed = ballBaseSpeed
  
  
  playerX, playerY = 20, h/2-50
  cpuX, cpuY =  w-30, h/2-50
 
  playerX, playerY = 20, h/2-50
  cpuX, cpuY =  w-30, h/2-50
  
  paddleWidth = 10
  paddleHeight = 100
  paddleSpeed = 300
  paddleAcc = 0.1

end

function love.update(dt)
  
   ball:update(dt)
   paddle:update(dt, ball)
   score:update(dt, ball)

  
  
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
  
  -- TODO 24: Make the cpu paddle move to get the ball
  CpuPaddleMovement(dt)
end

function love.draw()
  --background
  love.graphics.line(w/2, 0, w/2,h)
  
  ball:draw()
  paddle:draw()
  score:draw()
end





--TODO 19
function BallCollisionsPaddle()
  if (ballY>playerY and ballY<playerY+paddleHeight and ballX<playerX+paddleWidth)
    or (ballY>cpuY and ballY<cpuY+paddleHeight and ballX>cpuX-paddleWidth) then
    ballAngle = -(ballAngle - math.pi/2) + math.pi/2
    ballSpeed=ballSpeed + ballSpeed*paddleAcc
  end
end

--TODO 20
function BallCollisionsScreen()
  if ballY<0 or ballY>h then
    ballAngle = -(-ballAngle - math.pi/4) + math.pi/4
   -- ballSpeed = ballSpeed + ballSpeed*paddleAcc--ELIMINAR
  end
end

