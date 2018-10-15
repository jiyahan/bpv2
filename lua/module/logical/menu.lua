local menu = Entity:new()
menu:addComponent(StartMenu)
menu.index = 1
menu:show()
return menu