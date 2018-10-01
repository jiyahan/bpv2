local camera = Entity:new()
camera:addComponent(Camera)
camera:addComponent(ArrowCmd)
camera:addComponent(Axis2SimpMove)
camera:addComponent(SyncPosition)
camera:setData({ x = -50, y = -50 })
camera:show()
return camera

