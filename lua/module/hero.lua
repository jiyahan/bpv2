local hero = Entity:new()

hero:addComponent(RenderRect)
hero:addComponent(GameObject)
hero:addComponent(WasdCmd)
hero:addComponent(PhysicsMove)
hero:addComponent(RecoverJumpForceByLand)
hero:addComponent(Gravity)
hero:addComponent(AccSystem)
hero:setData({ name = 'hero', x = 100, y = -50, w = 20, h = 20, layerMask = layerMask.player })
hero:show()

return hero