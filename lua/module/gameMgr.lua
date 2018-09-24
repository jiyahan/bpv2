local gameMgr = Entity:new()
gameMgr:addComponent(FullScreen)
gameMgr:addComponent(QuitGame)
gameMgr:show()
return gameMgr