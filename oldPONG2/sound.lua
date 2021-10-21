local Object = Object or require "lib/classic"
local SoundLib = Object:extend()

function SoundLib:new()
  ballCollision = love.audio.newSource("resources/grass_sound.wav", "static")
  scoring = love.audio.newSource("resources/ItemPickup.wav", "static")
end

return SoundLib