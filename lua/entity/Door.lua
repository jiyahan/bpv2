local Door = Entity:extends()

function Door:onInit()
    self:addComponent(GameObject)
    self:addComponent(RenderRect)
    self:addComponent(MapDoor)
    self:setData({
        name = "door",
        layerMask = layerMask.brick,
        mapPath = mapPath,
    })
end

return Door

