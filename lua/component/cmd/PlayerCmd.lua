local PlayerCmd = Component:extends()
local defaulAttackCd = 0.2
function PlayerCmd:onEnable()
    local entity = self.entity
    self:reg(event.onCmdUpdate, function(dt)
        entity.cmdX, entity.cmdY = utils.getAxisWasd()
        if love.mouse.isDown(1) then
            self:onAttackPressing()
        end
        local x, y = love.mouse.getPosition()
        local wx, wy = x + camMgr:get().x, y + camMgr:get().y
        entity.dir = 1
        if wx < entity.x then
            entity.dir = -1
        end
    end)
end

function PlayerCmd:onAttackPressing()
    local entity = self.entity
    if entity.isAttacking then
        return
    end
    local entity = self.entity
    entity.isAttacking = true
    entity:popEvent("attack")
    self:scheduleTimer("attacking", self.attackCd or defaulAttackCd, function()
        entity.isAttacking = false
        entity:popEvent("stopAttacking")
    end)
end

return PlayerCmd