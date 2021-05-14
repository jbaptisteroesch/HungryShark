local menu = {}
local bg = {}
bg.background = {bg1, bg2, bg3, bg4, bg5, bg5}
for i = 1, 7 do
  if not pcall(function () bg.background[i] = love.graphics.newImage("assets/smenu/background/bg" .. i .. ".png") end) then
    print("Could not load background asset")
    return 2
  end
end
bg.scalex = 0.75
bg.scaley = 0.805
bg.x = 0
bg.y = 0
if not pcall(function () bg.woodbg = love.graphics.newImage("assets/smenu/background/swindow.png") end) then
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
if not pcall(function () text.smenutitlefont = love.graphics.newFont("assets/murder.ttf", 90) end) then
  print("Could not load 'murder.ttf' font..")
  return 2
end
table.insert(menu, text)
local button = {}
if not pcall(function () button.high = love.graphics.newImage("assets/smenu/buttons/high.png") end) then
  print("Could not load high button asset.")
  return 2
end
if not pcall(function () button.highws = love.graphics.newImage("assets/smenu/buttons/highwshadow.png") end) then
  print("Could not load high w shadow button asset.")
  return 2
end
if not pcall(function () button.low = love.graphics.newImage("assets/smenu/buttons/low.png") end) then
  print("Could not load low button asset.")
  return 2
end
if not pcall(function () button.lowws = love.graphics.newImage("assets/smenu/buttons/lowwshadow.png") end) then
  print("Could not load low w shadow button asset.")
  return 2
end
if not pcall(function () button.musicoff = love.graphics.newImage("assets/smenu/buttons/musicoff.png") end) then
  print("Could not load music off button asset.")
  return 2
end
if not pcall(function () button.musicon = love.graphics.newImage("assets/smenu/buttons/musicon.png") end) then
  print("Could not load music on button asset.")
  return 2
end
if not pcall(function () button.musicoffws = love.graphics.newImage("assets/smenu/buttons/musicoffwshadow.png") end) then
  print("Could not load music off w shadow button asset.")
  return 2
end
if not pcall(function () button.musiconws = love.graphics.newImage("assets/smenu/buttons/musiconwshadow.png") end) then
  print("Could not load music on w shadow button asset.")
  return 2
end
if not pcall(function () button.closews = love.graphics.newImage("assets/smenu/buttons/closewshadow.png") end) then
  print("Could not load close w shadow button asset.")
  return 2
end
if not pcall(function () button.close = love.graphics.newImage("assets/smenu/buttons/close.png") end) then
  print("Could not load close button asset.")
  return 2
end

button.highx = love.graphics.getWidth() / 2 + 70
button.highy = 392
button.highscalex = 0.5
button.highscaley = 0.5
button.highsizex = button.high:getWidth() * button.highscalex
button.highsizey = button.high:getHeight() * button.highscaley
button.lowx = love.graphics.getWidth() / 2 - 140
button.lowy = 392
button.lowscalex = 0.5
button.lowscaley = 0.5
button.lowsizex = button.low:getWidth() * button.lowscalex
button.lowsizey = button.low:getHeight() * button.lowscaley
button.low_collision = false
button.high_collision = false
button.low_selection = false
button.high_selection = true
button.musicx = love.graphics.getWidth() / 2 + 80
button.musicy = 525
button.musicscalex = 0.65
button.musicscaley = 0.65
button.musicsizex = button.musicon:getWidth() * button.musicscalex
button.musicsizey = button.musicon:getHeight() * button.musicscaley
button.is_on_music = false
button.closex = love.graphics.getWidth() / 2 - 25
button.closey = 660
button.closescalex = 0.50
button.closescaley = 0.50
button.closesizex = button.close:getWidth() * button.closescalex
button.closesizey = button.close:getHeight() * button.closescaley
button.is_on_close = false
table.insert(menu, button)
return menu