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
    --self:addComponent(NearAttack)
    self:addComponent(BulletAttack)
    self:addComponent(HitDamage)
    self:addComponent(DeadOnEvent)
    self:addComponent(RenderAnim)

    self:setData({
        name = 'hero',
        hp = 5,
        w = 22,
        h = 50,
        maxVx = 100,
        friction = 15,
        layerMask = layerMask.player,
        maxJumpTime = 3,
        bulletColor = { 0, 0.5, 0.6, 1 },
        bulletLayer = layerMask.playerBullet,
        axMap = {},
        ayMap = {},
        animcfg = {
            imgPath = "img/idle.png",
            width = 11,
            height = 25,
            space = 1,
            cnt = 5,
            fps = 5,
            scale = 2,
        },
    })
    heroMgr:set(self)
end

return Hero