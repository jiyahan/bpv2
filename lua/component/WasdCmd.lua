-- 读取键盘wasd输入
-- 写入cmdX cmdY

local WasdCmd = Component:extends()

function WasdCmd:onEnable()
    self:reg(event.onInputUpdate, function(dt)
        self.entity.cmdX, self.entity.cmdY = utils.getAxis1()
    end)
end

return WasdCmd