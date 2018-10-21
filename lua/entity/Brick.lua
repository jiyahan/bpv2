local Brick = Entity:extends()

function Brick:onInit()
    self:addComponent(GameObject)
    self:addComponent(RenderRect)
    self:setData({
        name = 'brick',
        layerMask = layerMask.brick,
        w = cfg.worldCellSize,
        h = cfg.worldCellSize
    })
end

return Brick