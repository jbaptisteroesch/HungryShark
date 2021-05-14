local leader = require "create_leaderboard"
local bg = 1
local buttons = 2
function draw_background_leader()
  for i = 1, 7 do
    love.graphics.draw(leader[bg].background[i], leader[bg].x, leader[bg].y, math.rad(0), leader[bg].scalex, leader[bg].scaley)
  end
  love.graphics.draw(leader[bg].woodbg, leader[bg].woodx, leader[bg].woody, math.rad(0), leader[bg].woodscalex,
    leader[bg].woodscaley, leader[bg].woodsizex/2, leader[bg].woodsizey/2)
end

function draw_text_leader()
  love.graphics.setFont(leader[3].leadertitlefont)
  local red = {1, 0, 0, 1}
  love.graphics.print({red, "{ LEADERBOARD }"}, love.graphics.getWidth() / 2 - 280, 180)
  love.graphics.setFont(leader[3].leaderinfofont)
  local r, g, b, a = love.graphics.getColor()
  love.graphics.setColor(1, 0, 0)
  local x = 472
  local y = 315
  for i, score, name in highscore() do
    love.graphics.printf(name .. " " .. score, x, y, 500, "center")
    y = y + 45
  end
  love.graphics.setColor (r, g, b, a)
end

function draw_button_leader()
  if leader[buttons].is_on_close == true then
    love.graphics.draw(leader[buttons].close, leader[buttons].closex - 3, leader[buttons].closey - 3, math.rad(0),
      leader[buttons].closescalex, leader[buttons].closescaley, leader[buttons].closesizex/2, leader[buttons].closesizey/2)
  else
    love.graphics.draw(leader[buttons].closews, leader[buttons].closex, leader[buttons].closey, math.rad(0),
      leader[buttons].closescalex, leader[buttons].closescaley, leader[buttons].closesizex/2, leader[buttons].closesizey/2)
  end
end

function display_leader()
  if info == 2 then
    return 2
  end
  draw_background_leader()
  draw_text_leader()
  draw_button_leader()
end