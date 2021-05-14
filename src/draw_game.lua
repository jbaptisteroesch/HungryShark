require "manage_game_background"
require "manageShark"

local crab = require 'create_crab'
local bg = require 'create_game_background'

if crab == 2 or bg == 2 then
  love.event.quit()
end

function display_game()
  draw_bg()
  draw_urchin()
  draw_jelly()
  draw_cfish()
  draw_shark()
  draw_text()
  shark.moving_shark = false
end

function draw_cfish()
  for key, value in pairs(cfish.coord) do
    love.graphics.draw(cfish.skin[cfish.cfishinskinpos], value[1], value[2], cfish.rad[key], cfish.sx, cfish.sy, cfish.sizex/2, cfish.sizey/2)
  end
end

function draw_shark()
  local current_skin
  local r, g, b, a = love.graphics.getColor()
  if shark.moving_shark then
    current_skin = shark.skinattack[shark.skinattackpos]
  else
    current_skin = shark.skiniddle[shark.skiniddlepos]
  end
  if shark.collision then
    if shark.collision_loop % 2 == 0 then
      love.graphics.draw(current_skin, shark.x, shark.y, math.rad(shark.r), shark.sx, shark.sy, shark.sizex/2, shark.sizey/2)
    else
      love.graphics.setColor(1, 0, 0)
      love.graphics.draw(current_skin, shark.x, shark.y, math.rad(shark.r), shark.sx, shark.sy, shark.sizex/2, shark.sizey/2)
      love.graphics.setColor (r, g, b, a)
    end
  else
    love.graphics.draw(current_skin, shark.x, shark.y, math.rad(shark.r), shark.sx, shark.sy, shark.sizex/2, shark.sizey/2)
  end
end

function draw_bg()
  for i = 1, 6 do
      love.graphics.draw(bg.background[i], bg.x, bg.y, math.rad(0), bg.scalex, bg.scaley)
      love.graphics.draw(bg.background[i], bg.x2, bg.y, math.rad(0), bg.scalex, bg.scaley)
      if i == 5 then
        love.graphics.draw(crab.skin[crab.skincrabpos], crab.x, crab.y, crab.r, crab.scalex, crab.scaley, crab.sizex/2, crab.sizey/2)
      end
  end
end

function draw_urchin()
  for key, value in pairs(urchin.coord) do
    love.graphics.draw(urchin.skin[urchin.skinurchinpos], value[1], value[2], urchin.r, urchin.sx, urchin.sy, urchin.sizex/2, urchin.sizey/2)
  end
end

function draw_jelly()
  for key, value in pairs(jelly.coord) do
    love.graphics.draw(jelly.skin[jelly.skinjellypos], value[1], value[2], jelly.r, jelly.sx, jelly.sy, jelly.sizex/2, jelly.sizey/2)
  end
end

function draw_text()
  love.graphics.setFont(font)
  local black = {0, 0, 0, 1}
  love.graphics.print({black, "Fish eaten : " .. score}, 10, 10)
  local red = {1, 0, 0, 1}
  love.graphics.print({red, "Remaining lives : " .. lives}, 610, 10)
end