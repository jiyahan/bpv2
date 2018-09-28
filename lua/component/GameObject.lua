local GameObject = Component:extends()

function GameObject:onEnable()
    local entity = self.entity
    entity.x = entity.x or 0
    entity.y = entity.y or 0
    entity.w = entity.w or 10
    entity.h = entity.h or 10
    local filter = function(other)
        return layerMask.collideWith(entity.layerMask, other.layerMask)
    end
    local items, len = world:queryRect(entity.x, entity.y, entity.w, entity.h, filter)

    if len > 0 then
        self.oldLayerMask = entity.layerMask
        entity.layerMask = layerMask.trigger
    end
    world:add(entity, entity.x, entity.y, entity.w, entity.h)
    self:reg(event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
    self:reg(event.onLateUpdate, function(dt)
        self:onLateUpdate(dt)
    end)
end

function GameObject:onUpdate(dt)
    if not self.createSuccess then
        local filter = function(other)
            return layerMask.collideWith(self.oldLayerMask, other.layerMask)
        end
        local entity = self.entity
        local items, len = world:queryRect(entity.x, entity.y, entity.w, entity.h, filter)
        if len == 0 then
            debug:setData({ debuginfo = "set back" })
            self.entity.layerMask = self.oldLayerMask
            self.createSuccess = true
        end
    end
end

function GameObject:onLateUpdate(dt)
    local entity = self.entity
    utils.assertType('number', entity.x, entity.name .. ' x')
    utils.assertType('number', entity.x, entity.name .. ' x')
    local nx, ny = entity.nextX or entity.x, entity.nextY or entity.y
    local actualX, actualY, cols, len = world:move(self.entity, nx, ny, layerMask.filter)
    entity.x = actualX
    entity.y = actualY
    for i = 1, len do
        local col = cols[i]
        col.item:popEvent("onCollision", { col = col, other = col.other })
        col.other:popEvent("onCollision", { col = col, other = col.item })
    end
end

function GameObject:onDisable()
    if self.createSuccess then
        local entity = self.entity
        world:remove(entity)
    end
end

return GameObject