local info = require "create_info"
local bg = 1
local buttons = 2
function draw_background_info()
  for i = 1, 7 do
    love.graphics.draw(info[bg].background[i], info[bg].x, info[bg].y, math.rad(0), info[bg].scalex, info[bg].scaley)
  end
  love.graphics.draw(info[bg].woodbg, info[bg].woodx, info[bg].woody, math.rad(0), info[bg].woodscalex,
    info[bg].woodscaley, info[bg].woodsizex/2, info[bg].woodsizey/2)
end

function draw_text_info()
  love.graphics.setFont(info[3].infotitlefont)
  local red = {1, 0, 0, 1}
  love.graphics.print({red, "INFO }"}, love.graphics.getWidth() / 2 - 120, 180)
  love.graphics.setFont(info[3].infoinfofont)
  love.graphics.print({red, "This game was build for"}, love.graphics.getWidth() / 2 - 210, 305)
  love.graphics.print({red, "learn purpose only with"}, love.graphics.getWidth() / 2 - 210, 355)
  love.graphics.print({red, "the lua language and the"}, love.graphics.getWidth() / 2 - 210, 405)
  love.graphics.print({red, "graphic library love2d."}, love.graphics.getWidth() / 2 - 200, 455)
  love.graphics.print({red, "Hope you have fun playing it !"}, love.graphics.getWidth() / 2 - 260, 525)
  love.graphics.print({red, "JB }"}, love.graphics.getWidth() / 2 + 125, 585)
end

function draw_button_info()
  if info[buttons].is_on_close == true then
    love.graphics.draw(info[buttons].close, info[buttons].closex - 3, info[buttons].closey - 3, math.rad(0),
    info[buttons].closescalex, info[buttons].closescaley, info[buttons].closesizex/2, info[buttons].closesizey/2)
  else
    love.graphics.draw(info[buttons].closews, info[buttons].closex, info[buttons].closey, math.rad(0),
    info[buttons].closescalex, info[buttons].closescaley, info[buttons].closesizex/2, info[buttons].closesizey/2)
  end
end

function display_info()
  if info == 2 then
    return 2
  end
  draw_background_info()
  draw_text_info()
  draw_button_info()
end