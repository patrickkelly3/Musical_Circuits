
function newButton(x1, y1, x2, y2, type)
  button = {x1 = x1, y1 = y1, x2 = x2, y2 = y2, type = type, data = "0"}
  table.insert(buttons, button)
end

function newCircleButton(x, y, rad, instrument, pitch)
  button = {x = x, y = y, rad = rad, instrument = instrument, pitch = pitch}
  table.insert(circleButtons, button)
end

--GET PIXEL COORDS FROM A PERCENTAGE
function percToPix(axis, percent)
  if axis == "y" then
    return whei*percent
  else
    return wwid*percent
  end
end

function buttonAction(button, data)
  if button.type == "p1" then
      local sound = piano:clone()
      sound:setPitch(pitch[1]) -- Play E
      sound:play()

  elseif button.type == "wire" then
    if love.keyboard.isDown("b") then
      createWire(1, msgridx, msgridy)
    end
  elseif button.type == "origin" then
    if love.keyboard.isDown("b") then
      createOrigin(1, msgridx, msgridy)
    end
  end




end
