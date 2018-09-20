local boot = Entity:new()

boot:addComponent(FullScreen)
boot:addComponent(LogDebug)
boot:addComponent(QuitGame)
boot:setActive(true)

local hero = Entity:new()
hero:addComponent(RenderRect)
hero:addComponent(GameObject)
hero:setData({ x = 50, y = 50, w = 20, h = 20 })
hero:setActive(true)

local camera = Entity:new()
camera:addComponent(Camera)
camera:addComponent(KeyMove)
camera:setActive(true)

return boot