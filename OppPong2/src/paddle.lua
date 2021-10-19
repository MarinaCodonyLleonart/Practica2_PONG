local Actor = Actor or require "src/actor" --1: Find file of father class
local Cpaddle = Actor:extend() --2: make the hierarchy
--local Cpaddle = Object:extend()
local Cdata = Cdata or require "data"
local d = Cdata()

--global px, py
--local pSpeed

function Cpaddle:new(x, y)

end

function Cpaddle.load(arg)  
  pSpeed = d.paddleBaseSpeed
  --Position
  
end

function Cpaddle.update(dt)
  
end

function Cpaddle.draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)end
  
end

return Cpaddle