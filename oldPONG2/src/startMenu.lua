local Object = Object or require "lib/classic"
local StartMenu = Object:extend()

local CData = CData or require("data")

local CButton = CButton or require "src/button"
local buttonList = {}

function StartMenu:new()
  local d = CData()
  
  --load texts
  self.font_heading = love.graphics.newFont( "resources/pong.ttf", 50, "normal", love.graphics.getDPIScale(0) )
  self.font_subheading = love.graphics.newFont( "resources/pong.ttf",30, "normal", love.graphics.getDPIScale(0) )
  self.gameTitle = "2021 Pong Game"
  self.credits = "by Eli & Marina"
  
  --load button
  local start = CButton(w/2-110, h/2, 185, 40, "game start") 
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
        
        if b.txt == "game start" then
          --button animation
          stateMachine = "game"
        end
        --add more ifs for more buttons
        
      end
    end
  end

end

function StartMenu:draw()
  
  --TEXT
  --estimated values. adjust once the program can complie
  love.graphics.print(self.gameTitle, self.font_heading, w/2-210, h/4, 0, 1, 1, 0, 0, 0, 0 )
  love.graphics.print(self.credits, self.font_subheading, w/2-130, h/4+50, 0, 1, 1, 0, 0, 0, 0 )
  
  --BUTTONS
  for _, b in pairs(buttonList) do
    b:draw()
  end
  
end

return StartMenu