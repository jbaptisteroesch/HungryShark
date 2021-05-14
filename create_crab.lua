local crab = {}
crab.skin = {crab1, crab2, crab3, crab4, crab5, crab6, crab7, crab8, crab9, crab10}
for i = 1, 10 do
  if not pcall(function () crab.skin[i] = love.graphics.newImage("assets/crab/crabm" .. i .. ".png") end) then
    print("Could not load crab asset.")
    return 2
  end
end
crab.scalex = 0.5
crab.scaley = 0.5
crab.r = math.rad(0)
crab.sizex = crab.skin[1]:getWidth()
crab.sizey = crab.skin[1]:getHeight()
crab.x = love.graphics.getWidth() / 2
crab.y = love.graphics.getHeight() - (crab.sizey / 2) + 50
crab.skincrabpos = 1
crab.speed = 150
crab.crabtimer = 0

return crab