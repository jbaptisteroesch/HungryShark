local menu = require "create_menu_background"
require "collision"
local utf8 = require("utf8")
pseudo = ''

function love.textinput(t)
  if string.len(pseudo) > 9 then
    return
  end
  pseudo = pseudo .. t
end

function handle_keyboard(key)
  if key == "backspace" then
    local byteoffset = utf8.offset(pseudo, -1)
    if byteoffset then
      pseudo = string.sub(pseudo, 1, byteoffset - 1)
    end
  end
end

function handle_pause(key)
  if key == 'space' then
    game.actual_scene = 3
  end
end

function love.keyreleased(key)
  if key == 'escape' and game.actual_scene == 7 then
    game.actual_scene = 1
    reset_game()
    love.graphics.setFont(menu.font)
  end
  if key == 'escape' and game.actual_scene == 3 then
    game.actual_scene = 7
  end
end

function love.keypressed(key)
  if game.actual_scene == 6 then
    handle_keyboard(key)
  end
  if game.actual_scene == 7 then
    handle_pause(key)
  end
end

function love.handlers.mousepos()
  local x, y = love.mouse.getPosition()
  if game.actual_scene == 1 then
    check_colllision_mmenu(x, y)
  elseif game.actual_scene == 2 then
    check_colllision_smenu(x, y)
  elseif game.actual_scene == 4 then
    check_colllision_info(x, y)
  elseif game.actual_scene == 5 then
    check_colllision_leader(x, y)
  elseif game.actual_scene == 6 then
    check_colllision_endgame(x, y)
  end
end

function love.mousepressed(x, y, button)
  if game.actual_scene == 1 then
    mmenu_mouse_event(button)
  elseif game.actual_scene == 2 then
    smenu_mouse_event(button)
  elseif game.actual_scene == 4 then
    info_mouse_event(button)
  elseif game.actual_scene == 5 then
    leader_mouse_event(button)
  elseif game.actual_scene == 6 then
    endgame_mouse_event(button)
  end
end

function love.handlers.check_lives()
  if game.actual_scene == 3 and lives == 0 then
    game.actual_scene = 6
  end
end