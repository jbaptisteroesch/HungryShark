local menu = require 'create_menu_background'
local bg = 1
local buttons = 2
function draw_background_menu()
  for i = 1, 7 do
    love.graphics.draw(menu[bg].background[i], menu[bg].x, menu[bg].y, math.rad(0), menu[bg].scalex, menu[bg].scaley)
  end
  love.graphics.draw(menu[bg].rock, menu[bg].rock_x, menu[bg].rock_y, math.rad(0), menu[bg].rock_scalex, 
    menu[bg].rock_scaley, menu[bg].rock_sizex/2, menu[bg].rock_sizey/2)
  local red = {1, 0, 0, 1}
  love.graphics.print({red, "HUNGRY}SHARK"}, 385, 150)
end

function draw_button_menu()
  if menu[buttons].collision == 2 then
    love.graphics.draw(menu[buttons].play, menu[buttons].playx - 5, menu[buttons].playy - 5, math.rad(0),
      menu[buttons].playscalex, menu[buttons].playscaley, button.playsizex/2, button.playsizey/2)
  else
    love.graphics.draw(menu[buttons].playwshadow, menu[buttons].playx, menu[buttons].playy, math.rad(0),
      menu[buttons].playscalex, menu[buttons].playscaley, button.playsizex/2, button.playsizey/2)
  end
  if menu[buttons].collision == 1 then
    love.graphics.draw(menu[buttons].settings, menu[buttons].settingsx - 4, menu[buttons].settingsy - 3, math.rad(0),
      menu[buttons].settingsscalex, menu[buttons].settingsscaley, menu[buttons].settingssizex/2, menu[buttons].settingssizey/2)
  else
    love.graphics.draw(menu[buttons].settingswshadow, menu[buttons].settingsx, menu[buttons].settingsy, math.rad(0),
      menu[buttons].settingsscalex, menu[buttons].settingsscaley, menu[buttons].settingssizex/2, menu[buttons].settingssizey/2)
  end
  if menu[buttons].collision == 4 then
    love.graphics.draw(menu[buttons].info, menu[buttons].infox - 3, menu[buttons].infoy - 2, math.rad(0),
      menu[buttons].infoscalex, menu[buttons].infoscaley, menu[buttons].infosizex/2, menu[buttons].infosizey/2)
  else
    love.graphics.draw(menu[buttons].infowshadow, menu[buttons].infox, menu[buttons].infoy, math.rad(0),
      menu[buttons].infoscalex, menu[buttons].infoscaley, menu[buttons].infosizex/2, menu[buttons].infosizey/2)
  end
  if menu[buttons].collision == 3 then
    love.graphics.draw(menu[buttons].leader, menu[buttons].leaderx - 4, menu[buttons].leadery - 3, math.rad(0),
      menu[buttons].leaderscalex, menu[buttons].leaderscaley, menu[buttons].leadersizex/2, menu[buttons].leadersizey/2)
  else
    love.graphics.draw(menu[buttons].leaderwshadow, menu[buttons].leaderx, menu[buttons].leadery, math.rad(0),
      menu[buttons].leaderscalex, menu[buttons].leaderscaley, menu[buttons].leadersizex/2, menu[buttons].leadersizey/2)
  end
end

function display_mmenu()
  if menu == 2 then
    return 2
  end
  draw_background_menu()
  draw_button_menu()
end