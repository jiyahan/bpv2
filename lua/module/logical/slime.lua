local slime = Entity:new()

slime:addComponent(RenderRect)
slime:addComponent(RecoverJumpForceByLand)
slime:addComponent(Gravity)
slime:addComponent(AccSystem)
slime:addComponent(GameObject)
slime:addComponent(PhysicsMove)
slime:addComponent(SlimeCmd)
slime:setData({
    name = "slime",
    x = 200,
    y = -10,
    w = 25,
    h = 25,
    maxVx = 150,
    friction = 50,
    layerMask = layerMask.enemy
})
--slime:show()
return slime