local GameObject = Component:extends()

function GameObject:onEnable()
    local entity = self.entity
    entity.x = entity.x or 0
    entity.y = entity.y or 0
    entity.w = entity.w or 10
    entity.h = entity.h or 10
    world:add(entity, entity.x, entity.y, entity.w, entity.h)
end

function GameObject:onDisable()
    local entity = self.entity
    mod.bump.world:remove(entity)
end

return GameObject