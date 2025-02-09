
function renderUi()
  love.graphics.setColor(0.15, 0.15, 0.15)
  rect(0, percToPix("y",.8), wwid, whei)
  --rect(percToPix("x", .35), 0, percToPix("x", .65), percToPix("y", .075))
  buttons = {}
  circleButtons = {}
  --love.graphics.setColor(0.3, 0.4, 0.1)
  --newButton(percToPix("x",.25), percToPix("y",.81), percToPix("x",.28), percToPix("y",.99), "whitekey")
  --newButton(percToPix("x",.286), percToPix("y",.81), percToPix("x",.306), percToPix("y",.9), "blackkey")

  for i = 0, 11 do
    -- Create white keys
    newCircleButton(
      percToPix("x", (i * .04) + .25),        -- x1
      percToPix("y", .87),                     -- y1
      percToPix("y", .03),  -- x2
      "piano",                     -- y2
      i+1
      )
  end
  for i = 11, 22 do
    -- Create white keys
    newCircleButton(
      percToPix("x", ((i-11) * .04) + .25),        -- x1
      percToPix("y", .94),                     -- y1
      percToPix("y", .03),  -- x2
      "piano",                     -- y2
      i+2
      )
  end

  for i = 11, 14 do
    -- Create white keys
    newCircleButton(
      percToPix("x", (i * .04) + .31),        -- x1
      percToPix("y", .87),                     -- y1
      percToPix("y", .03),  -- x2
      drums[i-10],                     -- y2
      1
      )
  end
  for i = 14, 17 do
    -- Create white keys
    newCircleButton(
      percToPix("x", ((i-3) * .04) + .31),        -- x1
      percToPix("y", .94),                     -- y1
      percToPix("y", .03),  -- x2
      drums[i-9],                     -- y2
      1
      )
  end

  newCircleButton(percToPix("x",.05), percToPix("y",.87), percToPix("y", .03), "origin", 1)
  newCircleButton(percToPix("x",.10), percToPix("y",.87), percToPix("y", .03), "wire", 1)
  newCircleButton(percToPix("x",.15), percToPix("y",.87), percToPix("y", .03), "halt", 1)
  newCircleButton(percToPix("x",.07), percToPix("y",.94), percToPix("y", .03), "eraser", 1)
  newCircleButton(percToPix("x",.13), percToPix("y",.94), percToPix("y", .03), "cursor", 1)

  renderButtons()
  renderCircleButtons()

  love.graphics.setColor(1,1,1)
  love.graphics.setFont(roobert_med)
  toolstring = tool
  if tool == "note" then
    toolstring = toolstring.." - "..tool_instrument
    if tool_instrument == "piano" then toolstring = toolstring.." - "..pitchesLetter[tool_pitch] end
  end
  love.graphics.print("SynthCircuit v0.5\n"..toolstring.."\n("..msgridx..", "..msgridy..")", 0, 0)
end

function rect(x1, y1, x2, y2)
  love.graphics.rectangle("fill", x1, y1, x2-x1, y2-y1)
end

function circ(x, y, rad )
  love.graphics.circle("fill", x, y, rad)
end

function renderButtons()
  for i=1, #buttons do
    if buttons[i].type == "whitekey" then
      love.graphics.setColor(1,1,1)
    elseif buttons[i].type == "blackkey" then
      love.graphics.setColor(0,0,0)
    elseif buttons[i].type == "wire" then
      love.graphics.setColor(1, 0, 0)
    elseif buttons[i].type == "halt" then
      love.graphics.setColor(0, 0, 1)
    elseif buttons[i].type == "origin" then
      love.graphics.setColor(1, 0.5, 0)
    else
      love.graphics.setColor(1,1,1)
    --love.graphics.setColor(1, 0.5, 0.4)
    --love.graphics.setColor(1,1,1)
    end
    rect(buttons[i]["x1"], buttons[i]["y1"], buttons[i]["x2"], buttons[i]["y2"])
  end
end

