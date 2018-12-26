local system = {}
function system.init()
    local entity = Entity:new()
    entity:addComponent(FullScreen)
    entity:addComponent(RuntimeTest)
    entity:addComponent(PauseGame)
    entity:addComponent(LogDebug)
    entity:show()
end
return system