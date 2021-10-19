local Object = Object or require "lib/classic"
Cpaddle = paddle or require "src/paddle"
Cpaddle_cpu = Cpaddle:extend()

function Cpaddle_cpu:new()
  Cpaddle_cpu.super.new(cpu0X, cpu0Y)
end


function Cpaddle_cpu:update(dt)
end


function Cpaddle_player:draw()
  love.graphics.rectangle("fill", Cpaddle_cpu.super.pX, Cpaddle_cpu.super.pY, paddleWidth, paddleHeight)
end

return Cpaddle_cpu