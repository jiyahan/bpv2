local Slime = Entity:extends()

function Slime:onInit()
    self:addComponent(RenderRect)
    self:addComponent(RecoverJumpForceByLand)
    self:addComponent(Gravity)
    self:addComponent(AccSystem)
    self:addComponent(GameObject)
    self:addComponent(PhysicsMove)
    self:addComponent(entityAI)
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
        x = 300,
        y = -10,
        w = 25,
        h = 25,
        maxVx = 150,
        friction = 50,
        layerMask = layerMask.enemy,
    })
end

return Slime

