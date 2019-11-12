game = require "game"

---------------------------------------------------

---final game is loaded updated and drawn here

function love.load()
	game:init()
end


function love.update(dt)
	game:update(dt)	
end


function love.draw()
	game:draw()
end



