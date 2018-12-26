local sceneMgr = {}

function sceneMgr:switchTo(mapPath)
    self:clear()
    local j = 0
    for line in love.filesystem.lines(mapPath) do
        j = j + 1
        local t = utils.split(line, ",")
        for i, v in ipairs(t) do
            local x, y = i * cfg.worldCellSize, j * cfg.worldCellSize
            local entity = nil

            if v == "1" then
                entity = Brick:new({ x = x, y = y })
            elseif v == "hero" then
                entity = Hero:new()
                entity:setData({
                    x = x,
                    y = y,
                })
            elseif v == "zombie" then
                entity = Zombie:new()
                entity:setData({ x = x, y = y })
            elseif v == "slime" then
                entity = Slime:new()
                entity:setData({ x = x, y = y })
            elseif utils.startwith(v, "door") then
                local ts = utils.split(v, ":")
                entity = Door:new({ x = x, y = y, mapPath = ts[2] })
            end

            if entity then
                entity:show()
                self:addEntity(entity)
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
end

return sceneMgr