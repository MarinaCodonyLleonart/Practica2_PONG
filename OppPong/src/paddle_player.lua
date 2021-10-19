Cpaddle_player = Cpaddle:extend()

function Cpaddle_player:new(x, y)
  Cpaddle_player.super.new(x, y)
end

function Cpaddle_player.update(dt)
  Cpaddle_player.super.update(dt)
end

function Cpaddle_player.draw()
  love.graphics.rectangle("fill", super.d.playerX, super.d.playerY, super.d.paddleWidth, super.d.paddleHeight)
end
return Cpaddle_player