function renderCircleButtons()
  for i=1, #circleButtons do
    if circleButtons[i].instrument == "piano" then

      --love.graphics.setColor((i/75)+(250/255), (i/75)+(110/255), (i/75)+(130/255))
      --circ(circleButtons[i]["x"], circleButtons[i]["y"], circleButtons[i]["rad"]*0.9)

      love.graphics.setColor(1,1,1,0.5)
      love.graphics.setColor(250/255, 110/255, 130/255)
      love.graphics.circle("fill", circleButtons[i]["x"], circleButtons[i]["y"], circleButtons[i]["rad"]*0.9)
      love.graphics.setColor(1,1,1)
      love.graphics.circle("line", circleButtons[i]["x"], circleButtons[i]["y"], circleButtons[i]["rad"]*0.9)

      love.graphics.setColor(0.12, 0.12, 0.12)
      --love.graphics.setColor(250/255, 110/255, 130/255)
      love.graphics.setColor(1,1,1)
      love.graphics.setFont(roobert)
      love.graphics.printf(pitchesLetter[i], circleButtons[i]["x"]-percToPix("y", .03), circleButtons[i]["y"]-(34), 2*percToPix("y", .03), "center")

    elseif circleButtons[i].instrument == "origin" then
      love.graphics.setColor(230/255, 120/255, 30/255)
      love.graphics.circle("fill", circleButtons[i]["x"], circleButtons[i]["y"], circleButtons[i]["rad"]*0.9)
      love.graphics.setColor(1,1,1)
      love.graphics.circle("line", circleButtons[i]["x"], circleButtons[i]["y"], circleButtons[i]["rad"]*0.9)

    elseif circleButtons[i].instrument == "halt" then
      love.graphics.setColor(75/255,160/255,250/255)
      love.graphics.polygon(
      "fill",
      circleButtons[i]["x"]-(circleButtons[i]["rad"]*0.9), (circleButtons[i]["y"]),
      circleButtons[i]["x"], (circleButtons[i]["y"])-(circleButtons[i]["rad"]*0.9),
      circleButtons[i]["x"]+(circleButtons[i]["rad"]*0.9), (circleButtons[i]["y"]),
      circleButtons[i]["x"], (circleButtons[i]["y"])+(circleButtons[i]["rad"]*0.9)
      )
      love.graphics.setColor(1,1,1)
      love.graphics.polygon(
      "line",
      circleButtons[i]["x"]-(circleButtons[i]["rad"]*0.9), (circleButtons[i]["y"]),
      circleButtons[i]["x"], (circleButtons[i]["y"])-(circleButtons[i]["rad"]*0.9),
      circleButtons[i]["x"]+(circleButtons[i]["rad"]*0.9), (circleButtons[i]["y"]),
      circleButtons[i]["x"], (circleButtons[i]["y"])+(circleButtons[i]["rad"]*0.9)
      )

    elseif circleButtons[i].instrument == "wire" then
      love.graphics.setColor(1,1,1)
      love.graphics.polygon(
      "line",
      circleButtons[i]["x"]-(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"]),
      circleButtons[i]["x"], (circleButtons[i]["y"])-(circleButtons[i]["rad"]*0.7),
      circleButtons[i]["x"]+(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"]),
      circleButtons[i]["x"], (circleButtons[i]["y"])+(circleButtons[i]["rad"]*0.7)
      )

    elseif circleButtons[i].instrument == "eraser" then
      love.graphics.setColor(1,1,1)
      love.graphics.circle("line", circleButtons[i]["x"], circleButtons[i]["y"], circleButtons[i]["rad"]*0.7)
      love.graphics.line(circleButtons[i]["x"]-(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"])-(circleButtons[i]["rad"]*0.7),
                         circleButtons[i]["x"]+(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"])+(circleButtons[i]["rad"]*0.7)
      )
      love.graphics.line(circleButtons[i]["x"]-(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"])+(circleButtons[i]["rad"]*0.7),
                         circleButtons[i]["x"]+(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"])-(circleButtons[i]["rad"]*0.7)
      )

    elseif circleButtons[i].instrument == "cursor" then
      love.graphics.setColor(1,1,1)
      love.graphics.line(circleButtons[i]["x"]-(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"])+(circleButtons[i]["rad"]*0.7),
                         circleButtons[i]["x"]-(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"])-(circleButtons[i]["rad"]*0.7),
                         circleButtons[i]["x"]+(circleButtons[i]["rad"]*0.7), (circleButtons[i]["y"])+(circleButtons[i]["rad"]*0.7)
      )
      love.graphics.setColor(0.15, 0.15, 0.15)
      love.graphics.rectangle("fill", circleButtons[i]["x"], circleButtons[i]["y"], (circleButtons[i]["rad"]*0.7), (circleButtons[i]["rad"]*0.7))
      love.graphics.setColor(1,1,1)
      love.graphics.rectangle("line", circleButtons[i]["x"], circleButtons[i]["y"], (circleButtons[i]["rad"]*0.7), (circleButtons[i]["rad"]*0.7))

    else
      love.graphics.setColor(130/255, 200/255, 90/255)
      love.graphics.circle("fill", circleButtons[i]["x"], circleButtons[i]["y"], circleButtons[i]["rad"]*0.9)
      love.graphics.setColor(1,1,1)
      love.graphics.circle("line", circleButtons[i]["x"], circleButtons[i]["y"], circleButtons[i]["rad"]*0.9)
      if circleButtons[i].instrument == "bell" then
      love.graphics.draw(img_bell, circleButtons[i]["x"], circleButtons[i]["y"], 0, (gridSpaceSize/32)*1.2, (gridSpaceSize/32)*1.2, 16, 16) end
      if circleButtons[i].instrument == "clap" then
      love.graphics.draw(img_clap, circleButtons[i]["x"], circleButtons[i]["y"], 0, (gridSpaceSize/32)*1.2, (gridSpaceSize/32)*1.2, 16, 16) end
      if circleButtons[i].instrument == "clave" then
      love.graphics.draw(img_clave, circleButtons[i]["x"], circleButtons[i]["y"], 0, (gridSpaceSize/32)*1.2, (gridSpaceSize/32)*1.2, 16, 16) end
      if circleButtons[i].instrument == "hat" then
      love.graphics.draw(img_hat, circleButtons[i]["x"], circleButtons[i]["y"], 0, (gridSpaceSize/32)*1.2, (gridSpaceSize/32)*1.2, 16, 16) end

      if circleButtons[i].instrument == "kick" then
      love.graphics.draw(img_kick, circleButtons[i]["x"], circleButtons[i]["y"], 0, (gridSpaceSize/32)*1.2, (gridSpaceSize/32)*1.2, 16, 16) end
      if circleButtons[i].instrument == "rim" then
      love.graphics.draw(img_rim, circleButtons[i]["x"], circleButtons[i]["y"], 0, (gridSpaceSize/32)*1.2, (gridSpaceSize/32)*1.2, 16, 16) end
      if circleButtons[i].instrument == "snare" then
      love.graphics.draw(img_snare, circleButtons[i]["x"], circleButtons[i]["y"], 0, (gridSpaceSize/32)*1.2, (gridSpaceSize/32)*1.2, 16, 16) end
      if circleButtons[i].instrument == "tom" then
      love.graphics.draw(img_tom, circleButtons[i]["x"], circleButtons[i]["y"], 0, (gridSpaceSize/32)*1.2, (gridSpaceSize/32)*1.2, 16, 16) end
    end

  end
end
