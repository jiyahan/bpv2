local LogDebug = Component:extend()

function LogDebug:onEnable()
    self:reg(event.onKeyPressed, function(key)
        print(key)
    end)
end

return LogDebug