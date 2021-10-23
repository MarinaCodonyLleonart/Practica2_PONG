Object = Object or require("lib/classic")
CData = CData or require("data")

animatedSprite = Object:extend()

function AnimatedSprite:new(image,nFrames)
  self.numFrames = nFrames  
  self.frames = {}
  self.actFrameCount = 0
  
  local x0 = 0
  local y0 = 0
  local width = self.imae:getWidth()
  local height = self.image:getHeight()
  
  for i=1, numFrames do
    self.frames[i] = love.graphics.newQuad( x0, y0, width/nFrames, height, width, height)
  end
  
end

function AnimatedSprite:update(dt)
  if self.actFrameCount <= numFrames then
    self.actFrameCount = self.actFrame + animationFr*dt
  else
    self.actFrame =1
  end
  
end

function AnimatedSprite.getActFrameQuad
  actFrameQuad = self.frames[self.actFrameCount]
  return actFrameQuad
end
  

function AnimatedSpritegetQuadsTable()
  return self.frames 
end


  