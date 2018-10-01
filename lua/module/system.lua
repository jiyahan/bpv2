local system = Entity:new()
system:addComponent(FullScreen)
system:addComponent(QuitGame)
system:show()
return system