local panelPauseMenu = Entity:new()
panelPauseMenu:addComponent(VerticalMenu)
panelPauseMenu.index = 1

panelPauseMenu.bars = {}
for i = 1, 2 do
    local bar = Entity:new()
    bar:addComponent(MenuBar)
    bar.index = i
    bar.parent = panelPauseMenu
    table.insert(panelPauseMenu.bars, bar)
end

panelPauseMenu.bars[1].text = "Resume"
panelPauseMenu.bars[1].callback = nil
panelPauseMenu.bars[2].text = "Quit"
panelPauseMenu.bars[2].callback = function()
    love.event.quit()
end

return panelPauseMenu