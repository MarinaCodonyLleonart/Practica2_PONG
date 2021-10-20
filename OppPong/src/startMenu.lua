local Object = Object or require "lib/classic"
local StartMenu = Object:extend()

function StartMenu:new()
  self.font = love.graphics.newFont( "resources/pong.ttf", 80, "normal", love.graphics.getDPIScale(0) )
  self.gameTitle = "2021 Pong Game"
  self.credits = "by Eli & Marina"
end

function StartMenu:update(dt, gameState)
  --if the start button is clicked..
  --gameState = "game"
  
end

function StartMenu:draw()
  love.graphics.print(gameTitle, font, w/4-20, h/4-110, 0, 1, 1, 0, 0, 0, 0 )
end

return StartMenu