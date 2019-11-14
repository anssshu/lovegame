--[[
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
    self.collider = world:newCircleCollider(300,0,20)
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
function player:update(dt)
    self.x = self.collider:getX()
    self.y = self.collider:getY()
    self:input()
    world:rayCast(self.x,self.y,self.x,self.y+35,callback)
end

function player:draw()
    love.graphics.line(self.x,self.y,self.x,self.y+35)
end


return player              