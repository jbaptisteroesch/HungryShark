local menu = {}
local bg = {}
bg.background = {bg1, bg2, bg3, bg4, bg5, bg5}
for i = 1, 7 do
  if not pcall(function () bg.background[i] = love.graphics.newImage("assets/smenu/background/bg" .. i .. ".png") end) then
    print("Could not load background asset.")
    return 2
  end
end
bg.scalex = 0.75
bg.scaley = 0.805
bg.x = 0
bg.y = 0
if not pcall(function () bg.woodbg = love.graphics.newImage("assets/info/woodbg.png") end) then
  print("Could not load background asset.")
  return 2
end
bg.woodx = love.graphics.getWidth() / 2
bg.woody = love.graphics.getHeight() / 2
bg.woodscalex = 0.35
bg.woodscaley = 0.35
bg.woodsizex = bg.woodbg:getWidth()
bg.woodsizey = bg.woodbg:getHeight()
table.insert(menu, bg)
local text = {}
if not pcall(function () text.pausetitlefont = love.graphics.newFont("assets/murder.ttf", 100) end) then
  print("Could not load 'murder.ttf' font..")
  return 2
end
if not pcall(function () text.pauseinfofont = love.graphics.newFont("assets/murder.ttf", 60) end) then
  print("Could not load 'murder.ttf' font..")
  return 2
end
table.insert(menu, text)
return menu