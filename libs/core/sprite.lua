local Entity = require "libs.core.entity"

local sprite = function(image)
    local self = Entity()
    self.image = image

    function self:update(dt)
       
    end

    function self:draw()
        love.graphics.draw(self.image,self.x+self.ox,self.y+self.oy,self.rot,self.sx*self.scale,self.sy*self.scale,self.ax*self.image:getWidth(),self.ay*self.image:getHeight())
        
    end

    return self
end

return sprite