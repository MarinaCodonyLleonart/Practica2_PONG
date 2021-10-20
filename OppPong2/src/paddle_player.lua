
local CActor = CActor or require "src/actor"
local Cpaddle_player = CActor:extend()

local Cdata = Cdata or require "data"
local d = Cdata()

function Cpaddle_player:new(x, y)
  --Actor:new(image,x,y,speed,fx,fy)
  self.super:new("Resources/redPaddle.png",d.player0X,d.player0Y,d.paddleBaseSpeed,0,1)  

end

function Cpaddle_player:update(dt)
    self.super:update(dt)
    self.Keyboard__PlayerPaddle(dt)
end

function Cpaddle_player:draw()
--love.graphics.rectangle("fill", d.playerX, d.playerY, d.paddleWidth, d.paddleHeight)

--Cpaddle_player.super:draw()

local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local sx = self.scale.x
  local sy = self.scale.y
  local rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Keyboard__PlayerPaddle(dt)
   if love.keyboard.isDown("up") then
    self.position.y = self.position.y - self.Speed*dt
  elseif love.keyboard.isDown("down") then
    self.position.y = self.position.y + self.speed*dt
  end
end


return Cpaddle_player