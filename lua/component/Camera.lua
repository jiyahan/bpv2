local Camera = Component:extends()

function Camera:onEnable()
    local entity = self.entity
    self:reg(event.onDraw, function()
        local x, y, w, h = entity.x or 0, entity.y or 0, love.graphics.getWidth(), love.graphics.getHeight()
        local items, len = world:queryRect(x, y, w, h)
        love.graphics.push()
        love.graphics.translate(-x, -y)
        for i = 1, len do
            items[i]:popEvent("beforeCameraDraw")
            items[i]:popEvent("cameraDraw")
            items[i]:popEvent("afterCameraDraw")
        end
        love.graphics.pop()
    end)
end

return Camera