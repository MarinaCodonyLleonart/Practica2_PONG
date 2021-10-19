Cpaddle_player = Cpaddle:extend()

function Cpaddle_player:new(x, y)
 Cpaddle_player.super.new(self,"Resources/playerShip1_blue.png",400,300,50,1,0)
end

function Cpaddle_player.update(dt)
    Cpaddle_player.super.new(dt)
    Keyboard__PlayerPaddle(dt)
end

function Cpaddle_player.draw()
love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)
end

function Keyboard__PlayerPaddle(dt)
  if love.keyboard.isDown("up") then
    playerY = playerY - paddleSpeed*dt
  elseif love.keyboard.isDown("down") then
    playerY = playerY + paddleSpeed*dt
  end
end


return Cpaddle_player