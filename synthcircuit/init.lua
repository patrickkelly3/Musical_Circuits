--INIT ARRAYS
a_w1 = {}
a_w2 = {}
a_global = {}

playing = false
framespeed = 10
steptimer = 0

tool = "note"
tool_instrument = "piano"
tool_pitch = 1

grids = {}
arraysize = 200
checkedgrid = {}
for i=1, arraysize do
  checkedgrid[i] = {}
  for j=1, arraysize do
    checkedgrid[i][j] = 0
    end
end

buttons = {}
--newButton(percToPix("x", .8), 0, percToPix("x", .99), percToPix("y", .1), "whitekey")

powerqueue = {}

function addGrid()
  newgrid = {}
  for i=1, arraysize do
    newgrid[i] = {}
    for j=1, arraysize do
      newgrid[i][j] = {type = "none"}
      end
    end
    table.insert(grids, newgrid)
end

addGrid() --datagrid

--STEP TIMES
--16STEP = 1
--8STEP = 2
--4STEP = 4
--2STEP = 8
--1STEP = 16

function reset()
powerqueue = {}
checkedgrid = {}
for i=1, arraysize do
  checkedgrid[i] = {}
  for j=1, arraysize do
    checkedgrid[i][j] = 0
    end
end
for i=1,arraysize do
  for j=1, arraysize do
    if getType(i, j) == "origin" then table.insert(powerqueue, {i, j}) end
    if getType(i, j) == "halt" then grids[1][i][j]["currenttime"] = grids[1][i][j]["time"] end
  end
end
end

--INIT NOTE OBJECT
--pitch, instrument, group, reverb, x, y

function getType(x, y)
  return grids[1][x][y]["type"]
end

function getInstrument(x, y)
  return grids[1][x][y]["instrument"]
end

function getOutput(x, y, dir)
  return grids[1][x][y][dir]
end

function createNote(gridnum, x, y, pitch, instrument)
  --default pitch: 1 default instrument: "piano"
  isup = "out"
  isdown = "out"
  isleft = "out"
  isright = "out"
  if grids[gridnum][x][y-1]["type"] == "wire" then isup = "in" end
  if grids[gridnum][x][y+1]["type"] == "wire" then isdown = "in" end
  if grids[gridnum][x-1][y]["type"] == "wire" then isleft = "in" end
  if grids[gridnum][x+1][y]["type"] == "wire" then isright = "in" end
  grids[gridnum][x][y] = {type = "note", pitch = pitch, instrument = instrument, group = 0, reverb = false, up = isup, down = isdown, left = isleft, right = isright}
end

function createOrigin(gridnum, x, y)
  grids[gridnum][x][y] = {type = "origin", up = "out", down = "out", left = "out", right = "out"}
end

function createWire(gridnum, x, y)
  grids[gridnum][x][y] = {type = "wire"}
end

function erase(x, y)
  grids[1][x][y] = {type = "none"}
end

function createHalt(gridnum, x, y, time)
  --TIME IN STEPS
  isup = "out"
  isdown = "out"
  isleft = "out"
  isright = "out"
  if grids[gridnum][x][y-1]["type"] == "wire" then isup = "in" end
  if grids[gridnum][x][y+1]["type"] == "wire" then isdown = "in" end
  if grids[gridnum][x-1][y]["type"] == "wire" then isleft = "in" end
  if grids[gridnum][x+1][y]["type"] == "wire" then isright = "in" end
  grids[gridnum][x][y] = {type = "halt", time=time, currenttime=time, group = 0, up = isup, down = isdown, left = isleft, right = isright}
end

function createModifier(gridnum, x, y, id, param, value)
  grids[gridnum][x][y] = {type = "mod", id = id, param = param, val = val, up = "in", down = "in", left = "in", right = "in"}
end

function createStartLoop(gridnum, x, y, id, iteration)
  --TIME IN STEPS
  isup = "out"
  isdown = "out"
  isleft = "out"
  isright = "out"
  isnext = "out"
  if grids[gridnum][x][y-1]["type"] == "wire" then isup = "in" end
  if grids[gridnum][x][y+1]["type"] == "wire" then isdown = "in" end
  if grids[gridnum][x-1][y]["type"] == "wire" then isleft = "in" end
  if grids[gridnum][x+1][y]["type"] == "wire" then isright = "in" end
  if grids[gridnum][x][y][""] == "wire" then isright = "in" end
  grids[gridnum][x][y] = {type = "halt", time=time, currenttime=time, group = 0, up = isup, down = isdown, left = isleft, right = isright}
end

createOrigin(1, 19, 10)
createWire(1, 20, 10)
createWire(1, 21, 10)
createNote(1, 22, 10, 1, "piano")
