local RenderAnim = Component:extends()
local imgPath = "img/idle.png"
local fps = 10
function RenderAnim:onEnable()
    self:scheduleTimerAtFixedRate("anim", 0, 1 / fps, function()
        self.index = self.index or 1
        self.index = self.index + 1
        if self.index > 6 then
            self.index = 1
        end
    end)
end

function RenderAnim:onPopEvent(type)
    if type == "cameraDraw" then
        local entity = self.entity
        if self.img == nil then
            self.img = love.graphics.newImage(imgPath)
            self.quads = {}
            for i = 0, 5 do
                local x = i * 12
                local y = 0
                local quad = love.graphics.newQuad(x, y, 11, 25, self.img:getDimensions())
                table.insert(self.quads, quad)
            end
        end
        local x, y = entity.x, entity.y
        local index = self.index or 1
        love.graphics.draw(self.img, self.quads[index], x, y, 0, 2, 2)
    end
end

return RenderAnim
