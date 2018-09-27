local Axis1 = Component:extends()
local ax, ay = 300, 10000

function Axis1:onEnable()
    self:reg(event.onUpdate, function(dt)
        self:onUpdate(dt)
    end)
end

function Axis1:onUpdate(dt)
    local entity = self.entity

    entity.axMap = entity.axMap or {}
    entity.ayMap = entity.ayMap or {}

    local x, y = utils.getAxis1()

    entity.axMap.axis1 = x * ax

    if y < 0 then
        entity.jumpEnergy = entity.jumpEnergy or 0
        if entity.jumpEnergy <= 0 then
            entity.ayMap.axis1 = 0
            return
        end
        entity.jumpEnergy = entity.jumpEnergy - dt
        entity.ayMap.axis1 = y * ay
    else
        entity.ayMap.axis1 = y * ay
    end
end

return Axis1