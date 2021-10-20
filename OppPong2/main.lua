Object = require "lib/classic"
local Cdata = Cdata or require "data"
local Cball = Cball or require "src/ball"
--local Cpaddle = paddle or require "src/paddle"

local CpaddlePlayer = paddle or require "src/paddle_player"
local CpaddleCpu = paddle or require "src/paddle_cpu"

local Cscore = Cscore or require "src/score"


local actorList = {}  --Lista de elementos de juego

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  --3 actors: ball, cpuPaddle and playerPaddle
  local ball = Cball:extend()
  ball:new()
  actorList.ball=ball
  --table.insert(actorList,ball)
  
  local cpuPaddle = CpaddleCpu:extend()
  cpuPaddle:new()
  actorList.cpuPaddle = cpuPaddle
  --table.insert(actorList,cpuPaddle)
  
  local playerPaddle = CpaddlePlayer:extend()
  playerPaddle:new()
  actorList.playerPaddle = playerPaddle
  --table.insert(actorList,playerPaddle)
  
  --Score
  local score = Cscore:extend()
  score:new()
  
  --ball.load()
  --playerPaddle.load()
  --cpuPaddle.load()
end

function love.update(dt)
  --Actors update
  --for _,v in ipairs(actorList) do v:update(dt) end
  --actorList[1]:update(dt, cpuPaddle, playerPaddle)
  actorList.ball:update(dt,actorList.ball, actorList.cpuPaddle, actorList.playerPaddle)
  actorList.cpuPaddle:update(dt, actorList.ball)

  actorList.playerPaddle:update(dt)

  --playerPaddle:update(dt)

  --Score update
  score:update()
end

function love.draw()
  --Actors
  for _,v in pairs(actorList) do----ipairs o pairs
    v:draw()
  end
  
  --Score
  score.draw()
 
 --Background
  love.graphics.line(d.w/2, 0, d.w/2,d.h)
  
end



--just for testing




