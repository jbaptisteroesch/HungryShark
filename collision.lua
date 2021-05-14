local menu = require "create_menu_background"
local smenu = require "create_settings_menu"
local info = require "create_info"
local leader = require "create_leaderboard"
local endgame = require "create_endgame"
require "sick"

function checkCircularCollision(ax, ay, bx, by, ar, br)
    local dx = bx - ax
    local dy = by - ay
    return dx^2 + dy^2 < (ar + br)^2
end

function checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
    x1 + w1 > x2 and
    y1 < y2 + h2 and
    y1 + h1 > y2
end

function check_colllision_mmenu(x, y)
  menu[2].collision = 0
  if checkCircularCollision(menu[2].playx + 5, menu[2].playy + 5, x, y, 85, 1) then
    menu[2].collision = 2
  end
  if checkCircularCollision(menu[2].settingsx + 15, menu[2].settingsy + 15, x, y, 65, 1) then
    menu[2].collision = 1
  end
  if checkCircularCollision(menu[2].infox + 15, menu[2].infoy + 15, x, y, 65, 1) then
    menu[2].collision = 4
  end
  if checkCircularCollision(menu[2].leaderx + 15, menu[2].leadery + 15, x, y, 65, 1) then
    menu[2].collision = 3
  end
end

function mmenu_mouse_event(button)
  if menu[2].collision == 2 and button == 1 then
      game.actual_scene = 3
  end
  if menu[2].collision == 1 and button == 1 then
    game.actual_scene = 2
  end
  if menu[2].collision == 4 and button == 1 then
    game.actual_scene = 4
  end
  if menu[2].collision == 3 and button == 1 then
    game.actual_scene = 5
  end
end

function check_colllision_smenu(x, y, button)
  smenu[3].high_collision = false
  smenu[3].low_collision = false
  smenu[3].is_on_music = false
  smenu[3].is_on_close = false
  if checkCollision(smenu[3].highx, smenu[3].highy, smenu[3].highsizex, smenu[3].highsizey, x, y, 1, 1) then
    smenu[3].high_collision = true
  end
  if checkCollision(smenu[3].lowx, smenu[3].lowy, smenu[3].lowsizex, smenu[3].lowsizey, x, y, 1, 1) then
    smenu[3].low_collision = true
  end
  if checkCircularCollision(smenu[3].musicx + 20, smenu[3].musicy + 18, x, y, 57, 1) then
    smenu[3].is_on_music = true
  end
  if checkCircularCollision(smenu[3].closex + 25, smenu[3].closey + 25, x, y, 50, 1) then
    smenu[3].is_on_close = true
  end
end

function smenu_mouse_event(button)
  if smenu[3].high_collision == true and button == 1 then
    fps = 120
    min_dt = 1/120
    smenu[3].high_selection = true
    smenu[3].low_selection = false
  elseif smenu[3].low_collision == true and button == 1 then
    fps = 60
    smenu[3].high_selection = false
    smenu[3].low_selection = true
    min_dt = 1/60
  elseif smenu[3].is_on_music == true and button == 1 then
    if music_is_on == true then
      music_is_on = false
      music:stop()
    elseif music_is_on == false then
      music_is_on = true
      music:play()
    end
  elseif smenu[3].is_on_close == true and button == 1 then
    game.actual_scene = 1
    love.graphics.setFont(menu.font)
  end
end

function check_colllision_info(x, y)
  info[2].is_on_close = false
  if checkCircularCollision(info[2].closex + 25, info[2].closey + 25, x, y, 50, 1) then
    info[2].is_on_close = true
  end
end

function info_mouse_event(button)
  if info[2].is_on_close == true and button == 1 then
    game.actual_scene = 1
    love.graphics.setFont(menu.font)
  end
end

function check_colllision_leader(x, y)
  leader[2].is_on_close = false
  if checkCircularCollision(leader[2].closex + 25, leader[2].closey + 25, x, y, 50, 1) then
    info[2].is_on_close = true
  end
end

function leader_mouse_event(button)
  if leader[2].is_on_close == true and button == 1 then
    game.actual_scene = 1
    love.graphics.setFont(menu.font)
  end
end

function check_colllision_endgame(x, y)
  endgame[2].is_on_close = false
  if checkCircularCollision(endgame[2].closex + 25, endgame[2].closey + 25, x, y, 50, 1) then
    endgame[2].is_on_close = true
  end
end

function endgame_mouse_event(button)
  if endgame[2].is_on_close == true and button == 1 then
    if string.len(pseudo) < 1 then
      pseudo = "Anonymous"
    end
    highscore.add(pseudo, score)
    game.actual_scene = 1
    reset_game()
    love.graphics.setFont(menu.font)
  end
end

function reset_game()
  shark.skinattackpos = 1
  shark.moving_shark = false
  shark.moving_shark_r = true
  shark.collision = false
  shark.collision_loop = 0
  shark.collision_timer = 0
  shark.x = love.graphics.getWidth() / 2
  shark.y = love.graphics.getHeight() / 2
  shark.r = 0
  score = 0
  lives = 3
  for key, value in pairs(urchin.coord) do
    table.remove(urchin.coord, key)
  end
  for key, value in pairs(jelly.coord) do
    table.remove(jelly.coord, key)
  end
  for key, value in pairs(cfish.coord) do
    table.remove(cfish.coord, key)
  end
  for key, value in pairs(cfish.pos) do
    table.remove(cfish.pos, key)
  end
  spawner_urchin()
  spawner_urchin()
  spawner_jelly()
  for i = 1, 2 do
    local cfishx = love.math.random(1000, 1500)
    local cfishy = love.math.random(100, 700)
    table.insert(cfish.coord, {cfishx, cfishy})
    local pos = false
    table.insert(cfish.pos, pos)
  end
  pseudo = ''
end