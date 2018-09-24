local scene = {}

for x = 1, 10 do
    for y = 1, 10 do
        local brick = Entity:new()
        brick:addComponent(GameObject)
        brick:addComponent(RenderRect)
        brick:setData({ name = 'brick', layerMask = layerMask.brick,
            x = x * cfg.worldCellSize, y = y * cfg.worldCellSize,
            w = cfg.worldCellSize, h = cfg.worldCellSize })
        brick:show()
    end
end

return scene