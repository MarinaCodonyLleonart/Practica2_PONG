Cpaddle = Object:extend()
local Cdata = Cdata or require "data"
local d = Cdata()

--global px, py
--local pSpeed

function Cpaddle:new(x, y)
  px, py = x, y
end

function Cpaddle.load(arg)  
 pSpeed = d.paddleBaseSpeed
  --Position
  
end

function Cpaddle.update(dt)
  
end

function Cpaddle.draw()
  --love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)
 -- love.graphics.rectangle("fill", d.cpuX, d.cpuY, d.paddleWidth, d.paddleHeight)
  
end

function getPos()
  return pX, pY
end


return Cpaddle