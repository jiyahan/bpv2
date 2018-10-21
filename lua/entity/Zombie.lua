local Zombie = Entity:extends()

function Zombie:onInit()
    self:addComponent(RenderRect)
    self:addComponent(RecoverJumpForceByLand)
    self:addComponent(Gravity)
    self:addComponent(AccSystem)
    self:addComponent(GameObject)
    self:addComponent(PhysicsMove)
    self:addComponent(ZombieAI)
    self:addComponent(PopHitEvent)
    self:addComponent(RenderHitting)
    self:addComponent(HitBack)
    self:addComponent(NearAttack)
    self:addComponent(EnemyHp)
    self:addComponent(HitDamage)
    self:addComponent(DeadOnEvent)
    self:setData({
        name = "zombie",
        hp = 4,
        maxHp = 4,
        w = 30,
        h = 30,
        maxVx = 50,
        layerMask = layerMask.enemy
    })
end

return Zombie