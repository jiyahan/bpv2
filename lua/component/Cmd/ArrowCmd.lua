-- 读取键盘up down left right输入
-- 写入cmdX cmdY

local ArrowCmd = Component:extends()

function ArrowCmd:onEnable()
    self:reg(event.onCmdUpdate, function(dt)
        self.entity.cmdX, self.entity.cmdY = utils.getAxis2()
    end)
end

return ArrowCmd