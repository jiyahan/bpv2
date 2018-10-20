local doorMgr = {}

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
    self.entityList = self.entityList or {}
    table.insert(self.entityList, entity)
    return entity
end

function doorMgr:clear()
    if self.entityList then
        for _, entity in ipairs(self.entityList) do
            entity:hide()
        end
        self.entityList = nil
    end
end

return doorMgr