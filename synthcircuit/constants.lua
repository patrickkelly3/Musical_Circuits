canvasx = 0
canvasy = 0
wwid, whei = love.graphics.getDimensions()
gss = 40
gridSpaceSize = wwid/gss

function util_constants()
  wwid, whei = love.graphics.getDimensions()
  msx, msy = love.mouse.getPosition()
  msgridx = 1+math.floor((msx-canvasx)/gridSpaceSize)
  msgridy = 1+math.floor((msy-canvasy)/gridSpaceSize)
end
