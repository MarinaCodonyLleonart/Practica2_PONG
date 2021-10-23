local CBall = CBall or require("src/ball")
local CPaddle = CPaddle or require("src/paddle")
local CScore = CScore or require("src/score")
local CStartMenu = CStartMenu or require("src/startMenu")
local CData = CData or require("data")

local d = CData()

--local w, h 
--
--local ballX, ballY 
--local ballRadius
--local ballSpeed
--local ballAngle
--
--
--local playerX, playerY, cpuX, cpuY 
--
--local paddleWidth 
--local paddleHeight 
--local paddleSpeed



function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio

  stateMachine = "start_menu"
  
  --CBall:new(x, y, angle, speed, radius, accel, h, w)
  ball = CBall(ballX, ballY, ballAngle, ballBaseSpeed, ballRadius, ballAcc, h, w, imageBall )
  
  --CPaddle:new(x, y, speed, width, height, isPlayer)
  cpuPaddle = CPaddle(cpuX, cpuY, paddleSpeed, paddleWidth,paddleHeight, false, imageBlue )
  playerPaddle = CPaddle(playerX, playerY, paddleSpeed, paddleWidth, paddleHeight, true, imageRed)
  
  --CScore:new(x, y, size, w, h)
  scorePlayer = CScore(w/4, h/12, 80, w, h)
  scoreCpu = CScore(w/4*3, h/12, 80, w, h)

  --CStartMenu
  sMenu = CStartMenu()


end

function love.update(dt)
  
  if stateMachine == "start_menu" then
    sMenu:update(dt, stateMachine)
    
  elseif stateMachine == "game" then
    ball:update(dt, playerPaddle, cpuPaddle, scoreCpu, scorePlayer)
    
    cpuPaddle:update(dt, ball)
    playerPaddle:update(dt, ball)
    
    scoreCpu:update(dt, ball)
    scorePlayer:update(dt, ball)
    
  end
  
end

function love.draw()
  
  if stateMachine == "start_menu" then
    sMenu:draw()
    
  elseif stateMachine == "game" then
    --background: love.graphics.line( x1, y1, x2, y2, ... )
    love.graphics.draw(imageBackground, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
    love.graphics.line(w/2, 0, w/2,h)
    
    ---
    ball:draw()
    
    cpuPaddle:draw()
    playerPaddle:draw()
    
    --CScore:draw(isPlayer)
    scoreCpu:draw(false)
    scorePlayer:draw(true)
    
  end
  
end
