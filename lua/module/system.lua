local system = Entity:new()
system:addComponent(FullScreen)
system:addComponent(QuitGame)
system:addComponent(RuntimeTest)
system:show()
return system