local heroMgr = {}

function heroMgr:set(hero)
    self.hero = hero
end

function heroMgr:get()
    return self.hero
end

return heroMgr