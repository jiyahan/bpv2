local SyncPosition = Component:extends()

function SyncPosition:onEnable()
    self:reg(event.onLateUpdate, function(dt)
        self:onLateUpdate(dt)
    end)
end

function SyncPosition:onLateUpdate(dt)
    local entity = self.entity
    local nextX, nextY = entity.nextX or 0, entity.nextY or 0
    entity.x = nextX
    entity.y = nextY
end

return SyncPosition