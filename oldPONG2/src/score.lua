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
--{red, green, blue, alpha}
self.colorPlayer= {50,50,100,100}
self.colorCpu= {100,50,50,100}

end

function CScore:update(dt, ball)
  
  playerPoints = ball.bplayerPoints
  cpuPoints = ball.bcpuPoints
  
end

function CScore:draw(isPlayer)
  
  if isPlayer then
    local ox = font:getWidth( playerPoints )/2
    local oy = font:getHeight( playerPoints )/2
    love.graphics.setColor(200, 0, 0, 255)--red tomato
    love.graphics.print(playerPoints, font, self.x, self.y, 0, 1, 1, ox, oy, 0, 0 )
    love.graphics.reset( )
  else
    local ox = font:getWidth( cpuPoints )/2
    local oy = font:getHeight( cpuPoints )/2
    love.graphics.setColor(0, 0, 255, 255)
    love.graphics.print(cpuPoints, font, self.x, self.y, 0, 1, 1, ox, oy, 0, 0 )
    love.graphics.reset( )
  end
end

return CScore