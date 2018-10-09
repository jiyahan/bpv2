local PopNearAttack = Component:extends()
local period = 0.5

function PopNearAttack:onEnable()
    local entity = self.entity
    self:scheduleTimerAtFixedRate("detect", 0, period, function()
        local targetEntity = utils.findTarget(entity.x, entity.y, entity.w, entity.h, function(item)
            return item.layerMask == layerMask.player
        end)
        if targetEntity then
            self.entity:popEvent("NearFiled_Attack")
        end
    end)
end

return PopNearAttack