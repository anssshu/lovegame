--[[
	the game object is a state machine and it moves between various states
	state 
	0 -- menu scene
	1 -- setting scene
	2 -- load level 
	3 -- play current level
	4 -- gameover scene

]]
---create a game object
local game = {}
--game is a state machine with four states --- menu 0,level 3,setting 1,levelselect 2

-- game resolution 
game.settings ={
	--my current desktop has a resolution of 1920/1080:16/9
	x_res  =  1200,
	y_res  =   675,
}

local W  =  love.graphics.getWidth()
local H = love.graphics.getHeight()

game.sx= W/game.settings.x_res
game.sy = H/game.settings.y_res
--local x,y = love.window.getDesktopDimensions()
--print(W,H,x,y)
function game:init()
	--set the current game state
	self.state = 0

	--load all the scenes
	self.setting = require "src.scenes.setting_scene"
	self.loadlevel = require "src.scenes.level_loader_scene"
	self.menu = require "src.scenes.menu_scene"
	self.game_scene = require "src.scenes.game_scene"
	self.gameover = require "src.scenes.gameover_scene"

	--initialise all the scenes
	self.setting:init()
	self.loadlevel:init()
	self.menu:init()
	self.game_scene:init()
	self.gameover:init()

end





--update all the scenes of the game as per the logic
function game:update(dt)

	--update setting scene
	if self.state == 1 then
		self.setting:update(dt)
	-- update level select scene
	elseif self.state == 2 then
		self.loadlevel:update(dt)
	-- update main scene
	elseif self.state == 3 then
		self.game_scene:update(dt)
	-- update menu scene
	elseif self.state == 4 then
		self.gameover:update(dt)
	else
		self.menu:update(dt)
	end
end


--draw all the scene of the game as per the logic
function game:draw()

	---draw as per resolution
	love.graphics.push()
	love.graphics.scale(self.sx,self.sy)
	--draw setting scene
	if self.state == 1 then
		self.setting:draw()

	-- draw level select scene
	elseif self.state == 2 then
		self.loadlevel:draw()

	-- draw main scene
	elseif self.state == 3 then
		self.game_scene:draw()

	elseif self.state == 4 then
		self.gameover:draw()
	else
	-- draw menu scene
		self.menu:draw()
	end
	love.graphics.pop()
end

return game