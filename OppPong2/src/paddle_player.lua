local Cpaddle = Cpaddle or require "src/paddle"
local Cpaddle_player = Cpaddle:extend()

function Cpaddle_player:new(x, y)
 Cpaddle_player.super.new(self,"Resources/redPaddle.png",d.player0X,d.player0Y,d.paddleBaseSpeed,0,0)  --Actor:new(image,x,y,speed,fx,fy)

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