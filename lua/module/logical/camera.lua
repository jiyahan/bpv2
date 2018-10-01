local camera = Entity:new()
camera:addComponent(Camera)
camera:addComponent(ArrowCmd)
camera:addComponent(CmdMove)
camera:setData({ x = 0, y = -500 })
camera:show()
return camera

