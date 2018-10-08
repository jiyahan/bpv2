local utils = {}

function utils.getAxis1()
    local x, y = 0, 0
    if love.keyboard.isDown("w") then
        y = -1
    end
    if love.keyboard.isDown("s") then
        y = 1
    end
    if love.keyboard.isDown("d") then
        x = 1
    end
    if love.keyboard.isDown("a") then
        x = -1
    end
    return x, y
end

function utils.getAxis2()
    local x, y = 0, 0
    if love.keyboard.isDown("up") then
        y = -1
    end
    if love.keyboard.isDown("down") then
        y = 1
    end
    if love.keyboard.isDown("right") then
        x = 1
    end
    if love.keyboard.isDown("left") then
        x = -1
    end
    return x, y
end

function utils.assertType(desiredType, value, name)
    if type(value) ~= desiredType then
        error(name .. ' must be a ' .. desiredType .. ', but was ' .. tostring(value) .. '(a ' .. type(value) .. ')')
    end
end

function utils.assetNotNil(value)
    if value == nil then
        error("value should not be nil")
    end
end

function utils.copy(t)
    local newtable = {}
    for k, v in pairs(t) do
        newtable[k] = v
    end
    return newtable
end

function utils.randomFrom(listTable)
    local count = #listTable
    if count > 0 then
        local idx = math.random(1, count)
        return listTable[idx]
    end
end

function utils.findTarget(x, y, w, h, filter)
    utils.assertType('number', x, ' x')
    utils.assertType('number', y, ' y')
    utils.assertType('number', w, ' w')
    utils.assertType('number', h, ' h')

    local items, len = world:queryRect(x - w / 2, y - h / 2,
        w, h, filter)
    if len > 0 then
        return items[1]
    else
        return nil
    end
end

function utils.setColor(color)
    love.graphics.setColor(color[1], color[2], color[3], color[4])
end

function utils.getColor()
    local r, g, b, a = love.graphics.getColor()
    return { r, g, b, a }
end

return utils