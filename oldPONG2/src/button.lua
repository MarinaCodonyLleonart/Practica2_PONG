Object = Object or require("lib/classic")
Button = Object:extend()

local CData = CData or require("data")

function Button:new(x, y, w, h,txt)
  local d = CData()
   
  self.X = x
  self.Y = y
  self.W = w
  self.H = h
  self.txt = txt
  
  --estimation of the font size. Change accordingly
  self.sprite = imageButton
  self.spritePressed = imageButtonPressed

end

function Button:update()
 -- no update. the menu class already checks the intersections from a table of buttons
end

function Button:draw()
  local xpos= self.X + self.W/2
  local ypos = self.Y + self.H/2
  love.graphics.draw(self.sprite,xpos, ypos, 0, 1, 1, self.sprite:getWidth()/2+10, self.sprite:getHeight()/2, 0, 0 )

  --Play text
  local ox = font_buttontxt:getWidth( self.txt ) / 2 + 10
  local oy = font_buttontxt:getHeight( self.txt ) / 2
  love.graphics.print(self.txt, font_buttontxt, xpos, ypos, 0, 1, 1, ox, oy, 0, 0 )

  love.graphics.rectangle("line", self.X, self.Y, self.W, self.H)
end

return Button