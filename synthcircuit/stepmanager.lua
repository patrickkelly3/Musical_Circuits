
function step()
  powergo = {}
  for i=1, #powerqueue do
    powergo[i] = powerqueue[i]
  end
  powerqueue = {}
  --reinit checked grid
  checkedgrid = {}
  for i=1, arraysize do
    checkedgrid[i] = {}
    for j=1, arraysize do
      checkedgrid[i][j] = 0
      end
  end

  for i=1, #powergo do
    checkedgrid[powergo[i][1]][powergo[i][2]] = 1
    if getType(powergo[i][1], powergo[i][2]) == "halt" then
      if grids[1][powergo[i][1]][powergo[i][2]]["currenttime"] > 0 then
        activate(powergo[i][1], powergo[i][2])
        table.insert(powerqueue, {powergo[i][1], powergo[i][2]})
      else
        grids[1][powergo[i][1]][powergo[i][2]]["currenttime"] = grids[1][powergo[i][1]][powergo[i][2]]["time"]
        power(powergo[i][1], powergo[i][2])
      end
    else
    power(powergo[i][1], powergo[i][2])
    end
  end
end

--powerqueue[i][x/y] (x=1, y=2)

function power(x, y)
  --check up
  if checkedgrid[x][y-1] == 0 and (getType(x, y)=="wire" or getType(x, y)=="origin" or (getType(x, y)~="wire" and getType(x, y)~="none") and getOutput(x, y, "up") == "out") then
    checkedgrid[x][y-1] = 1
    if getType(x, y-1)=="none" then
      --nothn
    elseif getType(x, y-1)=="wire" then
      power(x, y-1)
    elseif (getType(x, y)=="wire" and getOutput(x, y-1, "down") == "in") then
      --something with in/out
      --ACTIVATE NODE
      activate(x, y-1)
      table.insert(powerqueue, {x, y-1})
    end
  end

  --check down
  if checkedgrid[x][y+1] == 0 and (getType(x, y)=="wire" or getType(x, y)=="origin" or (getType(x, y)~="wire" and getType(x, y)~="none") and getOutput(x, y, "down") == "out") then
    checkedgrid[x][y+1] = 1
    if getType(x, y+1)=="none" then
      --nothn
    elseif getType(x, y+1)=="wire" then
      power(x, y+1)
    elseif (getType(x, y)=="wire" and getOutput(x, y+1, "up") == "in") then
      --something with in/out
      --ACTIVATE NODE
      activate(x, y+1)
      table.insert(powerqueue, {x, y+1})
    end
  end

  --check left
  if checkedgrid[x-1][y] == 0 and (getType(x, y)=="wire" or getType(x, y)=="origin" or (getType(x, y)~="wire" and getType(x, y)~="none") and getOutput(x, y, "left") == "out") then
    checkedgrid[x-1][y] = 1
    if getType(x-1, y)=="none" then
      --nothn
    elseif getType(x-1, y)=="wire" then
      power(x-1, y)
    elseif (getType(x, y)=="wire" and getOutput(x-1, y, "right") == "in") then
      --something with in/out
      --ACTIVATE NODE
      activate(x-1, y)
      table.insert(powerqueue, {x-1, y})
    end
  end

  --check right
  if checkedgrid[x+1][y] == 0 and (getType(x, y)=="wire" or getType(x, y)=="origin" or (getType(x, y)~="wire" and getType(x, y)~="none") and getOutput(x, y, "right") == "out") then
    checkedgrid[x+1][y] = 1
    if getType(x+1, y)=="none" then
      --nothn
    elseif getType(x+1, y)=="wire" then
      power(x+1, y)
    elseif (getType(x, y)=="wire" and getOutput(x+1, y, "left") == "in") then
      --something with in/out
      --ACTIVATE NODE
      activate(x+1, y)
      table.insert(powerqueue, {x+1, y})
    end
  end

end

function activate(x,y)
  --get type
  --do something abt it
  if getType(x, y) == "note" then
    if getInstrument(x, y) == "piano" then
      local sound = piano:clone()
      sound:setPitch(pitches[grids[1][x][y]["pitch"]])
      sound:play()
    elseif getInstrument(x, y) == "bell" then
      local sound = bell1:clone()
      sound:play()
    elseif getInstrument(x, y) == "clap" then
      local sound = clap:clone()
      sound:play()
    elseif getInstrument(x, y) == "clave" then
      local sound = clave:clone()
      sound:play()
    elseif getInstrument(x, y) == "kick" then
      local sound = kick:clone()
      sound:play()
    elseif getInstrument(x, y) == "snare" then
      local sound = snare:clone()
      sound:play()
    elseif getInstrument(x, y) == "hat" then
      local sound = hat:clone()
      sound:play()
    elseif getInstrument(x, y) == "rim" then
      local sound = rim:clone()
      sound:play()
    elseif getInstrument(x, y) == "tom" then
      local sound = tom:clone()
      sound:play()
    end
  end
  if getType(x, y) == "halt" then
    grids[1][x][y]["currenttime"] = grids[1][x][y]["currenttime"] - 1
  end
end
