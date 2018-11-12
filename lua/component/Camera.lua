local Camera = Component:extends()

function Camera:onEnable()
    local entity = self.entity
    self.px, self.py = love.graphics.getWidth(), love.graphics.getHeight()
    self:reg(event.onDraw, function()
        local x, y, w, h = entity.x or 0, entity.y or 0, entity.w, entity.h
        local pw, ph = self.px, self.py
        local scale = math.min(pw / w, ph / h)
        local items, len = world:queryRect(x, y, w, h)
        love.graphics.push()
        love.graphics.scale(scale, scale)
        love.graphics.translate(-(x + w / 2 - pw / 2 / scale), -(y + h / 2 - ph / 2 / scale))
        love.graphics.rectangle("line", x, y, w, h)
        for i = 1, len do
            items[i]:popEvent("beforeCameraDraw")
            items[i]:popEvent("cameraDraw")
            items[i]:popEvent("cameraDrawUI")
            items[i]:popEvent("afterCameraDraw")
        end
        love.graphics.pop()
    end)
    self:reg(event.resize, function()
        self.px, self.py = love.graphics.getWidth(), love.graphics.getHeight()
    end)
end

return Camera