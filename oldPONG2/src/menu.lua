local Object = Object or require "lib/classic"
local Menu = Object:extend()

local CData = CData or require("data")

local CButton = CButton or require "src/button"
local buttonList = {}


function Menu:new()
  
  --panel manager
  currentPanel = menuPanels[1]

  --load button
  local play = CButton(w/2-290/2, h/3*2-60/2, 290, 60, "Play") 
  table.insert(buttonList, play )
  local exit = CButton(0+10, h-70, 120, 60, "Exit")
  table.insert(buttonList, exit)
  local singleplayer = CButton(0+60, h/2-60, 290, 60, "Single") 
  table.insert(buttonList, singleplayer )
  local multiplayer = CButton(w-330, h/2-60, 290, 60, "Multi") 
  table.insert(buttonList, multiplayer )
  local restart = CButton(w/2-290/2, h-120, 290, 60, "Restart") 
  table.insert(buttonList, restart )
  
end

function Menu:update(dt)
  for _, b in pairs(buttonList) do
    b:update()
  end
  --add response animation for hovering
  x = love.mouse.getX()
  y = love.mouse.getY()

  --response for clicking
  function love.mousepressed( x, y)   
    
    for _, b in pairs(buttonList) do
      
      if x> b.X and x<b.X+b.W and y>b.Y and y<b.Y+b.H then
        
        if b.txt == "Exit" then
          stateMachine = gameStates[6]
          break
          
        elseif b.txt =="Play" then
          currentPanel = menuPanels[2]
          break
          
         elseif b.txt == "Single" then
          stateMachine = "single"
          break
        
        elseif b.txt =="Multi" then
          stateMachine = "multi"
          break
          
        elseif b.txt == "Restart" then
          stateMachine = gameStates[5]
          break
        end
        
        
      end
    end
  end

end

function Menu:draw()
  
  if currentPanel == menuPanels[1] then
    -- BACKGROUND
    love.graphics.draw(imageMenuBackground, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
    
    --TEXT
    local ox = font_subheading:getWidth(credits) / 2
    local oy = font_subheading:getHeight(credits) / 2
    
    love.graphics.setColor(0, 0.7, 0.3, 0.5)
    love.graphics.print(credits, font_subheading, w-ox-20, h-oy-10, 0, 1, 1, ox, oy, 0, 0 ) 
    love.graphics.reset( )

    --BUTTONS
    buttonList[1]:draw()
    buttonList[2]:draw()
    
  elseif currentPanel == menuPanels[2] then
    --print("panel 2 active")
    -- BACKGROUND
    love.graphics.draw(imageBackground, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
  
     --TEXT
    local ox = font_midheading:getWidth(chooseGameMode) / 2
    local oy = font_midheading:getHeight(chooseGameMode) / 2
    --no entenc lo del color, si vols canviar-ho a un altre que no sigui blanc perk es vegi millor tot teu
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print( chooseGameMode, font_midheading, w/2, h/4, 0, 1, 1, ox, oy, 0, 0 )
    love.graphics.reset()
 
    --BUTTONS
    buttonList[3]:draw()
    buttonList[4]:draw()
    
  elseif currentPanel == menuPanels[3] then
    love.graphics.draw(imageBackground, 0, 0, 0, 1, 1, 0, 0, 0, 0 )
    buttonList[5]:draw()
    local ox = font_heading:getWidth(winTxt) / 2
    local oy = font_heading:getHeight(winTxt) / 2
    local oxWinner = font_superheading:getWidth(winner) / 2
    local oyWinner = font_superheading:getHeight(winner) / 2
    if winner == player1Name then
      love.graphics.setColor(0.9, 0, 0, 1)
    else
      love.graphics.setColor(0,0.8,0.9, 1)
    end      
      
      love.graphics.print(winner.."\n", font_superheading, w/2, h/3, 0, 1, 1, oxWinner, oyWinner, 0, 0 )

      love.graphics.setColor(0, 0, 0, 1)
      love.graphics.print("\n"..winTxt, font_heading, w/2, h/3, 0, 1, 1, ox, oy, 0, 0 )
      love.graphics.reset()
  end
  
end

return Menu


