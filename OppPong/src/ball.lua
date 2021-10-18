local Cball = Object:extend()
local Cdata = Cdata or require "data"
local d = Cdata()


function Cball:new()
  
end

function Cball.load(arg)
  
  ballX, ballY = d.w/2, d.h/2
  
  ballRadius = 10
  ballAngle = math.pi/6
  
  ballBaseSpeed = 150
  ballSpeed = ballBaseSpeed

end

function Cball.update(dt)
  
end

function Cball.draw()
  
end

return Cball