Object = Object or require("lib/classic")
CData = CData or require("data")

CScore = Object:extend()

local d = CData()

local font
local playerPoints, cpuPoints 

function CScore:new(x, y, size, w, h)
--font = love.graphics.newFont( "pong.ttf", 80, "normal", love.graphics.getDPIScale(0))
font = love.graphics.newFont( "Resources/Poppins-Bold.ttf", size, "normal", love.graphics.getDPIScale(0))
playerPoints, cpuPoints = 0, 0  

self.x = x
self.y = y

self.h = h
self.w = w
end

function CScore:update(dt, ball)
  
  playerPoints = ball.bplayerPoints
  cpuPoints = ball.bcpuPoints
  
end

function CScore:draw(isPlayer)
  
  if isPlayer then
    local ox = font:getWidth( playerPoints )/2
    local oy = font:getHeight( playerPoints )/2

    love.graphics.print(playerPoints, font, self.x, self.y, 0, 1, 1, ox, oy, 0, 0 )
  else
    local ox = font:getWidth( cpuPoints )/2
    local oy = font:getHeight( cpuPoints )/2
    love.graphics.print(cpuPoints, font, self.x, self.y, 0, 1, 1, ox, oy, 0, 0 )
  end
end

return CScore