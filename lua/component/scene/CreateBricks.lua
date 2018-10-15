local CreateBricks = Component:extends()

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

function CreateBricks:onEnable()

    hero:show()
    enemy:show()
    slime:show()

    self.bricks = {}
    local mapdata = self.entity.mapdata
    for _, item in ipairs(mapdata) do
        for x = item[1], item[2] do
            for y = item[3], item[4] do
                table.insert(self.bricks, createBrick(x, y))
            end
        end
    end

end

function CreateBricks:onDisable()
    for k, v in ipairs(self.bricks) do
        v:hide()
    end
    hero:hide()
    enemy:hide()
    slime:hide()
end

return CreateBricks
