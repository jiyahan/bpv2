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
                brickMgr:create(x, y)
            elseif v == "2" then
                local hero = heroMgr:get()
                hero:setData({ x = x, y = y, vx = 0, vy = 0 })
                hero:show()
            elseif v == "door:config/map2.csv" then
                doorMgr:create(x, y)
            end
        end
    end
end

function sceneMgr:clear()
    brickMgr:clear()
    doorMgr:clear()
    heroMgr:get():hide()
end

return sceneMgr