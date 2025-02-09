left = false
right = false
up = false
down = false

button1 = false
button2 = false
button3 = false

buttonu = false
buttond = false
buttonl = false
buttonr = false

buttonu_lock = false
buttond_lock = false
buttonl_lock = false
buttonr_lock = false

left_press = false
right_press = false
up_press = false
down_press = false

buttonu_press = false
buttond_press = false
buttonl_press = false
buttonr_press = false

button1_press = false
button2_press = false
button3_press = false

left_lock = false
right_lock = false
up_lock = false
down_lock = false

button1_lock = false
button2_lock = false
button3_lock = false

function system_input()

  if love.keyboard.isDown("1") then
    buttonu = true
  else
    buttonu = false
  end
  if love.keyboard.isDown("2") then
    buttonr = true
  else
    buttonr = false
  end
  if love.keyboard.isDown("3") then
    buttond = true
  else
    buttond = false
  end
  if love.keyboard.isDown("4") then
    buttonl = true
  else
    buttonl = false
  end

  if love.keyboard.isDown("left") then
    left = true
  else
    left = false
  end

  if love.keyboard.isDown("right") then
    right = true
  else
    right = false
  end

  if love.keyboard.isDown("up") then
    up = true
  else
    up = false
  end

  if love.keyboard.isDown("down") then
    down = true
  else
    down = false
  end

  if love.keyboard.isDown("space") then
    button1 = true
  else
    button1 = false
  end

  if love.keyboard.isDown("r") then
    button2 = true
  else
    button2 = false
  end

  if love.keyboard.isDown("p") then
    button3 = true
  else
    button3 = false
  end

  if buttonu and (not buttonu_lock) and (not buttonu_press) then
    buttonu_press = true
    buttonu_lock = true
  elseif buttonu and buttonu_press and buttonu_lock then
    buttonu_press = false
  end
  if not buttonu then
    buttonu_press = false
    buttonu_lock = false
  end

  if buttonl and (not buttonl_lock) and (not buttonl_press) then
    buttonl_press = true
    buttonl_lock = true
  elseif buttonl and buttonl_press and buttonl_lock then
    buttonl_press = false
  end
  if not buttonl then
    buttonl_press = false
    buttonl_lock = false
  end

  if buttond and (not buttond_lock) and (not buttond_press) then
    buttond_press = true
    buttond_lock = true
  elseif buttond and buttond_press and buttond_lock then
    buttond_press = false
  end
  if not buttond then
    buttond_press = false
    buttond_lock = false
  end

  if buttonr and (not buttonr_lock) and (not buttonr_press) then
    buttonr_press = true
    buttonr_lock = true
  elseif buttonr and buttonr_press and buttonr_lock then
    buttonr_press = false
  end
  if not buttonr then
    buttonr_press = false
    buttonr_lock = false
  end

  if left and (not left_lock) and (not left_press) then
    left_press = true
    left_lock = true
  elseif left and left_press and left_lock then
    left_press = false
  end
  if not left then
    left_press = false
    left_lock = false
  end

  if right and (not right_lock) and (not right_press) then
    right_press = true
    right_lock = true
  elseif right and right_press and right_lock then
    right_press = false
  end
  if not right then
    right_press = false
    right_lock = false
  end

  if up and (not up_lock) and (not up_press) then
    up_press = true
    up_lock = true
  elseif up and up_press and up_lock then
    up_press = false
  end
  if not up then
    up_press = false
    up_lock = false
  end

  if down and (not down_lock) and (not down_press) then
    down_press = true
    down_lock = true
  elseif down and down_press and down_lock then
    down_press = false
  end
  if not down then
    down_press = false
    down_lock = false
  end

  if button1 and (not button1_lock) and (not button1_press) then
    button1_press = true
    button1_lock = true
  elseif button1 and button1_press and button1_lock then
    button1_press = false
  end
  if not button1 then
    button1_press = false
    button1_lock = false
  end

  if button2 and (not button2_lock) and (not button2_press) then
    button2_press = true
    button2_lock = true
  elseif button2 and button2_press and button2_lock then
    button2_press = false
  end
  if not button2 then
    button2_press = false
    button2_lock = false
  end

  if button3 and (not button3_lock) and (not button3_press) then
    button3_press = true
    button3_lock = true
  elseif button3 and button3_press and button3_lock then
    button3_press = false
  end
  if not button3 then
    button3_press = false
    button3_lock = false
  end
