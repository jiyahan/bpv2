local enemy = Entity:new()

enemy:addComponent(RenderRect)
enemy:addComponent(RecoverJumpForceByLand)
enemy:addComponent(Gravity)
enemy:addComponent(AccSystem)
enemy:addComponent(GameObject)
enemy:addComponent(PhysicsMove)
enemy:addComponent(WasdCmd)
enemy:setData({ name = "enemy", x = 100, y = -10, w = 30, h = 30 })
enemy:show()

return enemy