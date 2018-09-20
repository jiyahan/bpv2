local boot = {}
function boot.init()
    scene.create()

    local gameMgr = Entity:new()
    gameMgr:addComponent(FullScreen)
    gameMgr:addComponent(LogDebug)
    gameMgr:addComponent(QuitGame)
    gameMgr:setActive(true)

    local hero = Entity:new()
    hero:addComponent(RenderRect)
    hero:addComponent(GameObject)
    hero:addComponent(Axis1SimpMove)
    hero:addComponent(Collider)
    hero:setData({ x = 50, y = 50, w = 20, h = 20 })
    hero:setActive(true)

    local camera = Entity:new()
    camera:addComponent(Camera)
    camera:addComponent(Axis2SimpMove)
    camera:addComponent(SyncPosition)
    camera:setActive(true)
end

return boot