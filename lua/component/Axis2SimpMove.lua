local Axis2SimpMove = Component:extends()

function Axis2SimpMove:onEnable()
    self:reg(event.onUpdate, function(dt)
        local entity = self.entity
        entity.x = entity.x or 0
        entity.y = entity.y or 0
        entity.v = entity.v or 500
        local x, y = utils.getAxis2()
        entity.nextX, entity.nextY = entity.x + x * entity.v * dt, entity.y + y * entity.v * dt
    end)
end

return Axis2SimpMove