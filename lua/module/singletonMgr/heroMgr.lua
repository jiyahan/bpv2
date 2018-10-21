local heroMgr = {}

function heroMgr:init()
    self.hero = Hero:new()
end

function heroMgr:get()
    return self.hero
end

return heroMgr