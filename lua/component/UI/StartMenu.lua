local StartMenu = Component:extends()
local barWidth, barHeight = 100, 40
local startY = 200
local barNum = 3

function StartMenu:onEnable()
    _G.pause = true
    self:reg(event.resize, function() self:init() end)
    self:reg(event.onKeyPressed, function(key)
        if key == "s" or key == "down" then
            local index = self.entity.index
            index = index % barNum + 1
            self.entity.index = index
        elseif key == "w" or key == "up" then
            local index = self.entity.index
            index = (index + 1) % barNum + 1
            self.entity.index = index
        end
    end)
    self:init()
    camera:hide()
end

function StartMenu:init()
    if self.bars then
        for k, bar in pairs(self.bars) do
            bar:hide()
        end
    end
    self.bars = nil

    local width, height = love.window.getMode()
    self.startX = width / 2 - barWidth / 2
    local bars = {}
    for i = 1, barNum do
        local bar = Entity:new()
        bar:addComponent(MenuBar)
        bar.x = self.startX
        bar.y = startY + (i - 1) * (barHeight + 5)
        bar.w, bar.h = barWidth, barHeight
        bar.menu = self.entity
        bar.index = i
        bar:show()
        bars[i] = bar
    end
    bars[1].text = "Continue"
    bars[1].callback = function()
        scene:show()
    end
    bars[2].text = "New Game"
    bars[2].callback = function()
        scene:hide()
    end
    bars[3].text = "Quit"
    bars[3].callback = function()
        love.event.quit()
    end
    self.bars = bars
end

function StartMenu:onDisable()
    if self.bars then
        for k, bar in pairs(self.bars) do
            bar:hide()
        end
    end
    camera:show()
    _G.pause = false
end

return StartMenu