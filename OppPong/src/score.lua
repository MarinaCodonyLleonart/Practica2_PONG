Object = Object or require("lib/classic")
Cscore = Object:extend()

local sound = sound or require "sound"

function Cscore:new()
  
end

function Cscore.load(arg)
  --Font
  font = love.graphics.newFont( "resources/pong.ttf", 80, "normal", love.graphics.getDPIScale(0) )

  --Points
  playerPoints, cpuPoints = 0,0
end

function Cscore.update(dt)
   if ballX<0 then 
      cpuPoints = cpuPoints + 1
      sound.scoring:play()
      ResetBall()
    elseif ballX>w then 
      playerPoints = playerPoints + 1
      sound.scoring:play()
      ResetBall()
    end
end

function Cscore.draw()
  love.graphics.print(playerPoints, font, w/4-20, h/4-110, 0, 1, 1, 0, 0, 0, 0 )
  love.graphics.print(cpuPoints, font, w/4*3-20, h/4-110, 0, 1, 1, 0, 0, 0, 0 )
end

return Cscore