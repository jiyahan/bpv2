local CreateEntities = Component:extends()
-- entity raw data list -> entity list
function CreateEntities:onEnable()
    local entity = self.entity
    entity.entityList = {}
    local entityRawList = entity.entityRawList or {}
    for _, rawEntity in pairs(entityRawList) do
        local childEntity = Entity:new()
        local archetype = rawEntity.archetype or {}
        local data = rawEntity.data or {}
        childEntity:addComponents(archetype)
        childEntity:setData(data)
        childEntity:show()
        table.insert(entity.entityList, childEntity)
    end
end

function CreateEntities:onDisable()
    local entity = self.entity
    for k, childEntity in ipairs(entity.entityList) do
        childEntity:hide()
    end
    entity.entityList = nil
end

return CreateEntities