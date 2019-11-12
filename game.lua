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

function game:init()
	--set the current game state
	self.state = 3 

	--load all the scenes
	self.setting = require "src.scenes.setting_scene"
	self.loadlevel = require "src.scenes.level_loader_scene"
	self.menu = require "src.scenes.menu_scene"
	self.main_scene = require "src.scenes.main_scene"
	self.gameover = require "src.scenes.gameover_scene"

	--initialise all the scenes
	self.setting:init()
	self.loadlevel:init()
	self.menu:init()
	self.main_scene:init()
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
		self.main_scene:update(dt)
	-- update menu scene
	elseif self.state == 4 then
		self.gameover:update(dt)
	else
		self.menu:update(dt)
	end
end


--draw all the scene of the game as per the logic
function game:draw()
	--draw setting scene
	if self.state == 1 then
		self.setting:draw()

	-- draw level select scene
	elseif self.state == 2 then
		self.loadlevel:draw()

	-- draw main scene
	elseif self.state == 3 then
		self.main_scene:draw()

	elseif self.state == 4 then
		self.gameover:draw()
	else
	-- draw menu scene
		self.menu:draw()
	end

end

return game