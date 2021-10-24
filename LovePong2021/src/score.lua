Object = Object or require("lib/classic")
CData = CData or require("data")

CScore = Object:extend()


function CScore:new(x, y, w, h)

winner = "player"
self.playerPoints, self.cpuPoints = 0, 0  

self.x = x
self.y = y

self.h = h
self.w = w

self.colorPlayer= {200, 0, 0, 255}
self.colorCpu= {100,50,50,100}

end

function CScore:update(dt, ball)
  
  self.playerPoints = ball.bplayerPoints
  self.cpuPoints = ball.bcpuPoints

  if self.playerPoints>= winnerPoints or self.cpuPoints>= winnerPoints then
    stateMachine = gameStates[4]
    
    if self.playerPoints>self.cpuPoints then
      winner = player1Name
    else
      winner = player2Name
    end
    
  end
  
end

function CScore:draw(isPlayer)
  
  if isPlayer then
    local ox = font_score:getWidth( self.playerPoints )/2
    local oy = font_score:getHeight( self.playerPoints )/2
    
    love.graphics.setColor(0.9, 0, 0, 1)
    love.graphics.print(self.playerPoints, font_score, self.x, self.y, 0, 1, 1, ox, oy, 0, 0 )
    love.graphics.reset( )
    
  else
    local ox = font_score:getWidth( self.cpuPoints )/2
    local oy = font_score:getHeight( self.cpuPoints )/2
    love.graphics.setColor(0,0.8,0.9, 1)
    love.graphics.print(self.cpuPoints, font_score, self.x, self.y, 0, 1, 1, ox, oy, 0, 0 )
    love.graphics.reset( )
    
  end
  
end


return CScore