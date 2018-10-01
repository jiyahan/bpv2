-- 接收Axis命令来控制速度和加速度
-- entity 中读cmdX cmdY
-- entity 写 v axMap ayMap

local PhysicsMove = Component:extends()
local ax, ay = 300, 10000
local maxJumpEnergy, maxJumpTime = 0.1, 2
local checkY = 1
local littlehelp = 300
local umbrellaInitFallSpeed = 100
local defaultFriction = 150

function PhysicsMove:onEnable()
    self:reg(event.onPhysicsUpdate, function(dt)
        local entity = self.entity
        local _, _, cols, len = world:check(entity, entity.x, entity.y + checkY, layerMask.filter)
        local isGrounded = false
        local groundCol = nil
        for i = 1, len do
            local col = cols[i]
            if col.type == "slide" and col.normal.y ~= 0 and entity.y < col.other.y then
                isGrounded = true
                groundCol = col
                break
            end
        end
        self.jumpEnergy = self.jumpEnergy or 0
        self.jumpTime = self.jumpTime or 0
        entity.ayMap = entity.ayMap or {}
        entity.vy = entity.vy or 0

        local x, y = entity.cmdX or 0, entity.cmdY or 0
        if not isGrounded then -- 在空中
            if y < 0 then --向上
                if not self.released then -- 之前没松手
                    if self.jumpEnergy > 0 then --还有能量
                        self.released = false
                        self.jumpEnergy = self.jumpEnergy - dt
                        self.jumpTime = self.jumpTime
                        entity.ayMap.axis1 = -ay
                        entity.vy = entity.vy or 0
                    else --没有能量
                        self.released = false
                        self.jumpEnergy = 0
                        self.jumpTime = self.jumpTime
                        entity.vy = entity.vy or 0
                        if entity.vy > 0 then
                            if entity.vy > umbrellaInitFallSpeed then
                                entity.vy = umbrellaInitFallSpeed
                            end
                            entity.ayMap.axis1 = -littlehelp
                        else
                            entity.ayMap.axis1 = 0
                        end
                    end
                else --之前松过手
                    if self.jumpTime > 0 then -- 还能跳
                        self.jumpEnergy = maxJumpEnergy
                        self.jumpTime = self.jumpTime - 1
                        self.released = false
                        entity.ayMap.axis1 = -ay
                        entity.vy = 0
                    else --没有跳跃次数
                        self.jumpEnergy = 0
                        self.jumpTime = 0
                        self.released = false
                        entity.vy = entity.vy
                        if entity.vy > 0 then
                            if entity.vy > umbrellaInitFallSpeed then
                                entity.vy = umbrellaInitFallSpeed
                            end
                            entity.ayMap.axis1 = -littlehelp
                        else
                            entity.ayMap.axis1 = 0
                        end
                    end
                end
            else --没按上
                if y == 0 then --y方向没按
                    self.jumpEnergy = 0
                    self.jumpTime = self.jumpTime
                    self.released = true
                    entity.ayMap.axis1 = 0
                    entity.vy = entity.vy
                else -- y<0 向下加速，这个可以是技能
                    self.jumpEnergy = 0
                    self.jumpTime = self.jumpTime
                    self.released = true
                    entity.ayMap.axis1 = ay
                    entity.vy = entity.vy
                end
            end
        else -- 在地上
            if y < 0 then --按上
                if self.released then --之前松手了
                    if self.jumpTime > 0 then
                        self.jumpTime = self.jumpTime - 1
                        self.jumpEnergy = maxJumpEnergy
                        self.released = false
                        entity.ayMap.axis1 = -ay
                        entity.vy = 0
                    else
                        self.jumpTime = 0
                        self.jumpEnergy = 0
                        self.released = false
                        entity.ayMap.axis1 = 0
                        entity.vy = entity.vy
                    end
                else --之前没松手
                    if self.jumpEnergy > 0 then
                        self.jumpTime = self.jumpTime
                        self.jumpEnergy = self.jumpEnergy - dt
                        self.released = false
                        entity.ayMap.axis1 = -ay
                        entity.vy = entity.vy
                    else
                        self.jumpTime = self.jumpTime
                        self.jumpEnergy = 0
                        self.released = false
                        entity.ayMap.axis1 = 0
                        entity.vy = entity.vy
                    end
                end
            else --没按上
                self.jumpTime = maxJumpTime
                self.jumpEnergy = 0
                self.released = true
                entity.ayMap.axis1 = 0
                entity.vy = 0
            end
        end


        entity.axMap = entity.axMap or {}
        entity.axMap.fraction = entity.axMap.fraction or 0
        entity.axMap.axis1 = x * ax
        if isGrounded then
            local vx = entity.vx or 0
            -- 地板摩擦力
            if vx > 1 then
                entity.axMap.fraction = math.min(entity.axMap.fraction, -(groundCol.other.friction or defaultFriction))
            elseif vx < -1 then
                entity.axMap.fraction = math.max(entity.axMap.fraction, groundCol.other.friction or defaultFriction)
            else
                entity.axMap.fraction = 0
                entity.vx = 0
            end
        else
            entity.axMap.fraction = nil
        end

        local s1 = "jumpEngergy:" .. self.jumpEnergy
        local s2 = "jumpTime:" .. self.jumpTime
        local s3 = "CmdY:" .. y
        local s4 = "axis1:" .. entity.ayMap.axis1
        local s5 = "vy:" .. entity.vy
        local s6 = string.format("released:%s", self.released)
        local s7 = string.format("isGrounded:%s", isGrounded)
        local s8 = string.format("vx:%s", entity.vx)
        local s9 = string.format("axMap.fraction:%s", entity.axMap.fraction)
        debug.physicsMove = string.format("physicsMove:\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",
            s7, s3, s1, s2, s4, s5, s8, s6, s9)
    end)
end

return PhysicsMove