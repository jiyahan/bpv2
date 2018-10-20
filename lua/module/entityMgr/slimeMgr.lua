local slimeMgr = entityMgr:extends()

function slimeMgr:create()
    local entity = Entity:new()
    entity:addComponent(RenderRect)
    entity:addComponent(RecoverJumpForceByLand)
    entity:addComponent(Gravity)
    entity:addComponent(AccSystem)
    entity:addComponent(GameObject)
    entity:addComponent(PhysicsMove)
    entity:addComponent(entityAI)
    entity:addComponent(PopHitEvent)
    entity:addComponent(RenderHitting)
    entity:addComponent(HitBack)
    entity:addComponent(EnemyHp)
    entity:addComponent(HitDamage)
    entity:addComponent(DeadOnEvent)
    entity:setData({
        name = "entity",
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
    self:addEntity(entity)
    return entity
end

return slimeMgr