function love.load()
    require "autoScript.autoRequires"
end

function love.draw()
    event.onDraw:Trigger()
end

function love.keypressed(key)
    event.onKeyPressed:Trigger(key)
end

function love.update(dt)
    event.onInputUpdate:Trigger(dt)
    event.onUpdate:Trigger(dt)
    event.onAccSysUpdate:Trigger(dt)
    event.onLateUpdate:Trigger(dt)
end