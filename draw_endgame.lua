local endgame = require "create_endgame"
require "event"
local bg = 1
local buttons = 2
function draw_background_endgame()
  for i = 1, 7 do
    love.graphics.draw(endgame[bg].background[i], endgame[bg].x, endgame[bg].y, math.rad(0), endgame[bg].scalex, endgame[bg].scaley)
  end
  love.graphics.draw(endgame[bg].woodbg, endgame[bg].woodx, endgame[bg].woody, math.rad(0), endgame[bg].woodscalex,
    endgame[bg].woodscaley, endgame[bg].woodsizex/2, endgame[bg].woodsizey/2)
end

function draw_text_endgame()
  love.graphics.setFont(endgame[3].endgametitlefont)
  local red = {1, 0, 0, 1}
  love.graphics.print({red, "{ ENTER YOUR NAME }"}, love.graphics.getWidth() / 2 - 263, 187)
  local r, g, b, a = love.graphics.getColor()
  love.graphics.setColor(1, 0, 0)
  if string.len(pseudo) < 1 then
    love.graphics.printf("Type away !", 472, 420, 500, "center")
  else
    love.graphics.printf(pseudo, 472, 420, 500, "center")
  end
  love.graphics.setColor (r, g, b, a)
end

function draw_button_endgame()
  if endgame[buttons].is_on_close == true then
    love.graphics.draw(endgame[buttons].close, endgame[buttons].closex - 3, endgame[buttons].closey - 3, math.rad(0),
        endgame[buttons].closescalex, endgame[buttons].closescaley, endgame[buttons].closesizex/2, endgame[buttons].closesizey/2)
  else
    love.graphics.draw(endgame[buttons].closews, endgame[buttons].closex, endgame[buttons].closey, math.rad(0),
        endgame[buttons].closescalex, endgame[buttons].closescaley, endgame[buttons].closesizex/2, endgame[buttons].closesizey/2)
  end
end

function display_endgame()
  if endgame == 2 then
    return 2
  end
  draw_background_endgame()
  draw_text_endgame()
  draw_button_endgame()
end