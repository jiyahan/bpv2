local camera = Entity:new()
camera:addComponent(Camera)
camera:addComponent(ArrowCmd)
camera:addComponent(CmdMove)
camera:addComponent(SyncPosition)
camera:setData({ x = -80, y = -300 })
camera:show()
return camera

