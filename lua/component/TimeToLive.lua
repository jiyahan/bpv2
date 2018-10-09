local TimeToLive = Component:extends()
local defaulTtl = 3
function TimeToLive:onEnable()
    local entity = self.entity
    self:scheduleTimer("timeToLive", entity.timeLife or defaulTtl, function()
        entity:setActive(false)
    end)
end

return TimeToLive