end

pitches = {
0.5,
1/(1+(10.66/12)),
1/(1+(9.7/12)),
1/(1+(8.3/12)),
1/(1+(7/12)),
1/(1+(6/12)),
1/(1+(5/12)),
1/(1+(4/12)),
1/(1+(3/12)),
1/(1+(2.4/12)),
1/(1+(1.7/12)),
1/(1+(0.8/12)),
1,
1+(0.66/12),
1+(1.3/12),
1+(2/12),
1+(3/12),
1+(4/12),
1+(5/12),
1+(6/12),
1+(7/12),
1+(8/12),
1+(9/12),
1+(10.66/12),
2
}

pitchesLetter = {
"C",
"C#",
"D",
"Eb",
"E",
"F",
"F#",
"G",
"Ab",
"A",
"Bb",
"B",
"C",
"C#",
"D",
"Eb",
"E",
"F",
"F#",
"G",
"Ab",
"A",
"Bb",
"B",
"C"
}

drums = {
"bell",
"clap",
"clave",
"hat",
"kick",
"rim",
"snare",
"tom"
}

function placeLogic()

  if love.mouse.isDown(1) and msgridx > 1 and msgridy > 1 and (msy < percToPix("y",.8)) then
    if tool == "note" then
    createNote(1, msgridx, msgridy, tool_pitch, tool_instrument)
    end
    if tool == "eraser" then
    grids[1][msgridx][msgridy] = {type = "none"}
    end
    if tool == "origin" then
    createOrigin(1, msgridx, msgridy)
    end
    if tool == "wire" then
    createWire(1, msgridx, msgridy)
    end
    if tool == "halt" then
    createHalt(1, msgridx, msgridy, 1)
    end
  end

  if msgridx > 1 and msgridy > 1 and (msy < percToPix("y",.8)) then
    if getType(msgridx, msgridy) == "note" then
      if buttonu_press then if getOutput(msgridx, msgridy, "up")=="in" then grids[1][msgridx][msgridy]["up"]="out" else grids[1][msgridx][msgridy]["up"]="in" end end
      if buttonr_press then if getOutput(msgridx, msgridy, "right")=="in" then grids[1][msgridx][msgridy]["right"]="out" else grids[1][msgridx][msgridy]["right"]="in" end end
      if buttonl_press then if getOutput(msgridx, msgridy, "left")=="in" then grids[1][msgridx][msgridy]["left"]="out" else grids[1][msgridx][msgridy]["left"]="in" end end
      if buttond_press then if getOutput(msgridx, msgridy, "down")=="in" then grids[1][msgridx][msgridy]["down"]="out" else grids[1][msgridx][msgridy]["down"]="in" end end
    end
    if getType(msgridx, msgridy) == "halt" then
      if buttonu_press then if getOutput(msgridx, msgridy, "up")=="in" then grids[1][msgridx][msgridy]["up"]="out" else grids[1][msgridx][msgridy]["up"]="in" end end
      if buttonr_press then if getOutput(msgridx, msgridy, "right")=="in" then grids[1][msgridx][msgridy]["right"]="out" else grids[1][msgridx][msgridy]["right"]="in" end end
      if buttonl_press then if getOutput(msgridx, msgridy, "left")=="in" then grids[1][msgridx][msgridy]["left"]="out" else grids[1][msgridx][msgridy]["left"]="in" end end
      if buttond_press then if getOutput(msgridx, msgridy, "down")=="in" then grids[1][msgridx][msgridy]["down"]="out" else grids[1][msgridx][msgridy]["down"]="in" end end
    end
  end

  if love.keyboard.isDown("o") then tool = "origin" end
  if love.keyboard.isDown("w") then tool = "wire" end
  if love.keyboard.isDown("h") then tool = "halt" end
  if love.keyboard.isDown("e") then tool = "eraser" end
  if love.keyboard.isDown("c") then tool = "cursor" end
end

function playLogic()
  if button1_press then
    if playing == false then playing = true else playing = false end
  end

  if playing == true then steptimer = steptimer + 1 end
  if steptimer >= framespeed then steptimer = 0 step() end
end
