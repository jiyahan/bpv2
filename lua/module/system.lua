local system = Entity:new()
system:addComponent(FullScreen)
system:addComponent(OpenMenu)
system:addComponent(RuntimeTest)
system:addComponent(PauseGame)
system:show()
return system