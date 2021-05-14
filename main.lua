require "load"
require"update"
require "draw"
require "collision"
require "manage_game_background"
require "manageShark"
require "event"
require "sick"

function love.run()
  if arg[2] ~= nil  then
    print("This program does not take any argument !")
    return
  end
  if love.math then
    love.math.setRandomSeed(os.time())
  end
  if love.load then
    if love.load() == 2 then
      return
    end
  end
  local dt = 0
  return function()
    if love.event then
      love.event.push('check_lives')
      love.event.push('mousepos')
      love.event.pump()
      for name, a,b,c,d,e,f in love.event.poll() do
        if name == "quit" then
          if not love.quit or not love.quit() then
            return a or 0
          end
        end
        love.handlers[name](a,b,c,d,e,f)
      end
    end
    if love.timer then dt = love.timer.step() end
    if love.update then love.update(dt) end
  
    if love.graphics and love.graphics.isActive() then
        love.graphics.origin()
        love.graphics.clear(love.graphics.getBackgroundColor())
        if love.draw then 
          if love.draw() == 2 then
            love.event.quit()
            return
          end
        end
        love.graphics.present()
    end
  end
end

function love.quit()
  highscore.save()
end