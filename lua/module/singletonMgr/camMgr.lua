local camMgr = {}

function camMgr:get()
    if self.cam == nil then
        local camera = Entity:new()
        camera:addComponent(Camera)
        camera:addComponent(ArrowCmd)
        --camera:addComponent(CmdMove)
        camera:addComponent(CamFollowAI)
        camera:setData({ x = 0, y = 0, w = 1280, h = 720})
        self.cam = camera
    end
    return self.cam
end

return camMgr
