--[[
    code for the level 1 of the game
]]
local level = {}

-- create a physics world
wf = require 'libs.ext.windfield'
hc = require 'libs.ext.HC'
--draw a backgraound

--draw boundries
--this function is called inside the love.load function
function level:init()
    camera = require "src.objects.camera"

    --create a physics world
    world = wf.newWorld(0,0,true)
    world:setGravity(0,1024)
    world:addCollisionClass("Player")
    world:addCollisionClass("Platform")
    world:addCollisionClass("Others")

    hc_world = hc.new()
    --hc world circle
    circle = hc_world:circle(500,550,100)

    box = world:newRectangleCollider(400 - 50/2, 0, 50, 50)
    box:setRestitution(0.8)
    box:setCollisionClass("Others")

    player = require "src.objects.player"
    player:init()

    camera.target = player

    walls = require "src.objects.walls"
    walls:init()


end
--this is called inside the love.update function
function level:update(dt)
    camera:update(dt)
    world:update(dt)
    player:update(dt)
    
end

--this is called inside the love.draw function 
function level:draw()
    love.graphics.setBackgroundColor(0,0.5,0.5,1)
    
    camera:set()
    love.graphics.line(0,200,8000,550)
    -- all camera targets to be drawn here
    world:draw()
    player:draw()
    love.graphics.setColor(1,0,0,1)
    circle:draw()
    love.graphics.setColor(1,1,1,1)
    camera:unset()
end

return level