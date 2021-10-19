local Object = Object or require "lib/classic"
Cpaddle = paddle or require "src/paddle"
Cpaddle_player = Cpaddle:extend()

function Cpaddle_player:new()
  Cpaddle_player.super.new(player0X, player0Y)
end

function Cpaddle_player:update(dt)
  Cpaddle_player.super.update(dt)
  Keyboard__PlayerPaddle(dt)
  
end

function Cpaddle_player:draw()
  
  love.graphics.rectangle("fill", Cpaddle_player.super.pX, Cpaddle_player.super.pY, paddleWidth, paddleHeight)
end



function Keyboard__PlayerPaddle(dt)
  if love.keyboard.isDown("up") then
    super.pY = super.pY - super.pSpeed*dt
  elseif love.keyboard.isDown("down") then
    super.pY = super.pY + super.paddleSpeed*dt
  end
end

return Cpaddle_player