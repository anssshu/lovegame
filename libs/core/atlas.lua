local Entity = require "libs.core.entity"

local atlas = function(image,q)
    local self = Entity()
    self.image = image
    self.q = q
    self.quad = love.graphics.newQuad( self.q.x, self.q.y, self.q.width, self.q.height, self.image:getDimensions() )
    self.x =200
    function self:update(dt)
       
    end

    function self:draw()
        --love.graphics.draw(self.image,self.quad,0,0)
       love.graphics.draw(self.image,self.quad,self.x+self.ox,self.y+self.oy,self.rot,self.sx*self.scale,self.sy*self.scale,self.ax*self.q.width,self.ay*self.q.height)
        
    end

    return self
end

return atlas