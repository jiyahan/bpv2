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
enemy:addComponent(EnemyHp)
enemy:addComponent(HitDamage)
enemy:addComponent(DeadOnEvent)
enemy:setData({
    name = "enemy",
    hp = 4,
    maxHp = 4,
    x = 200,
    y = -10,
    w = 30,
    h = 30,
    maxVx = 50,
    layerMask = layerMask.enemy
})
return enemy