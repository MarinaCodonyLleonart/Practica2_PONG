Object = require "lib/classic"
--local Cdata = Cdata or require "d"
--local d = require "data"
local d = require "data"
local Csmenu = CMenu or require "src/startMenu"
local Cball = Cball or require "src/ball"
local Cpaddle = paddle or require "src/paddle"
local Cpaddle_player = Cpaddle_player or require "src/paddle_player"
local Cpaddle_cpu = Cpaddle_cpu or require "src/paddle_cpu"
local Cscore = Cscore or require "src/score"

local ball
local playerPaddle 
local cpuPaddle 

local stateMachine

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end 
  
  stateMachine = "game"
  --create the bjects
  startMenu = Csmenu()
  ball = Cball(ball0X, ball0Y, ballBaseSpeed, ballAngle)
  playerPaddle = Cpaddle_player(player0X, player0Y)
  cpuPaddle = Cpaddle_cpu(cpu0X, cpu0Y)
  
end

function love.update(dt)
  
  if stateMachine == "menu" then
    startMenu:update(dt, stateMachine)
  elseif stateMachine == "game" then
    playerPaddle:update(dt)
    cpuPaddle:update(dt)
    ball:update(dt, playerPaddle, cpuPaddle)
  elseif stateMachine == "gameover" then
  end

end

function love.draw()
  
  --draw objects
 ball:draw()
 playerPaddle:draw()
 cpuPaddle:draw()
 
 --Background
  love.graphics.line(w/2, 0, w/2,h)
  
end





