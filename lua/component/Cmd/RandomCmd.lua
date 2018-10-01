-- 随机写入cmdX cmdY

local RandomCmd = Component:extends()

function RandomCmd:onEnable()
    local entity = self.entity
    math.randomseed(12)
    self:scheduleTimerAtFixedRate("random1", 0, 3, function()
        self.entity.cmdX = utils.randomFrom({ 1, -1 })
        self:scheduleTimer("random2", 0.5, function()
            self.entity.cmdY = -1
            self:scheduleTimer("random3", 0.2, function()
                self.entity.cmdY = 0
            end)
        end)
    end)
end

return RandomCmd