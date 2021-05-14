local smenu = require "create_settings_menu"
local bg = 1
local buttons = 3

function draw_background_smenu()
  for i = 1, 7 do
    love.graphics.draw(smenu[bg].background[i], smenu[bg].x, smenu[bg].y, math.rad(0), smenu[bg].scalex, smenu[bg].scaley)
  end
  love.graphics.draw(smenu[bg].woodbg, smenu[bg].woodx, smenu[bg].woody, math.rad(0), smenu[bg].woodscalex,
    smenu[bg].woodscaley, smenu[bg].woodsizex/2, smenu[bg].woodsizey/2)
end

function draw_button_smenu()
  if smenu[buttons].high_collision == true or smenu[buttons].high_selection then
    love.graphics.draw(smenu[buttons].high, smenu[buttons].highx, smenu[buttons].highy, math.rad(0),
      smenu[buttons].highscalex, smenu[buttons].highscaley, smenu[buttons].highsizex/2, smenu[buttons].highsizey/2)
  else
    love.graphics.draw(smenu[buttons].highws, smenu[buttons].highx, smenu[buttons].highy, math.rad(0),
      smenu[buttons].highscalex, smenu[buttons].highscaley, smenu[buttons].highsizex/2, smenu[buttons].highsizey/2)
  end
  if smenu[buttons].low_collision == true or smenu[buttons].low_selection == true then
    love.graphics.draw(smenu[buttons].low, smenu[buttons].lowx, smenu[buttons].lowy, math.rad(0),
      smenu[buttons].lowscalex, smenu[buttons].lowscaley, smenu[buttons].lowsizex/2, smenu[buttons].lowsizey/2)
  else
    love.graphics.draw(smenu[buttons].lowws, smenu[buttons].lowx, smenu[buttons].lowy, math.rad(0),
      smenu[buttons].lowscalex, smenu[buttons].lowscaley, smenu[buttons].lowsizex/2, smenu[buttons].lowsizey/2)
  end
  if music_is_on == true and smenu[buttons].is_on_music == false then
    love.graphics.draw(smenu[buttons].musiconws, smenu[buttons].musicx, smenu[buttons].musicy, math.rad(0),
      smenu[buttons].musicscalex, smenu[buttons].musicscaley, smenu[buttons].musicsizex/2, smenu[buttons].musicsizey/2)
  elseif music_is_on == true and smenu[buttons].is_on_music == true then
    love.graphics.draw(smenu[buttons].musicon, smenu[buttons].musicx - 4, smenu[buttons].musicy - 3, math.rad(0),
      smenu[buttons].musicscalex, smenu[buttons].musicscaley, smenu[buttons].musicsizex/2, smenu[buttons].musicsizey/2)
  elseif music_is_on == false and smenu[buttons].is_on_music == false then
    love.graphics.draw(smenu[buttons].musicoffws, smenu[buttons].musicx, smenu[buttons].musicy, math.rad(0),
      smenu[buttons].musicscalex, smenu[buttons].musicscaley, smenu[buttons].musicsizex/2, smenu[buttons].musicsizey/2)
  elseif music_is_on == false and smenu[buttons].is_on_music == true then
    love.graphics.draw(smenu[buttons].musicoff, smenu[buttons].musicx - 4, smenu[buttons].musicy - 3, math.rad(0),
      smenu[buttons].musicscalex, smenu[buttons].musicscaley, smenu[buttons].musicsizex/2, smenu[buttons].musicsizey/2)
  end
  if smenu[buttons].is_on_close == true then
  love.graphics.draw(smenu[buttons].close, smenu[buttons].closex - 3, smenu[buttons].closey - 3, math.rad(0),
      smenu[buttons].closescalex, smenu[buttons].closescaley, smenu[buttons].closesizex/2, smenu[buttons].closesizey/2)
  else
    love.graphics.draw(smenu[buttons].closews, smenu[buttons].closex, smenu[buttons].closey, math.rad(0),
      smenu[buttons].closescalex, smenu[buttons].closescaley, smenu[buttons].closesizex/2, smenu[buttons].closesizey/2)
  end
end

function draw_text_smenu()
  love.graphics.setFont(smenu[2].smenutitlefont)
  local red = {1, 0, 0, 1}
  love.graphics.print({red, "FPS : "}, love.graphics.getWidth() / 2 - 60, 290)
  love.graphics.print({red, "Music : "}, love.graphics.getWidth() / 2 - 200, 510)
end

function display_smenu()
  if smenu == 2 then
    print("2 sm")
    return 2
  end
  draw_background_smenu()
  draw_text_smenu()
  draw_button_smenu()
end