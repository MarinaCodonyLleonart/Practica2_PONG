Object = Object or require ("lib/classic")
local Cdata = Object:extend()

function Cdata:new()
  
  w, h = love.graphics.getDimensions() 
  
  --State machines
  gameStates = {"start_menu", "single", "multi", "game_over", "restart", "exit"}
  menuPanels = {"home","mode_select","game_over"}
  
  --Texts
  gameTitle = "2021 Pong Game"
  credits = "by Eli & Marina"
  chooseGameMode = "Choose your game mode:"
  winTxt = " has won the match!!!"
  player1Name = "PLAYER 1"
  player2Name = "PLAYER 2"
  
  --Images
  imageBall = love.graphics.newImage ("Resources/flowerBall.png")
  imageBlue = love.graphics.newImage ("Resources/bluePaddle.png")
  imageRed = love.graphics.newImage ("Resources/redPaddle.png")
  imageMenuBackground = love.graphics.newImage ("Resources/menuBackground.jpg")
  imageBackground = love.graphics.newImage ("Resources/background.jpg")
  imageButton = love.graphics.newImage ("Resources/button.png")
  imageButtonPressed = love.graphics.newImage ("Resources/buttonPressed.png")
  animatedFlowerBall = love.graphics.newImage ("Resources/FlowerBallAnim.png")
  

  --Actors data
  ballX, ballY = w/2, h/2
  ballRadius = 40 
  ballAngle = math.pi/4
  ballBaseSpeed = 200
  ballAcc = 0.2

  playerX, playerY = 30, h/2-50
  cpuX, cpuY =  w-30, h/2-50
  
  paddleWidth = 10
  paddleHeight = 100
  paddleSpeed = 300
  
  winnerPoints = 11
  
  --Animations
  animationFr = 4
  
  --Fonts
  font_superheading = love.graphics.newFont( "resources/Poppins-Bold.ttf", 80, "normal", love.graphics.getDPIScale(0) )
  font_heading = love.graphics.newFont( "resources/Poppins-Bold.ttf", 50, "normal", love.graphics.getDPIScale(0) )
  font_midheading = love.graphics.newFont( "resources/Poppins-Bold.ttf", 40, "normal", love.graphics.getDPIScale(0) )
  font_subheading = love.graphics.newFont( "resources/Poppins-Bold.ttf",23, "normal", love.graphics.getDPIScale(0) )
  font_buttontxt = love.graphics.newFont( "resources/Poppins-Bold.ttf",50, "normal", love.graphics.getDPIScale(0) )
  font_score = love.graphics.newFont( "Resources/Poppins-Bold.ttf", 80, "normal", love.graphics.getDPIScale(0)) 
  
 
end

return Cdata