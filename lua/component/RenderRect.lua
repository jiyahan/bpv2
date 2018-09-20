local RenderRect = Component:extends()

function RenderRect:onPopEvent(type)
    if type == pop.cameraDraw then
        local entity = self.entity
        local x, y, w, h = entity.x, entity.y, entity.w, entity.h
        love.graphics.rectangle("fill", x or 10, y or 10, w or 10, h or 10)
    end
end

return RenderRect