local RuntimeTest = Component:extends()
local path = 'lua.component.Sys.RuntimeTest'

function RuntimeTest:onEnable()
    self:reg(event.onKeyPressed, function(key)
        if key == "f5" then
            package.loaded[path] = nil
            local test = require(path)
            test.f5()
        end
    end)
end

function RuntimeTest:f5()
    ui.panelDashBoard:removeComponent(PhysicsInfo)
end

return RuntimeTest

