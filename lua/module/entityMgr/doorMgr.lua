local doorMgr = entityMgr:extends()

function doorMgr:create(x, y)
    local entity = Entity:new()
    entity:addComponent(GameObject)
    entity:addComponent(RenderRect)
    entity:addComponent(MapDoor)
    entity:setData({
        name = "door",
        layerMask = layerMask.brick,
        x = x,
        y = y
    })
    entity:show()
    self:addEntity(entity)
    return entity
end

return doorMgr