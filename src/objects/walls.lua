--- this is to be called only after creating a world

local walls = {} 

function walls:init()
    self.ground = world:newRectangleCollider(0, 550, 8000, 50)
    self.wall_left = world:newRectangleCollider(0, 0, 50, 600)
    self.wall_right = world:newRectangleCollider(7950, 0, 50, 600)
    
    self.ground:setType('static') -- Types can be 'static', 'dynamic' or 'kinematic'. Defaults to 'dynamic'
    self.wall_left:setType('static')
    self.wall_right:setType('static')
end
return walls