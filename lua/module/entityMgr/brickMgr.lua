local brickMgr = entityMgr:extends()

function brickMgr:create(x, y)
    local brick = Entity:new()
    brick:addComponent(GameObject)
    brick:addComponent(RenderRect)
    brick:setData({
        name = 'brick',
        layerMask = layerMask.brick,
        x = x,
        y = y,
        w = cfg.worldCellSize,
        h = cfg.worldCellSize
    })
    brick:show()
    self:addEntity(brick)
    return brick
end

return brickMgr