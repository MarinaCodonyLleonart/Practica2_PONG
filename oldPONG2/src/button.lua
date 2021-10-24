Object = Object or require("lib/classic")
Button = Object:extend()

local CData = CData or require("data")

function Button:new(x, y, w, h, txt, rot, sx, sy )
  local d = CData()
   
  self.X = x
  self.Y = y
  self.W = w
  self.H = h
  self.rot= rot or 0
  self.sx= sx or 1
  self.sy= sy or 1
  self.txt = txt
  self.isPressed= false;
  --estimation of the font size. Change accordingly
  self.sprite = imageButton
  self.spritePressed = imageButtonPressed

end

function Button:update()
 -- no update. the menu class already checks the intersections from a table of buttons
  x = love.mouse.getX()
  y = love.mouse.getY()
  if x> self.X and x<self.X+self.W and y>self.Y and y<self.Y+self.H then
    self.isPressed= true;
  else 
    self.isPressed= false; 
  end

end

function Button:draw()
  
  local xpos= self.X + self.W/2
  local ypos = self.Y + self.H/2
  if self.isPressed then 
    love.graphics.draw(self.spritePressed, xpos, ypos, self.rot, self.sx, self.sy, self.sprite:getWidth()/2+10, self.sprite:getHeight()/2, 0, 0 )
  else 
    love.graphics.draw(self.sprite, xpos, ypos, self.rot, self.sx, self.sy, self.sprite:getWidth()/2+10, self.sprite:getHeight()/2, 0, 0 )
  end
  
  --Play text
  local ox = font_buttontxt:getWidth( self.txt ) / 2 + 10
  local oy = font_buttontxt:getHeight( self.txt ) / 2
  if self.isPressed then 
    love.graphics.setColor(0, 0.7, 0.3, 0.5)
    love.graphics.print(self.txt, font_buttontxt, xpos, ypos, 0, 1, 1, ox, oy, 0, 0 )
    love.graphics.reset()
  else
    love.graphics.print(self.txt, font_buttontxt, xpos, ypos, 0, 1, 1, ox, oy, 0, 0 )
  end
  
  --DEBUG rectangle
    --love.graphics.rectangle("line", self.X, self.Y, self.W, self.H)
  --quan no s'hagi de canviar res més de botons borrem el rectangle blanc k queda feo
end

return Button