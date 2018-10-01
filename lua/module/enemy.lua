local enemy = Entity:new()

enemy:addComponent(RenderRect)
enemy:addComponent(RecoverJumpForceByLand)
enemy:addComponent(Gravity)
enemy:addComponent(AccSystem)
enemy:addComponent(GameObject)
enemy:addComponent(PhysicsMove)
--enemy:addComponent(RandomCmd)
enemy:addComponent(FollowHeroCmd)
enemy:setData({ name = "enemy", x = 200, y = -10, w = 30, h = 30, maxVx = 100 })
--enemy:show()

return enemy