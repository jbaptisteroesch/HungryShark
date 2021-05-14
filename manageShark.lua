local bg = require 'create_game_background'

function moveShark(dt)
  local movelr = false
  if love.keyboard.isDown("up") and shark.y - (shark.sizey / 2) > 0 then
    shark.y = shark.y - shark.speed * dt
    if shark.sx > 0 then
      if shark.radius == 0 then
        shark.radius = shark.radius + 1
      end
    else
      if shark.radius == 0 then
        shark.radius = shark.radius - 1
      end
    end
    shark.moving_shark = true
  elseif love.keyboard.isDown("down") and shark.y + (shark.sizey + 100) < love.graphics.getHeight()
    and shark.y + shark.skiniddle[1]:getHeight() * 0.3 < love.graphics.getHeight() then
    shark.y = shark.y + shark.speed * dt
    if shark.sx > 0 then
      if shark.radius == 0 then
        shark.radius = shark.radius - 1
      end
    else
      if shark.radius == 0 then
        shark.radius = shark.radius + 1
      end
    end
    shark.moving_shark = true
  elseif love.keyboard.isDown("right") then
    if shark.x > love.graphics.getWidth() / 2 then
      shark.x = love.graphics.getWidth() / 2
    end
    if shark.sx > 0 then
      shark.x = shark.x + shark.sizex/2
    end
    shark.sx = - 0.3
    shark.x = shark.x + shark.speed * dt
    movelr = true
    shark.moving_shark = true
    shark.moving_shark_r = true
  elseif love.keyboard.isDown("left") then
    if shark.x == 60 or shark.x < 60  then
      shark.x = 60
    end
    if shark.sx < 0 then
      shark.x = shark.x - shark.sizex/2
    end
    shark.sx = 0.3
    shark.x = shark.x - shark.speed * dt
    movelr = true
    shark.moving_shark = true
  end
  if shark.moving_shark == false or movelr == true then
    if shark.r < 0 then
      if shark.radius == 0 then
        shark.radius = shark.radius + 1
      end
    elseif shark.r > 0 then
      if shark.radius == 0 then
        shark.radius = shark.radius - 1
      end
    else
      shark.radius = 0
    end
  end
  movelr = false
  if love.keyboard.isDown("right") then
    shark.moving_shark_r = true
  end
end

function shark_collision_fish()
  local x, y = mouse_collision()
  for key, value in pairs(cfish.coord) do
    if checkCircularCollision(x, y, value[1], value[2] + 8, 25, 17) then
      table.remove(cfish.coord, key)
      if score == 30 or score == 50 or score == 70 or score == 90 or score == 110
        or score == 130 or score == 150 then
        spawner_urchin()
      end
      if score == 40 or score == 60 or score == 80 or score == 100 or score == 120
        or score == 140 or score == 160 then
        spawner_jelly()
      end
      score = score + 1
    end
  end
end

function shark_collision_urchin()
  local sizex = 0
  local x, y = mouse_collision()
  local x2, y2 = queue_detection()
  if shark.sx < 0 then
    sizex = shark.x - shark.sizex
  else
    sizex = shark.x
  end
  for key, value in pairs(urchin.coord) do
    if checkCircularCollision(x, y, value[1] + 30, value[2] + 30, 25, 38) or
      checkCircularCollision(x2, y2, value[1] + 30, value[2] + 30, 20, 38) then
      table.remove(urchin.coord, key)
      spawner_urchin()
      lives = lives - 1
      shark.collision = true
    end
    if value[1] < 0 - urchin.sizex then
      table.remove(urchin.coord, key)
      spawner_urchin()
    end
  end
  for key, value in pairs(jelly.coord) do
    if checkCircularCollision(x, y, value[1] + 18, value[2] + 20, 25, 30) or
      checkCircularCollision(x2, y2, value[1] + 18, value[2] + 20, 20, 30) then
      table.remove(jelly.coord, key)
      spawner_jelly()
      lives = lives - 1
      shark.collision = true
    end
    if value[1] < 0 - jelly.sizex then
      table.remove(jelly.coord, key)
      spawner_jelly()
    end
  end
end

function shark_collision_color(dt)
  shark.collision_timer = shark.collision_timer + dt
  if shark.collision_timer > 0.1 then
    shark.collision_timer = shark.collision_timer - 0.1
    shark.collision_loop = shark.collision_loop + 1
  end
  if shark.collision_loop >= 10 then
    shark.collision = false
    shark.collision_loop = 0
  end
end

function setskinshark(dt)
  shark.sharktimer = shark.sharktimer + dt
  shark.sharkanimationtimer = shark.sharkanimationtimer + dt
  if shark.moving_shark then
    if shark.sharktimer > 0.15 then
      shark.sharktimer = shark.sharktimer - 0.15
      shark.skinattackpos = shark.skinattackpos + 1
      if shark.skinattackpos > 10 then
        shark.skinattackpos = 1
      end
    end
  elseif shark.sharktimer > 0.2 then
    shark.sharktimer = shark.sharktimer - 0.2
    shark.skiniddlepos = shark.skiniddlepos + 1
    if shark.skiniddlepos > 10 then
      shark.skiniddlepos = 1
    end
  end
  if shark.sharkanimationtimer > 0.020 then
    shark.sharkanimationtimer = shark.sharkanimationtimer - 0.020
    shark.r = shark.r + shark.radius
    if shark.r > 50 then
      shark.r = 50
    end
    if shark.r < - 50 then
      shark.r = - 50
    end
    shark.radius = 0
  end
end

function queue_detection()
  local x2 = shark.x + 120
  local y2 = shark.y + 55

  if shark.moving_shark == false then
    y2 = y2 - 15
  end
  if shark.sx < 0 then
    x2 = x2 - 240
  end
  if shark.r ~= 0 and shark.sx < 0 then
    if shark.r > 0 then
      x2 = x2 - (10 * shark.r/50)
      y2 = y2 - (120 * shark.r/50)
    elseif shark.r < 0 then
      x2 = x2 - (85 * shark.r/50)
      y2 = y2 - (75 * shark.r/50)
    end
  end
  if shark.r ~= 0 and shark.sx > 0 then
    if shark.r > 0 then
      x2 = x2 - (80 * shark.r/50)
      y2 = y2 + (80 * shark.r/50)
    elseif shark.r < 0 then
      x2 = x2 - (10 * shark.r/50)
      y2 = y2 + (120 * shark.r/50)
    end
  end
  return x2, y2
end

function mouse_collision()
  local x = shark.x + 10
  local y = shark.y + shark.sizey/2 - 15

  if shark.sx > 0 then
    x = x - 15
  end
  if shark.moving_shark == false then
    y = y - 15
  end
  if shark.r ~= 0 and shark.sx < 0 then
    if shark.r > 0 then
      x = x - (40 * shark.r/50)
      y = y - (10 * shark.r/50)
    elseif shark.r < 0 then
      x = x - (40 * shark.r/50)
      y = y + (40 * shark.r/50)
    end
  end
  if shark.r ~= 0 and shark.sx > 0 then
    if shark.r > 0 then
      x = x - (40 * shark.r/50)
      y = y - (20 * shark.r/50)
    elseif shark.r < 0 then
      x = x - (40 * shark.r/50)
      y = y + (20 * shark.r/50)
    end
  end
  return x, y
end