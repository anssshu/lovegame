
local entity =function ()
    local self = {}

    function self:init()
        self.name = ''
        self.x=0.0
        self.y=0.0
        self.rot = 0.0
        self.scale = 1.0
        self.sx=1--sacle x
        self.sy=1--scale y
        self.ax=0.5--x anchor
        self.ay=0.5--y anchor
        self.ox=0.0
        self.oy=0.0
        
    end

    function self:update(dt)

    end

    function self:draw()

    end
    

    function self:kill()
        self = nill
    end


    self:init()
    
    return self
end


return entity
