local CBall = CBall or require("src/ball")
local CPaddle = CPaddle or require("src/paddle")
local CScore = CScore or require("src/score")
local CMenu = CStartMenu or require("src/menu")
local CData = CData or require("data")
local CAnimatedSprite = CAnimatedSprite or require("src/animatedSprite")
local CSoundLib = CSoundLib or require("sound")

local d = CData()

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
    

  stateMachine = gameStates[1]
  
  ball = CBall(ballX, ballY, ballAngle, ballBaseSpeed, ballRadius, ballAcc, h, w, animatedFlowerBall )
  
  cpuPaddle = CPaddle(cpuX, cpuY, paddleSpeed, paddleWidth,paddleHeight, false, imageBlue )
  playerPaddle = CPaddle(playerX, playerY, paddleSpeed, paddleWidth, paddleHeight, true, imageRed)
  
  scorePlayer = CScore(w/4, h/12, w, h)
  scoreCpu = CScore(w/4*3, h/12, w, h)

  sMenu = CMenu()

end

function love.update(dt)
  
  if stateMachine == gameStates[1] then
    sMenu:update(dt)
    
  elseif stateMachine == gameStates[2] then
    ball:update(dt, playerPaddle, cpuPaddle, scoreCpu, scorePlayer)
    
    cpuPaddle:update(dt, ball)
    playerPaddle:update(dt, ball)
    
    scoreCpu:update(dt, ball)
    scorePlayer:update(dt, ball)
    
  elseif stateMachine == gameStates[3] then
    ball:update(dt, playerPaddle, cpuPaddle, scoreCpu, scorePlayer)
    
    cpuPaddle:update(dt, ball)
    playerPaddle:update(dt, ball)
    
    scoreCpu:update(dt, ball)
    scorePlayer:update(dt, ball)

  elseif stateMachine == gameStates[4] then
    currentPanel = menuPanels[3]
    sMenu:update(dt)

  elseif stateMachine == gameStates[5] then
    love.event.quit( "restart" )
    
  elseif stateMachine == gameStates[6] then
    love.event.push("quit", exitstatus)
    
  end
  
end

function love.draw()
  
  if stateMachine == gameStates[1] then
    sMenu:draw()
    
  elseif stateMachine == gameStates[2] then
    love.graphics.draw(imageBackground, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
    love.graphics.line(w/2, 0, w/2,h)
    
    ball:draw()
    
    cpuPaddle:draw()
    playerPaddle:draw()
    
    scoreCpu:draw(false)
    scorePlayer:draw(true)
  
  elseif stateMachine == gameStates[3] then
    love.graphics.draw(imageBackground, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
    love.graphics.line(w/2, 0, w/2,h)
    
    ball:draw()
    
    cpuPaddle:draw()
    playerPaddle:draw()
    
    scoreCpu:draw(false)
    scorePlayer:draw(true)
    
  elseif stateMachine == gameStates[4] then
    sMenu:draw()
    
  end
  
end
