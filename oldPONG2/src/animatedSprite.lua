Object = Object or require("lib/classic")
AnimatedSprite = Object:extend()
CData = CData or require("data")

--IN THE OTHER CLASS
--self.numFrames = 3 
--sprite = CAnimatedSprite(self.image, self.numFrames)
--self.sprite:update(dt)
--love.graphics.draw(self.sprite.getActFrameQuad(), self.x, self.y, self.angle, sx, sy, ox, oy, 0, 0 )

function AnimatedSprite:new(nimage,nFrames)
  print("here")
  self.numFrames = nFrames
  self.frames = {}
  self.actFrameCount = 0
  self.image = nimage
  
  self. x0 = 0
  self. y0 = 0
  self.width = nimage:getWidth()
  self. height = nimage:getHeight()
  
  for i=1, self.numFrames do
    self.frames[i] = love.graphics.newQuad( 0, 0, self.width/nFrames, self.height, self.width, self.height)
  end
  
end

function AnimatedSprite:update(dt)
  if self.actFrameCount <= self.numFrames then
    self.actFrameCount = self.actFrame + animationFr*dt
  else
    self.actFrame =1
  end
  
end

function AnimatedSprite:draw()
  
end

function AnimatedSprite.getActFrameQuad()
  actFrameQuad = self.frames[self.actFrameCount]
  return actFrameQuad
end
  

function AnimatedSprite.getQuadsTable()
  return self.frames 
end



return animatedSprite