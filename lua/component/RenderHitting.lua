local RenderHitting = Component:extends()
local period1 = 0.35
local period2 = period1 / 2
local color1 = { 1, 0.5, 0.5, 0.2 }
local color2 = { 1, 0.5, 0.5, 0.8 }
function RenderHitting:onPopEvent(type, data)
    if type == "beHit" then
        self:scheduleTimerAtFixedRate("change1", 0, period1, function()
            self.color = color1
            self:scheduleTimer("change2", period2, function()
                self.color = color2
            end)
        end)
    elseif type == "unHit" then
        self:unscheduleTimer("change1")
    end

    if self.entity.hitting then
        if self.color then
            if type == "beforeCameraDraw" then
                self.oldColor = utils.getColor()
                utils.setColor(self.color)
            elseif type == "afterCameraDraw" then
                utils.setColor(self.oldColor)
            end
        end
    end
end

return RenderHitting