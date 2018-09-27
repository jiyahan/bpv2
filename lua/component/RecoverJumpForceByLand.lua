local RecoverJumpForceByLand = Component:extends()
local defaultJumpEnergyMax = 0.2

function RecoverJumpForceByLand:onPopEvent(type, data)
    local entity = self.entity
    entity.jumpEnergyMax = entity.jumpEnergyMax or defaultJumpEnergyMax
    entity.jumpEnergy = entity.jumpEnergy or entity.jumpEnergyMax
    if type == pop.onCollision then
        local col = data.col
        if col.type == "slide" and col.normal.y ~= 0 and entity.y < data.other.y then
            if entity.jumpEnergy < entity.jumpEnergyMax then
                entity.jumpEnergy = entity.jumpEnergyMax
            end
        end
    end
end

return RecoverJumpForceByLand