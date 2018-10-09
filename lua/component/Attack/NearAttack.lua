local NearAttack = Component:extends()
local defaultBulletColor = { 1, 0, 0, 1 }
local defaultBulletLayer = layerMask.enemyBullet
function NearAttack:onPopEvent(type, data)
    local entity = self.entity
    if type == "attack" then
        local bulletEntity = Entity:new()
        bulletEntity:addComponent(GameObject)
        bulletEntity:addComponent(RenderRect)
        bulletEntity:addComponent(TimeToLive)
        local dir = entity.dir or 1
        bulletEntity:setData({
            name = "bullet",
            x = entity.x + dir * entity.w / 2,
            y = entity.y,
            w = entity.w,
            h = entity.h,
            timeLife = 0.1,
            color = entity.bulletColor or defaultBulletColor,
            layerMask = entity.bulletLayer or defaultBulletLayer,
        })
        print("create")
        utils.printt(bulletEntity.layerMask)
        bulletEntity:show()
    end
end

return NearAttack