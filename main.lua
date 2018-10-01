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
    -- AIInput => CmdX CmdY
    timer.onUpdate(dt)

    -- KeyInput => CmdX CmdY
    event.onInputUpdate:Trigger(dt)

    --CmdX CmdY => AxMap AyMap v
    event.onUpdate:Trigger(dt)

    -- AxMap AyMap v => nextX nextY
    event.onAccSysUpdate:Trigger(dt)

    -- nextX nextY =>x y
    event.onLateUpdate:Trigger(dt)
end