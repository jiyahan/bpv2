local hero = Entity:new()

hero:addComponent(RenderRect)
hero:addComponent(GameObject)
hero:addComponent(Axis1SimpMove)
hero:addComponent(Collider)
hero:setData({ name = 'hero', x = 50, y = 50, w = 20, h = 20, layerMask = layerMask.player })
hero:show()

return hero