Object = require "lib/classic"
--local Cdata = Cdata or require "d"
--local d = require "data"
local Cball = Cball or require "src/ball"
local Cpaddle = paddle or require "src/paddle"
local Cpaddle_player = Cpaddle_player or require "src/paddle_player"
local Cpaddle_cpu = Cpaddle_cpu or require "src/paddle_cpu"
local Cscore = Cscore or require "src/score"

local ball = Cball()
local playerPaddle = Cpaddle_player()
local cpuPaddle = Cpaddle_cpu()
  

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  --local d = Cdata()
  
  
  playerPaddle.load()
  cpuPaddle.load()
  
end

function love.update(dt)

 playerPaddle:update(dt)
 cpuPaddle:update(dt)
 ball:update(dt, playerPaddle, cpuPaddle)

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


