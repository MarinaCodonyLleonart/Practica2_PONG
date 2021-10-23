Object = Object or require("lib/classic")
AnimatedSprite = Object:extend()

CData = CData or require("data")

function AnimatedSprite:new(nimage,nFrames)
  
  self.numFrames = nFrames
  self.frames = {}
  self.actFrameCount = 1
  self.image = nimage
  
  local x0 = 0
  local y0 = 0
  local width = nimage:getWidth()
  local height = nimage:getHeight()
  
  for i=1, self.numFrames do
    self.frames[i] = love.graphics.newQuad( x0, y0, width/nFrames, height, width, height)
    x0 = x0+width/nFrames
  end
  
end

function AnimatedSprite:update(dt)

  if self.actFrameCount <= self.numFrames then
    self.actFrameCount = self.actFrameCount + animationFr*dt
  else
    self.actFrameCount =1
  end
  
end

function AnimatedSprite:draw(xx, yy, angle, sx, sy, ox, oy, kx, ky)
  actFrame = self.actFrameCount
  local nQuad = math.floor(actFrame)
  love.graphics.draw(self.image, self.frames[nQuad], xx, yy, angle, sx, sy, ox, oy, kx, ky)
  
end

--[[
function AnimatedSprite:getActFrame()
  return self.actFrameCount
  
end
  

function AnimatedSprite:getQuadsTable()
  return self.frames 
end
]]--

return AnimatedSprite