local scene = {}

function scene.create()
    for x = 1, 100 do
        for y = 1, 100 do
            local brick = Entity:new()
            brick:addComponent(GameObject)
            brick:addComponent(RenderRect)
            brick:setData({ x = x * cfg.worldCellSize, y = y * cfg.worldCellSize, w = cfg.worldCellSize, h = cfg.worldCellSize })
            brick:setActive(true)
        end
    end
end

return scene