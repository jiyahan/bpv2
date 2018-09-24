local camera = Entity:new()
camera:addComponent(Camera)
camera:addComponent(Axis2SimpMove)
camera:addComponent(SyncPosition)
camera:show()
return camera

