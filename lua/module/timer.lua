local timer = {}

timer.globalTimer = Timer:New()

function timer.onUpdate(dt)
    timer.globalTimer:Update(dt)
end

return timer