Object = Object or require("lib/classic")
Cpaddle = Object:extend()
--local Cdata = Cdata or require "d"
local d = require "data"
--global px, py
--local pSpeed

function Cpaddle:new(x, y)
  self.pX = x
  self.pY = y
  self.pSpeed = paddleBaseSpeed
end


function Cpaddle:update(dt)
  KeyboardPaddle(dt)
end

function Cpaddle:draw()
  --love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)
 -- love.graphics.rectangle("fill", d.cpuX, d.cpuY, d.paddleWidth, d.paddleHeight)
  
end

function getPos()
  return pX, pY
end

function KeyboardPaddle(dt)
  if love.keyboard.isDown("up") then
    self.pY = self.pY - self.pSpeed*dt
  elseif love.keyboard.isDown("down") then
    self.pY = self.pY + self.paddleSpeed*dt
  end
end



return Cpaddle