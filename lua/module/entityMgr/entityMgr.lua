local entityMgr=Object:extends()

function entityMgr:addEntity(entity)
    self.entityList = self.entityList or {}
    table.insert(self.entityList, entity)
end

function entityMgr:clear()
    if self.entityList then
        for _, entity in ipairs(self.entityList) do
            entity:hide()
        end
        self.entityList = nil
    end
end

return entityMgr