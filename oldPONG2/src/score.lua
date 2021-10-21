Object = Object or require("lib/classic")
CData = CData or require("data")

CScore = Object:extend()

local d = CData()

local font
local playerPoints, cpuPoints 

function CScore:new(x, y, size, w, h)
--font = love.graphics.newFont( "pong.ttf", 80, "normal", love.graphics.getDPIScale(0))
font = love.graphics.newFont( "Resources/pong.ttf", size, "normal", love.graphics.getDPIScale(0))
playerPoints, cpuPoints = 0, 0  

self.x = x
self.y = y

self.h = h
self.w = w
end

function CScore:update(dt, ball)
  
  playerPoints = ball.bplayerPoints
  cpuPoints = ball.bcpuPoints
   --if ball.x < 0 then 
   --  cpuPoints = cpuPoints + 1
   --  --ball.ResetBall()
   --    ball.x, ball.y = w/2, h/2
   --    ball.speed = speed 
   --elseif ball.x > self.w then 
   --  playerPoints = playerPoints + 1
   --  --ball.ResetBall()
   --    ball.x, ball.y = self.w/2, self.h/2
   --    ball.speed = ball.baseSpeed 
   --end
end

function CScore:draw(isPlayer)
  if isPlayer then
    love.graphics.print(playerPoints, font, self.x, self.y, 0, 1, 1, 0, 0, 0, 0 )
  else
    love.graphics.print(cpuPoints, font, self.x, self.y, 0, 1, 1, 0, 0, 0, 0 )
  end
end

return CScore