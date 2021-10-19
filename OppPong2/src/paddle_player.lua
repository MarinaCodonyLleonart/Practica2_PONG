local Cpaddle = Cpaddle or require "src/paddle"
local Cpaddle_player = Cpaddle:extend()

local Cdata = Cdata or require "data"
local d = Cdata()

function Cpaddle_player:new(x, y)
  --Actor:new(image,x,y,speed,fx,fy)
  Cpaddle_player.super.new(self,"Resources/redPaddle.png",d.player0X,d.player0Y,d.paddleBaseSpeed,0,0)  

end

function Cpaddle_player:update(dt)
    Cpaddle_player.super.new(dt)
    Keyboard__PlayerPaddle(dt)
end

function Cpaddle_player:draw()
--love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)
Cpaddle_player.super:draw()
end

function Keyboard__PlayerPaddle(dt)
   if love.keyboard.isDown("up") then
    self.position.y = self.position.y - self.Speed*dt
  elseif love.keyboard.isDown("down") then
    self.position.y = self.position.y + self.speed*dt
  end
end


return Cpaddle_player