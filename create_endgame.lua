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
if not pcall(function () button.closews = love.graphics.newImage("assets/endgame/acceptwshadow.png") end) then
  print("Could not load close w shadow button asset.")
  return 2
end
if not pcall(function () button.close = love.graphics.newImage("assets/endgame/accept.png") end) then
  print("Could not load close button asset.")
  return 2
end

button.closex = love.graphics.getWidth() / 2 - 25
button.closey = 660
button.closescalex = 0.50
button.closescaley = 0.50
button.closesizex = button.close:getWidth() * button.closescalex
button.closesizey = button.close:getHeight() * button.closescaley
button.is_on_close = false
table.insert(menu, button)
local text = {}
if not pcall(function () text.endgametitlefont = love.graphics.newFont("assets/murder.ttf", 80) end) then
  print("Could not load 'murder.ttf' font.")
  return 2
end
if not pcall(function () text.endgameinfofont = love.graphics.newFont("assets/murder.ttf", 60) end) then
  print("Could not load 'murder.ttf' font.")
  return 2
end
table.insert(menu, text)
return menu