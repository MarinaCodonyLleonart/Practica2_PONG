local Object = Object or require "lib/classic"
local Menu = Object:extend()

local CData = CData or require("data")

local CButton = CButton or require "src/button"
local buttonList = {}


function Menu:new()
  local d = CData()
  
  --panel manager
  currentPanel = menuPanels[1]

  --load button
  local play = CButton(w/2-290/2, h/3*2-60/2, 290, 60, "Play") 
  table.insert(buttonList, play )
  local exit = CButton(0+10, h-70, 120, 60, "Exit")
  table.insert(buttonList, exit)
  local singleplayer = CButton(w/2-290/2, h/4+60, 290, 60, "Singleplayer") 
  table.insert(buttonList, singleplayer )
  local multiplayer = CButton(w/2-290/2, h/2+50, 290, 60, "Multiplayer") 
  table.insert(buttonList, multiplayer )
  
end

function Menu:update(dt, gameState)
  --add response animation for hovering
  x = love.mouse.getX()
  y = love.mouse.getY()

  --response for clicking
  function love.mousepressed( x, y)   
    
    for _, b in pairs(buttonList) do
      
      if x> b.X and x<b.X+b.W and y>b.Y and y<b.Y+b.H then
        
        if b.txt == "Exit" then
          stateMachine = gameState[6]
          break
          
        elseif b.txt =="Play" then
          --button animation
          print("panel 2 toggled")
          currentPanel = menuPanels[2]
          break
          
        elseif b.txt =="Multiplayer" then
          stateMachine = "multi"
          break

        elseif b.txt == "Singleplayer" then
          stateMachine = "single"
          break
        end
        
      end
    end
  end

end

function Menu:draw()
  print(currentPanel)
  if currentPanel == menuPanels[1] then
    -- BACKGORUND
    love.graphics.draw(imageMenuBackground, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
    
    --TEXT
    local ox = font_subheading:getWidth(credits) / 2
    local oy = font_subheading:getHeight(credits) / 2
    love.graphics.print(credits, font_subheading, w-ox-20, h-oy-10, 0, 1, 1, ox, oy, 0, 0 ) 
    
    --BUTTONS
    buttonList[1]:draw()
    buttonList[2]:draw()
    
  elseif currentPanel == menuPanels[2] then
    print("panel 2 active")
    -- BACKGORUND
    love.graphics.draw(imageBackground, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
    
    --TEXT
    love.graphics.print("Choose your game mode", font_subheading, 100,100, 1, 1, 100, 100, 0, 0 )
    
    --BUTTONS
    buttonList[3]:draw()
    buttonList[4]:draw()
  end
  
end

return Menu


