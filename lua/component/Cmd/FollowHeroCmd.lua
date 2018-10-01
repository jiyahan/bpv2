-- 随机写入cmdX cmdY
local defaulViewWidth = 600
local defaulViewHeight = 600
local FollowHeroCmd = Component:extends()

function FollowHeroCmd:onEnable()
    local entity = self.entity
    self:scheduleTimerAtFixedRate("t1", 0, 2, function()
        local viewWidth = entity.viewWidth or defaulViewWidth
        local viewHeight = entity.viewHeight or defaulViewHeight
        self.targetEntity = utils.findTarget(entity.x, entity.y, viewWidth, viewHeight, function(item)
            return item.layerMask == layerMask.player
        end)
        local cmdX = 0
        if self.targetEntity then
            local dis = self.targetEntity.x - entity.x
            if dis > 20 then
                cmdX = 1
            else
                if dis < -20 then
                    cmdX = -1
                else
                    cmdX = 0
                end
            end
        else
            cmdX = 0
        end

        self.entity.cmdX = cmdX
        self:scheduleTimer("jump", 0.5, function()
            self.entity.cmdY = -1
            self:scheduleTimer("release", 0.2, function()
                self.entity.cmdY = 0
            end)
        end)

        debug.followHeroCmd = string.format("CmdX:%s", cmdX)
    end)
end

return FollowHeroCmd