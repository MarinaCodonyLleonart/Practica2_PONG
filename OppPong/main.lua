Object = require "lib/classic"
local Cdata = Cdata or require "data"
local Cball = Cball or require "src/ball"
local Cpaddle = paddle or require "src/paddle"
local Cscore = Cscore or require "src/score"


function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  local d = Cdata()
  local ball = Cball()
  local playerPaddle = Cpaddle_player()
  local cpuPaddle = Cpaddle_cpu()
  
end

function love.update(dt)
 
end

function love.draw()
  
  love.graphics.line(d.w/2, 0, d.w/2,d.h)
  
 
  
  -- TODO 11: Comment all the code of the TODO 3 and use the playerX, playerY, cpuX and cpuY variables to draw the player and cpu paddles
  love.graphics.rectangle("fill", playerX, playerY,paddleWidth, paddleHeight)
  love.graphics.rectangle("fill", cpuX, cpuY,paddleWidth, paddleHeight)
  
  -- TODO 22: Comment all the code of the TODO 4 and use the playerPoints and cpuPOints variables to draw the points
  
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



function CpuPaddleMovement(dt)
  forward = -(cpuY-ballY)/math.sqrt(ballX^2+ballY^2)
  cpuY = cpuY + paddleSpeed*dt*forward
end

