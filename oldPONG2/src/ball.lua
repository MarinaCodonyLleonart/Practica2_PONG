Data = Data or require("data")
Object = Object or require("lib/classic")

CBall = Object:extend()

function CBall:new(x, y, angle, speed, radius)
  self.x = x
  self.y = y
  self.angle = angle
  self.speed = speed
  self.radius = radius
end

function CBall:update(dt)
  
  --
    if self.x < 0 then 
      cpuPoints = cpuPoints + 1
      ResetBall()
    elseif self.x > w then 
      playerPoints = playerPoints + 1
      ResetBall()
    end
  --
end

function CBall:draw()
  love.graphics.circle("fill", self.x, self.y, self.radius)
end
-----METHODS OF BALL UPDATE
function ResetBall()--Load the ball in the init point and v
  self.x, self.y = w/2, h/2
  self.speed = speed 
end




return CBall