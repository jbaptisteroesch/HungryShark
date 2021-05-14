require "draw_game"
require "draw_mmenu"
require "draw_smenu"
require "draw_info"
require "draw_leaderboard"
require "draw_endgame"
require "draw_pause"

local scene = {}
scene[1] = {["display"] = display_mmenu}
scene[2] = {["display"] = display_smenu}
scene[3] = {["display"] = display_game}
scene[4] = {["display"] = display_info}
scene[5] = {["display"] = display_leader}
scene[6] = {["display"] = display_endgame}
scene[7] = {["display"] = display_pause}

function love.draw()
  if scene[game.actual_scene]["display"]() == 2 then
    print("2")
    return 2
  end
  local cur_time = love.timer.getTime()
  if next_time <= cur_time then
    next_time = cur_time
    return
  end
  love.timer.sleep(next_time - cur_time)
end