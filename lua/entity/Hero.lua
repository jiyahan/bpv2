local Hero = Entity:extends()

function Hero:onInit()
    self:addComponent(RenderRect)
    self:addComponent(GameObject)
    self:addComponent(PlayerCmd)
    self:addComponent(PhysicsMove)
    self:addComponent(RecoverJumpForceByLand)
    self:addComponent(Gravity)
    self:addComponent(AccSystem)
    self:addComponent(PopHitEvent)
    self:addComponent(RenderHitting)
    self:addComponent(HitBack)
    self:addComponent(NearAttack)
    self:addComponent(HitDamage)
    self:addComponent(DeadOnEvent)
    self:setData({
        name = 'hero',
        hp = 5,
        w = 20,
        h = 20,
        maxVx = 100,
        friction = 15,
        layerMask = layerMask.player,
        maxJumpTime = 3,
        bulletColor = { 0, 0.5, 0.6, 1 },
        bulletLayer = layerMask.playerBullet,
    })
end

return Hero