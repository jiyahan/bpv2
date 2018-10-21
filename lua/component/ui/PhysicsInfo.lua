local PhysicsInfo = Component:extends()

function PhysicsInfo:onEnable()
    self:reg(event.onDrawUi, function()
        local hero = heroMgr:get()
        if hero == nil then
            return
        end
        local s1 = "jumpEngergy:" .. hero.jumpEnergy
        local s2 = "jumpTime:" .. hero.jumpTime
        local s3 = string.format("CmdY:%2d", hero.cmdY)
        local s4 = "axis1:" .. hero.ayMap.axis1
        local s5 = string.format("vy:%2d", hero.vy)
        local s6 = string.format("released:%s", hero.released)
        local s7 = string.format("isGrounded:%s", hero.isGrounded)
        local s8 = string.format("vx:%2d", hero.vx)
        local s9 = string.format("axMap.fraction:%s", hero.axMap.fraction)
        local s = string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",
            s7, s3, s1, s2, s4, s5, s8, s6, s9)

        local oldColor = utils.getColor()
        utils.setColor({ 0, 0, 0, 0.8 })
        love.graphics.rectangle("fill", 10, 40, 100, 200)
        utils.setColor({ 1, 1, 1, 1 })
        love.graphics.print(s, 10, 40)
    end)
end

return PhysicsInfo