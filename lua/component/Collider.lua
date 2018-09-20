local collider = Component:extends()


function collider:onEnable()
    self:reg(event.onLateUpdate, function(dt)
        self:onLateUpdate(dt)
    end)
end

function collider:onLateUpdate(dt)
    local entity = self.entity
    local nx, ny = entity.nextX, entity.nextY
    local actualX, actualY, cols, len = world:move(self.entity, nx, ny)
    entity.x = actualX
    entity.y = actualY
end


return collider