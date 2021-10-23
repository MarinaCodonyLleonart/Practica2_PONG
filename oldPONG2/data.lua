Object = Object or require ("lib/classic")
local Cdata = Object:extend()

function Cdata:new()
  --images
  imageBall = love.graphics.newImage ("Resources/flowerBall.png")
  imageBlue = love.graphics.newImage ("Resources/bluePaddle.png")
  imageRed = love.graphics.newImage ("Resources/redPaddle.png")
  imageMenuBackground = love.graphics.newImage ("Resources/menuBackground.jpg")
  imageBackground = love.graphics.newImage ("Resources/background.jpg")
  imageButton = love.graphics.newImage ("Resources/button.png")
  imageButtonPressed = love.graphics.newImage ("Resources/buttonPressed.png")

  animatedFlowerBall = love.graphics.newImage ("Resources/FlowerBallAnim.png")
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height

  ballX, ballY = w/2, h/2
  ballRadius = 10
  ballAngle = math.pi/4
  ballBaseSpeed = 150
  ballAcc = 0.1

  playerX, playerY = 30, h/2-50
  cpuX, cpuY =  w-30, h/2-50
  
  paddleWidth = 10
  paddleHeight = 100
  paddleSpeed = 300
  
  animationFr = 6
  
end

return Cdata