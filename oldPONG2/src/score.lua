Object = Object or require("lib/classic")

CScore = Object:extend()

local font
local playerPoints, cpuPoints 

function CScore:new(x, y, size, w, h)
--font = love.graphics.newFont( "pong.ttf", 80, "normal", love.graphics.getDPIScale(0))
font = love.graphics.newFont( fileName, size, "normal", love.graphics.getDPIScale(0))
playerPoints, cpuPoints = 0, 0  

self.x = x
self.y = y
end

function CScore:update(dt, ball)
   if ball.x < 0 then 
      cpuPoints = cpuPoints + 1
      ball.ResetBall()
    elseif ball.x > w then 
      playerPoints = playerPoints + 1
      ball.ResetBall()
    end
end

function CScore:draw()
  love.graphics.print(playerPoints, font, self.x, self.y, 0, 1, 1, 0, 0, 0, 0 )
  love.graphics.print(cpuPoints, font, self.x, self.y, 0, 1, 1, 0, 0, 0, 0 )
end

return CScore