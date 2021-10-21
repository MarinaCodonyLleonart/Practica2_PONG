Object = Object or require("lib/classic")
Button = Object:extend()

function Button:new(x, y, w, h,txt)
    self.X = x
    self.Y = y
    self.W = W
    self.H = h
    self.txt = txt

    --estimation of the font size. Change accordingly
    font = love.graphics.newFont( "resources/pong.ttf", 30, "normal", love.graphics.getDPIScale(0) )

end

function Button:update()
 -- no update. the menu class already checks the intersections from a table of buttons
end

function Button:draw()
    love.graphics.rectangle("fill", X, Y, buttonWidth, buttonHeight)
    love.graphics.print(self.txt, font, X+5, Y+5, 0, 1, 1, 0, 0, 0, 0 )
end

return Button