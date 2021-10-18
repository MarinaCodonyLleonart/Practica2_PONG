Cpaddle_cpu = Cpaddle:extend()

function Cpaddle_cpu:new(x, y)
  Cpaddle_cpu.super.new(x, y)
end

function Cpaddle_cpu.update(dt)