local Object = Object or require "lib/classic"
local StartMenu = Object:extend()

local CData = CData or require("data")

local CButton = CButton or require "src/button"
local buttonList = {}

function StartMenu:new()
  local d = CData()
  --load background
  self.background = imageMenuBackground
  --load texts
  self.font_heading = love.graphics.newFont( "resources/pong.ttf", 50, "normal", love.graphics.getDPIScale(0) )
  self.font_subheading = love.graphics.newFont( "resources/Poppins-Bold.ttf",23, "normal", love.graphics.getDPIScale(0) )
  self.gameTitle = "2021 Pong Game"
  self.credits = "by Eli & Marina"
  
  --load button
  local start = CButton(w/2-290/2, h/3*2-60/2, 290, 60, "Play") 
  table.insert(buttonList, start )

end

function StartMenu:update(dt, gameState)
  --add response animation for hovering
  x = love.mouse.getX()
  y = love.mouse.getY()

  --response for clicking
  function love.mousepressed( x, y)   
    
    for _, b in pairs(buttonList) do
      
      if x> b.X and x<b.X+b.W and y>b.Y and y<b.Y+b.H then
        
        if b.txt == "Play" then
          --button animation
          stateMachine = "game"
        end
        --add more ifs for more buttons
        
      end
    end
  end

end

function StartMenu:draw()
  
  --love.graphics.draw( drawable, x, y, r, sx, sy, ox, oy, kx, ky )
  love.graphics.draw(self.background, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
  
  --TEXT
  --estimated values. adjust once the program can complie
  --love.graphics.print(self.gameTitle, self.font_heading, w/2-210, h/4, 0, 1, 1, 0, 0, 0, 0 )
  local ox = self.font_subheading:getWidth( self.credits ) / 2
  local oy = self.font_subheading:getHeight( self.credits ) / 2
  love.graphics.print(self.credits, self.font_subheading, w-ox-20, h-oy-10, 0, 1, 1, ox, oy, 0, 0 )
  
  --BUTTONS
  for _, b in pairs(buttonList) do
    b:draw()
  end
  
end

return StartMenu