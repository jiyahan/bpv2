local NearAttack = Component:extends()
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
            color = { 1, 0, 0, 1 },
            layerMask = layerMask.enemyBullet
        })
        bulletEntity:show()
    end
end

return NearAttack