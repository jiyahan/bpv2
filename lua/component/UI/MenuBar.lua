local MenuBar = Component:extends()
local radius = 8
local arrowImgPath = "img/arrow.png"
function MenuBar:onEnable()
    local entity = self.entity
    local menu = entity.menu
    self:reg(event.onDrawUi, function()
        self.img = self.img or love.graphics.newImage(arrowImgPath)
        if menu.index == entity.index then
            love.graphics.draw(self.img, entity.x, entity.y, 0, 2, 2, 22, 0)
        end
        love.graphics.print(entity.text, entity.x, entity.y, 0, 2, 2)
    end)
    self:reg(event.onKeyPressed, function(key)
        if key == "return" and menu.index == entity.index then
            if entity.callback then
                entity.callback()
            end
            menu:hide()
        end
    end)
end

return MenuBar