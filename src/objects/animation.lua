
local anim8 = require "libs.ext.anim8.anim8"
local Entity = require "libs.core.entity"
local animation = {}

function animation:create()
    local self = Entity()
    function self:init()
        self.ay = 0.8
        self.name = "animation"
        self.image = assets.baby
        self.frameWidth = 160
        self.frameHeight = 200
        local g = anim8.newGrid(160, 200, self.image:getWidth(), self.image:getHeight())
        self.animations = {}
        self.animations["idle"] = anim8.newAnimation(g('1-9',1), 0.1)
        self.animations["jump"] = anim8.newAnimation(g('1-9',2), 0.1)
        self.animations["run"] = anim8.newAnimation(g('1-9',3), 0.05)
        
        self.animation = self.animations["idle"]


    end
    function self:play(anim)
        self.animation = self.animations[anim]
    end
    function self:update(dt)
        self.animation:update(dt)
    end
    function self:draw()
       --self.animation:draw(self.image, self.x, self.y)
        self.animation:draw(self.image,self.x+self.ox,self.y+self.oy,self.rot,self.sx*self.scale,self.sy*self.scale,self.ax*self.frameWidth,self.ay*self.frameHeight)
    end
    self:init()
    return self
end

return animation 
