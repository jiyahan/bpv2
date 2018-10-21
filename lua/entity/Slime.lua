local Slime = Entity:extends()

function Slime:onInit()
    self:addComponent(RenderRect)
    self:addComponent(RecoverJumpForceByLand)
    self:addComponent(Gravity)
    self:addComponent(AccSystem)
    self:addComponent(GameObject)
    self:addComponent(PhysicsMove)
    self:addComponent(SlimeAI)
    self:addComponent(PopHitEvent)
    self:addComponent(RenderHitting)
    self:addComponent(HitBack)
    self:addComponent(EnemyHp)
    self:addComponent(HitDamage)
    self:addComponent(DeadOnEvent)
    self:setData({
        name = "slime",
        hp = 10,
        maxHp = 10,
        w = 25,
        h = 25,
        maxVx = 150,
        friction = 50,
        color = { 1, 0.5, 0.5, 1 },
        layerMask = layerMask.slime,
    })
end

return Slime

