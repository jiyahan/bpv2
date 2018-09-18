local function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item
        local fileinfo = love.filesystem.getInfo(file)
        if fileinfo then
            if fileinfo.type == "file" then
                table.insert(file_list, file)
            elseif fileinfo.type == "directory" then
                recursiveEnumerate(file, file_list)
            end
        end
    end
end

local function requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        require(file)
    end
end

function love.load()
    local files = {}
    recursiveEnumerate('lua', files)
    requireFiles(files)
end

function love.draw()
    if debug then
        love.graphics.clear()
        love.graphics.print(debuginfo)
    end
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
    if key == "f1" then
        local b = love.window.getFullscreen()
        love.window.setFullscreen(not b)
    end
    if key == "`" then
        debug = not debug
    end
end

function love.update(dt)

end