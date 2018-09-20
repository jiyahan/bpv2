function love.load()
    require "autoScript.autoRequires"
end

function love.draw()
    if debug then
        event.draw:Trigger()
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