local PanelStartMenu = Entity:new()

function PanelStartMenu:onInit()
    self:addComponent(VerticalMenu)
    self.index = 1
    self.bars = {}
    for i = 1, 2 do
        local bar = Entity:new()
        bar:addComponent(MenuBar)
        bar.index = i
        bar.parent = self
        table.insert(self.bars, bar)
    end
    self.bars[1].text = "Start"
    self.bars[1].callback = function()
        sceneMgr:switchTo("config/map1.csv")
        ui.panelDashBoard:show()
    end
    self.bars[2].text = "Quit"
    self.bars[2].callback = function()
        love.event.quit()
    end
end

return PanelStartMenu