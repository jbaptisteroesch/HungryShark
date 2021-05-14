require "update_game"

function love.update(dt)
  focus = love.window.hasFocus()
  if focus == false then
    game.actual_scene = 7
    return
  end
  if game.actual_scene == 3 then
    update_game(dt)
  end
  next_time = next_time + min_dt
end