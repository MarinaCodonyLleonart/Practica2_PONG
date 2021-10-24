local Object = Object or require "lib/classic"
local SoundLib = Object:extend()

function SoundLib:new()
  --Music 
  music = love.audio.newSource("Resources/songs/cute.wav","stream")
  music:setLooping(true)
  music:setVolume(0.1)
  music:play()
  
  --Sfx
  ballCollision = love.audio.newSource("resources/grass_sound.wav", "static")
  scoring = love.audio.newSource("resources/ItemPickup.wav", "static")
  
  ballCollision:setVolume(1)
  scoring:setVolume(0.25)
  
end

function SoundLib:ballcollision()
  love.audio.play(ballCollision)
end

function SoundLib:scoring()
  love.audio.play(scoring)
end


return SoundLib