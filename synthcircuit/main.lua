love.window.setMode(736*2, 576*1.5, {resizable=true, minwidth=214, minheight=463, highdpi=true, usedpiscale=true})
--love.graphics.setDefaultFilter("linear", "linear")
love.graphics.setDefaultFilter("nearest", "nearest")
moonshine = require 'moonshine'
effect = moonshine(moonshine.effects.vignette)
effect.vignette.opacity = .05

lastwwid = 0
lastwhei = 0

function love.load()
  lf("load.lua")
  --love.window.setFullscreen(true,"desktop")
end

function love.update()
  if love.keyboard.isDown("/") then love.load() end
  util_constants()
  system_input()
  if button2 then reset() end
  if button3_press then step() end

  if up then canvasy = canvasy + 1 end
  if down then canvasy = canvasy - 1 end
  if left then canvasx = canvasx + 1 end
  if right then canvasx = canvasx - 1 end

  placeLogic()

  playLogic()
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then -- Left mouse button
        for _, btn in ipairs(circleButtons) do
            if mouseOverButton(btn) then
                circleButtonAction(btn)
            end
        end
    end
end


function mouseOverButton(button)
    local mouseX, mouseY = love.mouse.getPosition()
    local dx = mouseX - button.x
    local dy = mouseY - button.y
    local distance = math.sqrt(dx * dx + dy * dy)

    return distance <= button.rad
end

function circleButtonAction(button)
  if button.instrument == "piano" then
      tool = "note"
      tool_pitch = button.pitch
      tool_instrument = "piano"
      local sound = piano:clone()
      sound:setPitch(pitches[button.pitch])
      sound:play()
  elseif button.instrument == "eraser" then
    tool = "eraser"
  elseif button.instrument == "origin" then
    tool = "origin"
  elseif button.instrument == "halt" then
    tool = "halt"
  elseif button.instrument == "wire" then
    tool = "wire"
  elseif button.instrument == "cursor" then
    tool = "cursor"
  elseif button.instrument == "bell" then
      tool = "note"
      tool_pitch = 1
      tool_instrument = "bell"
      local sound = bell1:clone()
      sound:setPitch(1) -- Play E
      sound:play()
  elseif button.instrument == "clap" then
  tool = "note"
  tool_pitch = 1
  tool_instrument = "clap"
      local sound = clap:clone()
      sound:setPitch(1) -- Play E
      sound:play()
  elseif button.instrument == "clave" then
  tool = "note"
  tool_pitch = 1
  tool_instrument = "clave"
      local sound = clave:clone()
      sound:setPitch(1) -- Play E
      sound:play()
  elseif button.instrument == "hat" then
  tool = "note"
  tool_pitch = 1
  tool_instrument = "hat"
      local sound = hat:clone()
      sound:setPitch(1) -- Play E
      sound:play()
  elseif button.instrument == "kick" then
  tool = "note"
  tool_pitch = 1
  tool_instrument = "kick"
      local sound = kick:clone()
      sound:setPitch(1) -- Play E
      sound:play()
  elseif button.instrument == "rim" then
  tool = "note"
  tool_pitch = 1
  tool_instrument = "rim"
    local sound = rim:clone()
    sound:setPitch(1) -- Play E
    sound:play()
  elseif button.instrument == "snare" then
  tool = "note"
  tool_pitch = 1
  tool_instrument = "snare"
      local sound = snare:clone()
      sound:setPitch(1) -- Play E
      sound:play()
  elseif button.instrument == "tom" then
  tool = "note"
  tool_pitch = 1
  tool_instrument = "tom"
      local sound = tom:clone()
      sound:setPitch(1) -- Play E
      sound:play()

  end

end


function love.draw()
  effect(function()
  renderCanvas()
  end)
  renderUi()
  renderCursor()
  if lastwhei ~= whei or lastwwid ~= wwid then effect.resize(wwid, whei) end
  lastwhei = whei
  lastwwid = wwid
end


--LOADS FILE FROM PATH
function lf(path)
  local func = love.filesystem.load(path)
  func()
end
