local NearAttack = Component:extends()
function NearAttack:onPopEvent(type, data)
    local entity = self.entity
    if type == "NearFiled_Attack" then
        print("pop")
        local bulletEntity = Entity:new()
        bulletEntity:addComponent(GameObject)
        bulletEntity:addComponent(RenderRect)
        bulletEntity:addComponent(TimeToLive)
        bulletEntity:setData({
            name="bullet",
            x = entity.x,
            y = entity.y,
            w = entity.w,
            h = entity.h,
            color = { 1, 0, 0, 1 },
            layerMask = layerMask.enemyBullet
        })
        bulletEntity:show()
    end
end

return NearAttack