Cpaddle = Object:extend()
function Cpaddle:new()
end
function Cpaddle.load(arg)  
  --Size
  paddleWidth = 10
  paddleHeight = 100
  
  --Movement
  paddleSpeed = 300
  paddleAcc = 0.1
  
  --Position
  playerX, playerY = 20, d.h/2-50
  cpuX, cpuY =  d.w -30, d.h/2-50
end

function Cpaddle.update(dt)
  
end

function Cpaddle.draw()
  
end

return Cpaddle