local pause = require "create_pause_menu"
local bg = 1
function draw_background_pause()
  for i = 1, 7 do
    love.graphics.draw(pause[bg].background[i], pause[bg].x, pause[bg].y, math.rad(0), pause[bg].scalex, pause[bg].scaley)
  end
  love.graphics.draw(pause[bg].woodbg, pause[bg].woodx, pause[bg].woody, math.rad(0), pause[bg].woodscalex,
    pause[bg].woodscaley, pause[bg].woodsizex/2, pause[bg].woodsizey/2)
end

function draw_text_pause()
  love.graphics.setFont(pause[2].pausetitlefont)
  local red = {1, 0, 0, 1}
  love.graphics.print({red, "{ PAUSE }"}, love.graphics.getWidth() / 2 - 167, 180)
  love.graphics.setFont(pause[2].pauseinfofont)
  love.graphics.print({red, "Press esc key again to"}, love.graphics.getWidth() / 2 - 210, 365)
  love.graphics.print({red, "go to the main menu"}, love.graphics.getWidth() / 2 - 185, 415)
  love.graphics.print({red, "Press spacebar to resume"}, love.graphics.getWidth() / 2 - 240, 495)
end

function display_pause()
  if pause == 2 then
    return 2
  end
  draw_background_pause()
  draw_text_pause()
end