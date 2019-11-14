local Button = require "src.objects.button"
--state 2
local scene = {}

function scene:init()
    self.home = Button(0,0,40,40)
    function self.home:onClick()
        game.state = 0
    end
end
 

function scene:update(dt)
    self.home:update(dt)
end

function scene:draw()
    love.graphics.setBackgroundColor(0,1,0,1)
    self.home:draw()
end

return scene