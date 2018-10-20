local heroMgr = {}

function heroMgr:create(x, y)
    if self.hero then
        self.hero:show()
        return self.hero
    end
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
    hero:addComponent(HeroHp)
    hero:addComponent(HitDamage)
    hero:addComponent(DeadOnEvent)
    hero:setData({
        name = 'hero',
        hp = 5,
        x = x,
        y = y,
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
    self.hero = hero
    return hero
end

function heroMgr:clear()
    if self.hero then
        self.hero:hide()
    end
end

return heroMgr