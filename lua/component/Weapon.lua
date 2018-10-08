local Weapon = Component:extends()

function Weapon:onPopEvent(type, data)
    if type == "onCollision" then
    end
end

function Weapon:createBullet()
    local bulletArchetype = self.entity.bulletArchetype
end

return Weapon