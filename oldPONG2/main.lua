CBall = CBall or require("src/ball")
CPaddle = CPaddle or require("src/paddle")
CScore = CScore or require("src/score")
--CData = CData or require("data")

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
  --
   ballX, ballY = w/2, h/2
   ballRadius = 10
   ballAngle = math.pi/4
   ballBaseSpeed = 150
   ballAcc = 0.1

   playerX, playerY = 20, h/2-50
   cpuX, cpuY =  w-30, h/2-50

   paddleWidth = 10
   paddleHeight = 100
   paddleSpeed = 300

  ---
  --CBall:new(x, y, angle, speed, radius, accel, h, w)
  ball = CBall(ballX, ballY, ballAngle, 150, ballRadius, ballAcc, h, w)
  
  --CPaddle:new(x, y, speed, width, height, isPlayer)
  cpuPaddle = CPaddle(cpuX, cpuY, paddleSpeed, paddleWidth,paddleHeight, false)
  playerPaddle = CPaddle(playerX, playerY, paddleSpeed, paddleWidth, paddleHeight, true)
  
  --CScore:new(x, y, size, w, h)
  scorePlayer = CScore(w/4-20, h/4-110, 80, w, h)
  scoreCpu = CScore(w/4*3-20, h/4-110, 80, w, h)

  -----


end

function love.update(dt)
  
  ball:update(dt, playerPaddle, cpuPaddle, scoreCpu, scorePlayer)
  
  cpuPaddle:update(dt, ball)
  playerPaddle:update(dt, ball)
  
  scoreCpu:update(dt, ball)
  scorePlayer:update(dt, ball)

  -----------
end

function love.draw()
  --background
  love.graphics.line(w/2, 0, w/2,h)
  ---
  ball:draw()
  
  cpuPaddle:draw()
  playerPaddle:draw()
  
  scoreCpu:draw()
  scorePlayer:draw()
end





--TODO 19
function BallCollisionsPaddle()
  if (ballY>playerY and ballY<playerY+paddleHeight and ballX<playerX+paddleWidth)
    or (ballY>cpuY and ballY<cpuY+paddleHeight and ballX>cpuX-paddleWidth) then
    ballAngle = -(ballAngle - math.pi/2) + math.pi/2
    ballSpeed = ballSpeed + ballSpeed*paddleAcc
  end
end

--TODO 20
function BallCollisionsScreen()
  if ballY<0 or ballY>h then
    ballAngle = -(-ballAngle - math.pi/4) + math.pi/4
  end
end
