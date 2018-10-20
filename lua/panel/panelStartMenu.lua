local panelStartMenu = Entity:new()
panelStartMenu:addComponent(VerticalMenu)
panelStartMenu.index = 1

panelStartMenu.bars = {}
for i = 1, 2 do
    local bar = Entity:new()
    bar:addComponent(MenuBar)
    bar.index = i
    bar.parent = panelStartMenu
    table.insert(panelStartMenu.bars, bar)
end

panelStartMenu.bars[1].text = "Start"
panelStartMenu.bars[1].callback = function()
    sceneMgr:goto("config/map1.csv")
end
panelStartMenu.bars[2].text = "Quit"
panelStartMenu.bars[2].callback = function()
    love.event.quit()
end

panelStartMenu:show()
return panelStartMenu