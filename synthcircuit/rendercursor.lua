cursorsize = 20
customcursor = true

function renderCursor()
  if customcursor then
    love.mouse.setVisible(false)
    if tool == "cursor" then
    love.graphics.setLineWidth(2)
    love.graphics.setColor(0.12, 0.12, 0.12)
    love.graphics.polygon("fill", msx, msy+cursorsize, msx, msy, msx+cursorsize/1.5, msy+cursorsize*.78)
    love.graphics.setColor(1,1,1)
    love.graphics.line(msx, msy+cursorsize, msx, msy, msx+cursorsize/1.5, msy+cursorsize*.78)
    if msgridx > 1 and msgridy > 1 then cursorMenu() end
    else
    love.graphics.setColor(1,1,1)
    love.graphics.circle("line", msx, msy, 12)
    love.graphics.circle("fill", msx, msy, 2)
    end
  else
  love.mouse.setVisible(true)
  end
end

function cursorMenu()
  if getType(msgridx, msgridy) == "note" then
    love.graphics.setColor(0.12, 0.12, 0.12)
    love.graphics.rectangle("fill", msx+20, msy+40, percToPix("y", 0.17), percToPix("y", 0.17))
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line", msx+20, msy+40, percToPix("y", 0.17), percToPix("y", 0.17))

    if grids[1][msgridx][msgridy]["instrument"] == "piano" then love.graphics.setColor(250/255, 110/255, 130/255) else love.graphics.setColor(130/255, 200/255, 90/255) end
    love.graphics.circle("fill", (msx+20)+(percToPix("y", 0.17)/2), (msy+40)+(percToPix("y", 0.17)/2), percToPix("y", 0.04))
    love.graphics.setColor(1,1,1)
    love.graphics.circle("line", (msx+20)+(percToPix("y", 0.17)/2), (msy+40)+(percToPix("y", 0.17)/2), percToPix("y", 0.04))
    love.graphics.setFont(roobert_med)
    love.graphics.printf(grids[1][msgridx][msgridy]["up"], (msx+20), (msy+40)+(percToPix("y", 0.035)/2)-20, (percToPix("y", 0.17)), "center")
    love.graphics.printf(grids[1][msgridx][msgridy]["down"], (msx+20), (msy+40)+(percToPix("y", 0.28)/2)-20, (percToPix("y", 0.17)), "center")
    love.graphics.printf(grids[1][msgridx][msgridy]["left"], (msx+20)-20+(percToPix("y", 0.03)/2), (msy+40)+(percToPix("y", 0.17)/2), (percToPix("y", 0.17)), "center", -math.pi/2, 1, 1, (percToPix("y", 0.17))/2)
    love.graphics.printf(grids[1][msgridx][msgridy]["right"], (msx+20)+20+(percToPix("y", 0.31)/2), (msy+40)+(percToPix("y", 0.17)/2), (percToPix("y", 0.17)), "center", math.pi/2, 1, 1, (percToPix("y", 0.17))/2)

  end
  if getType(msgridx, msgridy) == "halt" then
    love.graphics.setColor(0.12, 0.12, 0.12)
    love.graphics.rectangle("fill", msx+20, msy+40, percToPix("y", 0.17), percToPix("y", 0.17))
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line", msx+20, msy+40, percToPix("y", 0.17), percToPix("y", 0.17))

    love.graphics.setColor(75/255,160/255,250/255)
    love.graphics.circle("fill", (msx+20)+(percToPix("y", 0.17)/2), (msy+40)+(percToPix("y", 0.17)/2), percToPix("y", 0.04))
    love.graphics.setColor(1,1,1)
    love.graphics.circle("line", (msx+20)+(percToPix("y", 0.17)/2), (msy+40)+(percToPix("y", 0.17)/2), percToPix("y", 0.04))
    love.graphics.setFont(roobert_med)
    love.graphics.printf(grids[1][msgridx][msgridy]["up"], (msx+20), (msy+40)+(percToPix("y", 0.035)/2)-20, (percToPix("y", 0.17)), "center")
    love.graphics.printf(grids[1][msgridx][msgridy]["down"], (msx+20), (msy+40)+(percToPix("y", 0.28)/2)-20, (percToPix("y", 0.17)), "center")
    love.graphics.printf(grids[1][msgridx][msgridy]["left"], (msx+20)-20+(percToPix("y", 0.03)/2), (msy+40)+(percToPix("y", 0.17)/2), (percToPix("y", 0.17)), "center", -math.pi/2, 1, 1, (percToPix("y", 0.17))/2)
    love.graphics.printf(grids[1][msgridx][msgridy]["right"], (msx+20)+20+(percToPix("y", 0.31)/2), (msy+40)+(percToPix("y", 0.17)/2), (percToPix("y", 0.17)), "center", math.pi/2, 1, 1, (percToPix("y", 0.17))/2)

  end
end
