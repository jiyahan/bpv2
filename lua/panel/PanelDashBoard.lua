local PanelDashBoard = Entity:extends()

function PanelDashBoard:onInit()
    self:addComponent(HeroHp)
    self:addComponent(PhysicsInfo)
end

return PanelDashBoard