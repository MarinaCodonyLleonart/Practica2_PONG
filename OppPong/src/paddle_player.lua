Cpaddle_player = Cpaddle:extend()

function Cpaddle_player:new(x, y)
  Cpaddle_player.super.new(x, y)
end

function Cpaddle_player.update(dt)
    Cpaddle_player.super.new(dt)
end

function Cpaddle_player.draw()
love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)
end
return Cpaddle_player