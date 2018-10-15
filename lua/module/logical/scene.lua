local scene = Entity:new()
scene:addComponent(CreateBricks)
scene.mapdata = { { 1, 10, 1, 1 }, { 1, 10, 10, 10 } }
return scene