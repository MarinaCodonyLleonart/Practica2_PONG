Cpaddle_cpu = Cpaddle:extend()

function Cpaddle_cpu:new(x, y)
  Cpaddle_cpu.super.new(x, y)
end

function Cpaddle_cpu.update(dt)
  Cpaddle_cpu.super.update(dt)
end


function Cpaddle_player.draw()
  love.graphics.rectangle("fill", super.d.cpuX, super.d.cpuY, super.d.paddleWidth, super.d.paddleHeight)
end

return Cpaddle_cpu