local Object = Object or require "lib/classic"
local SoundLib = Object:extend()

function SoundLib:new()
  ballCollision = love.audio.newSource("resources/grass_sound(cut).wav", "static")
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