local enemy = Entity:new()

enemy:addComponent(RenderRect)
enemy:addComponent(RecoverJumpForceByLand)
enemy:addComponent(Gravity)
enemy:addComponent(AccSystem)
enemy:addComponent(GameObject)
enemy:addComponent(PhysicsMove)
enemy:addComponent(ZombieAI)
enemy:addComponent(PopHitEvent)
enemy:addComponent(RenderHitting)
enemy:addComponent(HitBack)
enemy:addComponent(NearAttack)
enemy:setData({
    name = "enemy",
    x = 200,
    y = -10,
    w = 30,
    h = 30,
    maxVx = 50,
    layerMask = layerMask.enemy
})
enemy:show()
return enemy