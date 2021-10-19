Cpaddle_cpu = Cpaddle:extend()

function Cpaddle_cpu:new(x, y)
  Cpaddle_cpu.super.new(x, y)
end

function Cpaddle_cpu.update(dt)
end
love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)

function Cpaddle_player.draw()
  love.graphics.rectangle("fill", d.cpuX, d.cpuY, d.paddleWidth, d.paddleHeight)
end

return Cpaddle_cpu