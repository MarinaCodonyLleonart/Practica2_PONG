Object = Object or require("lib/classic")
CData = CData or require("data")

animatedSprite = Object:extend()

function AnimatedSprite:new(image,nFrames)
  self.numFrames = nFrames  
  self.frames = {}
  
  local x0 = 0
  local y0 = 0
  local width = self.imae:getWidth()
  local height = self.image:getHeight()
  
  for i=1, numFrames do
    self.frames[i] = love.graphics.newQuad( x0, y0, width/nFrames, height, width, height)
  end
  
end

function AnimatedSprite:getQuadsTable()
  return self.frames 
end
  
  