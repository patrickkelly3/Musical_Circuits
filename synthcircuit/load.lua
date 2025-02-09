roobert = love.graphics.newFont("roobert.otf", 50)
love.graphics.setFont(roobert)

roobert_med = love.graphics.newFont("roobert.otf", 40)
love.graphics.setFont(roobert_med)

roobert_small = love.graphics.newFont("roobert.otf", 20)
love.graphics.setFont(roobert_small)

piano = love.audio.newSource("sound/piano.wav", "static")

bell1 = love.audio.newSource("sound/drum/bell1.wav", "static")
clap = love.audio.newSource("sound/drum/clap.wav", "static")
clave = love.audio.newSource("sound/drum/clave.wav", "static")
hat = love.audio.newSource("sound/drum/hat.wav", "static")
kick = love.audio.newSource("sound/drum/kick.wav", "static")
rim = love.audio.newSource("sound/drum/rim.wav", "static")
snare = love.audio.newSource("sound/drum/snare.wav", "static")
tom = love.audio.newSource("sound/drum/tom.wav", "static")


--odudo = love.graphics.newFont("monospace.otf", 12)
--love.graphics.setFont(odudo)

cursor_circle = love.graphics.newImage("cursor_circle.png")

img_bell = love.graphics.newImage("img/bell.png")
img_clap = love.graphics.newImage("img/clap.png")
img_clave = love.graphics.newImage("img/clave.png")
img_hat = love.graphics.newImage("img/hat.png")
img_kick = love.graphics.newImage("img/kick.png")
img_rim = love.graphics.newImage("img/rim.png")
img_snare = love.graphics.newImage("img/snare.png")
img_tom = love.graphics.newImage("img/tom.png")

--LOAD FILES HERE WITH lf("path")
lf("constants.lua")
util_constants()

lf("button.lua")
lf("init.lua")

lf("input.lua")

lf("stepmanager.lua")


lf("rendercanvas.lua")
lf("renderui.lua")
lf("rendercursor.lua")
