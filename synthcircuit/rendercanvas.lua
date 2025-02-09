gss = 40

function renderCanvas()
  love.graphics.clear(0.12, 0.12, 0.12)
  for i=1, arraysize do
    for j=1, arraysize do

      gridSpaceSize = wwid/gss
      love.graphics.setColor(0.15, 0.15, 0.15)
      love.graphics.setLineWidth(percToPix("x", .0015))
      love.graphics.rectangle("line", (i-1)*gridSpaceSize+canvasx, (j-1)*gridSpaceSize+canvasy, gridSpaceSize, gridSpaceSize)
    end
  end
  for i=1, arraysize do
    for j=1, arraysize do
      if grids[1][i][j]["type"] == "origin" then
        renderOrigin(i, j)
      end
      if grids[1][i][j]["type"] == "note" then
        renderNote(i, j)
      end
      if grids[1][i][j]["type"] == "halt" then
        renderHalt(i, j)
      end
      if grids[1][i][j]["type"] == "wire" then
        renderWire(i, j)
      end
    end
  end
end

function renderNote(x, y)
  if grids[1][x][y]["instrument"] == "piano" then love.graphics.setColor(250/255, 110/255, 130/255) else love.graphics.setColor(130/255, 200/255, 90/255) end
  love.graphics.circle("fill", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2)
  if checkedgrid[x][y] == 1 then love.graphics.setColor(230/255, 120/255, 30/255) else love.graphics.setColor(1, 1, 1) end
  love.graphics.circle("line", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2)
  love.graphics.setColor(1,1,1)
  if grids[1][x][y]["instrument"] == "piano" then
    love.graphics.setFont(roobert_med)
    love.graphics.printf(pitchesLetter[grids[1][x][y]["pitch"]], (x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy-27, gridSpaceSize, "center")
  else
    if grids[1][x][y]["instrument"] == "bell" then
    love.graphics.draw(img_bell, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, 0, (gridSpaceSize/32)*.9, (gridSpaceSize/32)*.9, 16, 16) end
    if grids[1][x][y]["instrument"] == "clap" then
    love.graphics.draw(img_clap, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, 0, (gridSpaceSize/32)*.9, (gridSpaceSize/32)*.9, 16, 16) end
    if grids[1][x][y]["instrument"] == "clave" then
    love.graphics.draw(img_clave, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, 0, (gridSpaceSize/32)*.9, (gridSpaceSize/32)*.9, 16, 16) end
    if grids[1][x][y]["instrument"] == "hat" then
    love.graphics.draw(img_hat, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, 0, (gridSpaceSize/32)*.9, (gridSpaceSize/32)*.9, 16, 16) end

    if grids[1][x][y]["instrument"] == "kick" then
    love.graphics.draw(img_kick, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, 0, (gridSpaceSize/32)*.9, (gridSpaceSize/32)*.9, 16, 16) end
    if grids[1][x][y]["instrument"] == "rim" then
    love.graphics.draw(img_rim, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, 0, (gridSpaceSize/32)*.9, (gridSpaceSize/32)*.9, 16, 16) end
    if grids[1][x][y]["instrument"] == "snare" then
    love.graphics.draw(img_snare, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, 0, (gridSpaceSize/32)*.9, (gridSpaceSize/32)*.9, 16, 16) end
    if grids[1][x][y]["instrument"] == "tom" then
    love.graphics.draw(img_tom, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, 0, (gridSpaceSize/32)*.9, (gridSpaceSize/32)*.9, 16, 16) end
  end
end

function renderOrigin(x, y)
  love.graphics.setColor(230/255, 120/255, 30/255)
  love.graphics.circle("fill", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2)
  if checkedgrid[x][y] == 1 then love.graphics.setColor(230/255, 120/255, 30/255) else love.graphics.setColor(1, 1, 1) end
  love.graphics.circle("line", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2)
end

function renderHalt(x, y)
  love.graphics.setColor(0, 0, 1)
  --love.graphics.circle("line", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2)
  love.graphics.setColor(75/255,160/255,250/255)
  love.graphics.polygon("fill",
                        gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, (y-1)*gridSpaceSize+canvasy,
                        gridSpaceSize+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy,
                        gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize+(y-1)*gridSpaceSize+canvasy,
                        (x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy
                        )
  if checkedgrid[x][y] == 1 then love.graphics.setColor(230/255, 120/255, 30/255) else love.graphics.setColor(1, 1, 1) end
  love.graphics.polygon("line",
                        gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, (y-1)*gridSpaceSize+canvasy,
                        gridSpaceSize+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy,
                        gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize+(y-1)*gridSpaceSize+canvasy,
                        (x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy
                        )
end

function renderWire(x, y)
  if checkedgrid[x][y] == 1 then love.graphics.setColor(230/255, 120/255, 30/255) else love.graphics.setColor(1, 1, 1) end
  love.graphics.setLineWidth(percToPix("x", .002))
  if getType(x, y-1) ~= "none" and getType(x, y+1) == "none" and getType(x-1, y) ~= "none" and getType(x+1, y) == "none" then
    love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, (y-1)*gridSpaceSize+canvasy, (x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy)
  elseif getType(x, y-1) ~= "none" and getType(x, y+1) == "none" and getType(x-1, y) == "none" and getType(x+1, y) ~= "none" then
    love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, (y-1)*gridSpaceSize+canvasy, gridSpaceSize+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy)
  elseif getType(x, y-1) == "none" and getType(x, y+1) ~= "none" and getType(x-1, y) == "none" and getType(x+1, y) ~= "none" then
    love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize+(y-1)*gridSpaceSize+canvasy, gridSpaceSize+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy)
  elseif getType(x, y-1) == "none" and getType(x, y+1) ~= "none" and getType(x-1, y) ~= "none" and getType(x+1, y) == "none" then
    love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize+(y-1)*gridSpaceSize+canvasy, (x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy)
  elseif getType(x, y-1) == "none" and getType(x, y+1) == "none" and getType(x-1, y) == "none" and getType(x+1, y) == "none" then
    love.graphics.circle("fill", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/6)
  else
    if getType(x, y-1) ~= "none" and getType(x, y+1) == "none" and getType(x-1, y) == "none" and getType(x+1, y) == "none" then
      love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, (y-1)*gridSpaceSize+canvasy)
      love.graphics.circle("fill", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/8)
    elseif getType(x, y-1) == "none" and getType(x, y+1) ~= "none" and getType(x-1, y) == "none" and getType(x+1, y) == "none" then
      love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize+(y-1)*gridSpaceSize+canvasy)
      love.graphics.circle("fill", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/8)
    elseif getType(x, y-1) == "none" and getType(x, y+1) == "none" and getType(x-1, y) ~= "none" and getType(x+1, y) == "none" then
      love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, (x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy)
      love.graphics.circle("fill", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/8)
    elseif getType(x, y-1) == "none" and getType(x, y+1) == "none" and getType(x-1, y) == "none" and getType(x+1, y) ~= "none" then
      love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy)
      love.graphics.circle("fill", gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/8)
    else
      --lines
      if getType(x, y-1) ~= "none" then love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, (y-1)*gridSpaceSize+canvasy) end
      if getType(x, y+1) ~= "none" then love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize+(y-1)*gridSpaceSize+canvasy) end
      if getType(x-1, y) ~= "none" then love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, (x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy) end
      if getType(x+1, y) ~= "none" then love.graphics.line(gridSpaceSize/2+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy, gridSpaceSize+(x-1)*gridSpaceSize+canvasx, gridSpaceSize/2+(y-1)*gridSpaceSize+canvasy) end
    end
  end
end
