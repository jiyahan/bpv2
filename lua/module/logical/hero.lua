local hero = Entity:new()

hero:addComponent(RenderRect)
hero:addComponent(GameObject)
hero:addComponent(PlayerCmd)
hero:addComponent(PhysicsMove)
hero:addComponent(RecoverJumpForceByLand)
hero:addComponent(Gravity)
hero:addComponent(AccSystem)
hero:addComponent(PopHitEvent)
hero:addComponent(RenderHitting)
hero:addComponent(HitBack)
hero:addComponent(NearAttack)
hero:setData({
    name = 'hero',
    x = 150,
    y = -50,
    w = 20,
    h = 20,
    maxVx = 100,
    friction = 15,
    layerMask = layerMask.player,
    maxJumpTime = 3,
    bulletColor = { 0, 0.5, 0.6, 1 },
    bulletLayer = layerMask.playerBullet,
})
hero:show()

return hero