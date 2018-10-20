local MapDoor = Component:extends()

function MapDoor:onPopEvent(type, data)
    if type == "onCollision" then
        local other = data.other
        if other.layerMask == layerMask.player then
            sceneMgr:goto("config/Map2.csv")
        end
    end
end

return MapDoor