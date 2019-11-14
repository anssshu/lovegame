
local Button = function(x,y,w,h,text)
    local self = {
        r = 1,
        g=1,
        b=1,
        a=1,
        unclicked = true,
        x=x,
        y=y,
        w=w,
        h=h,
        text = text or ""
    }
    
    
    function self:draw()
        love.graphics.setColor(self.r,self.g,self.b,self.a)
        love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setColor(0,0,0,1)
        love.graphics.print(self.text,x+self.w*0.4,y+self.h/3)
        love.graphics.setColor(1,1,1,1)
    end
    function self:update(dt)
        local x = love.mouse.getX()/game.sx
        local y = love.mouse.getY()/game.sy
        --if the button cursor is inside the rectangle 
        if x>self.x  and x < self.x+self.w  and y > self.y and y < self.y+self.h then
            self.a = .5
            if love.mouse.isDown(1) and self.unclicked then
                self.unclicked = false
                self.a = .2
                self:onClick()
            end
           
            if love.mouse.isDown(1) ==false then
                self.unclicked = true
            end
        else
            self.a = 1
        end
    end
    function self:onClick()
        print("button clicked")
    
    end
    return self
end

return Button