--[[
    this is a rigid body player 
    other possibility is the kinematic player

    # 1 calculate  the collision normal 
	self.calculate_collision_normal(state)
	
	
	# 2  set the ray cast direction		
	$RayCast2D.set("cast_to",-100*self.n)      
	
		
	# 3 determine if the object is on the ground or not
	self.determine_object_on_ground()
	
	
	# 4 calculate player states
	self.calculate_state_transition()
	
	# 5 calculate final player movements
	self.calculate_player_movements(state)
	
	# 6 update state logic
	self.update_state_logic()
]]
local Entity = require "libs.core.entity"
local player = Entity()

function player:init()
    self.maxVel = 1000
    self.f = 100
    --rigid body collider
    self.collider = world:newCircleCollider(300,0,20)
    self.collider:setCollisionClass("Player")
    -- hc lib collider
    self.hc_collider = hc_world:rectangle(300,0,50,75)
    self.hc_collision = false

    self.collider:setRestitution(0.1)
    self.animation = {}
    self.state = "idle"
    self.onground = false
end
function love.keypressed(k)
    if k == "w" and player.onground then
        player.collider:applyLinearImpulse(0,-1000)
    end
end
function player:input()
    local x,y = self.collider:getLinearVelocity()
    --print(x,y)
    local n=(x*x+y*y)^.5
    if love.keyboard.isDown("a") then
       
        if n < self.maxVel then
            self.collider:applyLinearImpulse(-self.f,0)
        end
    
    elseif love.keyboard.isDown("d") then
        if n < self.maxVel then
            self.collider:applyLinearImpulse(self.f,0)
        end
    else
        
        if self.onground then
            self.collider:setLinearVelocity(0,y)
        end
    end
end
--ray cast call back
function callback(a,b,c,d,e,f)
    --print(a,b,c,d,e,f)
    if f < 0.7 then 
        player.onground = true
    else 
        player.onground = false
    end
    return 1
end
function player:hcColEnter()
    print("col enter")
end
function player:hcColExit()
    print("col exit")
end
function player:hcColStay()
end
function player:checkHCcoll()
    local c = hc_world:collisions(self.hc_collider) 
    local cnt = 0
    for _ in pairs(c) do
         cnt = cnt+1
    end
    if cnt == 1 then 
        self:hcColStay()
    end 
    if cnt == 1 and self.hc_collision == false then
        self.hc_collision = true 
        self:hcColEnter()
    end
    if cnt == 0 and self.hc_collision == true then
        self:hcColExit()
        self.hc_collision = false 
    end
    
        
end
function player:onEnterCollision(other,contact)
    --print(other:getBody(),contact:getNormal())
    --other:applyLinearImpulse(0,-3000)
    print("i hit the box ")
end
function player:update(dt)
    self.x = self.collider:getX()
    self.y = self.collider:getY()
    self.hc_collider:moveTo(self.x,self.y) 
    self:checkHCcoll()
    self:input()
    if self.collider:enter("Others") then
        local data = self.collider:getEnterCollisionData('Others')
        self:onEnterCollision(data.collider,data.contact)
    end
    --ray casting is done for determining the collision normal and obj is in ground or not 
    world:rayCast(self.x,self.y,self.x,self.y+35,callback)
end

function player:draw()
    love.graphics.line(self.x,self.y,self.x,self.y+35)
    love.graphics.setColor(1,0,0,1)
    self.hc_collider:draw()
    love.graphics.setColor(1,1,1,1)
end


return player              