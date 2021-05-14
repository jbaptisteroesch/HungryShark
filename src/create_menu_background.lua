local menu = {}
local bg = {}
if not pcall(function () menu.font = love.graphics.newFont("assets/murder.ttf", 150) end) then
    print("Could not load 'murder.ttf' font..")
    return 2
end
love.graphics.setFont(menu.font)
bg.background = {bg1, bg2, bg3, bg4, bg5, bg5}
for i = 1, 7 do
  if not pcall(function () bg.background[i] = love.graphics.newImage("assets/mmenu/background/bg" .. i .. ".png") end) then
    print("Could not load background asset.")
    return 2
  end
end
if not pcall(function () bg.rock = love.graphics.newImage("assets/mmenu/background/rock.png") end) then
  print("Could not load background asset.")
  return 2
end
bg.rock_scalex = 0.6
bg.rock_scaley = 0.6
bg.rock_x = (love.graphics.getWidth() / 2) - 160
bg.rock_y = (love.graphics.getHeight() / 2) - 300
bg.rock_sizex = bg.rock:getWidth() * bg.rock_scalex
bg.rock_sizey = bg.rock:getHeight() * bg.rock_scaley
bg.scalex = 0.75
bg.scaley = 0.805
bg.x = 0
bg.y = 0
button = {}
table.insert(menu, bg)
if not pcall(function () button.play = love.graphics.newImage("assets/mmenu/buttons/play.png") end) then
  print("Could not load play button asset.")
  return 2
end
if not pcall(function () button.playwshadow = love.graphics.newImage("assets/mmenu/buttons/playwshadow.png") end) then
  print("Could not load play w shadow button asset.")
  return 2
end
if not pcall(function () button.settings = love.graphics.newImage("assets/mmenu/buttons/options.png") end) then
  print("Could not load options button asset.")
  return 2
end
if not pcall(function () button.settingswshadow = love.graphics.newImage("assets/mmenu/buttons/optionswshadow.png") end) then
  print("Could not load options w shadow button asset.")
  return 2
end
if not pcall(function () button.info = love.graphics.newImage("assets/mmenu/buttons/info.png") end) then
  print("Could not load info button asset.")
  return 2
end
if not pcall(function () button.infowshadow = love.graphics.newImage("assets/mmenu/buttons/infowshadow.png") end) then
  print("Could not load info w shadow button asset.")
  return 2
end
if not pcall(function () button.leader = love.graphics.newImage("assets/mmenu/buttons/leader.png") end) then
  print("Could not load leader button asset.")
  return 2
end
if not pcall(function () button.leaderwshadow = love.graphics.newImage("assets/mmenu/buttons/leaderwshadow.png") end) then
  print("Could not load leader w shadow button asset.")
  return 2
end
button.playscalex = 0.9
button.playscaley = 0.9
button.settingsscalex = 0.7
button.settingsscaley = 0.7
button.infoscalex = 0.5
button.infoscaley = 0.5
button.leaderscalex = 0.7
button.leaderscaley = 0.7
button.playsizex = button.play:getWidth() * button.playscalex
button.playsizey = button.play:getHeight() * button.playscaley
button.settingssizex = button.play:getWidth() * button.settingsscalex
button.settingssizey = button.play:getHeight() * button.settingsscaley
button.infosizex = button.play:getWidth() * button.infoscalex
button.infosizey = button.play:getHeight() * button.infoscaley
button.leadersizex = button.leader:getWidth() * button.leaderscalex
button.leadersizey = button.leader:getHeight() * button.leaderscaley
button.playx = love.graphics.getWidth() / 2
button.playy = love.graphics.getHeight() * 0.66
button.settingsx = (love.graphics.getWidth() / 2) - button.playsizex - 20
button.settingsy = love.graphics.getHeight() * 0.66
button.infox = button.infosizex - button.infosizex / 2 - 10
button.infoy = love.graphics.getHeight() - 82
button.leaderx = (love.graphics.getWidth() / 2) + button.playsizex - 9
button.leadery = love.graphics.getHeight() * 0.66
button.collision = 0
table.insert(menu, button)
return menu