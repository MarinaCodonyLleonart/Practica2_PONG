Cpaddle = Object:extend()
local Cdata = Cdata or require "data"
local d = Cdata()

global px, py
local pSpeed

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
  
end

return Cpaddle