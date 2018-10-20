local LoadMap = Component:extends()

function LoadMap:onEnable()
    local entity = self.entity
    local mapPath = entity.mapPath
    local y = 0
    for line in love.filesystem.lines(mapPath) do
        y = y + 1
        local t = utils.split(line, ",")
        for x, v in ipairs(t) do
            if v == "1" then
                brickMgr:create(x, y)
            elseif v == "2" then
                heroMgr:create(x * cfg.worldCellSize, y * cfg.worldCellSize)
            elseif v == "door:config/map2.csv" then
                doorMgr:create(x * cfg.worldCellSize, y * cfg.worldCellSize)
            end
        end
    end
end

function LoadMap:onDisable()
    brickMgr:clear()
    doorMgr:clear()
    heroMgr:clear()
end

return LoadMap