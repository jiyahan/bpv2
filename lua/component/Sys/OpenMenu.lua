local OpenMenu = Component:extends()

function OpenMenu:onEnable()
    self:reg(event.onKeyPressed, function(key)
        if key == "escape" then
            menu:show()
        end
    end)
end

return OpenMenu