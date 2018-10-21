local system = Entity:new()
system:addComponent(FullScreen)
system:addComponent(RuntimeTest)
system:addComponent(PauseGame)
system:show()
return system