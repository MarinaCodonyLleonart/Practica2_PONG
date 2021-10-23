Object = Object or require ("lib/classic")
local Cdata = Object:extend()

function Cdata:new()
  
  gameStates = {"start_menu", "single", "multi", "game_over", "restart", "exit"}
  menuPanels = {"home","mode_select"}
  
  gameTitle = "2021 Pong Game"
  credits = "by Eli & Marina"

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
  ballRadius = 40 --10
  ballAngle = math.pi/4
  ballBaseSpeed = 150
  ballAcc = 0.1

  playerX, playerY = 30, h/2-50
  cpuX, cpuY =  w-30, h/2-50
  
  paddleWidth = 10
  paddleHeight = 100
  paddleSpeed = 300
  
  animationFr = 6
  
  font_heading = love.graphics.newFont( "resources/pong.ttf", 50, "normal", love.graphics.getDPIScale(0) )
  font_subheading = love.graphics.newFont( "resources/Poppins-Bold.ttf",25, "normal", love.graphics.getDPIScale(0) )
  font_buttontxt = love.graphics.newFont( "resources/Poppins-Bold.ttf",30, "normal", love.graphics.getDPIScale(0) )
  
 
end

return Cdata