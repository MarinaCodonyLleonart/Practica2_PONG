local CBall = CBall or require("src/ball")
local CPaddle = CPaddle or require("src/paddle")
local CScore = CScore or require("src/score")
local CMenu = CStartMenu or require("src/menu")
local CData = CData or require("data")
local CAnimatedSprite = CAnimatedSprite or require("src/animatedSprite")

local d = CData()

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio

  stateMachine = gameStates[1]
  
  --CBall:new(x, y, angle, speed, radius, accel, h, w)
  ball = CBall(ballX, ballY, ballAngle, ballBaseSpeed, ballRadius, ballAcc, h, w, animatedFlowerBall )
  
  --CPaddle:new(x, y, speed, width, height, isPlayer)
  cpuPaddle = CPaddle(cpuX, cpuY, paddleSpeed, paddleWidth,paddleHeight, false, imageBlue )
  playerPaddle = CPaddle(playerX, playerY, paddleSpeed, paddleWidth, paddleHeight, true, imageRed)
  
  --CScore:new(x, y, size, w, h)
  scorePlayer = CScore(w/4, h/12, 80, w, h)
  scoreCpu = CScore(w/4*3, h/12, 80, w, h)

  --CStartMenu
  sMenu = CMenu()


end

function love.update(dt)
  --print(stateMachine)
  if stateMachine == gameStates[1] then
    sMenu:update(dt, stateMachine)
    
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

  elseif StateMachine == gameStates[4] then
    --gameover
  elseif StateMachine == gameStates[5] then
    love.event.quit( "restart" )
  elseif StateMachine == gameStates[6] then
    --love.event.quit( exitstatus )
    --love.quit()
    --os.exit()
    --love.event.clear()
    window.close()
    love.event.push("quit", exitstatus)
    
  end
  
end

function love.draw()
  
  if stateMachine == gameStates[1] then
    sMenu:draw()
    
  elseif stateMachine == gameStates[2] then
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
  
  elseif stateMachine == gameStates[3] then
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
