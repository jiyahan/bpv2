local Component = Object:extends()

local function UnregisterEvtHandlerEach(unreg)
    unreg()
end

function Component:setActive(active)
    self.isActive = active
    if active then
        self:onEnable()
    else
        if self.__evthandlers ~= nil then
            self.__evthandlers:ForEach(UnregisterEvtHandlerEach)
            self.__evthandlers:Clear()
        end

        if self.__timer_fixedids then
            for _, id in pairs(self.__timer_fixedids) do
                mod.Timer.globalTimer:Unschedule(id)
            end
            self.__timer_fixedids = nil
        end
        self:onDisable()
    end
end

function Component:onEnable()
end

function Component:onDisable()
end

function Component:scheduleTimer(fixid, delay, task, ...)
    local id
    if self.__timer_fixedids == nil then
        self.__timer_fixedids = {}
    else
        id = self.__timer_fixedids[fixid]
    end

    id = mod.Timer.globalTimer:Schedule(id, delay, task, self, ...) --- 这里不用在timer结束的时候清除，是因为这个id是自增的，不考虑回绕
    self.__timer_fixedids[fixid] = id
end

function Component:scheduleTimerAtFixedRate(fixid, delay, period, task, ...)
    local id
    if self.__timer_fixedids == nil then
        self.__timer_fixedids = {}
    else
        id = self.__timer_fixedids[fixid]
    end

    id = mod.Timer.globalTimer:ScheduleAtFixedRate(id, delay, period, task, self, ...)
    self.__timer_fixedids[fixid] = id
end

function Component:unscheduleTimer(fixid)
    if self.__timer_fixedids then
        local id = self.__timer_fixedids[fixid]
        if id then
            self.__timer_fixedids[fixid] = nil
            mod.Timer.globalTimer:Unschedule(id)
        end
    end
end

function Component:reg(simpleevt, handler, arg1)
    if self.__evthandlers == nil then
        self.__evthandlers = Stream:New()
    end

    local unreg = simpleevt:Register(handler, arg1)
    local id = self.__evthandlers:Add(unreg)
    return function()
        local old = self.__evthandlers:Delete(id)
        if old then
            old()
        end
    end
end

return Component