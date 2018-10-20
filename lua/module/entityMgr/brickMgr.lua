local brickMgr = {}

function brickMgr:create(x, y)
    local brick = Entity:new()
    brick:addComponent(GameObject)
    brick:addComponent(RenderRect)
    brick:setData({
        name = 'brick',
        layerMask = layerMask.brick,
        x = x * cfg.worldCellSize,
        y = y * cfg.worldCellSize,
        w = cfg.worldCellSize,
        h = cfg.worldCellSize
    })
    brick:show()
    self.entityList = self.entityList or {}
    table.insert(self.entityList, brick)
    return brick
end

function brickMgr:clear()
    if self.entityList then
        for _, entity in ipairs(self.entityList) do
            entity:hide()
        end
        self.entityList = nil
    end
end

return brickMgr