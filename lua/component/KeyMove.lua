local KeyMove = Component:extends()

function KeyMove:onEnable()
    self:reg(event.onUpdate, function(dt)
        local entity = self.entity
        entity.x = entity.x or 0
        entity.y = entity.y or 0
        entity.v = entity.v or 50

        local x, y = 0, 0
        if love.keyboard.isDown("up") then
            y = -1
        end
        if love.keyboard.isDown("down") then
            y = 1
        end
        if love.keyboard.isDown("right") then
            x = 1
        end
        if love.keyboard.isDown("left") then
            x = -1
        end

        entity.x, entity.y = entity.x + x * entity.v * dt, entity.y + y * entity.v * dt
    end)
end

return KeyMove