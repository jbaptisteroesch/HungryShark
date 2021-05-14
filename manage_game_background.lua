require "collision"

local crab = require "create_crab"
local bg = require 'create_game_background'

function move_urchin(dt)
  for key, value in pairs(urchin.coord) do
    value[1] = value[1] - urchin.speed * dt
  end
end

function move_jelly(dt)
  for key, value in pairs(jelly.coord) do
    value[1] = value[1] - jelly.speed * dt
  end
end

function move_background(dt)
  bg.x = bg.x - bg.speed * dt
  bg.x2 = bg.x2 - bg.speed * dt
  game.path = game.path + bg.speed * dt
  if bg.x <= - 1440 then
    bg.x = bg.x2 + 1440
  end
  if bg.x2 <= - 1440 then
    bg.x2 = bg.x + 1440
  end
  crab.x = crab.x - crab.speed * dt
  if crab.x <= 0 - crab.sizex then
    crab.x = 1440 + crab.sizex
  end
end

if crab == 2 then
  love.event.quit()
end

function smart_fish(ypos, key, dt)
  local pix = 5
  local rad_up = math.rad(15)
  local rad_down = math.rad(-15)
  local pos_down = ypos + cfish.speedy * dt * 0.3
  local pos_up = ypos - cfish.speedy * dt * 0.3
  if ypos <= 100 then
    ypos = pos_down
    cfish.pos[key] = false
    cfish.rad[key] = rad_down
  elseif ypos >= 701 then
    ypos = pos_up
    cfish.pos[key] = true
    cfish.rad[key] = rad_up
  elseif ypos >= 100 and ypos <= 450 then
    if ypos > 450 - pix then
      ypos = pos_up
      cfish.pos[key] = true
      cfish.rad[key] = rad_up
    elseif ypos < 100 + pix then
      ypos = pos_down
      cfish.pos[key] = false
      cfish.rad[key] = rad_down
    elseif cfish.pos[key] == false then
      ypos = pos_down
      cfish.rad[key] = rad_down
    else
      ypos = pos_up
      cfish.rad[key] = rad_up
    end
  elseif ypos >= 451 and ypos < 700 then
    if ypos > 700 - pix then
      ypos = pos_up
      cfish.pos[key] = true
      cfish.rad[key] = rad_up
    elseif ypos < 450 + pix then
      ypos = pos_down
      cfish.pos[key] = false
      cfish.rad[key] = rad_down
    elseif cfish.pos[key] == false then
      ypos = pos_down
      cfish.rad[key] = rad_down
    else
      ypos = pos_up
      cfish.rad[key] = rad_up
    end
  end
  return ypos
end

function move_cfish(dt)
  if shark.moving_shark and shark.x >= (love.graphics.getWidth() / 2) and shark.moving_shark_r == true then
    cfish.speed = 250
  else
    cfish.speed = 100
  end
  for key, value in pairs(cfish.coord) do
    value[1] = value[1] - cfish.speed * dt
  end
end

function cfishmovement(dt)
  cfish.cfishtimer = cfish.cfishtimer + dt
  if cfish.cfishtimer > 0.2 then
    cfish.cfishtimer = cfish.cfishtimer - 0.2
    cfish.cfishinskinpos = cfish.cfishinskinpos + 1
    if cfish.cfishinskinpos > 10 then
      cfish.cfishinskinpos = 1
    end
  end
  for key, value in pairs(cfish.coord) do
    value[2] = smart_fish(value[2], key, dt)
    if value[1] < 0 - cfish.sizex - cfish.skin[1]:getWidth() * urchin.sx then
      table.remove(cfish.coord, key)
    end
  end
end

function crabmovement(dt)
  crab.crabtimer = crab.crabtimer + dt
  if crab.crabtimer > 0.2 then
    crab.crabtimer = crab.crabtimer - 0.2
    crab.skincrabpos = crab.skincrabpos + 1
    if crab.skincrabpos > 10 then
      crab.skincrabpos = 1
    end
  end
end

function urchinmovement(dt)
  urchin.urchintimer = urchin.urchintimer + dt
  if urchin.urchintimer > 0.1 then
    urchin.urchintimer = urchin.urchintimer - 0.1
    urchin.skinurchinpos = urchin.skinurchinpos + 1
    if urchin.skinurchinpos > 10 then
      urchin.skinurchinpos = 1
    end
  end
end

function jellymovement(dt)
  jelly.jellytimer = jelly.jellytimer + dt
  if jelly.jellytimer > 0.3 then
    jelly.jellytimer = jelly.jellytimer - 0.3
    jelly.skinjellypos = jelly.skinjellypos + 1
    if jelly.skinjellypos > 10 then
      jelly.skinjellypos = 1
    end
  end
end