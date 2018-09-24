local Axis1SimpMove = Component:extends()

function Axis1SimpMove:onEnable()
    self:reg(event.onUpdate, function(dt)
        local entity = self.entity
        entity.x = entity.x or 0
        entity.y = entity.y or 0
        entity.v = entity.v or 100
        local x, y = utils.getAxis1()
        entity.nextX, entity.nextY = entity.x + x * entity.v * dt, entity.y + y * entity.v * dt
    end)
end

return Axis1SimpMove