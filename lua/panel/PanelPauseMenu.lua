local PanelPauseMenu = Entity:extends()

function PanelPauseMenu:onInit()
    self:addComponent(VerticalMenu)
    self:addComponent(HideDashBoard)
    self.index = 1
    self.bars = {}
    for i = 1, 3 do
        local bar = Entity:new()
        bar:addComponent(MenuBar)
        bar.index = i
        bar.parent = self
        table.insert(self.bars, bar)
    end

    self.bars[1].text = "Resume"
    self.bars[1].callback = nil
    self.bars[2].text = "Restart"
    self.bars[2].callback = function()
        sceneMgr:switchTo("config/map1.csv")
    end
    self.bars[3].text = "Quit"
    self.bars[3].callback = function()
        love.event.quit()
    end
end



return PanelPauseMenu