Object = Object or require("lib/classic")
Button = Object:extend()

function Button:new(x, y, w, h,txt)
    self.X = x
    self.Y = y
    self.W = w
    self.H = h
    self.txt = txt

    --estimation of the font size. Change accordingly
    self.font_button = love.graphics.newFont( "resources/pong.ttf", 30, "normal", love.graphics.getDPIScale(0) )

end

function Button:update()
 -- no update. the menu class already checks the intersections from a table of buttons
end

function Button:draw()
    love.graphics.rectangle("line", self.X, self.Y, self.W, self.H)
    love.graphics.print(self.txt, self.font_button, self.X+5, self.Y+5, 0, 1, 1, 0, 0, 0, 0 )
end

function Button.getX()
  x = self.x
  return x 
end
  


return Button