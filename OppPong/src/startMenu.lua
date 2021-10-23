local Object = Object or require "lib/classic"
local StartMenu = Object:extend()

local CButton = CButton or require "src/button"

local buttonList = {}

function StartMenu:new()
  self.font = love.graphics.newFont( "resources/pong.ttf", 80, "normal", love.graphics.getDPIScale(0) )
  self.gameTitle = "2021 Pong Game"
  self.credits = "by Eli & Marina"

  start = CButton(50, 50, "game start") 
  table.insert(buttonList, start)

end

function StartMenu:update(dt, gameState)
  --one response for hovering
  x = love.mouse.getX()
  y = love.mouse.getY()

  --one response for clicking
  function love.mousepressed( x, y)   
    for m, n in pairs do
      if x> n.X and x<n.X+n.W and y>n.Y and n<n.Y+n.H then
        if n.txt == "game start" then
          gameState = "game"
        end
        --add more ifs for more buttons
      end
    end
  end

end

function StartMenu:draw()
  --estimated values. adjust once the program can complie
  love.graphics.print(gameTitle, font, w/4-20, h/4-110, 0, 1, 1, 0, 0, 0, 0 )
  love.graphics.print(credits, font, w/4-20, h/4, 0, 1, 1, 0, 0, 0, 0 )
end

return StartMenu