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
--    local hero = heroMgr:get()
--    hero:setData({ x = 100, y = 50 })
--    hero:show()
--    utils.printt(hero)

--    ui.panelDashBoard:removeComponent(PhysicsInfo)
    ui.panelDashBoard:addComponent(PhysicsInfo)
end

return RuntimeTest

