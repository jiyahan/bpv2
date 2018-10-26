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
    self:addComponent(RenderAnim)
    self:setData({
        name = "zombie",
        hp = 4,
        maxHp = 4,
        w = 30,
        h = 50,
        maxVx = 50,
        layerMask = layerMask.zombie,
        animcfg = {
            imgPath = "img/zombieattack.png",
            width = 20,
            height = 25,
            space = 2,
            cnt = 4,
            fps = 6,
            scale = 2
        },
--        animcfg = {
--            imgPath = "img/zombiewalk.png",
--            width = 15,
--            height = 25,
--            space = 9,
--            cnt = 3,
--            fps = 3,
--            scale = 2
--        },
    })
end

return Zombie