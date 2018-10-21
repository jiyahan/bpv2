local PanelDashBoard = Entity:extends()

function PanelDashBoard:onInit()
    self:addComponent(HeroHp)
end

return PanelDashBoard