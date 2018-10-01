local scene = {}

local function createBrick(x, y)
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
end

for x = 1, 200 do
    for y = 1, 3 do
        createBrick(x, y)
    end
end

for x = 2, 3 do
    for y = -5, 0 do
        createBrick(x, y)
    end
end


return scene