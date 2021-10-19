Object = require "lib/classic"
--local Cdata = Cdata or require "d"
--local d = require "data"
Cball = Cball or require "src/ball"
Cpaddle = paddle or require "src/paddle"
Cpaddle_player = Cpaddle_player or require "src/paddle_player"
Cpaddle_cpu = Cpaddle_cpu or require "src/paddle_cpu"
Cscore = Cscore or require "src/score"

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  --local d = Cdata()
  ball = Cball(ball0X, ball0Y)
  playerPaddle = Cpaddle_player(player0X, player0Y)
  cpuPaddle = Cpaddle_cpu(cpu0X, cpu0Y)
  
  
  playerPaddle.load()
  cpuPaddle.load()
  
end

function love.update(dt)

 ball:update(dt)
 playerPaddle:update(dt)
 cpuPaddle:update(dt)
 
end

function love.draw()
  
 ball:draw()
 playerPaddle:draw()
 cpuPaddle:draw()
 
 --Background
  love.graphics.line(w/2, 0, w/2,h)
  
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

