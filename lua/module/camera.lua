local camera = Entity:new()
camera:addComponent(Camera)
camera:addComponent(ArrowCmd)
camera:addComponent(CmdMove)
camera:addComponent(SyncPosition)
camera:setData({ x = 1000, y = -500 })
camera:show()
return camera

