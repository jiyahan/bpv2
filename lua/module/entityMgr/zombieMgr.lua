local zombieMgr = entityMgr:extends()

function zombieMgr:create()
    local entity = Entity:new()
    entity:addComponent(RenderRect)
    entity:addComponent(RecoverJumpForceByLand)
    entity:addComponent(Gravity)
    entity:addComponent(AccSystem)
    entity:addComponent(GameObject)
    entity:addComponent(PhysicsMove)
    entity:addComponent(ZombieAI)
    entity:addComponent(PopHitEvent)
    entity:addComponent(RenderHitting)
    entity:addComponent(HitBack)
    entity:addComponent(NearAttack)
    entity:addComponent(EnemyHp)
    entity:addComponent(HitDamage)
    entity:addComponent(DeadOnEvent)
    entity:setData({
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
    self:addEntity(entity)
    return entity
end

return zombieMgr