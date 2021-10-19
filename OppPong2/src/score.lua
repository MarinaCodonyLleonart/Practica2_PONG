Cscore = Object:extend()

function Cscore:new()
    --Font
  font = love.graphics.newFont( "Resources/pong.ttf", 80, "normal", love.graphics.getDPIScale(0) )

  --Points
  playerPoints, cpuPoints = 0,0
end

function Cscore:update(dt)
   if ballX<0 then 
      cpuPoints = cpuPoints + 1
      ResetBall()
    elseif ballX>d.w then 
      playerPoints = playerPoints + 1
      ResetBall()
    end
end

function Cscore:draw()
  love.graphics.print(playerPoints, font, d.w/4-20, d.h/4-110, 0, 1, 1, 0, 0, 0, 0 )
  love.graphics.print(cpuPoints, font, d.w/4*3-20, d.h/4-110, 0, 1, 1, 0, 0, 0, 0 )
end

return Cscore