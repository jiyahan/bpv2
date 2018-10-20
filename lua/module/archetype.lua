local archetype = {}

archetype.brick = { GameObject, RenderRect }
archetype.brickData = {
    name = 'brick',
    layerMask = layerMask.brick,
    x = 0, --x * cfg.worldCellSize,
    y = 0, --y * cfg.worldCellSize,
    w = cfg.worldCellSize,
    h = cfg.worldCellSize
}

return archetype