local layerMask = {}

local player, playerbullet, enemy, enemybullet, brick, trigger = 0, 1, 2, 3, 4, 5

local function getLayerTag(layer)
    return bit.lshift(1, layer)
end

local function bitOrLayer(...)
    local c = 0
    for k, v in pairs({ ... }) do
        c = bit.bor(getLayerTag(v), c)
    end
    return c
end

function layerMask.collideWith(a, b)
    a, b = a or layerMask.brick, b or layerMask.brick
    return bit.band(a.tag, b.col) ~= 0
end

function layerMask.hurt(a, b)
    return bit.band(a.dmg, b.tag) ~= 0
end

function layerMask.getLayer(name)
    local newlm = {}
    local oldlm = layerMask[name]
    for k,v in pairs(oldlm) do
        newlm[k] = v
    end
    return newlm
end

layerMask.trigger = {}
layerMask.trigger.tag = getLayerTag(trigger)
layerMask.trigger.col = 0
layerMask.trigger.dmg = 0

layerMask.player = {}
layerMask.player.tag = getLayerTag(player)
layerMask.player.col = bitOrLayer(brick)
layerMask.player.dmg = 0

layerMask.playerbullet = {}
layerMask.playerbullet.tag = getLayerTag(playerbullet)
layerMask.playerbullet.col = bitOrLayer(enemy, brick)
layerMask.playerbullet.dmg = bitOrLayer(enemy, brick)

layerMask.enemy = {}
layerMask.enemy.tag = getLayerTag(enemy)
layerMask.enemy.col = bitOrLayer(playerbullet, brick)
layerMask.enemy.dmg = bitOrLayer(player)

layerMask.enemybullet = {}
layerMask.enemybullet.tag = getLayerTag(enemybullet)
layerMask.enemybullet.col = bitOrLayer(player, brick)
layerMask.enemybullet.dmg = bitOrLayer(player)

layerMask.brick = {}
layerMask.brick.tag = getLayerTag(brick)
layerMask.brick.col = bitOrLayer(player, playerbullet, enemy, enemybullet, brick)
layerMask.brick.dmg = 0

return layerMask