local camera = {}
camera.x = 0
camera.y = 0
camera.xoffset = 0
camera.yoffset = 0
camera.scaleX = 1
camera.scaleY = 1
camera.rotation = 0
camera.active = true
camera.w = camera.scaleX*game.settings.x_res/2
camera.h = camera.scaleY*game.settings.y_res/2

camera.target = {x=camera.w,y=camera.h}
function camera:update(dt)

end

function camera:draw()

end
function camera:set()
  love.graphics.push()
  love.graphics.rotate(-self.rotation)
  love.graphics.scale(1 / self.scaleX, 1 / self.scaleY)
  love.graphics.translate(-self.x, -self.y)
end

function camera:unset()
  love.graphics.pop()
end

function camera:move(dx, dy)
  self.x = self.x + (dx or 0)
  self.y = self.y + (dy or 0)
end

function camera:rotate(dr)
  self.rotation = self.rotation + dr
end

function camera:scale(sx, sy)
  sx = sx or 1
  self.scaleX = self.scaleX * sx
  self.scaleY = self.scaleY * (sy or sx)
end

function camera:setPosition(x, y)
  self.x = x or self.x
  self.y = y or self.y
end

function camera:setScale(sx, sy)
  self.scaleX = sx or self.scaleX
  self.scaleY = sy or self.scaleY
end

function camera:update(dt)
    local x=(self.target.x -self.x)*0.01 +self.target.x
    --self:setPosition(0,0)
    self:setPosition(x-self.w+self.xoffset,self.target.y-self.h+self.yoffset)
    
end





return camera