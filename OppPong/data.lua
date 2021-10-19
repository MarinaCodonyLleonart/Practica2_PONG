--local Object = Object or require "lib/classic"
--local Cdata = Object:extend()
--module("d",package.seeall)

w, h = love.graphics.getDimensions() -- width and height

ball0X, ball0Y = w/2, h/2 --ballposition
ballRadius = 10
ballBaseSpeed = 150
ballAngle = math.pi/6

player0X, player0Y = 20, h/2-50
cpu0X, cpu0Y = w-30, h/2-50
paddleWidth = 10
paddleHeight = 100
paddleBaseSpeed = 300
paddleAcc = 0.1

--playerPoints, cpuPoints --player and cpu points in match

return data

--[[
function Cdata:new()
  
  local w, h = love.graphics.getDimensions() -- width and height

  local ball0X, ball0Y = w/2, h/2 --ballposition
  local ballRadius = 10
  local ballBaseSpeed = 150
  local ballAngle = math.pi/6
  
  local player0X, player0Y = 20, h/2-50
  local cpu0X, cpu0Y = w-30, h/2-50
  local paddleWidth = 10
  local paddleHeight = 100
  local paddleBaseSpeed = 300
  local paddleAcc = 0.1
  
  local playerPoints, cpuPoints --player and cpu points in match
  
end


]]--