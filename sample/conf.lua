love.conf = function(t)
   t.gammacorrect = false
   t.title, t.identity = "sample", "sample"
   t.modules.joystick = false
   t.modules.physics = false
   t.window.width = 1280-- 720 * 21 / 9 -- 1280 -- 1920
   t.window.height = 720 -- 720 -- 1080
   t.window.vsync = true
   t.window.resizable = false
   t.window.fullscreen = false
   t.version = "11.5"
end
