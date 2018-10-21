local PanelDashBoard = Entity:extends()

function PanelDashBoard:onInit()
    self:addComponent(HeroHp)
    self:addComponent(PhysicsInfo)
    self:addComponent(OpenMenu)

end

return PanelDashBoard