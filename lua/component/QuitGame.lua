local QuitGame = Component:extends()

function QuitGame:onEnable()
    self:reg(event.onKeyPressed, function(key)
        if key == "escape" then
            love.event.quit()
        end
    end)
end

return QuitGame