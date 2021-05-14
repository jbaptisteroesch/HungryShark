local bg = {}
bg.background = {bg1, bg2, bg3, bg4, bg5, bg5}
for i = 1, 6 do
  if not pcall(function () bg.background[i] = love.graphics.newImage("assets/background/bg" .. i .. ".png") end) then
    print("Could not load background asset.")
    return 2
  end
end
bg.scalex = 0.75
bg.scaley = 0.805
bg.x = 0
bg.y = 0
bg.x2 = 1440
bg.speed = 150
return bg