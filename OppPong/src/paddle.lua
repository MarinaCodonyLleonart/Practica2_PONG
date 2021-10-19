Cpaddle = Object:extend()
--local Cdata = Cdata or require "d"
local d = require "data"
--global px, py
--local pSpeed

function Cpaddle:new(x, y)
  pX, pY = x, y
end

function Cpaddle:load(arg)  
 pSpeed = paddleBaseSpeed
  --Position
  
end

function Cpaddle:update(dt)
  
end

function Cpaddle:draw()
  --love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)
 -- love.graphics.rectangle("fill", d.cpuX, d.cpuY, d.paddleWidth, d.paddleHeight)
  
end

function getPos()
  return pX, pY
end


return Cpaddle