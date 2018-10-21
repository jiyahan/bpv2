local sceneMgr = {}

function sceneMgr:goto(mapPath)
    self:clear()
    local j = 0
    for line in love.filesystem.lines(mapPath) do
        j = j + 1
        local t = utils.split(line, ",")
        for i, v in ipairs(t) do
            local x, y = i * cfg.worldCellSize, j * cfg.worldCellSize
            if v == "1" then
                local brick = Brick:new({ x = x, y = y })
                brick:show()
                self:addEntity(brick)
            elseif v == "2" then
                local hero = heroMgr:get()
                hero:setData({ x = x, y = y })
                hero:show()
            elseif utils.startwith(v, "door") then
                local ts = utils.split(v, ":")
                local door = Door:new({ x = x, y = y, mapPath = ts[2] })
                door:show()
                self:addEntity(door)
            end
        end
    end
end

function sceneMgr:addEntity(entity)
    self.entityList = self.entityList or {}
    table.insert(self.entityList, entity)
end

function sceneMgr:clear()
    if self.entityList then
        for _, entity in ipairs(self.entityList) do
            entity:hide()
        end
        self.entityList = nil
    end

--    local hero = heroMgr:get()
--    hero:hide()
end

return sceneMgr