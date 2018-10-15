local Scene1 = Component:extends()

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
    return brick
end

function Scene1:onEnable()

    hero:show()
    enemy:show()
    slime:show()

    local bricks = {}
    for x = 1, 200 do
        for y = 1, 3 do
            table.insert(bricks, createBrick(x, y))
        end
    end

    for x = 2, 3 do
        for y = -5, 0 do
            table.insert(bricks, createBrick(x, y))
        end
    end
    self.bricks = bricks
end

function Scene1:onDisable()
    for k, v in ipairs(self.bricks) do
        v:hide()
    end
    hero:hide()
    enemy:hide()
    slime:hide()
end

return Scene1
