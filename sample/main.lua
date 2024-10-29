local font = love.graphics.newFont(40)
function love.draw ()
   local w,h = love.window.getMode()
   local h2 = math.floor(h/2)
   love.graphics.setColor(1,1,1,1)
   love.graphics.setFont(font)
   love.graphics.printf("Hello Emscripten", 0, h2 - 40, w, "center")
end
