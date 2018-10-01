local Gravity = Component:extends()

function Gravity:onEnable()
    self:reg(event.onPhysicsUpdate, function(dt)
        self:onPhysicsUpdate(dt)
    end)
end

function Gravity:onPhysicsUpdate(dt)
    local entity = self.entity
    entity.ayMap = entity.ayMap or {}
    entity.ayMap.gravityY = cfg.gravity
end

function Gravity:onDisable()
    self.entity.ayMap.gravityY = nil
end

return Gravity