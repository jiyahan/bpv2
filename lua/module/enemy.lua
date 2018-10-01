local enemy = Entity:new()

enemy:addComponent(RenderRect)
enemy:addComponent(RecoverJumpForceByLand)
enemy:addComponent(Gravity)
enemy:addComponent(AccSystem)
enemy:addComponent(GameObject)
enemy:addComponent(PhysicsMove)
enemy:addComponent(WasdCmd)
enemy:setData({ name = "enemy", x = 50, y = -10, w = 50, h = 50 })
enemy:show()

return enemy