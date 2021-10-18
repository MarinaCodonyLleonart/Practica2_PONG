local Cdata = Object:extend()

local w, h -- width and height

local ballX, ballY --ballposition
local ballRadius
local ballSpeed

local playerX, playerY, cpuX, cpuY --player and cpu's paddle position
local paddleWidth 
local paddleHeight 
local paddleSpeed

local ballAngle --ball movement angle
local playerPoints, cpuPoints --player and cpu points in match

return data