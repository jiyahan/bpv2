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
    --  => CmdX CmdY
    timer.onUpdate(dt)

    --  => CmdX CmdY
    event.onCmdUpdate:Trigger(dt)

    --  => AxMap AyMap Vi
    event.onPhysicsUpdate:Trigger(dt)

    --  =>Vn x y
    event.onLateUpdate:Trigger(dt)
end