local RenderRect = Component:extends()
local defaultColor = { 1, 1, 1, 1 }
function RenderRect:onPopEvent(type)
    if type == "cameraDraw" then
        local entity = self.entity
        local x, y, w, h = entity.x, entity.y, entity.w, entity.h
        local oldColor = utils.getColor()
        utils.setColor(entity.color or defaultColor)
        love.graphics.rectangle("line", x or 10, y or 10, w or 10, h or 10)
        utils.setColor(oldColor)
    end
end

return RenderRect