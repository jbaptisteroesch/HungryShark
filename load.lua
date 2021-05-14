highscore = require "sick"

function love.load()
  --Set game state
  min_dt = 1/120
  next_time = love.timer.getTime()
  music_is_on = true
  love.keyboard.setKeyRepeat(true)
  game = {}
  game.actual_scene = 1
  game.path = 0
  highscore.set("assets/leaderboard/leaderboard.txt", 6)
  music = love.audio.newSource("assets/fiji.mp3", "stream")
  music:setLooping(true)
  music:play()
  -- Set font
  if not pcall(function () font = love.graphics.newFont("assets/murder.ttf", 40) end) then
    print("Could not load 'murder.ttf' font..")
    return 2
  end
  -- Set up shark table
  shark = {}
  -- Set up shark iddle skin
  shark.skiniddle = {iddle1, iddle2, iddle3, iddle4, iddle5, iddle6, iddle7, iddle8, iddle9, iddle10}
  for i = 1, 10 do
    if not pcall (function () shark.skiniddle[i] = love.graphics.newImage("assets/shark/sharkm" .. i .. ".png") end) then
      print("Could not load shark asset..")
      return 2
    end
  end
  shark.skiniddlepos = 1
  -- Set up shark attack skin
  shark.skinattack = {attack1, attack2, attack3, attack4, attack5, attack6, attack7, attack8, attack9, attack10}
  for i = 1, 10 do
    if not pcall (function () shark.skinattack[i] = love.graphics.newImage("assets/shark/sharka" .. i .. ".png") end) then
      print("Could not load shark asset..")
      return 2
    end
  end
  shark.skinattackpos = 1
  -- Shark is not moving, set position and radius
  shark.moving_shark = false
  shark.moving_shark_r = true
  shark.collision = false
  shark.collision_loop = 0
  shark.collision_timer = 0
  shark.x = love.graphics.getWidth() / 2
  shark.y = love.graphics.getHeight() / 2
  shark.r = 0
  -- Set scale
  shark.sx = 0.3
  shark.sy = 0.3
  --Set offset axis
  shark.sizex = shark.skiniddle[1]:getWidth() * shark.sx
  shark.sizey = shark.skiniddle[1]:getHeight() * shark.sy
  -- Set shark speed
  shark.speed = 250
  shark.sharktimer = 0
  shark.sharkanimationtimer = 0
  shark.radius = 0
    --Set score & lives
    score = 0
    lives = 3
  -- Set ennemy table
  urchin = {}
  urchin.skin = {urchin1, urchin2, urchin3, urchin4, urchin5, urchin6, urchin7, urchin8, urchin9, urchin10}
  for i = 1, 10 do
    if not pcall (function () urchin.skin[i] = love.graphics.newImage("assets/urchin/urchin" .. i .. ".png") end) then
      print("Could not load urchin asset.")
      return 2
    end
  end
  urchin.coord = {}
  urchin.r = math.rad(0)
  urchin.sx = 0.25
  urchin.sy = 0.25
  urchin.sizex = urchin.skin[1]:getWidth() * urchin.sx
  urchin.sizey = urchin.skin[1]:getHeight() * urchin.sy
  urchin.skinurchinpos = 1
  urchin.urchintimer = 0
  urchin.speed = 150
  spawner_urchin()
  spawner_urchin()
  jelly = {}
  jelly.skin = {jelly1, jelly2, jelly3, jelly4, jelly5, jelly6, jelly7, jelly8, jelly9, jelly10}
  for i = 1, 10 do
    if not pcall (function () jelly.skin[i] = love.graphics.newImage("assets/jellyfish/jelly" .. i .. ".png") end) then
      print("Could not load jellyfish asset.")
      return 2
    end
  end
  jelly.coord = {}
  jelly.r = math.rad(0)
  jelly.sx = 0.5
  jelly.sy = 0.5
  jelly.sizex = jelly.skin[1]:getWidth() * jelly.sx
  jelly.sizey = jelly.skin[1]:getHeight() * jelly.sy
  jelly.skinjellypos = 1
  jelly.jellytimer = 0
  jelly.speed = 150
  spawner_jelly()
  --Set clown fish
  cfish = {}
  cfish.skin = {cfish1, cfish2, cfish3, cfish4, cfish5, cfish6, cfish7, cfish8, cfish9, cfish10}
  for i = 1, 10 do
    if not pcall (function () cfish.skin[i] = love.graphics.newImage("assets/clownfish/cfishm" .. i .. ".png") end) then
      print("Could not load clon fish asset.")
      return 2
    end
  end
  cfish.coord = {}
  cfish.pos = {}
  cfish.rad = {0, 0, 0}
  for i = 1, 3 do
    local cfishx = love.math.random(1000, 1500)
    local cfishy = love.math.random(100, 700)
    table.insert(cfish.coord, {cfishx, cfishy})
    local pos = false
    table.insert(cfish.pos, pos)
  end
  cfish.r = math.rad(0)
  cfish.sx = 0.25
  cfish.sy = 0.25
  cfish.sizex = cfish.skin[1]:getWidth() * urchin.sx
  cfish.sizey = cfish.skin[1]:getHeight() * urchin.sy
  cfish.cfishinskinpos = 1
  cfish.cfishtimer = 0
  cfish.speed = 100
  cfish.speedy = 150
end