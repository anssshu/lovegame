local Button = require "src.objects.button"
local hud = {}
hud.b = Button(0,0,40,40)
function hud.b:onClick()
    game.state = 0
end
function hud:draw()
    self.b:draw()
end
function hud:update(dt)
    self.b:update(dt)
end

--[[
    this is simple a container of the current level scene
    current level of the main scene is 1
]]

--state 2
local scene = {}

function scene:loadLevel(level)
    self.currentLevel = level
    self.play = false
    self.level = {}
    -- load demo level ---this is reserved for experiments
    if level == 0 then
        self.level = require "src.levels.demo"
    end
    --load level 1
    if level ==1 then
        self.level = require "src.levels.level1"
    end
    self.level:init()
    self.play = true
end

function scene:init()
    self.play = true
    self.hud = hud 
    self:loadLevel(1)
    
end


 


---update the main game scene
function scene:update(dt)
    self.hud:update(dt)
    if self.play then
        self.level:update(dt)
    end
end

function scene:draw()
    love.graphics.setBackgroundColor(1,0,1,1)
    self.hud:draw()
    self.level:draw()
end

return scene