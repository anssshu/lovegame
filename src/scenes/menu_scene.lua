local Button = require "src.objects.button"





local menu = {}

function menu:init()
    self.W = game.settings.x_res
    self.H = game.settings.y_res

    self.w = 200
    self.h = 40

    self.x = self.W/2 -self.w/2
    self.y = self.H/2 -self.h/2
    self.play = Button(self.x,self.y-120,self.w,self.h,"PLAY")
    function self.play:onClick()
        --restart the game and change the game state
        game:init()
        game.state = 3
    end

    self.load = Button(self.x,self.y-60.1,self.w,self.h,"LOAD")
    function self.load:onClick()
        game.state = 2
    end

    self.settings = Button(self.x,self.y,self.w,self.h,"SETTINGS")
    function self.settings:onClick()
        game.state = 1
    end

    self.exit = Button(self.x,self.y+60,self.w,self.h,"EXIT")

    function self.exit:onClick()
        love.event.quit()
    end


end
--state 0
function menu:update(dt)
    self.play:update(dt)
    self.load:update(dt)
    self.exit:update(dt)
    self.settings:update(dt)
end

function menu:draw()
    love.graphics.setBackgroundColor(0,0,0,0)
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("line",self.x-10,self.y-120-10,220,240)
    love.graphics.rectangle("line",10,10,self.W-20,self.H-20)
    self.play:draw()
    self.load:draw()
    self.exit:draw()
    self.settings:draw()
end

return menu




