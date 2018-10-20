local sceneMgr = {}

function sceneMgr:create(mapPath)
    self:clear()
    self.curScene= Entity:new()
    self.curScene.mapPath = mapPath
    self.curScene:addComponent(LoadMap)
    self.curScene:show()
    return self.curScene
end

function sceneMgr:clear()
    if self.curScene ~= nil then
        self.curScene:hide()
        self.curScene=nil
    end
end

return sceneMgr