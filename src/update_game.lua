require "collision"
require "manage_game_background"
require "manageShark"

function update_game(dt)
  if not love.keyboard.isDown("right") then
    shark.moving_shark_r = false
  end
  if love.keyboard.isDown("right") and shark.x >= (love.graphics.getWidth() / 2) then
    move_background(dt)
    move_urchin(dt)
    move_jelly(dt)
  end
  moveShark(dt)
  shark_collision_urchin()
  if shark.collision then
    shark_collision_color(dt)
  end
  shark_collision_fish()
  setskinshark(dt)
  crabmovement(dt)
  urchinmovement(dt)
  jellymovement(dt)
  cfishmovement(dt)
  move_cfish(dt)
  if game.path > 175 then
    spawner_cfish()
    game.path = 0
  end
end

function spawner_cfish()
  local x = 0
  local y = 0
  x = love.math.random((1440 + cfish.sizex), 2000)
  y = love.math.random(100, 700)
  table.insert(cfish.coord, {x, y})
  local pos = false
  table.insert(cfish.pos, pos)
end

function spawner_urchin()
  local x = 0
  local y = 0
  x = love.math.random((1440 + urchin.sizex), 3000)
  y = love.math.random(100, 700)
  table.insert(urchin.coord, {x, y})
end

function spawner_jelly()
  local x = 0
  local y = 0
  x = love.math.random((1440 + jelly.sizex), 3000)
  y = love.math.random(100, 700)
  table.insert(jelly.coord, {x, y})
end