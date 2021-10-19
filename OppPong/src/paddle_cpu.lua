local Object = Object or require "lib/classic"
Cpaddle = paddle or require "src/paddle"
Cpaddle_cpu = Cpaddle:extend()

function Cpaddle_cpu:new(x, y)
  Cpaddle_cpu.super:new(x, y)
end


function Cpaddle_cpu:update(dt)
end


function Cpaddle_player:draw()
  love.graphics.rectangle("fill", cpu0X, cpu0Y, paddleWidth, paddleHeight)
end

return Cpaddle_cpu