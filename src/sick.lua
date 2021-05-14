local h = {}
h.scores = {}

function h.set(filename, places, name, score)
  h.filename = filename
  h.places = places
  if not h.load() then
    h.scores = {}
    for i = 1, places do
      h.scores[i] = {score, name}
    end
  end
end

local function sortScore(a, b)
  return a[1] > b[1]
end

function h.load()
  local file = love.filesystem.newFile(h.filename)
  if not love.filesystem.getInfo(h.filename) or not file:open("r") then return end
  h.scores = {}
  for line in love.filesystem.lines(h.filename) do
     local i = line:find('\t', 1, true)
     h.scores[#h.scores+1] = {tonumber(line:sub(1, i-1)), line:sub(i+1)}
  end
  table.sort(h.scores, sortScore)
  return file:close()
end

function h.add(name, score)
  h.scores[#h.scores+1] = {score, name}
  table.sort(h.scores, sortScore)
end

function h.save()
  io.open("src/assets/leaderboard/leaderboard.txt","w"):close()
  file = io.open("src/assets/leaderboard/leaderboard.txt", "a")
  for i = 1, #h.scores do
    if i == 7 then
      break
    end
     item = h.scores[i]
     file:write(item[1] .. "\t" .. item[2] .. "\n")
  end
  return file:close()
end

setmetatable(h, {__call = function(self)
  local i = 0
  return function()
  i = i + 1
  if i <= h.places and h.scores[i] then
    return i, unpack(h.scores[i])
  end
end
end})

local highscore = h

return h